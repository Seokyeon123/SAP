  METHOD convert_date_time_to_timestamp.

    " BOBT STOP: PLAN_TRANS_TIME 등 시간 관련 업데이트 할 떄
    " Convert date and time to time stamp

    " BOBT STOP: PLAN_TRANS_TIME 등 시간 관련 데이터를 가져올 때
    " Convert timestamp to date and time
    CLEAR:
    ev_tzone,
    ev_timestamp.

    IF iv_date IS INITIAL.
      RETURN.
    ENDIF.

    IF iv_timezone IS INITIAL.
      ev_tzone = /scmtms/cl_common_helper=>loc_key_get_timezone( iv_loc_key = iv_loc_uuid ).
    ELSE.
      ev_tzone = iv_timezone.
    ENDIF.

    CLEAR ev_timestamp.

    CONVERT DATE iv_date TIME iv_time INTO TIME STAMP ev_timestamp
    TIME ZONE ev_tzone.

  ENDMETHOD.
