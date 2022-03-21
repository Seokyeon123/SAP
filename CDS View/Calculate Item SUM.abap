as select from /scmtms/d_torite
{
  key parent_key,
      item_cat,

      @Semantics.quantity.unitOfMeasure: 'qua_pcs_uni'
      sum(qua_pcs_val) as tot_qua_pcs_val,
      @Semantics.unitOfMeasure: true
      qua_pcs_uni,

      @Semantics.quantity.unitOfMeasure: 'gro_wei_uni'
      sum(gro_wei_val) as tot_gro_wei_val,
      @Semantics.unitOfMeasure: true
      gro_wei_uni,

      @Semantics.quantity.unitOfMeasure: 'gro_vol_uni'
      sum(gro_vol_val) as tot_gro_vol_val,
      @Semantics.unitOfMeasure: true
      gro_vol_uni,

      @Semantics.quantity.unitOfMeasure: 'net_wei_uni'
      sum(net_wei_val) as tot_net_wei_val,
      @Semantics.unitOfMeasure: true
      net_wei_uni

}
group by
  parent_key,
  item_cat,
  qua_pcs_uni,
  gro_wei_uni,
  gro_vol_uni,
  net_wei_uni
