CLASS zcl_hstate_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

ENDCLASS.



CLASS ZCL_HSTATE_TEST IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

      zcl_hstate_manager=>set_expanded(
        iv_node_id  = 'START'
        iv_expanded = abap_true
      ).

      zcl_hstate_manager=>set_expanded(
        iv_node_id  = 'Q_TYPE'
        iv_expanded = abap_true
      ).

      zcl_hstate_manager=>set_expanded(
        iv_node_id  = 'DEAL'
        iv_expanded = abap_true
      ).

      DATA(lt_nodes) =
        zcl_hstate_manager=>get_expanded_nodes( ).

      out->write( 'Expanded nodes:' ).

      LOOP AT lt_nodes INTO DATA(lv_node).
        out->write( lv_node ).
      ENDLOOP.

    ENDMETHOD.
ENDCLASS.
