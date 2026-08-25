@EndUserText.label: 'Melody RAP node hierarchy'
define hierarchy ZR_MELODY_HIERARCHY
  as parent child hierarchy(
    source ZR_MELODY_HNODE
    child to parent association _Parent
    start where ParentId is initial
    siblings order by SortOrder ascending
  )
{
  key NodeId,
      ParentId,
      NodeName,
      NodeType,
      SortOrder
}
