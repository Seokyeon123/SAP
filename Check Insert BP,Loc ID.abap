  METHOD check_insert_bp_id.

    CHECK iv_bp IS NOT INITIAL.

    READ TABLE ct_bp TRANSPORTING NO FIELDS
      WITH TABLE KEY id = iv_bp.
    IF sy-subrc NE 0.
      INSERT VALUE #( id = iv_bp ) INTO TABLE ct_bp.
    ENDIF.

  ENDMETHOD.
  
  
    METHOD check_insert_loc_id.

    CHECK iv_loc_id IS NOT INITIAL.

    READ TABLE ct_loc_id TRANSPORTING NO FIELDS
      WITH TABLE KEY id = iv_loc_id.
    IF sy-subrc NE 0.
      INSERT VALUE #( id = iv_loc_id ) INTO TABLE ct_loc_id.
    ENDIF.

  ENDMETHOD.
