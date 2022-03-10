@AbapCatalog.sqlViewName: 'Z100236_CV_60'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS View from /scmtms/d_torrot'
define view z100236_dv_60
  as select from /scmtms/d_torstp as a
    join         /sapapo/v_loc2   as b on  b.locno = a.log_locid
                                       and b.spras = $session.system_language
{
  key a.db_key,
      a.parent_key,
      a.stop_id,
      a.stop_cat,
      a.log_loc_uuid,
      a.log_locid,
      a.log_locun,
      a.log_lociata,
      b.tzone,
      b.descr40,
      a.adr_loc_uuid,
      a.req_start,
      concat(tstmp_to_dats(a.req_start, b.tzone, $session.client, 'NULL'),
            tstmp_to_tims(a.req_start, b.tzone, $session.client, 'NULL') ) as conv_reqs,
      tstmp_to_dats(a.req_start, b.tzone, $session.client, 'NULL')         as conv_reqs_D,
      tstmp_to_tims(a.req_start, b.tzone, $session.client, 'NULL')         as conv_reqs_t,      
      a.req_end,
      concat(tstmp_to_dats(a.req_end, b.tzone, $session.client, 'NULL'),
            tstmp_to_tims(a.req_end, b.tzone, $session.client, 'NULL') ) as conv_reqd,
      tstmp_to_dats(a.req_end, b.tzone, $session.client, 'NULL')         as conv_reqd_D,
      tstmp_to_tims(a.req_end, b.tzone, $session.client, 'NULL')         as conv_reqd_t,      
      a.plan_trans_time,
      concat(tstmp_to_dats(a.plan_trans_time, b.tzone, $session.client, 'NULL'),
            tstmp_to_tims(a.plan_trans_time, b.tzone, $session.client, 'NULL') ) as conv_ptt,
      tstmp_to_dats(a.plan_trans_time, b.tzone, $session.client, 'NULL')         as conv_ptt_D,
      tstmp_to_tims(a.plan_trans_time, b.tzone, $session.client, 'NULL')         as conv_ptt_t,
      a.stop_role,
      a.stop_seq_pos,
      a.cutoff_cargo,
      concat(tstmp_to_dats(a.cutoff_cargo, b.tzone, $session.client, 'NULL'),
            tstmp_to_tims(a.cutoff_cargo, b.tzone, $session.client, 'NULL') )    as conv_coc,
      tstmp_to_dats(a.cutoff_cargo, b.tzone, $session.client, 'NULL')            as conv_coc_D,
      tstmp_to_tims(a.cutoff_cargo, b.tzone, $session.client, 'NULL')            as conv_coc_t,
      a.cutoff_doc,
      concat(tstmp_to_dats(a.cutoff_doc, b.tzone, $session.client, 'NULL'),
            tstmp_to_tims(a.cutoff_doc, b.tzone, $session.client, 'NULL') )      as conv_cod,
      tstmp_to_dats(a.cutoff_doc, b.tzone, $session.client, 'NULL')              as conv_cod_D,
      tstmp_to_tims(a.cutoff_doc, b.tzone, $session.client, 'NULL')              as conv_cod_t

}
