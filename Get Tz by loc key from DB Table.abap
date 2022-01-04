  METHOD get_timezone_by_loc_uuid.

    DATA: lt_loc_uuid TYPE /bobf/t_frw_key.

    CLEAR et_loc_tzone.

    IF it_loc_key IS INITIAL.
      RETURN.
    ELSE.
      lt_loc_uuid = it_loc_key.
    ENDIF.

    DELETE ADJACENT DUPLICATES FROM lt_loc_uuid USING KEY key_sort.

    SELECT
      FROM /sapapo/loc
      FIELDS loc_uuid,
             tzone
      FOR ALL ENTRIES IN @lt_loc_uuid
      WHERE loc_uuid = @lt_loc_uuid-key
      INTO TABLE @et_loc_tzone.


  ENDMETHOD.
