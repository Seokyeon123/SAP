DATA: lt_param TYPE tihttpnvp,
      ls_param TYPE ihttpnvp,
      ls_url   TYPE string.

* Set up configuration ID for calling the Web Dynpro
MOVE 'WDCONFIGURATIONID' TO ls_param-name.
MOVE 'ZSD_SD_INV_REQ_CREATE' TO ls_param-value.
APPEND ls_param TO lt_param.

* Set up the parameter that need to be passed into Web Dynpro
MOVE 'VBELN_IR'   TO ls_param-name.
MOVE '0000000001' TO ls_param-value.
APPEND ls_param TO lt_param.

CALL FUNCTION 'WDY_EXECUTE_IN_PLACE'
  EXPORTING
    internalmode        = 'X'
    application         = 'ZSD_SD_INV_REQ_CREATE'
    parameters          = lt_param
  IMPORTING
    out_url             = ls_url
  EXCEPTIONS
    invalid_application = 1
    browser_not_started = 2
    action_cancelled    = 3
    OTHERS              = 4.

IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.
