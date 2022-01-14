*&---------------------------------------------------------------------*
*& Report ZTEST29_TEMP01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZTEST29_TEMP10.

DATA: LT_KEY TYPE /BOBF/T_FRW_KEY.

" Get CU/FB key from FWO
SELECT DISTINCT
  A~REF_TRQ_ROOT_KEY AS TRQ_KEY,
  A~PARENT_KEY       AS TOR_TU_KEY,
  C~DB_KEY           AS TOR_BO_KEY
  FROM /SCMTMS/D_TORITE AS A
  JOIN /SCMTMS/D_TORITE AS B ON B~REF_ITEM_KEY = A~DB_KEY
  LEFT OUTER
  JOIN /SCMTMS/D_TORROT AS C ON C~DB_KEY       = A~PARENT_KEY
                            AND C~TOR_CAT      = @/SCMTMS/IF_TOR_CONST=>SC_TOR_CAT_BO
  FOR ALL ENTRIES IN @LT_KEY
  WHERE A~REF_TRQ_ROOT_KEY = @LT_KEY-KEY
  INTO TABLE @DATA(LT_KEY_TAB).


" Get CU/FO key from FWO
SELECT DISTINCT
  A~REF_TRQ_ROOT_KEY AS TRQ_KEY,
  A~PARENT_KEY       AS TOR_TU_KEY,
  C~DB_KEY           AS TOR_TO_KEY
  FROM /SCMTMS/D_TORITE AS A
  JOIN /SCMTMS/D_TORITE AS B ON B~REF_ITEM_KEY = A~DB_KEY
  LEFT OUTER
  JOIN /SCMTMS/D_TORROT AS C ON C~DB_KEY       = A~PARENT_KEY
                            AND C~TOR_CAT      = @/SCMTMS/IF_TOR_CONST=>SC_TOR_CAT_FOR
  FOR ALL ENTRIES IN @LT_KEY
  WHERE A~REF_TRQ_ROOT_KEY = @LT_KEY-KEY
  INTO TABLE @DATA(LT_KEY_TAB2).

  " Get CU/FB/FO key from FWO
SELECT DISTINCT
A~REF_TRQ_ROOT_KEY AS TRQ_KEY,
A~PARENT_KEY       AS TOR_TU_KEY,
C~DB_KEY           AS TOR_BO_KEY,
D~DB_KEY           AS TOR_TO_KEY
FROM /SCMTMS/D_TORITE AS A
"TU
JOIN /SCMTMS/D_TORITE AS B ON B~REF_ITEM_KEY = A~DB_KEY
"BO
LEFT OUTER
JOIN /SCMTMS/D_TORROT AS C ON C~DB_KEY       = A~PARENT_KEY
                          AND C~TOR_CAT      = @/SCMTMS/IF_TOR_CONST=>SC_TOR_CAT_BO
"TO
LEFT OUTER
JOIN /SCMTMS/D_TORROT AS D ON D~DB_KEY       = A~PARENT_KEY
                          AND D~TOR_CAT      = @/SCMTMS/IF_TOR_CONST=>SC_TOR_CAT_FOR

FOR ALL ENTRIES IN @LT_KEY
WHERE A~REF_TRQ_ROOT_KEY = @LT_KEY-KEY
INTO TABLE @DATA(LT_KEY_TAB3).