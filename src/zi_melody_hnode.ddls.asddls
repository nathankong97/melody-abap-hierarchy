@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Melody hierarchy node source'

define view entity ZI_MELODY_HNODE
  as select from zmelody_hnode

  association [0..1] to ZI_MELODY_HNODE as _Parent
    on $projection.ParentId = _Parent.NodeId
{
  key node_id    as NodeId,
      parent_id  as ParentId,
      node_name  as NodeName,
      node_type  as NodeType,
      sort_order as SortOrder,

      _Parent
}
