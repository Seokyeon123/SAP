"Common use stop info.

SELECT
  FROM /scmtms/d_torstp AS torstp
  JOIN /sapapo/loc      AS loc    ON loc~locno    = torstp~log_locid
                                 AND loc~loc_uuid = torstp~log_loc_uuid
  JOIN /sapapo/loct     AS loct   ON loct~locid   = loc~locid
                                 AND loct~spras   = @sy-langu
  FIELDS
    torstp~db_key,
    torstp~parent_key,
    torstp~stop_cat,
    torstp~log_loc_uuid,
    torstp~log_locid,
    torstp~log_locun,
    torstp~adr_loc_uuid,
    torstp~req_start,
    torstp~req_end,
    torstp~plan_trans_time,
    torstp~stop_role,
    torstp~stop_seq_pos,
    torstp~cutoff_cargo,
    torstp~cutoff_doc,
    loc~tzone,
    loc~adrnummer,
    loct~descr40
  INTO TABLE @DATA(lt_stop_info).
