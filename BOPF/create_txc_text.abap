METHOD create_txc_text.
  DATA:
    lv_key            TYPE /bobf/conf_key,
    lv_txc_root_key   TYPE /bobf/conf_key,
    lv_txc_text_node  TYPE /bobf/conf_key,
    lv_txc_text_assoc TYPE /bobf/conf_key.
  DATA:
    ls_txc_root TYPE /bobf/s_txc_root_k,
    ls_txc_text TYPE /bobf/s_txc_txt_k.
  IF iv_key IS INITIAL OR iv_txc_root_key IS INITIAL.
    RETURN.
  ELSE.
    lv_key = iv_key.
    lv_txc_root_key = iv_txc_root_key.
  ENDIF.
  DATA(lo_conf_trq) =
  /bobf/cl_frw_factory=>get_configuration( iv_bo_key = /scmtms/if_trq_c=>sc_bo_key ).
  " Get key
  lo_conf_trq->get_content_key_mapping(
  EXPORTING
  iv_content_cat = /bobf/if_conf_c=>sc_content_nod
  iv_do_content_key = /bobf/if_txc_c=>sc_node-text
  iv_do_root_node_key = /scmtms/if_trq_c=>sc_node-textcollection
  RECEIVING
  ev_content_key = lv_txc_text_node
  ).
  lo_conf_trq->get_content_key_mapping(
  EXPORTING
  iv_content_cat = /bobf/if_conf_c=>sc_content_ass
  iv_do_content_key = /bobf/if_txc_c=>sc_association-root-text
  iv_do_root_node_key = /scmtms/if_trq_c=>sc_node-textcollection
  RECEIVING
  ev_content_key = lv_txc_text_assoc
  ).
  CLEAR ls_txc_text.
  ls_txc_text-key = /bobf/cl_frw_factory=>get_new_key( ).
  ls_txc_text-parent_key = lv_txc_root_key.
  ls_txc_text-root_key = lv_key.
  ls_txc_text-text_type = 'NOTE'.
  ls_txc_text-language_code = sy-langu.
  /scmtms/cl_mod_helper=>mod_create_single(
  EXPORTING
  is_data = ls_txc_text
  iv_node = lv_txc_text_node
  iv_source_node = /scmtms/if_trq_c=>sc_node-textcollection
  iv_association = lv_txc_text_assoc
  CHANGING
  ct_mod = ct_mod
  ).
  create_txc_content(
  EXPORTING
  iv_key = lv_key
  iv_txc_text_key = ls_txc_text-key
  CHANGING
  ct_mod = ct_mod
  ).
ENDMETHOD.
