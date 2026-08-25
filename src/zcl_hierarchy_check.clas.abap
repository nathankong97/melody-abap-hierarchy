CLASS zcl_hierarchy_check DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.



CLASS ZCL_HIERARCHY_CHECK IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT FROM zi_melody_hierarchy
      FIELDS NodeId,
             ParentId,
             NodeName,
             NodeType,
             SortOrder
      INTO TABLE @DATA(nodes).

    out->write( nodes ).

  ENDMETHOD.
ENDCLASS.
