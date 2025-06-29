CREATE TABLE Accounts (
    AccountID NUMBER PRIMARY KEY,
    ClientID NUMBER,
    AccountType VARCHAR2(20),
    Balance NUMBER,
    LastModified DATE,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);

CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,
    EmpName VARCHAR2(100),
    Position VARCHAR2(50),
    Salary NUMBER,
    Department VARCHAR2(50),
    HireDate DATE
);

INSERT INTO Accounts (AccountID, ClientID, AccountType, Balance, LastModified)
VALUES (1, 1, 'Savings', 5000, SYSDATE);

INSERT INTO Accounts (AccountID, ClientID, AccountType, Balance, LastModified)
VALUES (2, 1, 'Checking', 2000, SYSDATE);

INSERT INTO Accounts (AccountID, ClientID, AccountType, Balance, LastModified)
VALUES (3, 2, 'Savings', 8000, SYSDATE);

INSERT INTO Employees (EmployeeID, EmpName, Position, Salary, Department, HireDate)
VALUES (1, 'Alice Johnson', 'Manager', 70000, 'HR', TO_DATE('2015-06-15', 'YYYY-MM-DD'));

INSERT INTO Employees (EmployeeID, EmpName, Position, Salary, Department, HireDate)
VALUES (2, 'Bob Brown', 'Developer', 60000, 'IT', TO_DATE('2017-03-20', 'YYYY-MM-DD'));

INSERT INTO Employees (EmployeeID, EmpName, Position, Salary, Department, HireDate)
VALUES (3, 'Charlie Lee', 'Analyst', 50000, 'Finance', TO_DATE('2018-09-12', 'YYYY-MM-DD'));

-- SCENARIO 1:
CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest AS
BEGIN
  FOR acc IN (
    SELECT AccountID, Balance
    FROM Accounts
    WHERE AccountType = 'Savings'
  ) LOOP
    UPDATE Accounts
    SET Balance = Balance + (Balance * 0.01),
        LastModified = SYSDATE
    WHERE AccountID = acc.AccountID;
  END LOOP;
END;
/

-- SCENARIO 2:
CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
  dept_name IN VARCHAR2,
  bonus_percent IN NUMBER
) AS
BEGIN
  UPDATE Employees
  SET Salary = Salary + (Salary * bonus_percent / 100),
      HireDate = HireDate
  WHERE Department = dept_name;
END;
/

-- SCENARIO 3:
CREATE OR REPLACE PROCEDURE TransferFunds (
  from_acc_id IN NUMBER,
  to_acc_id IN NUMBER,
  amount IN NUMBER
) AS
  from_balance NUMBER;
BEGIN
  SELECT Balance INTO from_balance
  FROM Accounts
  WHERE AccountID = from_acc_id
  FOR UPDATE;

  IF from_balance < amount THEN
    RAISE_APPLICATION_ERROR(-20001, 'Insufficient balance for transfer.');
  END IF;

  UPDATE Accounts
  SET Balance = Balance - amount,
      LastModified = SYSDATE
  WHERE AccountID = from_acc_id;

  UPDATE Accounts
  SET Balance = Balance + amount,
      LastModified = SYSDATE
  WHERE AccountID = to_acc_id;
END;
/

BEGIN
  ProcessMonthlyInterest;
  UpdateEmployeeBonus('IT', 10);
  TransferFunds(1, 2, 500);
END;
/