  METHOD if_fpm_guibb_ovs~handle_phase_0.

    DATA:
      ls_text         TYPE wdr_name_value,
      lt_label_texts  TYPE wdr_name_value_list,
      lt_column_texts TYPE wdr_name_value_list.
*      lv_window_title TYPE string,
*      lv_group_header TYPE string,
*      lv_table_header TYPE string.

*  FIELD-SYMBOLS:  TYPE LTY_STRU_INPUT,
*                     TYPE LTY_STRU_LIST.
*
    CASE iv_field_name.
      WHEN `ZIF_ID`.
      WHEN `K2_ZRPL_CD`.
        ls_text-name = `K2_ZRPL_CD`.
        ls_text-value = `CKD 운송사 코드`.
        INSERT ls_text INTO TABLE lt_label_texts.

        ls_text-name = `K2_ZRPL_CD_TM`.
        ls_text-value = `TM 운송사 코드`.
        INSERT ls_text INTO TABLE lt_label_texts.

        lt_column_texts = lt_label_texts.

      WHEN `CONSIGNEEID`.
        ls_text-name = `CONSIGNEEID`.
        ls_text-value = `CKD CONSIGNEE 코드`.
        INSERT ls_text INTO TABLE lt_label_texts.

        ls_text-name = `CONSIGNEEID_TM`.
        ls_text-value = `TM CONSIGNEE 코드`.
        INSERT ls_text INTO TABLE lt_label_texts.

        lt_column_texts = lt_label_texts.

      WHEN `ZCRG_NO`.
        ls_text-name = `ZCRG_NO`.
        ls_text-value = `차량번호`.
        INSERT ls_text INTO TABLE lt_label_texts.

        lt_column_texts = lt_label_texts.
      WHEN OTHERS.
    ENDCASE.

*[+] test
*    LV_WINDOW_TITLE = 'OVS SEARCH HELP'.
*    LV_GROUP_HEADER = 'FLIGHT INFORMATION'.
*    LV_TABLE_HEADER = 'FLIGHT DETAILS'.
*[-] test

    io_ovs_callback->set_configuration(
    LABEL_TEXTS  = LT_LABEL_TEXTS
    column_texts = lt_column_texts
*    GROUP_HEADER = LV_GROUP_HEADER  "안먹음
*    WINDOW_TITLE = LV_WINDOW_TITLE  "안먹음
*    TABLE_HEADER = LV_TABLE_HEADER  "안먹음
*    COL_COUNT    = 2
    row_count    = 20 ).
*
    RETURN.

  ENDMETHOD.
  
  
  
  
    METHOD if_fpm_guibb_ovs~handle_phase_2.

    DATA:
*      lv_fname       TYPE fieldname,
*      lv_as_fname    TYPE fieldname,
      lv_sort     TYPE fieldname,
      lv_zclss_cd TYPE string,
*      lv_zref_cd     TYPE string,
      dref        TYPE REF TO data,
      itab_type   TYPE REF TO cl_abap_tabledescr,
      struct_type TYPE REF TO cl_abap_structdescr,
      comp_tab    TYPE cl_abap_structdescr=>component_table,
      lt_attr     TYPE /scmtms/t_string,
      lt_from     TYPE /scmtms/t_string,
      lt_where    TYPE /scmtms/t_string.

    FIELD-SYMBOLS : <lt_outtab>   TYPE ANY TABLE,
                    <ls_type_ref> TYPE any.

    CLEAR mv_ovs_result_type.
    mv_ovs_result_type = SWITCH #( iv_field_name
                                 WHEN `ZIF_ID`      THEN `TY_OVS_STR_R-ZIF_ID`
                                 WHEN `K2_ZRPL_CD`  THEN `TY_OVS_STR_R-K2_ZRPL_CD`
                                 WHEN `CONSIGNEEID` THEN `TY_OVS_STR_R-CONSIGNEEID`
                                 WHEN `ZCRG_NO`     THEN `TY_OVS_STR_R-ZCRG_NO`
                                 WHEN `ZCNTR_NO`    THEN `TY_OVS_STR_R-ZCNTR_NO`
                                 ).

    CREATE DATA dref TYPE (mv_ovs_result_type).
    ASSIGN dref->* TO <ls_type_ref>.
*    CREATE DATA <LS_TYPE_REF> TYPE (MV_OVS_RESULT_TYPE).

    struct_type ?= cl_abap_structdescr=>describe_by_data( <ls_type_ref> ).
    comp_tab = struct_type->get_components( ).

    struct_type = cl_abap_structdescr=>create( comp_tab ).
    itab_type   = cl_abap_tabledescr=>create( struct_type ).

    CLEAR dref.
    CREATE DATA dref TYPE HANDLE itab_type.
    ASSIGN dref->* TO <lt_outtab>.

*    lt_from = VALUE #( ( `ZTMIFT0940 AS A` ) ).

    IF   iv_field_name = `K2_ZRPL_CD`
      OR iv_field_name = `CONSIGNEEID`.


      lv_zclss_cd = COND #( WHEN iv_field_name = 'K2_ZRPL_CD' THEN |'{ sc_zclss_cd-k2 }'|
                                                              ELSE |'{ sc_zclss_cd-k6 }'| ).

*      lv_zref_cd = COND #( WHEN iv_field_name = 'K2_ZRPL_CD' THEN `A~ZKTNET_TRK_CD`
*                                                             ELSE `A~ZCUST_CD` ).

*      lt_attr = COND #( WHEN iv_field_name = 'K2_ZRPL_CD'
*                             THEN VALUE #( ( `A~ZKTNET_TRK_CD AS K2_ZRPL_CD,`  ) ( `B~ZRPL_CD AS K2_ZRPL_CD_TM`  ) )
*                             ELSE VALUE #( ( `A~ZCUST_CD      AS CONSIGNEEID,` ) ( `B~ZRPL_CD AS CONSIGNEEID_TM` ) ) ).


*      lt_from = VALUE #( BASE lt_from ( `LEFT OUTER JOIN ZTMIFT0021 AS B` )
*                                      ( `ON B~BUKRS    = 'H000'` )
*                                      ( |AND B~ZCLSS_CD = { lv_zclss_cd }| )
*                                      ( |AND B~ZREF_CD = { lv_zref_cd }| ) ).
      lv_sort = COND #( WHEN iv_field_name = 'K2_ZRPL_CD' THEN 'K2_ZRPL_CD'
                                                          ELSE 'CONSIGNEEID' ).

      lt_attr = COND #( WHEN iv_field_name = 'K2_ZRPL_CD'
                             THEN VALUE #( ( `ZRPL_CD AS K2_ZRPL_CD_TM,`  ) ( `ZREF_CD AS K2_ZRPL_CD,`  ) ( `ZDESC_1`  ) )
                             ELSE VALUE #( ( `ZRPL_CD AS CONSIGNEEID_TM,` ) ( `ZREF_CD AS CONSIGNEEID,` ) ( `ZDESC_1`  ) ) ).

      lt_from = VALUE #( ( `ZTMIFT0021` ) ).
      lt_where = VALUE #( ( |ZCLSS_CD = { lv_zclss_cd }| ) ).

      APPEND `AND BUKRS = 'H000'` TO lt_where.
    ELSE.
      lt_attr = VALUE #( ( CONV string( iv_field_name ) ) ).
      lt_from = VALUE #( ( `ZTMIFT0940 AS A` ) ).


    ENDIF.

    DATA lv_input_type TYPE string.
    io_ovs_callback->context_element->get_attribute(
      EXPORTING
        name  = io_ovs_callback->context_attribute
      IMPORTING
*        value = <value>
        value = lv_input_type "Test
    ).

    SELECT (lt_attr)
      FROM (lt_from)
      WHERE (lt_where)
      INTO CORRESPONDING FIELDS OF TABLE @<lt_outtab>.

    IF sy-subrc = 0 AND lv_sort IS NOT INITIAL.
      SORT <lt_outtab> BY (lv_sort).
    ENDIF.


    io_ovs_callback->set_output_table(
      EXPORTING
        output       = <lt_outtab>
    ).

  ENDMETHOD.
  
  
  
  
  
    METHOD if_fpm_guibb_ovs~handle_phase_3.

    DATA: dref TYPE REF TO data.

    FIELD-SYMBOLS <structure> TYPE any.

    CREATE DATA dref TYPE (mv_ovs_result_type).
    ASSIGN dref->* TO <structure>.

    ASSIGN io_ovs_callback->selection->* TO <structure>.
    io_ovs_callback->context_element->set_attribute(
      EXPORTING
        value = <structure>
        name  = iv_wd_context_attr_name
    ).

  ENDMETHOD.
