

WITH
    sys_qty
    as
    
    (

        select T2901753.C39334884 as QUANTITY_RELEASED,
            T2901753.C477984733 as EXPIRATION_DATE,
            T2901753.C202238716 as REPORT_DATE,
            T2901753.C154071095 as DAY_OF_YEAR,
            T2901753.C74241182 as PARENT_MONTH,
            T2901753.C358676734 as SEGMENT1,
            T2901753.C282981021 as PARTY_NAME1,
            T2901753.C382218218 as VENDOR_SITE_CODE,
            T2901753.C453017474 as ITEM_NUMBER,
            T2901753.C284554434 as ITEM_ID,
            T2901753.C523995133 as VENDOR_PRODUCT_NUM,
            T2901753.C15565991 as VENDOR_ID268,
            T2901753.C403221656 as ITEM_DESCRIPTION,
            T2901753.C306253662 as C_CATEGORY_NAME

            ,T2901753.PKA_VendorSiteId0 as VENDOR_SITE_ID
        from
            (SELECT V380216164.QUANTITY_RELEASED AS C39334884, V380216164.EXPIRATION_DATE AS C477984733, V162917909.REPORT_DATE AS C202238716, V162917909.DAY_OF_YEAR AS C154071095, V162917909.PARENT_MONTH AS C74241182, V492164244.SEGMENT1 AS C358676734, V492164244.PARTY_NAME1 AS C282981021, V250398895.VENDOR_SITE_CODE AS C382218218, V385839313.ITEM_NUMBER AS C453017474, V380216164.ITEM_ID AS C284554434, V380216164.VENDOR_PRODUCT_NUM AS C523995133, V380216164.VENDOR_ID268 AS C15565991, V380216164.ITEM_DESCRIPTION AS C403221656, V380216164.C_CATEGORY_NAME AS C306253662, V380216164.TYPE_LOOKUP_CODE263 AS C460297595, V380216164.PO_LINE_ID AS BDep_PoLineId0, V380216164.PO_HEADER_ID1 AS PKA_PurchasingDocumentHeaderP0, V380216164.C_CATEGORY_ID AS PKA_CategoryCategoryId0, V250398895.VENDOR_SITE_ID AS PKA_VendorSiteId0, V492164244.VENDOR_ID557 AS PKA_VendorId0, V492164244.PARTY_ID824 AS PKA_PartyPartyId0, V385839313.INVENTORY_ITEM_ID AS PKA_InventoryItemId0, V385839313.ORGANIZATION_ID1596 AS PKA_OrganizationId0
            FROM (SELECT PurchasingDocumentLine.EXPIRATION_DATE, PurchasingDocumentLine.ITEM_DESCRIPTION, PurchasingDocumentLine.ITEM_ID, PurchasingDocumentLine.PO_LINE_ID, PurchasingDocumentLine.VENDOR_PRODUCT_NUM, PurchasingDocumentHeader.PO_HEADER_ID AS PO_HEADER_ID1, PurchasingDocumentHeader.TYPE_LOOKUP_CODE AS TYPE_LOOKUP_CODE263, PurchasingDocumentHeader.VENDOR_ID AS VENDOR_ID268, PurchasingDocumentHeader.VENDOR_SITE_ID AS VENDOR_SITE_ID270, PurchasingDocumentVersion.PROCESSED_DATE, (TRUNC(PurchasingDocumentVersion.PROCESSED_DATE)) AS PROCESSED_DATE_ONLY, POSystemParameters.INVENTORY_ORGANIZATION_ID, Category.CATEGORY_ID AS C_CATEGORY_ID, Category.CATEGORY_NAME AS C_CATEGORY_NAME, (PO_CORE_S.get_ga_line_quantity_released(PurchasingDocumentLine.PO_LINE_ID)) AS QUANTITY_RELEASED
                FROM PO_LINES_ALL PurchasingDocumentLine, PO_HEADERS_ALL PurchasingDocumentHeader, PO_VERSIONS_INIT_SEQUENCE_V PurchasingDocumentVersion, PO_SYSTEM_PARAMETERS_ALL POSystemParameters, EGP_CATEGORIES_VL Category
                WHERE (PurchasingDocumentLine.PO_HEADER_ID = PurchasingDocumentHeader.PO_HEADER_ID AND PurchasingDocumentHeader.PO_HEADER_ID = PurchasingDocumentVersion.PO_HEADER_ID AND PurchasingDocumentHeader.PRC_BU_ID = POSystemParameters.PRC_BU_ID AND PurchasingDocumentLine.CATEGORY_ID = Category.CATEGORY_ID(+)) AND ( ( ((  ( (PurchasingDocumentHeader.TYPE_LOOKUP_CODE = 'BLANKET' ) ) OR ( (PurchasingDocumentHeader.TYPE_LOOKUP_CODE = 'CONTRACT' ) )  )) ) AND (((PurchasingDocumentHeader.REQ_BU_ID IN (select POR_GRANTS_UTIL.get_default_financial_bu
                    from dual)) OR (EXISTS   (SELECT 0
                    FROM PO_AGENT_ACCESSES PoAgentAccess
                    WHERE PoAgentAccess.agent_id IN (SELECT HRC_SESSION_UTIL.GET_USER_PERSONID
                        FROM DUAL) AND PoAgentAccess.PRC_BU_ID                  = PurchasingDocumentHeader.PRC_BU_ID AND ( (PurchasingDocumentHeader.type_lookup_code = 'STANDARD' AND PoAgentAccess.access_action_code         = 'MANAGE_PURCHASE_ORDERS') OR (PurchasingDocumentHeader.type_lookup_code IN ('BLANKET', 'CONTRACT') AND PoAgentAccess.access_action_code         = 'MANAGE_PURCHASE_AGREEMENTS')  ) AND PoAgentAccess.active_flag                = 'Y' AND PoAgentAccess.allowed_flag               = 'Y' AND (PoAgentAccess.access_others_level_code IN ('VIEW','MODIFY','FULL') OR PurchasingDocumentHeader.agent_id      = PoAgentAccess.agent_id)  )) OR EXISTS (SELECT NULL
                    FROM fnd_grants gnt
                    WHERE exists (                                                                                    SELECT /*+ index(fnd_session_role_sets FND_SESSION_ROLE_SETS_U1) no_unnest */ null
                            FROM fnd_session_role_sets
                            WHERE session_role_set_key = fnd_global.session_role_set_key and role_guid = gnt.grantee_key
                        UNION ALL
                            SELECT fnd_global.user_guid AS path
                            FROM dual
                            WHERE fnd_global.user_guid = gnt.grantee_key) AND exists (select /*+ no_unnest */ null
                        from fnd_compiled_menu_functions cmf
                        where cmf.function_id = 300000000016758 and cmf.menu_id = gnt.menu_id) AND gnt.object_id = 300000000015357 AND gnt.grant_type = 'ALLOW' AND gnt.instance_type = 'SET' AND gnt.start_date <= SYSDATE and (gnt.end_date is null or gnt.end_date >= sysdate) AND ((gnt.CONTEXT_NAME is NULL) or (gnt.context_name is not null and gnt.context_value like fnd_global.get_conn_ds_attribute(gnt.context_name))) AND (gnt.instance_set_id = 300000000015361 AND (PurchasingDocumentHeader.type_lookup_code='STANDARD' and PurchasingDocumentHeader.REQ_BU_ID IN (  
SELECT ORG_ID
                        FROM FUN_USER_ROLE_DATA_ASGNMNTS
                        WHERE USER_GUID = FND_GLOBAL.USER_GUID
                            AND ROLE_NAME = GNT.ROLE_NAME AND ACTIVE_FLAG='Y' ))

                        OR

                        (PurchasingDocumentHeader.type_lookup_code IN ('BLANKET','CONTRACT')
                        AND EXISTS
  (SELECT 1
                        FROM FUN_USER_ROLE_DATA_ASGNMNTS FUN,
                            PO_GA_ORG_ASSIGNMENTS BU
                        WHERE FUN.USER_GUID = FND_GLOBAL.USER_GUID
                            AND FUN.ORG_ID  =BU.REQ_BU_ID
                            AND FUN.ROLE_NAME = GNT.ROLE_NAME AND FUN.ACTIVE_FLAG='Y'
  ) ))))) )) V380216164, (SELECT SupplierSite.VENDOR_SITE_CODE, SupplierSite.VENDOR_SITE_ID, Supplier.VENDOR_ID AS VENDOR_ID2164
                FROM POZ_SUPPLIER_SITES_ALL_M SupplierSite, POZ_SUPPLIERS Supplier
                WHERE SupplierSite.VENDOR_ID = Supplier.VENDOR_ID(+)) V250398895, (SELECT Supplier.SEGMENT1, Supplier.VENDOR_ID AS VENDOR_ID557, Party.PARTY_ID AS PARTY_ID824, Party.PARTY_NAME AS PARTY_NAME1
                FROM POZ_SUPPLIERS Supplier, HZ_PARTIES Party
                WHERE (Supplier.PARTY_ID = Party.PARTY_ID) AND ( (1=1))) V492164244, (SELECT FndCalDayEO.REPORT_DATE, FndCalDayEO.LAST_UPDATE_DATE, FndCalDayEO.LAST_UPDATED_BY, FndCalDayEO.CREATION_DATE, FndCalDayEO.CREATED_BY, FndCalDayEO.LAST_UPDATE_LOGIN, FndCalDayEO.PARENT_MONTH, FndCalDayEO.DAY_OF_YEAR
                FROM FND_CAL_DAY FndCalDayEO) V162917909, (SELECT ItemBasePEO.INVENTORY_ITEM_ID, ItemBasePEO.ITEM_NUMBER, ItemBasePEO.ORGANIZATION_ID AS ORGANIZATION_ID1596
                FROM EGP_SYSTEM_ITEMS_B_V ItemBasePEO) V385839313
            WHERE V380216164.VENDOR_SITE_ID270 = V250398895.VENDOR_SITE_ID AND V250398895.VENDOR_ID2164 = V492164244.VENDOR_ID557(+) AND V380216164.PROCESSED_DATE_ONLY = V162917909.REPORT_DATE(+) AND V380216164.ITEM_ID = V385839313.INVENTORY_ITEM_ID(+) AND V380216164.INVENTORY_ORGANIZATION_ID = V385839313.ORGANIZATION_ID1596(+) AND ( ( (V380216164.TYPE_LOOKUP_CODE263 = 'BLANKET' ) ) )) T2901753

    ),

    filter_dirty as (
            SELECT   *   FROM sys_qty  
            WHERE 
                sys_qty.REPORT_DATE is  not NULL

    ), 

    sys_qty_temp as 
(
select dirty_tab.*
            from filter_dirty  dirty_tab inner join (select ITEM_ID, ITEM_NUMBER, VENDOR_SITE_CODE, SEGMENT1,VENDOR_SITE_ID
      , max(REPORT_DATE ) as REPORT_DATE
                from filter_dirty   
                WHERE  EXPIRATION_DATE >=sysdate  or  EXPIRATION_DATE is null
                group by ITEM_ID, ITEM_NUMBER, VENDOR_SITE_CODE, SEGMENT1,VENDOR_SITE_ID) B on 
                        dirty_tab.ITEM_ID=B.ITEM_ID
                    and dirty_tab.ITEM_NUMBER  =B.ITEM_NUMBER
                    and dirty_tab.VENDOR_SITE_CODE =B.VENDOR_SITE_CODE
                    and dirty_tab.SEGMENT1 =B.SEGMENT1                   
                    and dirty_tab.VENDOR_SITE_ID =B.VENDOR_SITE_ID                   )