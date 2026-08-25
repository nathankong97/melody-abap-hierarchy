@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Melody hierarchy user expansion state'

define root view entity ZI_MELODY_HSTATE
  as select from zmelody_hstate
{
  key user_id as UserId,
  key node_id as NodeId
}
where user_id = $session.user
