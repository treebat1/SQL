
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
---- =============================================
---- Author:                            Cole McMannus
---- Create date: 2014/08/26
---- Description:   Used for populating the Manage Models grid
---- =============================================
--CREATE PROCEDURE Get_Models_for_Manage_Models



                declare @Catalog_ID VARCHAR(50)

				SET @catalog_id = 'abercrombiec02'

                SET NOCOUNT ON;
                --DECLARE @Dimensions NVARCHAR(MAX);
                
--SELECT @dimension = COALESCE(@Dimensions + ', ', '') + sa.Customer_Field) as Dimensions
--, (SELECT COUNT(DISTINCT vm.Variant_ID) FROM dbo.Variant_Models vm WHERE vm.Model_ID = m.Model_ID AND vm.Is_Enabled = 1) as Used_In
--                FROM dbo.Models m
--                JOIN Models_Segmented ms ON ms.Model_ID = m.Model_ID
--                JOIN Segmentation_Attributes sa ON sa.Segmentation_ID = ms.Segmentation_ID
--                WHERE m.Catalog_ID = @Catalog_ID AND sa.is_used = 1



--create TABLE #tmp2
--(Model_id varchar(50)
--, name varchar(50)
--, [description] varchar(50)
--, dimensions VARCHAR(50)
--, used_in varchar(50))


--INSERT INTO #tmp2
--(Model_id, name, [description], dimensions, used_in)
--SELECT m.Model_ID, m.Name, m.Description, sa.Customer_Field as Dimensions
--, (SELECT COUNT(DISTINCT vm.Variant_ID) FROM dbo.Variant_Models vm WHERE vm.Model_ID = m.Model_ID AND vm.Is_Enabled = 1) as Used_In
--FROM dbo.Models m
--JOIN Models_Segmented ms ON ms.Model_ID = m.Model_ID
--JOIN Segmentation_Attributes sa ON sa.Segmentation_ID = ms.Segmentation_ID
--WHERE m.Catalog_ID = @Catalog_ID
--AND sa.is_used = 1


--SELECT *
--FROM #tmp2;




WITH CTE AS (
  SELECT
	rownum = ROW_NUMBER() OVER (PARTITION BY model_id order BY model_id)
    , dimensions
	, model_id
	, name
	, [description]
	, used_in
	--FROM #tmp2
  FROM (SELECT m.Model_ID, m.Name, m.Description, sa.Customer_Field as Dimensions
		, (SELECT COUNT(DISTINCT vm.Variant_ID) FROM dbo.Variant_Models vm WHERE vm.Model_ID = m.Model_ID AND vm.Is_Enabled = 1) as Used_In
		FROM dbo.Models m
		JOIN Models_Segmented ms ON ms.Model_ID = m.Model_ID
		JOIN Segmentation_Attributes sa ON sa.Segmentation_ID = ms.Segmentation_ID
		WHERE m.Catalog_ID = @Catalog_ID
		AND sa.is_used = 1) d1
)
SELECT
    cur.model_id
  , cur.name
  , cur.[description]
  , cur.dimensions + ', ' + prev.dimensions AS DimensionsLists
  , cur.used_in
FROM CTE cur
INNER JOIN CTE prev on prev.rownum = cur.rownum - 1
AND cur.model_id = prev.model_id AND cur.name = prev.name AND cur.[description] = prev.[description] AND cur.used_in = prev.used_in


--DROP TABLE  #tmp2
