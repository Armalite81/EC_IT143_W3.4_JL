/***********************************************************************************************
    NAME:        EC_IT143_W5.2_EmbeddedNetwork_jl
    PURPOSE:     Provide SQL answers to four stakeholder questions for the 
                 embedded_system_network_security_dataset community.

    MODIFICATION LOG:
    Ver      Date          Author        Description
    ------   ------------  ------------  --------------------------------------------------------
    1.0      11/28/2025    J. LeSueur    1. Created script for IT 143 W5.2 assignment
***********************************************************************************************/

-- RUNTIME:
-- X minutes or less

-- NOTES:
-- This script answers four questions about the embedded system network security dataset. 
-- Each question includes an English description (Q1–Q4) and a corresponding SQL answer (A1–A4).
-- Questions marked as classmate-authored may use placeholder names.

USE embedded_system_network_security_dataset;
GO


/***********************************************************************************************
    Q1: (Author: John LeSueur)
    How many abnormal packets (label = 1) appear for each source and destination port pair?
***********************************************************************************************/

-- A1: Count abnormal packets grouped by src_port and dst_port.
SELECT
    src_port,
    dst_port,
    COUNT(*) AS abnormal_packet_count
FROM dbo.embedded_system_network_security_dataset
WHERE label = 1
GROUP BY src_port, dst_port
ORDER BY abnormal_packet_count DESC;
GO


/***********************************************************************************************
    Q2: (Author: John LeSueur)
    What is the average spectral_entropy for normal vs abnormal packets?
***********************************************************************************************/

-- A2: Average spectral_entropy grouped by label.
SELECT
    label,
    AVG(spectral_entropy) AS avg_spectral_entropy
FROM dbo.embedded_system_network_security_dataset
GROUP BY label
ORDER BY label;
GO


/***********************************************************************************************
    Q3: (Author: John LeSueur)
    Which destination ports have the highest average packet size?
***********************************************************************************************/

-- A3: Average mean_packet_size grouped by destination port.
SELECT
    dst_port,
    AVG(mean_packet_size) AS avg_packet_size
FROM dbo.embedded_system_network_security_dataset
GROUP BY dst_port
ORDER BY avg_packet_size DESC;
GO


/***********************************************************************************************
    Q4: (Author: Classmate John LeSueur)
    Which protocol type (TCP or UDP) appears most often in the dataset?
***********************************************************************************************/

-- A4: Count packets by protocol type using the indicator columns.

SELECT 'TCP' AS protocol_type,
       COUNT(*) AS total_packets
FROM dbo.embedded_system_network_security_dataset
WHERE protocol_type_TCP = 1

UNION ALL

SELECT 'UDP' AS protocol_type,
       COUNT(*) AS total_packets
FROM dbo.embedded_system_network_security_dataset
WHERE protocol_type_UDP = 1
ORDER BY total_packets DESC;
GO

