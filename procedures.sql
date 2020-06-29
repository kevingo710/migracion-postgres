--ver mejor cliente

create or replace function sp_verMejorCliente(IN fechaInicio date, IN fechaFin date) returns void
AS $$
BEGIN
    START TRANSACTION;
            SELECT * FROM BESTCLIENT
            WHERE fechaInicio = BESTCLIENT.fechaInicio AND fechaFin = BESTCLIENT.fechaFin;

END;
 $$ language plpgsql;

--ordenar producto

create or replace function sp_orderProduct(IN orderNumberP int, IN orderDateP date, IN requiredDateP date,
                                                 IN shippedDateP date, IN statusP varchar(15), IN commentsP text,
                                                 IN customerNumberP int, IN productCodeP varchar(15),
                                                 IN quantityOrderedP int, IN priceEachP decimal(10, 2),
                                                 IN orderLineNumberP smallint) returns void
AS $$
BEGIN
    START TRANSACTION;
            insert  into orders(orderNumber,orderDate,requiredDate,shippedDate,status,comments,customerNumber)
            values (orderNumberP,orderDateP,requiredDateP,shippedDateP,statusP,commentsP,customerNumberP);

            insert  into orderdetails(orderNumber,productCode,quantityOrdered,priceEach,orderLineNumber)
            values  (orderNumberP,productCodeP,quantityOrderedP,priceEachP,orderLineNumberP);
END;
 $$ language plpgsql;
