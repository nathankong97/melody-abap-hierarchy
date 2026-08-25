@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Melody hierarchy selected node state'

define root view entity ZI_MELODY_HSELECT
  as select from zmelody_hselect
{
  key user_id          as UserId,
      selected_node_id as SelectedNodeId
}
where user_id = $session.user
