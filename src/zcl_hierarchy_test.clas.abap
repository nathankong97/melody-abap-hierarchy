CLASS zcl_hierarchy_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HIERARCHY_TEST IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
   out->write( 'ABAP Cloud connection works.' ).
  ENDMETHOD.
ENDCLASS.
