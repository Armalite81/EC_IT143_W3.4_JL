-- Q2 (Business User - Marginal)
-- Question:
--   Which employees are listed as managers using the
--   dbo.uspGetEmployeeManagers stored procedure?
--   (Example run for one employee.)
-- Sara Elizabeth McCoy


DECLARE @BusinessEntityID INT = 251;   -- example employee

EXEC dbo.uspGetEmployeeManagers @BusinessEntityID = @BusinessEntityID;
