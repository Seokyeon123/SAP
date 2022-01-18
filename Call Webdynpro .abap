METHOD /bobf/if_frw_action~execute.
* DATA ls_si_root TYPE /scmtms/s_tor_root_k.
* FIELD-SYMBOLS <fs_si_node_data> TYPE STANDARD TABLE.
* READ TABLE core_object->mo_controller->/bofu/if_fbi_controller~mt_node_buffer
* INTO DATA(ls_si_node_buffer) WITH KEY bo_key = /scmtms/if_tor_c=>sc_bo_key
* node_key = /scmtms/if_tor_c=>sc_node-root.
* ASSIGN ls_si_node_buffer-t_data->* TO <fs_node_data>.
* CHECK <fs_node_data> IS ASSIGNED.
* READ TABLE <fs_node_data> ASSIGNING FIELD-SYMBOL(<fs_si_root>) INDEX 1.
* ls_si_root = <fs_si_root>.
  CALL METHOD /scmtms/cl_tor_helper_read=>get_tor_data
    EXPORTING
      it_root_key = it_key
    IMPORTING
      et_root     = DATA(lt_root).
  CHECK lt_root IS NOT INITIAL.
  READ TABLE lt_root INTO DATA(ls_root) INDEX 1.
  DATA : if_si_fpm    TYPE REF TO if_fpm,
         if_si_nav    TYPE REF TO if_fpm_navigate_to,
         ls_si_url_wa TYPE fpm_s_launch_url,
         ls_si_params TYPE apb_lpd_s_portal_parameters,
         lv_si_url_c  TYPE string,
         lv_si_torid  TYPE string.
*
  CLEAR: lv_si_url_c, lv_si_torid, ls_si_url_wa." LS_PARAMS.
  if_si_fpm = cl_fpm_factory=>get_instance( ).
  if_si_nav = if_si_fpm->get_navigate_to( ).
  CALL METHOD cl_wd_utilities=>construct_wd_url
    EXPORTING
      application_name = 'ZTMWD_SI_PDF' " Application Name
    IMPORTING
      out_absolute_url = lv_si_url_c.
  lv_si_url_c = lv_si_url_c && '?' && '&torid=' && ls_root-tor_id.
  ls_si_url_wa-url = lv_si_url_c.
* LS_PARAMS-WINDOW_FEATURES = 'titlebar=yes,top=center,left=350,width=900,height=900'.
  ls_si_params-window_features = 'left=25%,top=5%,width=800,height=800'.
  CALL METHOD if_si_nav->launch_url "Webdyn Pro Connecting (Windows -> Methods -> HANDLEDEFAULT
    EXPORTING
      is_url_fields            = ls_si_url_wa
      is_additional_parameters = ls_si_params.
ENDMETHOD.
