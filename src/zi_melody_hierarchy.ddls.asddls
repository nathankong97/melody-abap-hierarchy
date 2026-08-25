@EndUserText.label: 'Melody node hierarchy'
define hierarchy ZI_MELODY_HIERARCHY
  as parent child hierarchy(
    source ZI_MELODY_HNODE
    child to parent association _Parent
    start where ParentId is initial
    siblings order by SortOrder ascending
  )
{
  NodeId,
  ParentId,
  NodeName,
  NodeType,
  SortOrder
}
