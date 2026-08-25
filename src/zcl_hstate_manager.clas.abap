CLASS zcl_hstate_manager DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES tt_node_ids TYPE STANDARD TABLE OF zmelody_hstate-node_id
        WITH EMPTY KEY.

    CLASS-METHODS set_expanded
      IMPORTING
        iv_node_id  TYPE zmelody_hstate-node_id
        iv_expanded TYPE abap_bool.

    CLASS-METHODS get_expanded_nodes
        RETURNING
            VALUE(rt_node_ids) TYPE tt_node_ids.

ENDCLASS.



CLASS ZCL_HSTATE_MANAGER IMPLEMENTATION.


  METHOD set_expanded.

    DATA(lv_user_id) =
      cl_abap_context_info=>get_user_technical_name( ).

    IF iv_expanded = abap_true.

      INSERT zmelody_hstate FROM @(
        VALUE #(
          user_id = lv_user_id
          node_id = iv_node_id
        )
      ).

    ELSE.

      DELETE FROM zmelody_hstate
        WHERE user_id = @lv_user_id
          AND node_id = @iv_node_id.

    ENDIF.

  ENDMETHOD.


  METHOD get_expanded_nodes.

      DATA(lv_user_id) =
        cl_abap_context_info=>get_user_technical_name( ).

      SELECT node_id
        FROM zmelody_hstate
        WHERE user_id = @lv_user_id
        INTO TABLE @rt_node_ids.

    ENDMETHOD.
ENDCLASS.
