METHOD /bobf/if_frw_action~execute.
  DATA:
    ls_params     TYPE apb_lpd_s_portal_parameters,
    lt_return     TYPE bapirettab,
    ls_return     LIKE LINE OF lt_return,
    ls_url_fields TYPE fpm_s_launch_url,
    lo_fpm        TYPE REF TO if_fpm,
    lo_nav        TYPE REF TO if_fpm_navigate_to.
  lo_fpm = cl_fpm_factory=>get_instance( ).
  lo_nav = lo_fpm->get_navigate_to( ).
* ls_url_fields-url = 'https://etrans.klnet.co.kr/login_link.do?loginId=GLOVC010&loginPwd=GLOVC010!&**
*ls_params-navigation_mode = 'EXT_PORT'.
  ls_url_fields-url = 'http://etrans.klnet.co.kr/login_link.do?loginId=GLOVC010&loginPwd=GLOVC010!&'.
  ls_params-navigation_mode = 'EXTERNAL'.
* ls_params-window_features = 'width=100%,height=100%'.
  lo_nav->launch_url(
  EXPORTING
  is_url_fields = ls_url_fields
  is_additional_parameters = ls_params
  IMPORTING
  et_messages = DATA(lt_messages)
  ev_error = DATA(lv_error)
  ).
  IF lv_error IS NOT INITIAL.
    LOOP AT lt_messages INTO DATA(ls_messages).
      CLEAR ls_return.
      ls_return =
      VALUE #(
      id = ls_messages-msgid number = ls_messages-msgno type = ls_messages-severity
      message_v1 = ls_messages-parameter_1 message_v2 = ls_messages-parameter_2
      message_v3 = ls_messages-parameter_3 message_v4 = ls_messages-parameter_4
      ).
      APPEND ls_return TO lt_return.
    ENDLOOP.
    /scmtms/cl_common_helper=>msg_convert_bapiret2_2_bopf(
    EXPORTING
* iv_node_key = is_ctx-node_key
* it_key = it_key
    it_return = lt_return
    CHANGING
    co_message = eo_message
    ct_failed_key = et_failed_key
    ).
  ENDIF.
ENDMETHOD.
