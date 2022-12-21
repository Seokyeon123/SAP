  * tabledescr 
  DATA:
    lo_tabdescr         TYPE REF TO cl_abap_tabledescr,
    lo_linedescr        TYPE REF TO cl_abap_datadescr,
    lo_descr            TYPE REF TO cl_abap_structdescr.
    
    
      lo_tabdescr  ?= cl_abap_tabledescr=>describe_by_data( p_data = et_data ).
      lo_linedescr  = lo_tabdescr->get_table_line_type( ).
      
        lo_descr ?= lo_linedescr.
        CALL METHOD lo_descr->get_ddic_field_list
          RECEIVING
            p_field_list = mt_dfies_result
          EXCEPTIONS
            no_ddic_type = 1.      
