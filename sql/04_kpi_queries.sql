-- ============================================================
-- NHS RTT Waiting Times: KPI Queries
-- ============================================================
-- All KPIs exclude Treatment_Function_Code = 'C_999' (the specialty
-- rollup row -- see data_quality_checks.sql, check 5).

-- ------------------------------------------------------------
-- KPI 1: Total Patient Volume
-- ------------------------------------------------------------
SELECT SUM(Total_All) AS Total_Patient_Volume
FROM nhs_rtt.nhs
WHERE Treatment_Function_Code <> 'C_999';
-- Result: 11,951,716


-- ------------------------------------------------------------
-- KPI 2: Percentage of Patients Treated
-- ------------------------------------------------------------
SELECT ((SELECT SUM(Total_All) FROM nhs_rtt.nhs
          WHERE Treatment_Function_Code <> 'C_999' AND RTT_Part_Type IN ('Part_1A','Part_1B'))
        / (SELECT SUM(Total_All) FROM nhs_rtt.nhs
          WHERE Treatment_Function_Code <> 'C_999')) * 100 AS Pct_Patients_Treated;
-- Result: 13.66%


-- ------------------------------------------------------------
-- KPI 3: Long Waiter Volume (52+ Weeks)
-- ------------------------------------------------------------
SELECT
    SUM(Gt_52_To_53_Weeks_SUM_1) + SUM(Gt_53_To_54_Weeks_SUM_1) + SUM(Gt_54_To_55_Weeks_SUM_1) + SUM(Gt_55_To_56_Weeks_SUM_1) + SUM(Gt_56_To_57_Weeks_SUM_1) + SUM(Gt_57_To_58_Weeks_SUM_1) + SUM(Gt_58_To_59_Weeks_SUM_1) + SUM(Gt_59_To_60_Weeks_SUM_1) + SUM(Gt_60_To_61_Weeks_SUM_1) + SUM(Gt_61_To_62_Weeks_SUM_1) + SUM(Gt_62_To_63_Weeks_SUM_1) + SUM(Gt_63_To_64_Weeks_SUM_1) + SUM(Gt_64_To_65_Weeks_SUM_1) + SUM(Gt_65_To_66_Weeks_SUM_1) + SUM(Gt_66_To_67_Weeks_SUM_1) + SUM(Gt_67_To_68_Weeks_SUM_1) + SUM(Gt_68_To_69_Weeks_SUM_1) + SUM(Gt_69_To_70_Weeks_SUM_1) + SUM(Gt_70_To_71_Weeks_SUM_1) + SUM(Gt_71_To_72_Weeks_SUM_1) + SUM(Gt_72_To_73_Weeks_SUM_1) + SUM(Gt_73_To_74_Weeks_SUM_1) + SUM(Gt_74_To_75_Weeks_SUM_1) + SUM(Gt_75_To_76_Weeks_SUM_1) + SUM(Gt_76_To_77_Weeks_SUM_1) + SUM(Gt_77_To_78_Weeks_SUM_1) + SUM(Gt_78_To_79_Weeks_SUM_1) + SUM(Gt_79_To_80_Weeks_SUM_1) + SUM(Gt_80_To_81_Weeks_SUM_1) + SUM(Gt_81_To_82_Weeks_SUM_1) + SUM(Gt_82_To_83_Weeks_SUM_1) + SUM(Gt_83_To_84_Weeks_SUM_1) + SUM(Gt_84_To_85_Weeks_SUM_1) + SUM(Gt_85_To_86_Weeks_SUM_1) + SUM(Gt_86_To_87_Weeks_SUM_1) + SUM(Gt_87_To_88_Weeks_SUM_1) + SUM(Gt_88_To_89_Weeks_SUM_1) + SUM(Gt_89_To_90_Weeks_SUM_1) + SUM(Gt_90_To_91_Weeks_SUM_1) + SUM(Gt_91_To_92_Weeks_SUM_1) + SUM(Gt_92_To_93_Weeks_SUM_1) + SUM(Gt_93_To_94_Weeks_SUM_1) + SUM(Gt_94_To_95_Weeks_SUM_1) + SUM(Gt_95_To_96_Weeks_SUM_1) + SUM(Gt_96_To_97_Weeks_SUM_1) + SUM(Gt_97_To_98_Weeks_SUM_1) + SUM(Gt_98_To_99_Weeks_SUM_1) + SUM(Gt_99_To_100_Weeks_SUM_1) + SUM(Gt_100_To_101_Weeks_SUM_1) + SUM(Gt_101_To_102_Weeks_SUM_1) + SUM(Gt_102_To_103_Weeks_SUM_1) + SUM(Gt_103_To_104_Weeks_SUM_1) + SUM(Gt_104_Weeks_SUM_1) AS Long_Waiters_Over_52_Weeks
FROM nhs_rtt.nhs
WHERE Treatment_Function_Code <> 'C_999';
-- Result: 223,700


-- ------------------------------------------------------------
-- KPI 4: Percentage of Long Waiters
-- ------------------------------------------------------------
SELECT
    (SUM(Gt_52_To_53_Weeks_SUM_1) + SUM(Gt_53_To_54_Weeks_SUM_1) + SUM(Gt_54_To_55_Weeks_SUM_1) + SUM(Gt_55_To_56_Weeks_SUM_1) + SUM(Gt_56_To_57_Weeks_SUM_1) + SUM(Gt_57_To_58_Weeks_SUM_1) + SUM(Gt_58_To_59_Weeks_SUM_1) + SUM(Gt_59_To_60_Weeks_SUM_1) + SUM(Gt_60_To_61_Weeks_SUM_1) + SUM(Gt_61_To_62_Weeks_SUM_1) + SUM(Gt_62_To_63_Weeks_SUM_1) + SUM(Gt_63_To_64_Weeks_SUM_1) + SUM(Gt_64_To_65_Weeks_SUM_1) + SUM(Gt_65_To_66_Weeks_SUM_1) + SUM(Gt_66_To_67_Weeks_SUM_1) + SUM(Gt_67_To_68_Weeks_SUM_1) + SUM(Gt_68_To_69_Weeks_SUM_1) + SUM(Gt_69_To_70_Weeks_SUM_1) + SUM(Gt_70_To_71_Weeks_SUM_1) + SUM(Gt_71_To_72_Weeks_SUM_1) + SUM(Gt_72_To_73_Weeks_SUM_1) + SUM(Gt_73_To_74_Weeks_SUM_1) + SUM(Gt_74_To_75_Weeks_SUM_1) + SUM(Gt_75_To_76_Weeks_SUM_1) + SUM(Gt_76_To_77_Weeks_SUM_1) + SUM(Gt_77_To_78_Weeks_SUM_1) + SUM(Gt_78_To_79_Weeks_SUM_1) + SUM(Gt_79_To_80_Weeks_SUM_1) + SUM(Gt_80_To_81_Weeks_SUM_1) + SUM(Gt_81_To_82_Weeks_SUM_1) + SUM(Gt_82_To_83_Weeks_SUM_1) + SUM(Gt_83_To_84_Weeks_SUM_1) + SUM(Gt_84_To_85_Weeks_SUM_1) + SUM(Gt_85_To_86_Weeks_SUM_1) + SUM(Gt_86_To_87_Weeks_SUM_1) + SUM(Gt_87_To_88_Weeks_SUM_1) + SUM(Gt_88_To_89_Weeks_SUM_1) + SUM(Gt_89_To_90_Weeks_SUM_1) + SUM(Gt_90_To_91_Weeks_SUM_1) + SUM(Gt_91_To_92_Weeks_SUM_1) + SUM(Gt_92_To_93_Weeks_SUM_1) + SUM(Gt_93_To_94_Weeks_SUM_1) + SUM(Gt_94_To_95_Weeks_SUM_1) + SUM(Gt_95_To_96_Weeks_SUM_1) + SUM(Gt_96_To_97_Weeks_SUM_1) + SUM(Gt_97_To_98_Weeks_SUM_1) + SUM(Gt_98_To_99_Weeks_SUM_1) + SUM(Gt_99_To_100_Weeks_SUM_1) + SUM(Gt_100_To_101_Weeks_SUM_1) + SUM(Gt_101_To_102_Weeks_SUM_1) + SUM(Gt_102_To_103_Weeks_SUM_1) + SUM(Gt_103_To_104_Weeks_SUM_1) + SUM(Gt_104_Weeks_SUM_1)) / SUM(Total_All) * 100 AS Percentage_of_Long_Waiters
FROM nhs_rtt.nhs
WHERE Treatment_Function_Code <> 'C_999';
-- Result: 1.87%


-- ------------------------------------------------------------
-- KPI 5: Extreme Long Waiter Volume (104+ Weeks)
-- ------------------------------------------------------------
SELECT SUM(Gt_104_Weeks_SUM_1) AS Extreme_Long_Waiters
FROM nhs_rtt.nhs
WHERE Treatment_Function_Code <> 'C_999';
-- Result: approx. 2,400


-- ------------------------------------------------------------
-- KPI 6: High-Risk Specialty Long-Waiter Count
-- (Cardiology, Cardiothoracic Surgery, Neurosurgery, General Surgery,
--  Urology, Gynaecology, Respiratory Medicine)
-- ------------------------------------------------------------
SELECT
    SUM(Gt_52_To_53_Weeks_SUM_1) + SUM(Gt_53_To_54_Weeks_SUM_1) + SUM(Gt_54_To_55_Weeks_SUM_1) + SUM(Gt_55_To_56_Weeks_SUM_1) + SUM(Gt_56_To_57_Weeks_SUM_1) + SUM(Gt_57_To_58_Weeks_SUM_1) + SUM(Gt_58_To_59_Weeks_SUM_1) + SUM(Gt_59_To_60_Weeks_SUM_1) + SUM(Gt_60_To_61_Weeks_SUM_1) + SUM(Gt_61_To_62_Weeks_SUM_1) + SUM(Gt_62_To_63_Weeks_SUM_1) + SUM(Gt_63_To_64_Weeks_SUM_1) + SUM(Gt_64_To_65_Weeks_SUM_1) + SUM(Gt_65_To_66_Weeks_SUM_1) + SUM(Gt_66_To_67_Weeks_SUM_1) + SUM(Gt_67_To_68_Weeks_SUM_1) + SUM(Gt_68_To_69_Weeks_SUM_1) + SUM(Gt_69_To_70_Weeks_SUM_1) + SUM(Gt_70_To_71_Weeks_SUM_1) + SUM(Gt_71_To_72_Weeks_SUM_1) + SUM(Gt_72_To_73_Weeks_SUM_1) + SUM(Gt_73_To_74_Weeks_SUM_1) + SUM(Gt_74_To_75_Weeks_SUM_1) + SUM(Gt_75_To_76_Weeks_SUM_1) + SUM(Gt_76_To_77_Weeks_SUM_1) + SUM(Gt_77_To_78_Weeks_SUM_1) + SUM(Gt_78_To_79_Weeks_SUM_1) + SUM(Gt_79_To_80_Weeks_SUM_1) + SUM(Gt_80_To_81_Weeks_SUM_1) + SUM(Gt_81_To_82_Weeks_SUM_1) + SUM(Gt_82_To_83_Weeks_SUM_1) + SUM(Gt_83_To_84_Weeks_SUM_1) + SUM(Gt_84_To_85_Weeks_SUM_1) + SUM(Gt_85_To_86_Weeks_SUM_1) + SUM(Gt_86_To_87_Weeks_SUM_1) + SUM(Gt_87_To_88_Weeks_SUM_1) + SUM(Gt_88_To_89_Weeks_SUM_1) + SUM(Gt_89_To_90_Weeks_SUM_1) + SUM(Gt_90_To_91_Weeks_SUM_1) + SUM(Gt_91_To_92_Weeks_SUM_1) + SUM(Gt_92_To_93_Weeks_SUM_1) + SUM(Gt_93_To_94_Weeks_SUM_1) + SUM(Gt_94_To_95_Weeks_SUM_1) + SUM(Gt_95_To_96_Weeks_SUM_1) + SUM(Gt_96_To_97_Weeks_SUM_1) + SUM(Gt_97_To_98_Weeks_SUM_1) + SUM(Gt_98_To_99_Weeks_SUM_1) + SUM(Gt_99_To_100_Weeks_SUM_1) + SUM(Gt_100_To_101_Weeks_SUM_1) + SUM(Gt_101_To_102_Weeks_SUM_1) + SUM(Gt_102_To_103_Weeks_SUM_1) + SUM(Gt_103_To_104_Weeks_SUM_1) + SUM(Gt_104_Weeks_SUM_1) AS High_Risk_Specialty_Long_Waiters
FROM nhs_rtt.nhs
WHERE Treatment_Function_Code <> 'C_999'
AND Treatment_Function_Name IN (
    'Cardiology Service','Cardiothoracic Surgery Service','Neurosurgical Service',
    'General Surgery Service','Urology Service','Gynaecology Service',
    'Respiratory Medicine Service'
);
-- Result: approx. 61,000


-- ============================================================
-- Dashboard Chart / Table Requirements
-- ============================================================

-- ------------------------------------------------------------
-- Requirement 1: Provider League Table (Top 10 Long Waiters)
-- ------------------------------------------------------------
SELECT Provider_Org_Name, SUM(Gt_52_To_53_Weeks_SUM_1) + SUM(Gt_53_To_54_Weeks_SUM_1) + SUM(Gt_54_To_55_Weeks_SUM_1) + SUM(Gt_55_To_56_Weeks_SUM_1) + SUM(Gt_56_To_57_Weeks_SUM_1) + SUM(Gt_57_To_58_Weeks_SUM_1) + SUM(Gt_58_To_59_Weeks_SUM_1) + SUM(Gt_59_To_60_Weeks_SUM_1) + SUM(Gt_60_To_61_Weeks_SUM_1) + SUM(Gt_61_To_62_Weeks_SUM_1) + SUM(Gt_62_To_63_Weeks_SUM_1) + SUM(Gt_63_To_64_Weeks_SUM_1) + SUM(Gt_64_To_65_Weeks_SUM_1) + SUM(Gt_65_To_66_Weeks_SUM_1) + SUM(Gt_66_To_67_Weeks_SUM_1) + SUM(Gt_67_To_68_Weeks_SUM_1) + SUM(Gt_68_To_69_Weeks_SUM_1) + SUM(Gt_69_To_70_Weeks_SUM_1) + SUM(Gt_70_To_71_Weeks_SUM_1) + SUM(Gt_71_To_72_Weeks_SUM_1) + SUM(Gt_72_To_73_Weeks_SUM_1) + SUM(Gt_73_To_74_Weeks_SUM_1) + SUM(Gt_74_To_75_Weeks_SUM_1) + SUM(Gt_75_To_76_Weeks_SUM_1) + SUM(Gt_76_To_77_Weeks_SUM_1) + SUM(Gt_77_To_78_Weeks_SUM_1) + SUM(Gt_78_To_79_Weeks_SUM_1) + SUM(Gt_79_To_80_Weeks_SUM_1) + SUM(Gt_80_To_81_Weeks_SUM_1) + SUM(Gt_81_To_82_Weeks_SUM_1) + SUM(Gt_82_To_83_Weeks_SUM_1) + SUM(Gt_83_To_84_Weeks_SUM_1) + SUM(Gt_84_To_85_Weeks_SUM_1) + SUM(Gt_85_To_86_Weeks_SUM_1) + SUM(Gt_86_To_87_Weeks_SUM_1) + SUM(Gt_87_To_88_Weeks_SUM_1) + SUM(Gt_88_To_89_Weeks_SUM_1) + SUM(Gt_89_To_90_Weeks_SUM_1) + SUM(Gt_90_To_91_Weeks_SUM_1) + SUM(Gt_91_To_92_Weeks_SUM_1) + SUM(Gt_92_To_93_Weeks_SUM_1) + SUM(Gt_93_To_94_Weeks_SUM_1) + SUM(Gt_94_To_95_Weeks_SUM_1) + SUM(Gt_95_To_96_Weeks_SUM_1) + SUM(Gt_96_To_97_Weeks_SUM_1) + SUM(Gt_97_To_98_Weeks_SUM_1) + SUM(Gt_98_To_99_Weeks_SUM_1) + SUM(Gt_99_To_100_Weeks_SUM_1) + SUM(Gt_100_To_101_Weeks_SUM_1) + SUM(Gt_101_To_102_Weeks_SUM_1) + SUM(Gt_102_To_103_Weeks_SUM_1) + SUM(Gt_103_To_104_Weeks_SUM_1) + SUM(Gt_104_Weeks_SUM_1) AS Waiting
FROM nhs_rtt.nhs
WHERE Treatment_Function_Code <> 'C_999'
GROUP BY Provider_Org_Name
ORDER BY Waiting DESC
LIMIT 10;


-- ------------------------------------------------------------
-- Requirement 2: Waiting Time Distribution
-- ------------------------------------------------------------
SELECT '0-18 Weeks' AS Wait_Band, (SUM(Gt_00_To_01_Weeks_SUM_1) + SUM(Gt_01_To_02_Weeks_SUM_1) + SUM(Gt_02_To_03_Weeks_SUM_1) + SUM(Gt_03_To_04_Weeks_SUM_1) + SUM(Gt_04_To_05_Weeks_SUM_1) + SUM(Gt_05_To_06_Weeks_SUM_1) + SUM(Gt_06_To_07_Weeks_SUM_1) + SUM(Gt_07_To_08_Weeks_SUM_1) + SUM(Gt_08_To_09_Weeks_SUM_1) + SUM(Gt_09_To_10_Weeks_SUM_1) + SUM(Gt_10_To_11_Weeks_SUM_1) + SUM(Gt_11_To_12_Weeks_SUM_1) + SUM(Gt_12_To_13_Weeks_SUM_1) + SUM(Gt_13_To_14_Weeks_SUM_1) + SUM(Gt_14_To_15_Weeks_SUM_1) + SUM(Gt_15_To_16_Weeks_SUM_1) + SUM(Gt_16_To_17_Weeks_SUM_1) + SUM(Gt_17_To_18_Weeks_SUM_1)) AS Patient_Volume
FROM nhs_rtt.nhs WHERE Treatment_Function_Code <> 'C_999'
UNION ALL
SELECT '18-52 Weeks', (SUM(Gt_18_To_19_Weeks_SUM_1) + SUM(Gt_19_To_20_Weeks_SUM_1) + SUM(Gt_20_To_21_Weeks_SUM_1) + SUM(Gt_21_To_22_Weeks_SUM_1) + SUM(Gt_22_To_23_Weeks_SUM_1) + SUM(Gt_23_To_24_Weeks_SUM_1) + SUM(Gt_24_To_25_Weeks_SUM_1) + SUM(Gt_25_To_26_Weeks_SUM_1) + SUM(Gt_26_To_27_Weeks_SUM_1) + SUM(Gt_27_To_28_Weeks_SUM_1) + SUM(Gt_28_To_29_Weeks_SUM_1) + SUM(Gt_29_To_30_Weeks_SUM_1) + SUM(Gt_30_To_31_Weeks_SUM_1) + SUM(Gt_31_To_32_Weeks_SUM_1) + SUM(Gt_32_To_33_Weeks_SUM_1) + SUM(Gt_33_To_34_Weeks_SUM_1) + SUM(Gt_34_To_35_Weeks_SUM_1) + SUM(Gt_35_To_36_Weeks_SUM_1) + SUM(Gt_36_To_37_Weeks_SUM_1) + SUM(Gt_37_To_38_Weeks_SUM_1) + SUM(Gt_38_To_39_Weeks_SUM_1) + SUM(Gt_39_To_40_Weeks_SUM_1) + SUM(Gt_40_To_41_Weeks_SUM_1) + SUM(Gt_41_To_42_Weeks_SUM_1) + SUM(Gt_42_To_43_Weeks_SUM_1) + SUM(Gt_43_To_44_Weeks_SUM_1) + SUM(Gt_44_To_45_Weeks_SUM_1) + SUM(Gt_45_To_46_Weeks_SUM_1) + SUM(Gt_46_To_47_Weeks_SUM_1) + SUM(Gt_47_To_48_Weeks_SUM_1) + SUM(Gt_48_To_49_Weeks_SUM_1) + SUM(Gt_49_To_50_Weeks_SUM_1) + SUM(Gt_50_To_51_Weeks_SUM_1) + SUM(Gt_51_To_52_Weeks_SUM_1))
FROM nhs_rtt.nhs WHERE Treatment_Function_Code <> 'C_999'
UNION ALL
SELECT '52-104 Weeks', (SUM(Gt_52_To_53_Weeks_SUM_1) + SUM(Gt_53_To_54_Weeks_SUM_1) + SUM(Gt_54_To_55_Weeks_SUM_1) + SUM(Gt_55_To_56_Weeks_SUM_1) + SUM(Gt_56_To_57_Weeks_SUM_1) + SUM(Gt_57_To_58_Weeks_SUM_1) + SUM(Gt_58_To_59_Weeks_SUM_1) + SUM(Gt_59_To_60_Weeks_SUM_1) + SUM(Gt_60_To_61_Weeks_SUM_1) + SUM(Gt_61_To_62_Weeks_SUM_1) + SUM(Gt_62_To_63_Weeks_SUM_1) + SUM(Gt_63_To_64_Weeks_SUM_1) + SUM(Gt_64_To_65_Weeks_SUM_1) + SUM(Gt_65_To_66_Weeks_SUM_1) + SUM(Gt_66_To_67_Weeks_SUM_1) + SUM(Gt_67_To_68_Weeks_SUM_1) + SUM(Gt_68_To_69_Weeks_SUM_1) + SUM(Gt_69_To_70_Weeks_SUM_1) + SUM(Gt_70_To_71_Weeks_SUM_1) + SUM(Gt_71_To_72_Weeks_SUM_1) + SUM(Gt_72_To_73_Weeks_SUM_1) + SUM(Gt_73_To_74_Weeks_SUM_1) + SUM(Gt_74_To_75_Weeks_SUM_1) + SUM(Gt_75_To_76_Weeks_SUM_1) + SUM(Gt_76_To_77_Weeks_SUM_1) + SUM(Gt_77_To_78_Weeks_SUM_1) + SUM(Gt_78_To_79_Weeks_SUM_1) + SUM(Gt_79_To_80_Weeks_SUM_1) + SUM(Gt_80_To_81_Weeks_SUM_1) + SUM(Gt_81_To_82_Weeks_SUM_1) + SUM(Gt_82_To_83_Weeks_SUM_1) + SUM(Gt_83_To_84_Weeks_SUM_1) + SUM(Gt_84_To_85_Weeks_SUM_1) + SUM(Gt_85_To_86_Weeks_SUM_1) + SUM(Gt_86_To_87_Weeks_SUM_1) + SUM(Gt_87_To_88_Weeks_SUM_1) + SUM(Gt_88_To_89_Weeks_SUM_1) + SUM(Gt_89_To_90_Weeks_SUM_1) + SUM(Gt_90_To_91_Weeks_SUM_1) + SUM(Gt_91_To_92_Weeks_SUM_1) + SUM(Gt_92_To_93_Weeks_SUM_1) + SUM(Gt_93_To_94_Weeks_SUM_1) + SUM(Gt_94_To_95_Weeks_SUM_1) + SUM(Gt_95_To_96_Weeks_SUM_1) + SUM(Gt_96_To_97_Weeks_SUM_1) + SUM(Gt_97_To_98_Weeks_SUM_1) + SUM(Gt_98_To_99_Weeks_SUM_1) + SUM(Gt_99_To_100_Weeks_SUM_1) + SUM(Gt_100_To_101_Weeks_SUM_1) + SUM(Gt_101_To_102_Weeks_SUM_1) + SUM(Gt_102_To_103_Weeks_SUM_1) + SUM(Gt_103_To_104_Weeks_SUM_1))
FROM nhs_rtt.nhs WHERE Treatment_Function_Code <> 'C_999'
UNION ALL
SELECT '104+ Weeks', (SUM(Gt_104_Weeks_SUM_1))
FROM nhs_rtt.nhs WHERE Treatment_Function_Code <> 'C_999';


-- ------------------------------------------------------------
-- Requirement 3: Specialty Breakdown
-- ------------------------------------------------------------
SELECT Treatment_Function_Name, SUM(Gt_52_To_53_Weeks_SUM_1) + SUM(Gt_53_To_54_Weeks_SUM_1) + SUM(Gt_54_To_55_Weeks_SUM_1) + SUM(Gt_55_To_56_Weeks_SUM_1) + SUM(Gt_56_To_57_Weeks_SUM_1) + SUM(Gt_57_To_58_Weeks_SUM_1) + SUM(Gt_58_To_59_Weeks_SUM_1) + SUM(Gt_59_To_60_Weeks_SUM_1) + SUM(Gt_60_To_61_Weeks_SUM_1) + SUM(Gt_61_To_62_Weeks_SUM_1) + SUM(Gt_62_To_63_Weeks_SUM_1) + SUM(Gt_63_To_64_Weeks_SUM_1) + SUM(Gt_64_To_65_Weeks_SUM_1) + SUM(Gt_65_To_66_Weeks_SUM_1) + SUM(Gt_66_To_67_Weeks_SUM_1) + SUM(Gt_67_To_68_Weeks_SUM_1) + SUM(Gt_68_To_69_Weeks_SUM_1) + SUM(Gt_69_To_70_Weeks_SUM_1) + SUM(Gt_70_To_71_Weeks_SUM_1) + SUM(Gt_71_To_72_Weeks_SUM_1) + SUM(Gt_72_To_73_Weeks_SUM_1) + SUM(Gt_73_To_74_Weeks_SUM_1) + SUM(Gt_74_To_75_Weeks_SUM_1) + SUM(Gt_75_To_76_Weeks_SUM_1) + SUM(Gt_76_To_77_Weeks_SUM_1) + SUM(Gt_77_To_78_Weeks_SUM_1) + SUM(Gt_78_To_79_Weeks_SUM_1) + SUM(Gt_79_To_80_Weeks_SUM_1) + SUM(Gt_80_To_81_Weeks_SUM_1) + SUM(Gt_81_To_82_Weeks_SUM_1) + SUM(Gt_82_To_83_Weeks_SUM_1) + SUM(Gt_83_To_84_Weeks_SUM_1) + SUM(Gt_84_To_85_Weeks_SUM_1) + SUM(Gt_85_To_86_Weeks_SUM_1) + SUM(Gt_86_To_87_Weeks_SUM_1) + SUM(Gt_87_To_88_Weeks_SUM_1) + SUM(Gt_88_To_89_Weeks_SUM_1) + SUM(Gt_89_To_90_Weeks_SUM_1) + SUM(Gt_90_To_91_Weeks_SUM_1) + SUM(Gt_91_To_92_Weeks_SUM_1) + SUM(Gt_92_To_93_Weeks_SUM_1) + SUM(Gt_93_To_94_Weeks_SUM_1) + SUM(Gt_94_To_95_Weeks_SUM_1) + SUM(Gt_95_To_96_Weeks_SUM_1) + SUM(Gt_96_To_97_Weeks_SUM_1) + SUM(Gt_97_To_98_Weeks_SUM_1) + SUM(Gt_98_To_99_Weeks_SUM_1) + SUM(Gt_99_To_100_Weeks_SUM_1) + SUM(Gt_100_To_101_Weeks_SUM_1) + SUM(Gt_101_To_102_Weeks_SUM_1) + SUM(Gt_102_To_103_Weeks_SUM_1) + SUM(Gt_103_To_104_Weeks_SUM_1) + SUM(Gt_104_Weeks_SUM_1) AS Waiting
FROM nhs_rtt.nhs
WHERE Treatment_Function_Code <> 'C_999'
GROUP BY Treatment_Function_Name
ORDER BY Waiting DESC;


-- ------------------------------------------------------------
-- Requirement 4: Regional (ICB) Comparison
-- ------------------------------------------------------------
SELECT Provider_Parent_Name, SUM(Gt_52_To_53_Weeks_SUM_1) + SUM(Gt_53_To_54_Weeks_SUM_1) + SUM(Gt_54_To_55_Weeks_SUM_1) + SUM(Gt_55_To_56_Weeks_SUM_1) + SUM(Gt_56_To_57_Weeks_SUM_1) + SUM(Gt_57_To_58_Weeks_SUM_1) + SUM(Gt_58_To_59_Weeks_SUM_1) + SUM(Gt_59_To_60_Weeks_SUM_1) + SUM(Gt_60_To_61_Weeks_SUM_1) + SUM(Gt_61_To_62_Weeks_SUM_1) + SUM(Gt_62_To_63_Weeks_SUM_1) + SUM(Gt_63_To_64_Weeks_SUM_1) + SUM(Gt_64_To_65_Weeks_SUM_1) + SUM(Gt_65_To_66_Weeks_SUM_1) + SUM(Gt_66_To_67_Weeks_SUM_1) + SUM(Gt_67_To_68_Weeks_SUM_1) + SUM(Gt_68_To_69_Weeks_SUM_1) + SUM(Gt_69_To_70_Weeks_SUM_1) + SUM(Gt_70_To_71_Weeks_SUM_1) + SUM(Gt_71_To_72_Weeks_SUM_1) + SUM(Gt_72_To_73_Weeks_SUM_1) + SUM(Gt_73_To_74_Weeks_SUM_1) + SUM(Gt_74_To_75_Weeks_SUM_1) + SUM(Gt_75_To_76_Weeks_SUM_1) + SUM(Gt_76_To_77_Weeks_SUM_1) + SUM(Gt_77_To_78_Weeks_SUM_1) + SUM(Gt_78_To_79_Weeks_SUM_1) + SUM(Gt_79_To_80_Weeks_SUM_1) + SUM(Gt_80_To_81_Weeks_SUM_1) + SUM(Gt_81_To_82_Weeks_SUM_1) + SUM(Gt_82_To_83_Weeks_SUM_1) + SUM(Gt_83_To_84_Weeks_SUM_1) + SUM(Gt_84_To_85_Weeks_SUM_1) + SUM(Gt_85_To_86_Weeks_SUM_1) + SUM(Gt_86_To_87_Weeks_SUM_1) + SUM(Gt_87_To_88_Weeks_SUM_1) + SUM(Gt_88_To_89_Weeks_SUM_1) + SUM(Gt_89_To_90_Weeks_SUM_1) + SUM(Gt_90_To_91_Weeks_SUM_1) + SUM(Gt_91_To_92_Weeks_SUM_1) + SUM(Gt_92_To_93_Weeks_SUM_1) + SUM(Gt_93_To_94_Weeks_SUM_1) + SUM(Gt_94_To_95_Weeks_SUM_1) + SUM(Gt_95_To_96_Weeks_SUM_1) + SUM(Gt_96_To_97_Weeks_SUM_1) + SUM(Gt_97_To_98_Weeks_SUM_1) + SUM(Gt_98_To_99_Weeks_SUM_1) + SUM(Gt_99_To_100_Weeks_SUM_1) + SUM(Gt_100_To_101_Weeks_SUM_1) + SUM(Gt_101_To_102_Weeks_SUM_1) + SUM(Gt_102_To_103_Weeks_SUM_1) + SUM(Gt_103_To_104_Weeks_SUM_1) + SUM(Gt_104_Weeks_SUM_1) AS Waiting
FROM nhs_rtt.nhs
WHERE Treatment_Function_Code <> 'C_999'
GROUP BY Provider_Parent_Name
ORDER BY Waiting DESC;


-- ------------------------------------------------------------
-- Requirement 5: Interactive Filtering
-- (Implemented as Power BI slicers -- no separate query;
--  slicer fields are RTT_Part_Description, Treatment_Function_Name,
--  Provider_Parent_Name)
-- ------------------------------------------------------------


-- ------------------------------------------------------------
-- Requirement 6: Data Completeness Table
-- ------------------------------------------------------------
SELECT  
Provider_Org_Name, 
SUM((CASE WHEN Gt_00_To_01_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_01_To_02_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_02_To_03_Weeks_SUM_1 
IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_03_To_04_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 
END) + (CASE WHEN Gt_04_To_05_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_05_To_06_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_06_To_07_Weeks_SUM_1 
IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_07_To_08_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 
END) + (CASE WHEN Gt_08_To_09_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_09_To_10_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_10_To_11_Weeks_SUM_1 
IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_11_To_12_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 
END) + (CASE WHEN Gt_12_To_13_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_13_To_14_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_14_To_15_Weeks_SUM_1 
IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_15_To_16_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 
END) + (CASE WHEN Gt_16_To_17_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_17_To_18_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_18_To_19_Weeks_SUM_1 
IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_19_To_20_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 
END) + (CASE WHEN Gt_20_To_21_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_21_To_22_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_22_To_23_Weeks_SUM_1 
IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_23_To_24_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 
END) + (CASE WHEN Gt_24_To_25_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_25_To_26_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_26_To_27_Weeks_SUM_1 
IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_27_To_28_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 
END) + (CASE WHEN Gt_28_To_29_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_29_To_30_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_30_To_31_Weeks_SUM_1 
IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_31_To_32_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 
END) + (CASE WHEN Gt_32_To_33_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_33_To_34_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_34_To_35_Weeks_SUM_1 
IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_35_To_36_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 
END) + (CASE WHEN Gt_36_To_37_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_37_To_38_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_38_To_39_Weeks_SUM_1 
IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_39_To_40_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 
END) + (CASE WHEN Gt_40_To_41_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_41_To_42_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_42_To_43_Weeks_SUM_1 
IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_43_To_44_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 
END) + (CASE WHEN Gt_44_To_45_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_45_To_46_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_46_To_47_Weeks_SUM_1 
IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_47_To_48_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 
END) + (CASE WHEN Gt_48_To_49_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_49_To_50_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_50_To_51_Weeks_SUM_1 
IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_51_To_52_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 
END) + (CASE WHEN Gt_52_To_53_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_53_To_54_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_54_To_55_Weeks_SUM_1 
IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_55_To_56_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 
END) + (CASE WHEN Gt_56_To_57_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_57_To_58_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_58_To_59_Weeks_SUM_1 
IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_59_To_60_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 
END) + (CASE WHEN Gt_60_To_61_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_61_To_62_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_62_To_63_Weeks_SUM_1 
IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_63_To_64_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 
END) + (CASE WHEN Gt_64_To_65_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_65_To_66_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_66_To_67_Weeks_SUM_1 
IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_67_To_68_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 
END) + (CASE WHEN Gt_68_To_69_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_69_To_70_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_70_To_71_Weeks_SUM_1 
IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_71_To_72_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 
END) + (CASE WHEN Gt_72_To_73_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_73_To_74_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_74_To_75_Weeks_SUM_1 
IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_75_To_76_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 
END) + (CASE WHEN Gt_76_To_77_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_77_To_78_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_78_To_79_Weeks_SUM_1 
IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_79_To_80_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 
END) + (CASE WHEN Gt_80_To_81_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_81_To_82_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_82_To_83_Weeks_SUM_1 
IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_83_To_84_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 
END) + (CASE WHEN Gt_84_To_85_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_85_To_86_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_86_To_87_Weeks_SUM_1 
IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_87_To_88_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 
END) + (CASE WHEN Gt_88_To_89_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_89_To_90_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_90_To_91_Weeks_SUM_1 
IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_91_To_92_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 
END) + (CASE WHEN Gt_92_To_93_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_93_To_94_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_94_To_95_Weeks_SUM_1 
IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_95_To_96_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 
END) + (CASE WHEN Gt_96_To_97_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_97_To_98_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_98_To_99_Weeks_SUM_1 
IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_99_To_100_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 
END) + (CASE WHEN Gt_100_To_101_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_101_To_102_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_102_To_103_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN 
Gt_103_To_104_Weeks_SUM_1 IS NULL THEN 1 ELSE 0 END) + (CASE WHEN Gt_104_Weeks_SUM_1 IS 
NULL THEN 1 ELSE 0 END)) AS Null_Count 
FROM nhs_rtt.nhs 
GROUP BY Provider_Org_Name 
ORDER BY Null_Count DESC;


-- ------------------------------------------------------------
-- Requirement 7: Patient Journey Breakdown (RTT Pathway Stages)
-- ------------------------------------------------------------
SELECT RTT_Part_Type, RTT_Part_Description, SUM(Total_All) AS Patient_Volume
FROM nhs_rtt.nhs
WHERE Treatment_Function_Code <> 'C_999'
GROUP BY RTT_Part_Type, RTT_Part_Description
ORDER BY CASE RTT_Part_Type
    WHEN 'Part_3' THEN 1 WHEN 'Part_2' THEN 2 WHEN 'Part_2A' THEN 3
    WHEN 'Part_1A' THEN 4 WHEN 'Part_1B' THEN 5 END;
