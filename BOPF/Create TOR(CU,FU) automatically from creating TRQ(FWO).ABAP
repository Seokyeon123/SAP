* This is a senario that create TRQ(Forwarding Order) from program.
* TOR(Container Unit or Freight Unit) is automatically created When you create item in FWO document in SAP TM Fiori.
* But It is not possible to create TOR automaticaaly if you do coding only by using TRQ service manager and a method of a modify
* , not using an action called "build_fus".
  
  DATA lr_param_build_fus TYPE REF TO /scmtms/s_trq_a_build_fus.
  CREATE DATA lr_param_build_fus   .

  lr_param_build_fus->fub_consider_pending_trq_keys = abap_true.
  lr_param_build_fus->process = /scmtms/if_fub_const=>sc_fub_process-inbound_controller.
  lr_param_build_fus->automatic = abap_true.

*[+] 
* This action is that 
  lo_trq_srvmgr->do_action(
    EXPORTING
      iv_act_key              = /scmtms/if_trq_c=>sc_action-root-build_fus                 " Action
      it_key                  = VALUE #( ( key = lr_trq_root->key ) )
      is_parameters           = lr_param_build_fus
    IMPORTING
      eo_change               = DATA(test_1)
      eo_message              = DATA(test_2)
      et_failed_key           = DATA(test_3)
      et_failed_action_key    = DATA(test_4)
      ev_static_action_failed = DATA(test_5)
  ).
*[-] 

* If you haven`t saved yet by using a save method of transaction manager, you can retrieve below
* if you use an above method.
  
  
  DATA lt_tor_item TYPE /scmtms/t_tor_item_tr_k.
  lo_trq_srvmgr->retrieve_by_association(
    EXPORTING
      iv_node_key             = /scmtms/if_trq_c=>sc_node-item
      it_key                  = CORRESPONDING #( lt_item )
      iv_association          = /scmtms/if_trq_c=>sc_association-item-tor_item
      iv_fill_data            = abap_true
    IMPORTING
      et_data                 = lt_tor_item
  ).

  DATA lt_tor_root_fu TYPE /scmtms/t_tor_root_k.
  lo_trq_srvmgr->retrieve_by_association(
    EXPORTING
      iv_node_key             = /scmtms/if_trq_c=>sc_node-root
      it_key                  = VALUE #( ( key = lr_trq_root->key ) )
      iv_association          = /scmtms/if_trq_c=>sc_association-root-tor_root_fu
      iv_fill_data            = abap_true
    IMPORTING
      et_data                 = lt_tor_root_fu
      et_key_link             = DATA(lt_tor_root_fu_kl)
      et_target_key           = DATA(lt_tor_root_fu_k)
  ).  
  
