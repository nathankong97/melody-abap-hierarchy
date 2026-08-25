CLASS lcl_buffer DEFINITION.
  PUBLIC SECTION.

    TYPES:
      BEGIN OF ty_change,
        node_id  TYPE zmelody_hstate-node_id,
        expanded TYPE abap_bool,
      END OF ty_change,

      tt_changes TYPE STANDARD TABLE OF ty_change
        WITH EMPTY KEY.

    CLASS-DATA changes TYPE tt_changes.

ENDCLASS.


CLASS lhc_zi_melody_hstate DEFINITION
  INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS SetExpansionState
      FOR MODIFY
      IMPORTING keys FOR ACTION ZI_MELODY_HSTATE~SetExpansionState.

ENDCLASS.


CLASS lhc_zi_melody_hstate IMPLEMENTATION.

  METHOD SetExpansionState.

    LOOP AT keys INTO DATA(key).

      APPEND VALUE #(
        node_id  = key-%param-NodeId
        expanded = key-%param-Expanded
      ) TO lcl_buffer=>changes.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.


CLASS lsc_zi_melody_hstate DEFINITION
  INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.

    METHODS save REDEFINITION.
    METHODS cleanup REDEFINITION.

ENDCLASS.


CLASS lsc_zi_melody_hstate IMPLEMENTATION.

  METHOD save.

    LOOP AT lcl_buffer=>changes INTO DATA(change).

      zcl_hstate_manager=>set_expanded(
        iv_node_id  = change-node_id
        iv_expanded = change-expanded
      ).

    ENDLOOP.

  ENDMETHOD.


  METHOD cleanup.

    CLEAR lcl_buffer=>changes.

  ENDMETHOD.

ENDCLASS.
