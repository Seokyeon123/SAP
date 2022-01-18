METHOD get_tor_key_by_mawb.

* Class        /SCMTMS/CL_TOR_HELPER_ITEM_EXT
* Method       GET_TOR_KEY_BY_MAWB

* IO_TOR_SRVMGR	TYPE REF TO /BOBF/IF_TRA_SERVICE_MANAGER OPTIONAL	Containing the public service methods of a service manager
* IV_MBL_ID	TYPE /SCMTMS/PARTNER_MBL_NUMBER	Carrier's Master Bill of Lading Number
* ET_TOR_KEY	TYPE /BOBF/T_FRW_KEY	Key Table
* EO_MESSAGE	TYPE REF TO /BOBF/IF_FRW_MESSAGE	Interface of Message Object

  DATA:
    lo_tor_srvmgr LIKE io_tor_srvmgr,
    lt_selopt     TYPE /bobf/t_frw_query_selparam,
    ls_selopt     TYPE /bobf/s_frw_query_selparam,
    lv_mbl_id     TYPE /scmtms/partner_mbl_number,
    lv_airlcawb   TYPE /scmtms/airlcawb.


  lv_mbl_id = iv_mbl_id+3.
  IF substring( val = lv_mbl_id off = 0 len = 1 ) = '-'.
    lv_mbl_id = iv_mbl_id+4.
  ENDIF.
  lv_airlcawb = iv_mbl_id.
  CLEAR ls_selopt.
  ls_selopt-attribute_name = /scmtms/if_tor_c=>sc_query_attribute-root-root_elements-partner_mbl_id. "'PARTNER_MBL_ID'. " TODO, überhaupt unterstützt durch index oder BOPF puffer?
  ls_selopt-sign    = 'I'.
  ls_selopt-option  = 'EQ'.
  ls_selopt-low     = lv_mbl_id.
  APPEND ls_selopt TO lt_selopt.
  ls_selopt-attribute_name = /scmtms/if_tor_c=>sc_query_attribute-root-root_elements-tsp_airlcawb. "'PARTNER_MBL_ID'. " TODO, überhaupt unterstützt durch index oder BOPF puffer?
  ls_selopt-low     = lv_airlcawb.
  APPEND ls_selopt TO lt_selopt.

  IF io_tor_srvmgr IS NOT BOUND.
    lo_tor_srvmgr = /bobf/cl_tra_serv_mgr_factory=>get_service_manager( iv_bo_key = /scmtms/if_tor_c=>sc_bo_key ).
  ELSE.
    lo_tor_srvmgr = io_tor_srvmgr.
  ENDIF.

  lo_tor_srvmgr->query(   " TODO query in LOOP -> performance problems?
    EXPORTING
      iv_query_key            = /scmtms/if_tor_c=>sc_query-root-root_elements
      it_selection_parameters =  lt_selopt
    IMPORTING
      eo_message              = eo_message
      et_key                  = et_tor_key ).

ENDMETHOD.
