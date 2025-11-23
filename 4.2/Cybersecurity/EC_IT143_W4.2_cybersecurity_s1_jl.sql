/* Step 1: Start with a simple question */
-- Question:
-- What are the most common destination ports in the network security dataset?

SELECT TOP (10)
    dst_port,
    COUNT(*) AS port_count
FROM embedded_system_network_security_dataset
GROUP BY dst_port
ORDER BY port_count DESC;
