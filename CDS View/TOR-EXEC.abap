@AbapCatalog.sqlViewName: 'Z100236_CV_70'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS View from /scmtms/d_torexe'
define view z100236_ddl_70
  as select from /scmtms/d_torexe as a
    join         /sapapo/v_loc2   as b on  b.locno = a.ext_loc_id
                                       and b.spras = $session.system_language
{
  key a.db_key,
  key a.parent_key,
  key a.torstopuuid,
  key a.toritmuuid,
      a.execution_id,
      a.actual_date,
      concat(tstmp_to_dats(a.actual_date, b.tzone, $session.client, 'NULL'),
                tstmp_to_tims(a.actual_date, b.tzone, $session.client, 'NULL') ) as conv_actual_date,
      tstmp_to_dats(a.actual_date, b.tzone, $session.client, 'NULL')             as conv_actual_date_D,
      tstmp_to_tims(a.actual_date, b.tzone, $session.client, 'NULL')             as conv_actual_date_t,
      //a.actual_tzone,
      a.ext_loc_id,
      a.ext_loc_uuid,
      b.tzone,
      b.descr40,
      a.event_code,
      a.event_reason,
      a.event_status,
      a.trans_activity,
      a.execinfo_source,
      a.event_revoked,
      a.orig_exec_key
}
where
  a.event_revoked = ''
