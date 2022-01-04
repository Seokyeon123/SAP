  METHOD analyse_msg_for_lock_unlock_k.

    CLEAR:
      et_locked_key,
      et_unlocked_key.


    CHECK io_message IS BOUND.

    CALL METHOD /scmtms/cl_common_helper=>analyze_messages
      EXPORTING
        io_message    = io_message
      IMPORTING
        et_locked_key = DATA(lt_locked_key).

    IF lt_locked_key IS NOT INITIAL.

      LOOP AT it_key INTO DATA(ls_key).

        READ TABLE lt_locked_key INTO DATA(ls_locked_key)
          WITH TABLE KEY key = ls_key-key.
        IF sy-subrc = 0.
          APPEND ls_key TO et_locked_key.
        ELSE.
          APPEND ls_key TO et_unlocked_key.
        ENDIF.

      ENDLOOP.

    ELSE.

      et_unlocked_key = it_key.

    ENDIF.

  ENDMETHOD.
