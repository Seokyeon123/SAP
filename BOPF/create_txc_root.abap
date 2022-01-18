METHOD create_txc_root.
  DATA:
  lv_key TYPE /bobf/conf_key.
  DATA:
  ls_txc_root TYPE /bobf/s_txc_root_k.
  IF iv_key IS INITIAL.
    RETURN.
  ELSE.
    lv_key = iv_key.
  ENDIF.
  " Create TEXTCOLLECTION
  CLEAR ls_txc_root.
  ls_txc_root-key = /bobf/cl_frw_factory=>get_new_key( ).
  ls_txc_root-parent_key = lv_key.
  ls_txc_root-root_key = lv_key.
  ls_txc_root-host_bo_key = /scmtms/if_trq_c=>sc_bo_key.
  ls_txc_root-host_node_key = /scmtms/if_trq_c=>sc_node-root.
  ls_txc_root-host_key = lv_key.
  /scmtms/cl_mod_helper=>mod_create_single(
  EXPORTING
  is_data = ls_txc_root
  iv_node = /scmtms/if_trq_c=>sc_node-textcollection
  iv_source_node = /scmtms/if_trq_c=>sc_node-root
  iv_association = /scmtms/if_trq_c=>sc_association-root-textcollection
  CHANGING
  ct_mod = ct_mod
  ).
  create_txc_text(
  EXPORTING
  iv_key = lv_key
  iv_txc_root_key = ls_txc_root-key
  CHANGING
  ct_mod = ct_mod
  ).
ENDMETHOD.
