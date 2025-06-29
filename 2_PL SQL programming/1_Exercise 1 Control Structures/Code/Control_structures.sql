CREATE TABLE Clients (
    ClientID NUMBER PRIMARY KEY,
    FullName VARCHAR2(100),
    BirthDate DATE,
    CurrentBalance NUMBER
);

CREATE TABLE Mortgages (
    MortgageID NUMBER PRIMARY KEY,
    ClientID NUMBER,
    PrincipalAmount NUMBER,
    RateOfInterest NUMBER,
    IssueDate DATE,
    MaturityDate DATE,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);

ALTER TABLE Clients ADD VIPStatus CHAR(1);

-- SAMPLE DATA - Clients
INSERT INTO Clients (ClientID, FullName, BirthDate, CurrentBalance)
VALUES (1, 'Robert Green', TO_DATE('1980-04-10', 'YYYY-MM-DD'), 2000);

INSERT INTO Clients (ClientID, FullName, BirthDate, CurrentBalance)
VALUES (2, 'Emily White', TO_DATE('1992-11-25', 'YYYY-MM-DD'), 12000);

-- SAMPLE DATA - Mortgages
INSERT INTO Mortgages (MortgageID, ClientID, PrincipalAmount, RateOfInterest, IssueDate, MaturityDate)
VALUES (1, 1, 15000, 4.5, SYSDATE, ADD_MONTHS(SYSDATE, 48));

INSERT INTO Mortgages (MortgageID, ClientID, PrincipalAmount, RateOfInterest, IssueDate, MaturityDate)
VALUES (2, 2, 3000, 6, SYSDATE, SYSDATE + 15);


-- SCENARIO 1:
SET SERVEROUTPUT ON;
BEGIN
  FOR cl IN (SELECT ClientID, BirthDate FROM Clients) 
  LOOP
    IF MONTHS_BETWEEN(SYSDATE, cl.BirthDate) / 12 > 60 THEN
      UPDATE Mortgages
      SET RateOfInterest = RateOfInterest - 1
      WHERE ClientID = cl.ClientID;
    END IF;
  END LOOP;
END;
/

-- SCENARIO 2:
BEGIN
  FOR cl IN (SELECT ClientID, CurrentBalance FROM Clients)
  LOOP
    IF cl.CurrentBalance > 10000 THEN
      UPDATE Clients
      SET VIPStatus = 'Y'
      WHERE ClientID = cl.ClientID;
    END IF;
  END LOOP;
END;
/

-- SCENARIO 3:
BEGIN
  FOR mort IN (
    SELECT m.MortgageID, m.ClientID, c.FullName, m.MaturityDate
    FROM Mortgages m
    JOIN Clients c ON m.ClientID = c.ClientID
    WHERE m.MaturityDate BETWEEN SYSDATE AND SYSDATE + 30
  ) LOOP
    DBMS_OUTPUT.PUT_LINE('Reminder: Mortgage ' || mort.MortgageID || 
                         ' for client ' || mort.FullName ||
                         ' is due on ' || TO_CHAR(mort.MaturityDate, 'DD-MON-YYYY'));
  END LOOP;
END;
/
