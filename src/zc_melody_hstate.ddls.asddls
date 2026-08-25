@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Melody hierarchy user state consumption'

define root view entity ZC_MELODY_HSTATE
  as projection on ZI_MELODY_HSTATE
{
  key UserId,
  key NodeId
}
