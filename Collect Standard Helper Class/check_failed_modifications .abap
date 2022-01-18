METHOD check_failed_modifications.

* Class        /SCMTMS/CL_COMMON_HELPER
* Method       CHECK_FAILED_MODIFICATIONS

* IO_MODIFY	TYPE REF TO /BOBF/IF_FRW_MODIFY	Interface to Change Data
* ET_FAILED_MOD_NODES	TYPE /BOBF/T_FRW_NODE	Node Table
* CO_MESSAGE	TYPE REF TO /BOBF/IF_FRW_MESSAGE	Interface of Change Object

  DATA:
    lo_chg TYPE REF TO /bobf/if_frw_change,
    lo_msg TYPE REF TO /bobf/if_frw_message.

* do the end-modify to be able to handle failed changes
  io_modify->end_modify( EXPORTING iv_process_immediately = abap_true
                         IMPORTING eo_change              = lo_chg
                                   eo_message             = lo_msg ).

* return messages
  IF lo_msg IS BOUND.
    /scmtms/cl_common_helper=>msg_helper_add_mo( EXPORTING io_new_message = lo_msg
                                                 CHANGING  co_message     = co_message ).
  ENDIF.

* check for failed mods
  IF lo_chg IS BOUND.
    lo_chg->get_changes( EXPORTING iv_failed       = abap_true
                         IMPORTING et_changed_node = et_failed_mod_nodes ).
  ENDIF.

ENDMETHOD.
