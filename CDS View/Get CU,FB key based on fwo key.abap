@AbapCatalog.sqlViewName: 'ZTMFSDV1910'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Get cu/fb key link base on fwo'

define view ZTMFSDD1910
  as select from /scmtms/d_trqrot as a

    join         /scmtms/d_torite as b on b.ref_root_key = a.db_key

    left outer join(
                 /scmtms/d_torite as c
        join     /scmtms/d_torrot as d on  d.db_key  = c.parent_key
                                       and d.tor_cat = 'BO'
    )
    on c.ref_item_key = b.db_key
{
  a.db_key     as trq_key,
  b.parent_key as tor_tu_key,
  d.db_key     as tor_bo_key
}

where
      a.lifecycle <> '10'
  and a.trq_cat   =  '03'
