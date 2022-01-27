CONSTANTS:
  BEGIN OF C_ALPHA,
    A TYPE C VALUE 'A',
    B TYPE C VALUE 'B',
    C TYPE C VALUE 'C',
    D TYPE C VALUE 'D',
    E TYPE C VALUE 'E',
    F TYPE C VALUE 'F',
    G TYPE C VALUE 'G',
    H TYPE C VALUE 'H',
    I TYPE C VALUE 'I',
    J TYPE C VALUE 'J',
    K TYPE C VALUE 'K',
    L TYPE C VALUE 'L',
    M TYPE C VALUE 'M',
    N TYPE C VALUE 'N',
    O TYPE C VALUE 'O',
    P TYPE C VALUE 'P',
    Q TYPE C VALUE 'Q',
    R TYPE C VALUE 'R',
    S TYPE C VALUE 'S',
    T TYPE C VALUE 'T',
    U TYPE C VALUE 'U',
    V TYPE C VALUE 'V',
    W TYPE C VALUE 'W',
    X TYPE C VALUE 'X',
    Y TYPE C VALUE 'Y',
    Z TYPE C VALUE 'Z',
  END OF C_ALPHA,

  BEGIN OF C_NUMBER,
    N_0   TYPE N LENGTH 1 VALUE '0',
    N_1   TYPE N LENGTH 1 VALUE '1',
    N_2   TYPE N LENGTH 1 VALUE '2',
    N_3   TYPE N LENGTH 1 VALUE '3',
    N_4   TYPE N LENGTH 1 VALUE '4',
    N_5   TYPE N LENGTH 1 VALUE '5',
    N_6   TYPE N LENGTH 1 VALUE '6',
    N_7   TYPE N LENGTH 1 VALUE '7',
    N_8   TYPE N LENGTH 1 VALUE '8',
    N_9   TYPE N LENGTH 1 VALUE '9',
    N_01  TYPE N LENGTH 2 VALUE '01',
    N_02  TYPE N LENGTH 2 VALUE '02',
    N_03  TYPE N LENGTH 2 VALUE '03',
    N_04  TYPE N LENGTH 2 VALUE '04',
    N_05  TYPE N LENGTH 2 VALUE '05',
    N_06  TYPE N LENGTH 2 VALUE '06',
    N_07  TYPE N LENGTH 2 VALUE '07',
    N_08  TYPE N LENGTH 2 VALUE '08',
    N_09  TYPE N LENGTH 2 VALUE '09',
    N_10  TYPE N LENGTH 2 VALUE '10',
    N_001 TYPE N LENGTH 3 VALUE '001',
    N_002 TYPE N LENGTH 3 VALUE '002',
    N_003 TYPE N LENGTH 3 VALUE '003',
    N_004 TYPE N LENGTH 3 VALUE '004',
    N_005 TYPE N LENGTH 3 VALUE '005',
    N_006 TYPE N LENGTH 3 VALUE '006',
    N_007 TYPE N LENGTH 3 VALUE '007',
    N_008 TYPE N LENGTH 3 VALUE '008',
    N_009 TYPE N LENGTH 3 VALUE '009',
    N_010 TYPE N LENGTH 3 VALUE '010',
  END OF C_NUMBER,

  BEGIN OF C_NODE,
    TRQ_ROOT      TYPE /BOBF/OBM_NODE_KEY VALUE /SCMTMS/IF_TRQ_C=>SC_NODE-ROOT,
    TRQ_DOCREF    TYPE /BOBF/OBM_NODE_KEY VALUE /SCMTMS/IF_TRQ_C=>SC_NODE-DOCREFERENCE,
    TRQ_ITEM      TYPE /BOBF/OBM_NODE_KEY VALUE /SCMTMS/IF_TRQ_C=>SC_NODE-ITEM,
    TRQ_PARTY     TYPE /BOBF/OBM_NODE_KEY VALUE /SCMTMS/IF_TRQ_C=>SC_NODE-PARTY,

    TOR_ROOT      TYPE /BOBF/OBM_NODE_KEY VALUE /SCMTMS/IF_TOR_C=>SC_NODE-ROOT,
    TOR_DOCREF    TYPE /BOBF/OBM_NODE_KEY VALUE /SCMTMS/IF_TOR_C=>SC_NODE-DOCREFERENCE,
    TOR_ITEM      TYPE /BOBF/OBM_NODE_KEY VALUE /SCMTMS/IF_TOR_C=>SC_NODE-ITEM_TR,
    TOR_PARTY     TYPE /BOBF/OBM_NODE_KEY VALUE /SCMTMS/IF_TOR_C=>SC_NODE-PARTY,
    TOR_STOP      TYPE /BOBF/OBM_NODE_KEY VALUE /SCMTMS/IF_TOR_C=>SC_NODE-STOP,
    TOR_STOP_SUCC TYPE /BOBF/OBM_NODE_KEY VALUE /SCMTMS/IF_TOR_C=>SC_NODE-STOP_SUCCESSOR,
    TOR_EXEC      TYPE /BOBF/OBM_NODE_KEY VALUE /SCMTMS/IF_TOR_C=>SC_NODE-EXECUTIONINFORMATION,
  END OF C_NODE,

  BEGIN OF C_ASSOC,
    TRQ_ROOT_DOCREF    TYPE /BOBF/OBM_ASSOC_KEY VALUE /SCMTMS/IF_TRQ_C=>SC_ASSOCIATION-ROOT-DOCREFERENCE,
    TRQ_ROOT_ITEM      TYPE /BOBF/OBM_ASSOC_KEY VALUE /SCMTMS/IF_TRQ_C=>SC_ASSOCIATION-ROOT-ITEM,
    TRQ_ROOT_PARTY     TYPE /BOBF/OBM_ASSOC_KEY VALUE /SCMTMS/IF_TRQ_C=>SC_ASSOCIATION-ROOT-PARTY,
    TRQ_ROOT_TOR_ROOT  TYPE /BOBF/OBM_ASSOC_KEY VALUE /SCMTMS/IF_TRQ_C=>SC_ASSOCIATION-ROOT-TOR_ROOT,
    TRQ_ROOT_CAPA_TOR  TYPE /BOBF/OBM_ASSOC_KEY VALUE /SCMTMS/IF_TRQ_C=>SC_ASSOCIATION-ROOT-CAPA_TOR,

    TOR_ROOT_DOCREF    TYPE /BOBF/OBM_ASSOC_KEY VALUE /SCMTMS/IF_TOR_C=>SC_ASSOCIATION-ROOT-DOCREFERENCE,
    TOR_ROOT_ITEM      TYPE /BOBF/OBM_ASSOC_KEY VALUE /SCMTMS/IF_TOR_C=>SC_ASSOCIATION-ROOT-ITEM_TR,
    TOR_ITEM_SEAL      TYPE /BOBF/OBM_ASSOC_KEY VALUE /SCMTMS/IF_TOR_C=>SC_ASSOCIATION-ITEM_TR-SEAL,
    TOR_ROOT_PARTY     TYPE /BOBF/OBM_ASSOC_KEY VALUE /SCMTMS/IF_TOR_C=>SC_ASSOCIATION-ROOT-PARTY,
    TOR_ROOT_STOP      TYPE /BOBF/OBM_ASSOC_KEY VALUE /SCMTMS/IF_TOR_C=>SC_ASSOCIATION-ROOT-STOP,
    TOR_ROOT_STOP_SUCC TYPE /BOBF/OBM_ASSOC_KEY VALUE /SCMTMS/IF_TOR_C=>SC_ASSOCIATION-ROOT-STOP_SUCC,
    TOR_ROOT_EXEC      TYPE /BOBF/OBM_ASSOC_KEY VALUE /SCMTMS/IF_TOR_C=>SC_ASSOCIATION-ROOT-EXEC,
  END OF C_ASSOC,

  BEGIN OF C_STOP_CAT,
    INBOUND  TYPE /SCMTMS/STOP_CATEGORY VALUE 'I',
    OUTBOUND TYPE /SCMTMS/STOP_CATEGORY VALUE 'O',
  END OF C_STOP_CAT,

  BEGIN OF C_STOP_ROLE,
    MAINLEG_START  TYPE /SCMTMS/TOR_STOP_ROLE   VALUE 'MS', " Booking Main Leg Start Stop
    MAINLEG_TRANS  TYPE /SCMTMS/TOR_STOP_ROLE   VALUE 'MT', " BookingTransit Location in Main leg
    MAINLEG_END    TYPE /SCMTMS/TOR_STOP_ROLE   VALUE 'ME', " Booking Main Leg End Stop
    BOOKING_PU     TYPE /SCMTMS/TOR_STOP_ROLE   VALUE 'BP', " Booking Pickup Stop
    BOOKING_DL     TYPE /SCMTMS/TOR_STOP_ROLE   VALUE 'BD', " Booking Delivery Stop
    BOOKING_PUDLTR TYPE /SCMTMS/TOR_STOP_ROLE   VALUE 'BT', " Booking Pre- or On-Carriage Transit Stop
  END OF C_STOP_ROLE,

  BEGIN OF C_ITEM_CAT,
    PACKAGING   TYPE /SCMTMS/OVERVIEW_ITEM_CATEGORY VALUE 'PKG',
    TU_RESOURCE TYPE /SCMTMS/ITEM_CATEGORY          VALUE 'TUR',
    AV_ITEM     TYPE /SCMTMS/OVERVIEW_ITEM_CATEGORY VALUE 'AVR',
    BOOKING     TYPE /SCMTMS/OVERVIEW_ITEM_CATEGORY VALUE 'BOK',
    BOOK_CAPREQ TYPE /SCMTMS/OVERVIEW_ITEM_CATEGORY VALUE 'BCR',
  END OF C_ITEM_CAT,

  BEGIN OF C_TOR_ACT,  "TOR transportation Activities
    DEPART  TYPE /SCMTMS/TRANSP_ACT VALUE '03',
    ARRIVAL TYPE /SCMTMS/TRANSP_ACT VALUE '04',
    OTHER   TYPE /SCMTMS/TRANSP_ACT VALUE '99',
  END OF C_TOR_ACT,

  C_TRQ_BO_KEY TYPE /BOBF/OBM_BO_KEY VALUE /SCMTMS/IF_TRQ_C=>SC_BO_KEY,
  C_TOR_BO_KEY TYPE /BOBF/OBM_BO_KEY VALUE /SCMTMS/IF_TOR_C=>SC_BO_KEY,
  C_INITIAL    TYPE CHAR1            VALUE '',
  C_TRUE       TYPE ABAP_BOOL        VALUE ABAP_TRUE,
  C_FALSE      TYPE ABAP_BOOL        VALUE ABAP_FALSE.

DATA:
  LT_KEY        TYPE /BOBF/T_FRW_KEY,
  LT_KEY2       TYPE /BOBF/T_FRW_KEY,
  LT_KEY3       TYPE /BOBF/T_FRW_KEY,
  LT_MOD        TYPE /BOBF/T_FRW_MODIFICATION,
  LT_CHG_FIELDS TYPE /BOBF/T_FRW_NAME,
  LV_REJECTED   TYPE BOOLE_D,
  LO_SRV_TRQ    TYPE REF TO /BOBF/IF_TRA_SERVICE_MANAGER,
  LO_SRV_TOR    TYPE REF TO /BOBF/IF_TRA_SERVICE_MANAGER,
  LO_TRAMGR     TYPE REF TO /BOBF/IF_TRA_TRANSACTION_MGR,
  LO_MESSAGE    TYPE REF TO /BOBF/IF_FRW_MESSAGE,
  LO_MESSAGE2   TYPE REF TO /BOBF/IF_FRW_MESSAGE,
  LO_CHANGE     TYPE REF TO /BOBF/IF_TRA_CHANGE,
  LO_CHANGE2    TYPE REF TO /BOBF/IF_TRA_CHANGE.

DATA:
  LT_TRQ_ROOT       TYPE /SCMTMS/T_TRQ_ROOT_K,
  LS_TRQ_ROOT       TYPE /SCMTMS/S_TRQ_ROOT_K,
  LT_TRQ_DOCREF     TYPE /SCMTMS/T_TRQ_DOCREF_K,
  LS_TRQ_DOCREF     TYPE /SCMTMS/S_TRQ_DOCREF_K,
  LT_TRQ_ITEM       TYPE /SCMTMS/T_TRQ_ITEM_K,
  LS_TRQ_ITEM       TYPE /SCMTMS/S_TRQ_ITEM_K,
  LT_TRQ_PARTY      TYPE /SCMTMS/T_TRQ_PARTY_K,
  LS_TRQ_PARTY      TYPE /SCMTMS/S_TRQ_PARTY_K,
  LT_TOR_ROOT       TYPE /SCMTMS/T_TOR_ROOT_K,
  LS_TOR_ROOT       TYPE /SCMTMS/S_TOR_ROOT_K,
  LT_TOR_DOCREF     TYPE /SCMTMS/T_TOR_DOCREF_K,
  LS_TOR_DOCREF     TYPE /SCMTMS/S_TOR_DOCREF_K,
  LT_TOR_ITEM       TYPE /SCMTMS/T_TOR_ITEM_TR_K,
  LS_TOR_ITEM       TYPE /SCMTMS/S_TOR_ITEM_TR_K,
  LT_TOR_SEAL       TYPE /SCMTMS/T_TOR_SEAL_K,
  LS_TOR_SEAL       TYPE /SCMTMS/S_TOR_SEAL_K,
  LT_TOR_PARTY      TYPE /SCMTMS/T_TOR_PARTY_K,
  LS_TOR_PARTY      TYPE /SCMTMS/S_TOR_PARTY_K,
  LT_TOR_STOP       TYPE /SCMTMS/T_TOR_STOP_K,
  LS_TOR_STOP       TYPE /SCMTMS/S_TOR_STOP_K,
  LT_TOR_STOP_SUCC  TYPE /SCMTMS/T_TOR_STOP_SUCC_K,
  LS_TOR_STOP_SUCC  TYPE /SCMTMS/S_TOR_STOP_SUCC_K,
  LT_TOR_EXEC       TYPE /SCMTMS/T_TOR_EXEC_K,
  LS_TOR_EXEC       TYPE /SCMTMS/S_TOR_EXEC_K,
  LT_CAPA_ROOT      TYPE /SCMTMS/T_TOR_ROOT_K,
  LS_CAPA_ROOT      TYPE /SCMTMS/S_TOR_ROOT_K,
  LT_CAPA_DOCREF    TYPE /SCMTMS/T_TOR_DOCREF_K,
  LS_CAPA_DOCREF    TYPE /SCMTMS/S_TOR_DOCREF_K,
  LT_CAPA_ITEM      TYPE /SCMTMS/T_TOR_ITEM_TR_K,
  LS_CAPA_ITEM      TYPE /SCMTMS/S_TOR_ITEM_TR_K,
  LT_CAPA_SEAL      TYPE /SCMTMS/T_TOR_SEAL_K,
  LS_CAPA_SEAL      TYPE /SCMTMS/S_TOR_SEAL_K,
  LT_CAPA_PARTY     TYPE /SCMTMS/T_TOR_PARTY_K,
  LS_CAPA_PARTY     TYPE /SCMTMS/S_TOR_PARTY_K,
  LT_CAPA_STOP      TYPE /SCMTMS/T_TOR_STOP_K,
  LS_CAPA_STOP      TYPE /SCMTMS/S_TOR_STOP_K,
  LT_CAPA_STOP_SUCC TYPE /SCMTMS/T_TOR_STOP_SUCC_K,
  LS_CAPA_STOP_SUCC TYPE /SCMTMS/S_TOR_STOP_SUCC_K,
  LT_CAPA_EXEC      TYPE /SCMTMS/T_TOR_EXEC_K,
  LS_CAPA_EXEC      TYPE /SCMTMS/S_TOR_EXEC_K.

FIELD-SYMBOLS:
  <FS_TRQ_ROOT>       TYPE /SCMTMS/S_TRQ_ROOT_K,
  <FS_TRQ_DOCREF>     TYPE /SCMTMS/S_TRQ_DOCREF_K,
  <FS_TRQ_ITEM>       TYPE /SCMTMS/S_TRQ_ITEM_K,
  <FS_TRQ_PARTY>      TYPE /SCMTMS/S_TRQ_PARTY_K,
  <FS_TOR_ROOT>       TYPE /SCMTMS/S_TOR_ROOT_K,
  <FS_TOR_DOCREF>     TYPE /SCMTMS/S_TOR_DOCREF_K,
  <FS_TOR_ITEM>       TYPE /SCMTMS/S_TOR_ITEM_TR_K,
  <FS_TOR_SEAL>       TYPE /SCMTMS/S_TOR_SEAL_K,
  <FS_TOR_PARTY>      TYPE /SCMTMS/S_TOR_PARTY_K,
  <FS_TOR_STOP>       TYPE /SCMTMS/S_TOR_STOP_K,
  <FS_TOR_STOP_SUCC>  TYPE /SCMTMS/S_TOR_STOP_SUCC_K,
  <FS_TOR_EXEC>       TYPE /SCMTMS/S_TOR_EXEC_K,
  <FS_CAPA_ROOT>      TYPE /SCMTMS/S_TOR_ROOT_K,
  <FS_CAPA_DOCREF>    TYPE /SCMTMS/S_TOR_DOCREF_K,
  <FS_CAPA_ITEM>      TYPE /SCMTMS/S_TOR_ITEM_TR_K,
  <FS_CAPA_SEAL>      TYPE /SCMTMS/S_TOR_SEAL_K,
  <FS_CAPA_PARTY>     TYPE /SCMTMS/S_TOR_PARTY_K,
  <FS_CAPA_STOP>      TYPE /SCMTMS/S_TOR_STOP_K,
  <FS_CAPA_STOP_SUCC> TYPE /SCMTMS/S_TOR_STOP_SUCC_K,
  <FS_CAPA_EXEC>      TYPE /SCMTMS/S_TOR_EXEC_K.

DATA:
  LV_STRING    TYPE STRING,
  LV_STRING2   TYPE STRING,
  LV_STRING3   TYPE STRING,
  LV_TABIX     TYPE SY-TABIX,
  LV_TABIX2    TYPE SY-TABIX,
  LV_TABIX3    TYPE SY-TABIX,
  LV_INDEX     TYPE SY-INDEX,
  LV_INDEX2    TYPE SY-INDEX,
  LV_INDEX3    TYPE SY-INDEX,
  LV_TZ        TYPE /SCMTMS/TZONE,
  LV_DATA      TYPE /SCMTMS/UI_DATE,
  LV_TIME      TYPE /SCMTMS/UI_TIME,
  LV_TIMESTAMP TYPE /SCMTMS/TIMESTAMP,
  LV_KEY       TYPE /BOBF/CONF_KEY,
  LV_KEY2      TYPE /BOBF/CONF_KEY,
  LV_KEY3      TYPE /BOBF/CONF_KEY.

FIELD-SYMBOLS:
  <DATA>   TYPE ANY,
  <DATA2>  TYPE ANY,
  <DATA3>  TYPE ANY,
  <FIELD>  TYPE FIELDNAME,
  <FIELD2> TYPE FIELDNAME,
  <FIELD3> TYPE FIELDNAME.

LO_SRV_TRQ = /BOBF/CL_TRA_SERV_MGR_FACTORY=>GET_SERVICE_MANAGER( C_TRQ_BO_KEY ).
LO_SRV_TOR = /BOBF/CL_TRA_SERV_MGR_FACTORY=>GET_SERVICE_MANAGER( C_TOR_BO_KEY ).
LO_TRAMGR  = /BOBF/CL_TRA_TRANS_MGR_FACTORY=>GET_TRANSACTION_MANAGER( ).

CALL METHOD LO_SRV_TRQ->RETRIEVE
  EXPORTING
    IV_NODE_KEY     = C_NODE-TRQ_ROOT
    IT_KEY          = LT_KEY
    IV_BEFORE_IMAGE = ABAP_FALSE                         " Data element for domain BOOLE: TRUE (='X') and FALSE (=' ')
  IMPORTING
    ET_DATA         = LT_TRQ_ROOT.

CALL METHOD LO_SRV_TRQ->RETRIEVE_BY_ASSOCIATION
  EXPORTING
    IV_NODE_KEY     = C_NODE-TRQ_ROOT
    IT_KEY          = LT_KEY
    IV_ASSOCIATION  = C_ASSOC-TRQ_ROOT_TOR_ROOT
    IV_FILL_DATA    = ABAP_TRUE
    IV_BEFORE_IMAGE = ABAP_FALSE                         " Data element for domain BOOLE: TRUE (='X') and FALSE (=' ')
  IMPORTING
    ET_DATA         = LT_TOR_ROOT
    ET_KEY_LINK     = DATA(LT_K_TOR_ROOT)
    ET_TARGET_KEY   = DATA(LT_KL_TRQ_TOR_ROOT).


*" tu/fu key로 trq, capa 데이터 가져오기
*CALL METHOD /SCMTMS/CL_TOR_HELPER_READ=>GET_TOR_DATA
*  EXPORTING
*    IT_ROOT_KEY = LT_KEY "fu key
*   IV_BEFORE_IMAGE       =
*  IMPORTING
*   ET_ROOT     =                  " Root Node
*   ET_ALL_ITEMS          =                  " All items
*   ET_MCI_ITEMS          =                  " Main Cargo items
*   ET_ITEM_SEAL          =                  " Seals
*   ET_STOP     =                  " Stop
*   ET_ASSIGNED_STOP      = same             " Stops assigned to a capacity stop
*   ET_CAPA_STOP          = same             " Capacity stops used by the TOR instance
*   ET_STOP_FIRST         =                  " First stop of a TOR instance
*   ET_STOP_LAST          =                  " Last stop of a TOR instance
*   ET_STOP_SUCC          =                  " Logistical Stop Successor = Stage
*   ET_DOC_REFERENCE      =                  " Document Reference
*   ET_EXEC     =                  " Execution Data
*   ET_PARTY    =                  " Parties on Root node level
*   ET_TXC_ROOT =                  " TextCollectionRootNode
*   ET_TXC_CONT =                  " Text content node in text collection
*   ET_TXC_TEXT =                  " Text node in text collection
*   ET_KL_TOR_TRQ         =
*   ET_TRQ_ROOT_KEY       =
*   ET_TRQ_ROOT =
*   ET_TRQ_DOCREF         =                  " Item Document Reference
*   ET_TRQ_ITEM =
*   ET_TRQ_SEAL =
*
*.


*CALL METHOD LO_SRV_TRQ->MODIFY
*  EXPORTING
*    IT_MODIFICATION = LT_MOD
*  IMPORTING
*    EO_CHANGE       = LO_CHANGE
*    EO_MESSAGE      = LO_MESSAGE.

*IF LO_MESSAGE IS BOUND.
*  IF LO_MESSAGE->CHECK( ).
*    LO_TRAMGR->CLEANUP( ). " roll back
*
*    EO_MESSAGE->ADD( IO_MESSAGE = LO_MESSAGE ).
*    RETURN.
*  ELSE.
*    EO_MESSAGE->ADD( IO_MESSAGE = LO_MESSAGE ).
*  ENDIF.
*ENDIF.
*
*CALL METHOD LO_TRAMGR->SAVE
*  IMPORTING
*    EV_REJECTED = LV_REJECTED
*    EO_CHANGE   = LO_CHANGE2
*    EO_MESSAGE  = LO_MESSAGE2.
*
*IF LV_REJECTED = ABAP_TRUE.
*  LO_TRAMGR->CLEANUP( ).
*  EO_MESSAGE->ADD( IO_MESSAGE = LO_MESSAGE2 ).
*ENDIF.