-- ============================================================
-- NHS RTT Waiting Times: Data Quality Investigation
-- ============================================================
-- Seven checks, each run against the full 182,411-row dataset
-- before any KPI or chart was trusted.

-- ------------------------------------------------------------
-- 1. Commissioner Code = 0 anomaly
-- ------------------------------------------------------------
SELECT COUNT(*) AS rows_with_commissioner_zero
FROM nhs_rtt.nhs
WHERE Commissioner_Parent_Org_Code = '0';
-- Result: 0 rows affected -- not present in this dataset.

-- ------------------------------------------------------------
-- 2. Negative Value Check (all 108 numeric columns)
-- ------------------------------------------------------------
--Result: 0 negative values found across every numeric column. Verified independently in Excel. 

-- ------------------------------------------------------------
-- 3. Duplicate Row Check
-- ------------------------------------------------------------
-- Step 1: initial grouping check (broader grain -- can look misleading)
SELECT Provider_Org_Code, Commissioner_Parent_Name, RTT_Part_Type, Treatment_Function_Code,
       COUNT(*) AS Duplicate
FROM nhs_rtt.nhs
GROUP BY Provider_Org_Code, Commissioner_Parent_Name, RTT_Part_Type, Treatment_Function_Code
HAVING COUNT(*) > 1;

-- Step 2: verify at the correct grain (Commissioner_Org_Code, not Commissioner_Parent_Name)
SELECT * FROM nhs_rtt.nhs
WHERE Provider_Org_Code = 'AAV'
AND Commissioner_Parent_Name = 'NHS GREATER MANCHESTER INTEGRATED CARE BOARD'
AND RTT_Part_Type = 'Part_2'
AND Treatment_Function_Code = 'C_130';
-- Result: Commissioner_Org_Code differs between rows -- these are
-- legitimately distinct sub-commissioner records, not duplicates.

-- ------------------------------------------------------------
-- 4. C_999 "Total" Rollup Investigation
-- ------------------------------------------------------------
-- Uniqueness check: is C_999 duplicated within its own grain?
SELECT Provider_Org_Code, Commissioner_Org_Code, RTT_Part_Type, COUNT(*) AS c999_row_count 
FROM nhs_rtt.nhs 
WHERE Treatment_Function_Code = 'C_999' 
GROUP BY Provider_Org_Code, Commissioner_Org_Code, RTT_Part_Type 
HAVING COUNT(*) > 1; 
-- Result: 0 rows (no internal duplication)

-- ------------------------------------------------------------
-- 5. Missing Values by Provider
-- ------------------------------------------------------------
SELECT  
Provider_Org_Code,Provider_Org_Name,COUNT(*) AS total_rows_for_provider, ROUND(AVG(((CASE WHEN Gt_00_To_01_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_01_To_02_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_02_To_03_Weeks_SUM_1 IS 
NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_03_To_04_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + 
(CASE WHEN Gt_04_To_05_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_05_To_06_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_06_To_07_Weeks_SUM_1 IS 
NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_07_To_08_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + 
(CASE WHEN Gt_08_To_09_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_09_To_10_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_10_To_11_Weeks_SUM_1 IS 
NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_11_To_12_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + 
(CASE WHEN Gt_12_To_13_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_13_To_14_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_14_To_15_Weeks_SUM_1 IS 
NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_15_To_16_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + 
(CASE WHEN Gt_16_To_17_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_17_To_18_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_18_To_19_Weeks_SUM_1 IS 
NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_19_To_20_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + 
(CASE WHEN Gt_20_To_21_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_21_To_22_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_22_To_23_Weeks_SUM_1 IS 
NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_23_To_24_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + 
(CASE WHEN Gt_24_To_25_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_25_To_26_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_26_To_27_Weeks_SUM_1 IS 
NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_27_To_28_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + 
(CASE WHEN Gt_28_To_29_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_29_To_30_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_30_To_31_Weeks_SUM_1 IS 
NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_31_To_32_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + 
(CASE WHEN Gt_32_To_33_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_33_To_34_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_34_To_35_Weeks_SUM_1 IS 
NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_35_To_36_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + 
(CASE WHEN Gt_36_To_37_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_37_To_38_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_38_To_39_Weeks_SUM_1 IS 
NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_39_To_40_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + 
(CASE WHEN Gt_40_To_41_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_41_To_42_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_42_To_43_Weeks_SUM_1 IS 
NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_43_To_44_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + 
(CASE WHEN Gt_44_To_45_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_45_To_46_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_46_To_47_Weeks_SUM_1 IS 
NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_47_To_48_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + 
(CASE WHEN Gt_48_To_49_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_49_To_50_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_50_To_51_Weeks_SUM_1 IS 
NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_51_To_52_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + 
(CASE WHEN Gt_52_To_53_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_53_To_54_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_54_To_55_Weeks_SUM_1 IS 
NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_55_To_56_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + 
(CASE WHEN Gt_56_To_57_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_57_To_58_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_58_To_59_Weeks_SUM_1 IS 
NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_59_To_60_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + 
(CASE WHEN Gt_60_To_61_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_61_To_62_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_62_To_63_Weeks_SUM_1 IS 
NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_63_To_64_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + 
(CASE WHEN Gt_64_To_65_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_65_To_66_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_66_To_67_Weeks_SUM_1 IS 
NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_67_To_68_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + 
(CASE WHEN Gt_68_To_69_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_69_To_70_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_70_To_71_Weeks_SUM_1 IS 
NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_71_To_72_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + 
(CASE WHEN Gt_72_To_73_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_73_To_74_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_74_To_75_Weeks_SUM_1 IS 
NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_75_To_76_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + 
(CASE WHEN Gt_76_To_77_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_77_To_78_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_78_To_79_Weeks_SUM_1 IS 
NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_79_To_80_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + 
(CASE WHEN Gt_80_To_81_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_81_To_82_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_82_To_83_Weeks_SUM_1 IS 
NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_83_To_84_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + 
(CASE WHEN Gt_84_To_85_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_85_To_86_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_86_To_87_Weeks_SUM_1 IS 
NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_87_To_88_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + 
(CASE WHEN Gt_88_To_89_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_89_To_90_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_90_To_91_Weeks_SUM_1 IS 
NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_91_To_92_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + 
(CASE WHEN Gt_92_To_93_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_93_To_94_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_94_To_95_Weeks_SUM_1 IS 
NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_95_To_96_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + 
(CASE WHEN Gt_96_To_97_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_97_To_98_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_98_To_99_Weeks_SUM_1 IS 
NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_99_To_100_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + 
(CASE WHEN Gt_100_To_101_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_101_To_102_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_102_To_103_Weeks_SUM_1 IS 
NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_103_To_104_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + 
(CASE WHEN Gt_104_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END)) / 105.0 * 100), 2) AS pct_missing 
FROM nhs_rtt.nhs 
GROUP BY Provider_Org_Code, Provider_Org_Name 
ORDER BY pct_missing DESC 
-- Result: profiling finding -- identifies providers with the most
-- incomplete weekly reporting. NULLs are preserved, never replaced with 0.


-- ------------------------------------------------------------
-- 6. Part_2 vs Part_2A Investigation
-- ------------------------------------------------------------
SELECT RTT_Part_Type, RTT_Part_Description, COUNT(*) AS row_count, SUM(Total_All) AS total_patients
FROM nhs_rtt.nhs
WHERE RTT_Part_Type IN ('Part_2', 'Part_2A')
GROUP BY RTT_Part_Type, RTT_Part_Description;
-- Result: confirmed as distinct, legitimate pathway stages -- not a data error.
