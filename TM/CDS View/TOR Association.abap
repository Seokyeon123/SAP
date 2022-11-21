as select from /scmtms/d_torrot as root
  association [1..*] to /scmtms/d_torite as _item      on root.db_key = _item.parent_key
  association [1..*] to /scmtms/d_torpty as _party     on root.db_key = _party.parent_key
  association [1..*] to /scmtms/d_torlca as _lcaddr    on root.db_key = _lcaddr.parent_key
  association [1..*] to /scmtms/d_tordrf as _docref    on root.db_key = _docref.parent_key
  association [1..*] to /scmtms/d_torstp as _stop      on root.db_key = _stop.parent_key
  association [1..*] to /scmtms/d_torsts as _stop_succ on root.db_key = _stop_succ.parent_key
  association [1..*] to /scmtms/d_torexe as _exec      on root.db_key = _exec.parent_key
{
  key root.db_key,
      root.tor_id, 
      root.tor_cat,
      root.tor_type,
      root.creation_type,
      root.movement_cat,
      root.consol_type,
      root.labeltxt,
      root.partner_ref_id,
      root.partner_mbl_id,
      root.partner_mbl_id_status,
      root.partner_mbl_rcvd,
      root.mbl_issuing_date,
      root.bl_number,
      root.resp_person,
      root.dgo_indicator,
      root.dgo_check_error,
      root.transsrvlvl_code,
      root.tsp,
      root.tspid,
      root.tsp_scac,
      root.tsp_airlc,
      root.tsp_airlcawb,
      root.tsp_address_id,
      root.shipper_key,
      root.shipperid,
      root.consignee_key,
      root.consigneeid,
      root.commpty_key,
      root.commptyid,
      root.tspexec_key,
      root.tspexecid,
      root.tspexec_scac,
      root.tspexec_airlc,
      root.tspexec_set_by,
      root.tspissagnt_key,
      root.tspissagnt_id,
      root.eikto,
      root.booking_trmo,
      root.traffic_direct,
      root.exec_org_id,
      root.exec_grp_id,
      root.purch_org_id,
      root.purch_grp_id,
      root.lifecycle,
      root.execution,
      root.arrival_date,
      root.mtr,
      root.trmodcod,
      root.trmodcat,
      root.gro_wei_val,
      root.gro_wei_uni,
      root.gro_vol_val,
      root.gro_vol_uni,
      root.net_wei_val,
      root.net_wei_uni,
      root.qua_pcs_val,
      root.qua_pcs_uni,
      root.pkgun_wei_val,
      root.pkgun_wei_uni,
      root.cont_cnt_val,
      root.cont_cnt_uni,
      root.confirmation,
      root.subcontracting,
      root.created_by,
      root.created_on,
      root.changed_by,
      root.changed_on,

      _item,   // Make association public
      _party,  // Make association public
      _lcaddr, // Make association public
      _docref, // Make association public
      _stop, // Make association public
      _stop_succ, // Make association public
      _exec // Make association public
}
