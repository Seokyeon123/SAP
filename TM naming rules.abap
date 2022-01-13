
* TM Naming Rules in my opinion

**********************************************************************
* Start about BOPF

**********************************************************************
* 1. Create enhancement Determination and implementing class
**********************************************************************
* 1-1 . Integration DET by trigger points

* 1-1-1) Determination
* ZDET_(NODE)_(Timepoint)
* Ex) ZDET_ROOT_BS (BS = Before Save)

* 1-1-2) implementing class
* ZTM_CL_(BO)_D_(NODE)_(Timepoint)
* Ex) ZTM_CL_TRQ_D_ROOT_BS ( Refer to your determination name )

* 1-2. Specific DET

* 1-2-1) Determination
* ZDET_(NODE)_(Name for purpose)
* Ex) ZDET_ROOT_SET_INIT_VAL ( Setting initial value when creating node )

* 1-2-2) implementing class
* ZTM_CL_(BO)_D_(NODE)_(your determination name)
* Ex) ZTM_CL_TRQ_D_ROOT_SET_INIT_VAL ( Refer to your determination name )

**********************************************************************
* 2. Create enhancement Validation and implementing class
**********************************************************************
* 2-1 . Consistency VAL

* 2-1-1) Validation
* ZVAL_(NODE)_CHECK or CONSISTENCY ( depending on trigger condtions )
* Ex) ZVAL_ROOT_CHECK or ZVAL_ROOT_CONSISTENCY

* 2-1-2) implementing class
* ZTM_CL_(BO)_V_CONS_(NODE)
* Ex) ZTM_CL_TRQ_V_CONS_ROOT

* 2-2 . Action VAL

* 2-2-1) Validation
* ZVAL_(NODE)_CHECK_ACTION
* Ex) ZDET_ROOT_CHECK_ACTION

* 2-2-2) implementing class
* ZTM_CL_(BO)_V_(NODE)_ACTION
* Ex) ZTM_CL_TRQ_V_ROOT_ACTION

**********************************************************************
* 3. Create enhancement Action and implementing class and structure
**********************************************************************
* 3-1) Action
* ZACT_(NODE)_(Your action name)
* Ex) ZACT_ROOT_SEND_HBL

* 3-2) implementing class
* ZTM_CL_(BO)_A_(Proper Name with your action)
* Ex) ZTM_CL_TRQ_A_SEND_HBL

* 3-3) implementing Parameter Structure
* ZTM_S_TRQ_A_(Proper Name with your action)
* Ex) ZTM_S_TRQ_A_SEND_HBL

**********************************************************************
* 4. Create enhancement Query and query class and structure
**********************************************************************
* 4-1) Query
* ZQUERY_(NODE)_(Your query name)
* Ex) ZQUERY_ROOT_HBL_BY_ATTRIBUTES

* 4-2) Query class
* ZTM_CL_(BO)_(NODE)_Q_(Proper Name with your query)
* Ex) ZTM_CL_TRQ_ROOT_Q_HBL_ATTR

* 4-3) Filter Structure
* ZTM_CL_(BO)_(NODE)_Q_(Proper Name with your query)
* Ex) ZTM_S_TRQ_ROOT_Q_HBL_ATTR

* 4-4) Result Structure & Table
* ZTM_CL_(BO)_(NODE)_Q_(Proper Name with your query)_R
* Ex) ZTM_S_TRQ_ROOT_Q_HBL_ATTR_R

* End about BOPF
**********************************************************************



**********************************************************************
* Start about FPM

**********************************************************************
* 1. FPM Application
**********************************************************************
* ZTM_FPM_( your FPM name )
* ex) ZTM_FPM_1000

**********************************************************************
* 2. Create Component Configuration
**********************************************************************
* ZTM_WDCC_( Proper name with your FPM App. )
* ex) ZTM_WDCC_FPM_1000_LIST ( List UIBB)

**********************************************************************
* 3. Feeder Class
**********************************************************************
* ZTM_FCL_( Proper name with your Component Configuration. )
* or
* ZTM_CL_( Proper name with your Component Configuration. )

* ex) ZTM_FCL_FPM_1000_LIST

**********************************************************************
* 4. Dialog Box(Page ID)
**********************************************************************
* Z_(name)
* ex) Z_HBL_PRINT_OPTION

* End about FPM
**********************************************************************



**********************************************************************
* Start about Enhancement in standard

**********************************************************************
* 1. Enhancement Implementation ( Class )
**********************************************************************
* ZTM_ENH_( name referd to standard class )
* ex) ZTM_ENH_CL_UI_POW_FD_TRQ ( /SCMTMS/CL_UI_POW_FD_TRQ )

**********************************************************************
* 2. Append Strcuture 
**********************************************************************

* 2-1. in structure
* ZTM_ENH_S_( name referd to standard structure )
* ex) ZTM_ENH_S_UI_TRQ_GEN ( /SCMTMS/S_UI_TRQ_GEN )

* 2-2. in DB table of node in BOPF
* ZTM_ENH_EEW_(BO)_(NODE)
* ex) ZTM_ENH_EEW_TRQ_ROOT ( /SCMTMS/D_TRQROT, ROOT Node of /SCMTMS/TRQ_ROOT object )

* End about Enhancement in standard
**********************************************************************
