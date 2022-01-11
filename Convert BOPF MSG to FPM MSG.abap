  METHOD msg_convert_bopf_2_t_messages.

    DATA:
      lt_bapiret2 TYPE bapiret2_tab,
      ls_bapiret2 LIKE LINE OF lt_bapiret2.

    CLEAR:
      et_messages.

    /scmtms/cl_common_helper=>msg_convert_bopf_2_bapiret2(
      EXPORTING
        io_message              = io_message
      CHANGING
        ct_bapiret2             = lt_bapiret2
    ).

    et_messages =
    CORRESPONDING #(
    lt_bapiret2 MAPPING
    msgid = id
    msgno = number
    severity = type
    parameter_1 = message_v1
    parameter_2 = message_v2
    parameter_3 = message_v3
    parameter_4 = message_v4
    ).

    IF ct_messages IS SUPPLIED.
      LOOP AT lt_bapiret2 INTO ls_bapiret2.
        APPEND VALUE #(
        msgid       = ls_bapiret2-id
        msgno       = ls_bapiret2-number
        severity    = ls_bapiret2-type
        parameter_1 = ls_bapiret2-message_v1
        parameter_2 = ls_bapiret2-message_v2
        parameter_3 = ls_bapiret2-message_v3
        parameter_4 = ls_bapiret2-message_v4
        ) TO ct_messages.

        CLEAR ls_bapiret2.
      ENDLOOP.

      IF iv_severity IS NOT INITIAL.
        DELETE ct_messages WHERE severity <> iv_severity .
      ENDIF.

    ENDIF.

    IF iv_severity IS NOT INITIAL.
      DELETE et_messages WHERE severity <> iv_severity .
    ENDIF.

  ENDMETHOD.
