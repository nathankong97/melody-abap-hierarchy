@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Melody hierarchy consumption view'
@Metadata.allowExtensions: true
@Search.searchable: true

@OData.hierarchy.recursiveHierarchy: [
  {
    entity.name: 'ZR_MELODY_HIERARCHY'
  }
]

define view entity ZC_MELODY_HNODE
  as select from ZR_MELODY_HNODE

  association [0..1] to ZC_MELODY_HNODE as _Parent
    on $projection.ParentId = _Parent.NodeId
{
      @Search.defaultSearchElement: true
  key NodeId,
      ParentId,

      @Search.defaultSearchElement: true
      NodeName,

      NodeType,
      SortOrder,

      _Parent
}
