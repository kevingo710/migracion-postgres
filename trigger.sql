--1
--CODIGO FUNCTION
CREATE OR REPLACE FUNCTION CustomersRecoveryINSERT()
  RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO CustomersRecovery
    (
    customerNumber,
    customerName,
    contactLastName,
    contactFirstName,
    phone,
    addressLine1,
    addressLine2,
    city,
    postalCode,
    country,
    salesRepEmployeeNumber,
    creditLimit
    )

    VALUES (OLD.customerNumber, OLD.customerName, OLD.contactLastName, OLD.contactFirstName, OLD.phone, OLD.addressLine1,
            OLD.addressLine2, OLD.city, OLD.postalCode, OLD.country, OLD.salesRepEmployeeNumber, OLD.creditLimit);
END;
$BODY$
language plpgsql;

--CODIGO DE TRIGGER
CREATE TRIGGER before_customers_delete
  BEFORE UPDATE
  ON employees
  FOR EACH ROW
  EXECUTE PROCEDURE CustomersRecoveryINSERT();
EJEMPLO 2





--2 PASADO A POSTGRES EMPLOYE TRIGGER
CREATE OR REPLACE FUNCTION before_employee_delete_INSERT()
  RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO exEmployees(employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle)
    VALUES (OLD.employeeNumber, OLD.lastName, OLD.firstName, OLD.extension, OLD.email, OLD.officeCode, OLD.reportsTo, OLD.jobTitle);
END;
$BODY$
language plpgsql;


CREATE TRIGGER before_employee_delete
    BEFORE DELETE
    ON employees
    FOR EACH ROW
	EXECUTE PROCEDURE before_employee_delete_INSERT();

