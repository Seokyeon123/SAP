*If there are stages with same stage type, then need only first stop and last stop wtih same stage type.

*it_stage type /SCMTMS/T_TOR_STAGE.

    DATA:
      lv_k_pre_dest_stop TYPE /bobf/conf_key,
      lv_stage_type      TYPE /scmtms/tor_type,
      lt_stage           LIKE ct_stage,
      ls_stage           LIKE LINE OF lt_stage,
      lv_count           TYPE i.

    FIELD-SYMBOLS: <fs_stage> LIKE LINE OF lt_stage.
    
  LOOP AT it_stage ASSIGNING FIELD-SYMBOL(<stage>)
      GROUP BY ( root_key = <stage>-root_key ).

      CLEAR: lv_stage_type, lv_count, lv_k_pre_dest_stop.
      lv_stage_type = <stage>-stage_type.

      LOOP AT GROUP <stage> ASSIGNING FIELD-SYMBOL(<group>).

        IF lv_stage_type NE <group>-stage_type.
          CLEAR: lv_stage_type, lv_count, ls_stage, lv_k_pre_dest_stop.
          lv_stage_type = <group>-stage_type.

        ENDIF.

        ADD 1 TO lv_count.
        ls_stage-stage_type      = lv_stage_type.
        ls_stage-seq_num         = <group>-seq_num.
        ls_stage-root_key        = <group>-root_key.
        ls_stage-source_stop_key = <group>-source_stop_key.
        ls_stage-dest_stop_key   = <group>-dest_stop_key.

        CASE <group>-stage_type.
          WHEN ztmtg_stage_type-stg_ty_03.
            IF lv_count = 1 .
              ls_stage-source_stop = <group>-source_stop.
            ENDIF.
            ls_stage-dest_stop = <group>-dest_stop.
          WHEN ztmtg_stage_type-stg_ty_04.
            IF lv_count = 1 .
              ls_stage-source_stop = <group>-source_stop.
            ENDIF.
            ls_stage-dest_stop = <group>-dest_stop.

          WHEN ztmtg_stage_type-stg_ty_05.
            IF lv_count = 1 .
              ls_stage-source_stop = <group>-source_stop.
            ENDIF.
            ls_stage-dest_stop = <group>-dest_stop.
          WHEN OTHERS.
            CLEAR ls_stage.
            CONTINUE.
        ENDCASE.

        IF lv_count GT 1.

          " 동일 Stage Type 존재 -> 마지막 Dest로 적용
          ASSIGN lt_stage[ dest_stop_key = lv_k_pre_dest_stop ] TO <fs_stage>.
          CHECK sy-subrc = 0.

          <fs_stage>-dest_stop_key = ls_stage-dest_stop_key.
          <fs_stage>-dest_stop     = ls_stage-dest_stop.

        ELSE.
          INSERT ls_stage INTO TABLE lt_stage.

        ENDIF.

        " Keep destination key
        lv_k_pre_dest_stop = ls_stage-dest_stop_key.

      ENDLOOP.

    ENDLOOP.
