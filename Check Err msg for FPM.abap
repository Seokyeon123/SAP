  METHOD CHECK_ERR_N_DISPLAY_TO_FPM.

    CLEAR: ev_result, et_messages.

    IF io_change IS NOT BOUND
      AND io_change IS NOT BOUND.
      RETURN.
    ENDIF.


    IF   ( io_change  IS BOUND AND io_change->has_failed_changes( ) )
      OR ( io_message IS BOUND AND io_message->check( ) ).

      ev_result = if_fpm_constants=>gc_event_result-failed.

      IF io_message IS BOUND.
        CALL METHOD ztm_cl_common_helper=>msg_convert_bopf_2_t_messages
          EXPORTING
            io_message  = io_message
          IMPORTING
            et_messages = et_messages.
      ENDIF.

      IF is_messages IS NOT INITIAL.

        IF is_messages-plaintext IS NOT INITIAL.
          et_messages = VALUE #( ( severity  = COND #( WHEN is_messages-severity IS INITIAL THEN 'E' ELSE is_messages-severity )
                                   plaintext = is_messages-plaintext ) ).
        ELSEIF is_messages-msgid IS NOT INITIAL.
          et_messages = VALUE #( ( severity    = COND #( WHEN is_messages-severity IS INITIAL THEN 'E' ELSE is_messages-severity )
                                   msgid       = is_messages-msgid
                                   msgno       = is_messages-msgno
                                   parameter_1 = is_messages-parameter_1
                                   parameter_2 = is_messages-parameter_2
                                   parameter_3 = is_messages-parameter_3
                                   parameter_4 = is_messages-parameter_4 ) ).
        ENDIF.

      ENDIF.

      IF et_messages IS INITIAL .
        et_messages = VALUE #( ( severity  = 'E'
                                 msgid     = 'ZTM_MSG'
                                 msgno     = '97' ) ). "Error occurred
      ENDIF.

    ENDIF.



  ENDMETHOD.
