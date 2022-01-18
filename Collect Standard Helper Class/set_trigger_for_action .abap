METHOD set_trigger_for_action.

* Class        /SCMTMS/CL_TRIG_HELPER
* Method       SET_TRIGGER_FOR_ACTION

IV_TRIGGER_ID	TYPE /SCMTMS/TRIG_TRIGGER_ID	BO Trigger: Trigger ID
IT_FAILED_KEY	TYPE /BOBF/T_FRW_KEY OPTIONAL	Key Table of failed keys with check on fail reason lock
IT_FORCED_KEY	TYPE /BOBF/T_FRW_KEY OPTIONAL	Keys that should be processed always
IT_KL_FAILED_LOCKNODE	TYPE /BOBF/T_FRW_KEY_LINK OPTIONAL	Key Link
IV_PROCESS_ASAP	TYPE ABAP_BOOL  DEFAULT ABAP_TRUE	Process trigger asap, e.g. for decoupling triggers
ET_FAILED_KEY	TYPE /BOBF/T_FRW_KEY	Key Table
IV_PROCESS_DELAY_IN_SEC	TYPE INT4 OPTIONAL	Processing Delay in seconds
EO_MESSAGE	TYPE REF TO /BOBF/IF_FRW_MESSAGE	Interface of Message Object
ET_TRIGGER_KEY	TYPE /SCMTMS/T_TRIG_TRIGGER_KEY	Key Table


  DATA: ls_key               TYPE /bobf/s_frw_key,
        ls_trigger_key       TYPE /scmtms/s_trig_trigger_key,
        lo_msg               TYPE REF TO /bobf/if_frw_message,
        lr_s_message         TYPE REF TO /bobf/s_frw_message_k,
        lo_trig_control      TYPE REF TO /scmtms/if_trig_control,
        lr_s_trigger_context TYPE REF TO /scmtms/s_trig_context_action,
        lr_s_trigger_key     TYPE REF TO /scmtms/s_trig_trigger_key,
        lv_dummy             TYPE string.

  DATA(lt_failed_key) = it_failed_key.

* check the messages for locking issue and collect the trigger keys accordingly
  check_for_locking_issue(
    EXPORTING
      io_message            = io_message
      it_failed_key         = lt_failed_key
      it_kl_failed_locknode = it_kl_failed_locknode
    IMPORTING
      et_trigger_key        = et_trigger_key
      et_failed_key         = et_failed_key
      eo_message            = eo_message ).

*  Collect the keys that should be processed always
  LOOP AT it_forced_key INTO ls_key.
    ls_trigger_key-trigger_key = ls_key-key.
    INSERT ls_trigger_key INTO TABLE et_trigger_key.
  ENDLOOP.
  DELETE ADJACENT DUPLICATES FROM et_trigger_key USING KEY key_sort.
  IF et_trigger_key IS NOT INITIAL.
************************************************************
*   Trigger handling
*   Trigger is set to reprocess action for the failed keys at a later point in time
    TRY.
        lo_trig_control = /scmtms/cl_trig_factory=>get_instance( iv_trigger_id ).

        CREATE DATA lr_s_trigger_context.

        lr_s_trigger_context->s_frw_ctx_act  = is_action_context.
        lr_s_trigger_context->r_s_parameters = is_parameter.

        lo_trig_control->set_trigger(
          EXPORTING
            it_trigger_key  = et_trigger_key
            ir_context      = lr_s_trigger_context
            iv_process_asap = iv_process_asap
            iv_process_delay_in_sec = iv_process_delay_in_sec ).
      CATCH /scmtms/cx_trig.
*  Standard error handling
        LOOP AT et_trigger_key REFERENCE INTO lr_s_trigger_key.
          CLEAR ls_key.
          ls_key-key = lr_s_trigger_key->trigger_key.
          INSERT ls_key INTO TABLE et_failed_key.
        ENDLOOP.
    ENDTRY.
    IF et_failed_key IS INITIAL.
* message that trigger could be set successfully
      MESSAGE s002(/scmtms/trig) WITH iv_trigger_id INTO lv_dummy.
      CALL METHOD /scmtms/cl_common_helper=>msg_helper_add_symsg
        EXPORTING
          iv_subobject = /scmtms/cl_applog_helper=>sc_al_sobj_trig
          iv_detlevel  = /scmtms/cl_applog_helper=>sc_al_detlev_technical
          iv_probclass = /scmtms/cl_applog_helper=>sc_al_probclass_add_info
        CHANGING
          co_message   = eo_message.
    ENDIF.
  ENDIF.


ENDMETHOD.



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


