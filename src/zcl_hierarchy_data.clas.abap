CLASS zcl_hierarchy_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HIERARCHY_DATA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  " Illustrative FBS request-guidance decision tree.
  " This replaces the original generic organization-chart sample data.

  DELETE FROM zmelody_hnode.

  INSERT zmelody_hnode FROM TABLE @( VALUE #(

    ( node_id    = 'START'
      parent_id  = ''
      node_name  = 'Choose the right FBS request'
      node_type  = 'ROOT'
      sort_order = 1 )

    ( node_id    = 'Q_TYPE'
      parent_id  = 'START'
      node_name  = 'What kind of support do you need?'
      node_type  = 'QUESTION'
      sort_order = 1 )

    ( node_id    = 'DEAL'
      parent_id  = 'Q_TYPE'
      node_name  = 'Deal Support - help progress or close a deal'
      node_type  = 'OPTION'
      sort_order = 1 )

    ( node_id    = 'PQA'
      parent_id  = 'Q_TYPE'
      node_name  = 'PQA Support - quote and pricing quality'
      node_type  = 'OPTION'
      sort_order = 2 )

    ( node_id    = 'DMT'
      parent_id  = 'Q_TYPE'
      node_name  = 'DMT Support'
      node_type  = 'OPTION'
      sort_order = 3 )

    ( node_id    = 'UNSURE'
      parent_id  = 'Q_TYPE'
      node_name  = 'Not sure or opportunity data looks wrong'
      node_type  = 'OPTION'
      sort_order = 4 )

    ( node_id    = 'D_SCOPE'
      parent_id  = 'DEAL'
      node_name  = 'Is this operating model supported by FBS?'
      node_type  = 'QUESTION'
      sort_order = 1 )

    ( node_id    = 'D_SCOPE_N'
      parent_id  = 'D_SCOPE'
      node_name  = 'No - not supported by FBS'
      node_type  = 'OPTION'
      sort_order = 1 )

    ( node_id    = 'D_OUT'
      parent_id  = 'D_SCOPE_N'
      node_name  = 'Contact FBS; do not submit this request'
      node_type  = 'ACTION'
      sort_order = 1 )

    ( node_id    = 'D_SCOPE_Y'
      parent_id  = 'D_SCOPE'
      node_name  = 'Yes - supported'
      node_type  = 'OPTION'
      sort_order = 2 )

    ( node_id    = 'D_ENTRY'
      parent_id  = 'D_SCOPE_Y'
      node_name  = 'Are you submitting from an opportunity or account?'
      node_type  = 'QUESTION'
      sort_order = 1 )

    ( node_id    = 'D_OPP'
      parent_id  = 'D_ENTRY'
      node_name  = 'From an opportunity'
      node_type  = 'OPTION'
      sort_order = 1 )

    ( node_id    = 'D_QUOTE'
      parent_id  = 'D_OPP'
      node_name  = 'Does the opportunity already have a quote or BOM?'
      node_type  = 'QUESTION'
      sort_order = 1 )

    ( node_id    = 'D_QUOTE_Y'
      parent_id  = 'D_QUOTE'
      node_name  = 'Yes - quote exists'
      node_type  = 'OPTION'
      sort_order = 1 )

    ( node_id    = 'D_ACV_AUT'
      parent_id  = 'D_QUOTE_Y'
      node_name  = 'Verify the ACV imported from Harmony'
      node_type  = 'ACTION'
      sort_order = 1 )

    ( node_id    = 'D_QUOTE_N'
      parent_id  = 'D_QUOTE'
      node_name  = 'No quote yet'
      node_type  = 'OPTION'
      sort_order = 2 )

    ( node_id    = 'D_ACV_MAN'
      parent_id  = 'D_QUOTE_N'
      node_name  = 'Enter the estimated ACV manually'
      node_type  = 'ACTION'
      sort_order = 1 )

    ( node_id    = 'D_ACC'
      parent_id  = 'D_ENTRY'
      node_name  = 'From an account'
      node_type  = 'OPTION'
      sort_order = 2 )

    ( node_id    = 'D_ACC_SUB'
      parent_id  = 'D_ACC'
      node_name  = 'Submit from the account and answer all 18 questions'
      node_type  = 'ACTION'
      sort_order = 1 )

    ( node_id    = 'P_WHEN'
      parent_id  = 'PQA'
      node_name  = 'Is the deal signed or ready for booking?'
      node_type  = 'QUESTION'
      sort_order = 1 )

    ( node_id    = 'P_WHEN_N'
      parent_id  = 'P_WHEN'
      node_name  = 'Not yet signed'
      node_type  = 'OPTION'
      sort_order = 1 )

    ( node_id    = 'P_WAIT'
      parent_id  = 'P_WHEN_N'
      node_name  = 'Keep Deal Support active; request PQA at signature'
      node_type  = 'ACTION'
      sort_order = 1 )

    ( node_id    = 'P_WHEN_Y'
      parent_id  = 'P_WHEN'
      node_name  = 'Signed or ready'
      node_type  = 'OPTION'
      sort_order = 2 )

    ( node_id    = 'P_SUB'
      parent_id  = 'P_WHEN_Y'
      node_name  = 'Submit a PQA Support request'
      node_type  = 'ACTION'
      sort_order = 1 )

    ( node_id    = 'DMT_SUB'
      parent_id  = 'DMT'
      node_name  = 'Submit a DMT Support request'
      node_type  = 'ACTION'
      sort_order = 1 )

    ( node_id    = 'U_ORIG'
      parent_id  = 'UNSURE'
      node_name  = 'Is the opportunity origin correct?'
      node_type  = 'QUESTION'
      sort_order = 1 )

    ( node_id    = 'U_ORIG_N'
      parent_id  = 'U_ORIG'
      node_name  = 'No - the origin looks wrong'
      node_type  = 'OPTION'
      sort_order = 1 )

    ( node_id    = 'U_FIX'
      parent_id  = 'U_ORIG_N'
      node_name  = 'Correct the origin in CRM before submitting'
      node_type  = 'ACTION'
      sort_order = 1 )

    ( node_id    = 'U_ORIG_Y'
      parent_id  = 'U_ORIG'
      node_name  = 'Yes - but I am still unsure'
      node_type  = 'OPTION'
      sort_order = 2 )

    ( node_id    = 'U_ASK'
      parent_id  = 'U_ORIG_Y'
      node_name  = 'Ask ORE or FBS, or return the request for correction'
      node_type  = 'ACTION'
      sort_order = 1 )

  ) ).

  out->write( 'FBS decision-tree sample data created.' ).

ENDMETHOD.
ENDCLASS.
