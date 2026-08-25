CLASS lcl_buffer DEFINITION.
  PUBLIC SECTION.
    CLASS-DATA selected_node_id TYPE zmelody_hselect-selected_node_id.
    CLASS-DATA has_change       TYPE abap_bool.
ENDCLASS.


CLASS lhc_zi_melody_hselect DEFINITION
  INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS SetSelectedNode
      FOR MODIFY
      IMPORTING keys FOR ACTION ZI_MELODY_HSELECT~SetSelectedNode.

ENDCLASS.


CLASS lhc_zi_melody_hselect IMPLEMENTATION.

  METHOD SetSelectedNode.

    LOOP AT keys INTO DATA(key).

      lcl_buffer=>selected_node_id = key-%param-NodeId.
      lcl_buffer=>has_change       = abap_true.

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

    IF lcl_buffer=>has_change = abap_true.

      DATA(lv_user_id) =
        cl_abap_context_info=>get_user_technical_name( ).

      MODIFY zmelody_hselect FROM @(
        VALUE #(
          user_id          = lv_user_id
          selected_node_id = lcl_buffer=>selected_node_id
        )
      ).

    ENDIF.

  ENDMETHOD.


  METHOD cleanup.

    CLEAR:
      lcl_buffer=>selected_node_id,
      lcl_buffer=>has_change.

  ENDMETHOD.

ENDCLASS.
