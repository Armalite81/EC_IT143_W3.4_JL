/* Step 2: Begin creating an answer */
-- Where I am:
-- I know which destination ports appear most often.

-- Next step:
-- Compare normal vs suspicious traffic counts by port.

SELECT
    dst_port,
    label,
    COUNT(*) AS traffic_count
FROM embedded_system_network_security_dataset
GROUP BY dst_port, label
ORDER BY dst_port, label;
