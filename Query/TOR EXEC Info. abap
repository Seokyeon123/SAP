"Exec 

SELECT
  FROM /scmtms/d_torexe AS torexe
  FIELDS
    torexe~db_key,
    torexe~parent_key,
    torexe~torstopuuid,
    torexe~toritmuuid,
    torexe~actual_date,
    torexe~actual_tzone,
    torexe~ext_loc_id,
    torexe~ext_loc_uuid,
    torexe~event_code,
    torexe~event_reason,
    torexe~trans_activity,
    torexe~event_revoked
  INTO TABLE @DATA(lt_exec_info).
