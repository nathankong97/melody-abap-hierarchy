CLASS lcl_buffer DEFINITION.

  PUBLIC SECTION.

    TYPES:
      BEGIN OF ty_change,
        node_id  TYPE zmelody_hselect-selected_node_id,
        selected TYPE abap_bool,
      END OF ty_change,

      tt_changes TYPE STANDARD TABLE OF ty_change
        WITH EMPTY KEY.

    CLASS-DATA changes TYPE tt_changes.

ENDCLASS.


CLASS lhc_zi_melody_hselect DEFINITION
  INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS SetSelectionState
      FOR MODIFY
      IMPORTING keys
        FOR ACTION ZI_MELODY_HSELECT~SetSelectionState.

ENDCLASS.


CLASS lhc_zi_melody_hselect IMPLEMENTATION.

  METHOD SetSelectionState.

    LOOP AT keys INTO DATA(key).

      "Keep only the latest requested state for a node.
      DELETE lcl_buffer=>changes
        WHERE node_id = key-%param-NodeId.

      APPEND VALUE #(
        node_id  = key-%param-NodeId
        selected = key-%param-Selected
      ) TO lcl_buffer=>changes.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.


CLASS lsc_zi_melody_hselect DEFINITION
  INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.

    METHODS save REDEFINITION.
    METHODS cleanup REDEFINITION.

ENDCLASS.


CLASS lsc_zi_melody_hselect IMPLEMENTATION.

  METHOD save.

    IF lcl_buffer=>changes IS INITIAL.
      RETURN.
    ENDIF.

    DATA(lv_user_id) =
      cl_abap_context_info=>get_user_technical_name( ).

    LOOP AT lcl_buffer=>changes INTO DATA(change).

      IF change-selected = abap_true.

      INSERT zmelody_hselect FROM @(
        VALUE #(
          user_id          = lv_user_id
          selected_node_id = change-node_id
        )
      ).

    ELSE.

        DELETE FROM zmelody_hselect
          WHERE user_id          = @lv_user_id
            AND selected_node_id = @change-node_id.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.


  METHOD cleanup.

    CLEAR lcl_buffer=>changes.

  ENDMETHOD.

ENDCLASS.
