
    LOOP AT it_fpm_search_criteria INTO DATA(ls_params).
        TRY .
            cl_fpm_guibb_search_conversion=>to_abap_select_option(
              EXPORTING
                is_fpm_search_row  = ls_params
                io_attr_rtti       = lo_attr_rtti
              RECEIVING
                rs_abap_sel_option = ls_selopt
            ).
          CATCH cx_fpmgb.
            ASSERT CONDITION 0 <> 0.
        ENDTRY.

      ENDLOOP.
