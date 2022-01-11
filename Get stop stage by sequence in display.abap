  METHOD get_stop_seq.

IT_ROOT_KEY	Importing	Type	/BOBF/T_FRW_KEY
ET_STOP_SEQ	Exporting	Type	/SCMTMS/T_PLN_STOP_SEQ
ET_STAGE	Exporting	Type	/SCMTMS/T_PLN_STAGE

    DATA:
      lv_seq_num   TYPE i,
      lt_stop      TYPE /scmtms/t_tor_stop_k,
      lt_stop_succ TYPE /scmtms/t_tor_stop_succ_k,
      lt_key       TYPE /bobf/t_frw_key.

    FIELD-SYMBOLS:
      <fs_stop>      LIKE LINE OF lt_stop,
      <fs_stop_succ> LIKE LINE OF lt_stop_succ,
      <fs_key>       LIKE LINE OF lt_key.

    DATA:
      lt_stage    LIKE et_stage,
      lt_stop_seq LIKE et_stop_seq,
      ls_stage    LIKE LINE OF et_stage,
      ls_stop_seq LIKE LINE OF et_stop_seq.

    CLEAR:
     et_stop_seq,
     et_stage.

    lt_key = it_root_key.

    /scmtms/cl_tor_helper_common=>get_tor_data(
      EXPORTING
        it_root_key      = lt_key
*        io_read          = io_read
      IMPORTING
        et_stop          = lt_stop
        et_stop_succ_all = lt_stop_succ
  ).


    LOOP AT lt_key ASSIGNING <fs_key>.

      CLEAR lv_seq_num.
      READ TABLE lt_stop ASSIGNING <fs_stop> WITH TABLE KEY stop_seq_pos
        COMPONENTS root_key     = <fs_key>-key
                   stop_seq_pos = /scmtms/if_tor_const=>sc_stop_seq_pos-pos_source_stop.
      CHECK sy-subrc = 0.

      ADD 1 TO lv_seq_num.

      CLEAR ls_stop_seq.
      ls_stop_seq          = CORRESPONDING #( <fs_stop> ).
      ls_stop_seq-root_key = <fs_stop>-root_key.
      ls_stop_seq-seq_num  = lv_seq_num.
      INSERT ls_stop_seq INTO TABLE lt_stop_seq.

      CLEAR ls_stage.
      ls_stage-source_stop     = CORRESPONDING #( <fs_stop> ).
      ls_stage-source_stop_key = <fs_stop>-key.
      ls_stage-source_loc_uuid = <fs_stop>-log_loc_uuid.
      ls_stage-root_key        = <fs_stop>-root_key.
      ls_stage-seq_num         = lv_seq_num.

      DATA(lv_lines) = lines( FILTER #( lt_stop USING KEY root_key WHERE root_key = <fs_stop>-root_key ) ).

      DO.
        ADD 1 TO lv_seq_num.
        " in stop_successor_all association senario
        " parent_key    = source_key     (show stage in display)
        " succ_stop_key = destnation key (show stage in display)
        " parent_key    = destnation key (not show stage in display)
        " succ_stop_key = source key     (not show stage in display)
        READ TABLE lt_stop_succ ASSIGNING <fs_stop_succ> WITH TABLE KEY parent_key
          COMPONENTS parent_key = <fs_stop>-key.
        CHECK sy-subrc = 0.

        ls_stage = CORRESPONDING #( BASE ( ls_stage ) <fs_stop_succ> MAPPING stage_key = key ).
        ls_stage-stage_key  = <fs_stop_succ>-key.

        READ TABLE lt_stop ASSIGNING <fs_stop> WITH TABLE KEY key = <fs_stop_succ>-succ_stop_key.
        CHECK sy-subrc = 0.

        CASE <fs_stop>-stop_cat.
          WHEN /scmtms/if_tor_const=>sc_tor_stop_cat-inbound.
            ls_stage-dest_stop     = CORRESPONDING #( <fs_stop> ).
            ls_stage-dest_stop_key = <fs_stop>-key.
            ls_stage-dest_loc_uuid = <fs_stop>-log_loc_uuid.
            INSERT ls_stage INTO TABLE lt_stage.
          WHEN /scmtms/if_tor_const=>sc_tor_stop_cat-outbound.
            CLEAR ls_stage.
            ls_stage-source_stop     = CORRESPONDING #( <fs_stop> ).
            ls_stage-source_stop_key = <fs_stop>-key.
            ls_stage-source_loc_uuid = <fs_stop>-log_loc_uuid.
            ls_stage-root_key        = <fs_stop>-root_key.
            ls_stage-seq_num         = lines( FILTER #( lt_stage WHERE root_key = <fs_key>-key ) ) + 1.
        ENDCASE.

        " source or destination
        CLEAR ls_stop_seq.
        ls_stop_seq          = CORRESPONDING #( <fs_stop> ).
        ls_stop_seq-root_key = <fs_stop>-root_key.
        ls_stop_seq-seq_num  = lv_seq_num.
        INSERT ls_stop_seq INTO TABLE lt_stop_seq.

        IF lv_lines = lv_seq_num.
          CLEAR lv_lines.
          EXIT.
        ENDIF.

      ENDDO.

    ENDLOOP.

    INSERT LINES OF lt_stop_seq INTO TABLE et_stop_seq.
    INSERT LINES OF lt_stage    INTO TABLE et_stage.

  ENDMETHOD.
