using { managed } from '@sap/cds/common';


namespace sales;

entity SalesOrderHeaders: managed {
    key id: UUID;
        customer: association to Customers;
        totalAmount: Decimal(15,2);
        items: composition of many SalesOrderItems on items.header = $self;
}


entity SalesOrderItems {
    key id: UUID; 
        header: association to SalesOrderHeaders;
        product: association to Products;
        quantity: Integer;
        price: Decimal(15,2);
}


entity Customers {
    key id: UUID;
        firstName: String(20);
        lastName: String(100);
        email: String(255);
}


entity Products {
    key id: UUID;
        name: String(255);
        description: String(255);
        price: Decimal(15,2);
}