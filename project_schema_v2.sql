drop table options;
drop table brand;
drop table models;
drop table dealer;
drop table vehicle;
drop table includes;
drop table may_have;
drop table body_style;
drop table customer;
drop table sells;


create table options
      (option_id varchar(8),
      name varchar(50),
      description varchar(50),
      primary key (option_id));
      
insert into options values('001', 'color', 'red');
insert into options values('002', 'color', 'blue');
insert into options values('003', 'color', 'white');
insert into options values('004', 'color', 'black');
insert into options values('005', 'engine', 'standard');
insert into options values('006', 'engine', 'V6');
insert into options values('007', 'engine', 'V8');
insert into options values('008', 'transmission', 'automatic');
insert into options values('009', 'transmission', 'manual');

create table brand
      (brand_name varchar(25),
      brand_logo blob,
      primary key (brand_name));

insert into brand values('Buick', EMPTY_BLOB());
insert into brand values('Saturn', EMPTY_BLOB());
insert into brand values('Saab', EMPTY_BLOB());
insert into brand values('Cadillac', NULL);
insert into brand values('GMC', NULL);
insert into brand values('Hummer', NULL);



create table models
      (model_id varchar(8),
      brand_name varchar(25) NOT NULL,
      model_name varchar(25),
      primary key (model_id),
      foreign key (brand_name) references brand(brand_name) on delete set null);

insert into models values('001', 'Buick', 'LeSabre');
insert into models values('002', 'Buick', 'Enclave');
insert into models values('003', 'Buick', 'Encore');
insert into models values('004', 'Saturn', 'SL1');
insert into models values('005', 'Saturn', 'SL2');
insert into models values('006', 'Saab', '9-3');
insert into models values('007', 'Saab', '900');
insert into models values('008', 'Saab', '9-5');
insert into models values('009', 'Cadillac', 'CTS');
insert into models values('010', 'Cadillac', 'Escalade');
insert into models values('011', 'Cadillac', 'ATS');
insert into models values('012', 'GMC', 'Acadia');
insert into models values('013', 'GMC', 'Sierra');
insert into models values('014', 'GMC', 'Terrain');
insert into models values('015', 'Hummer', 'H2');
insert into models values('016', 'Hummer', 'H3');


create table dealer
      (dealer_id varchar(8),
      name varchar(50),
      addr_country varchar(3),
      addr_state varchar(2),
      addr_city varchar(25),
      addr_zip varchar(5),
      addr_street_name varchar(25),
      addr_street_number varchar(8),
      phone_area_code varchar(3),
      phone_number varchar(10),
      primary key (dealer_id));

insert into dealer values('001', 'Jeff Wyler', 'USA', 'OH', 'Cincinnati', '45207', 'Madison Rd.', '1635', '513', '555-5555');
insert into dealer values('002', 'Hinkles', 'USA', 'OH', 'Cincinnati', '45230', 'Beechmont Ave.', '6741', '513', '666-6666');
insert into dealer values('003', 'Alford Motors', 'USA', 'KY', 'Arlington Heights', '41630', 'Fake St.', '123', '513', '777-7777');


create table vehicle
      (vin varchar(17),
      model_id varchar(8),
      dealer_id varchar(8),
      prod_date date,
      engine varchar(10),
      transmission varchar(10),
      color varchar(15),
      tag_price real,
      manuf_sell_date date,
      primary key (vin),
      foreign key (model_id) references models(model_id),
      foreign key (dealer_id) references dealer(dealer_id));

insert into vehicle values('12345678901264539', '001', '002', TO_DATE('01/20/2018', 'MM/DD/YYYY'), 'V6', 'automatic', 'red', '20000', TO_DATE('01/01/2019', 'MM/DD/YYYY'));
insert into vehicle values('09876543214536759', '001', '002', TO_DATE('01/20/2018', 'MM/DD/YYYY'), 'V6', 'manual', 'black', '27000', TO_DATE('02/01/2019', 'MM/DD/YYYY'));
insert into vehicle values('36589752614898754', '003', '001', TO_DATE('03/01/2018', 'MM/DD/YYYY'), 'V8', 'automatic', 'red', '40000', TO_DATE('05/01/2019', 'MM/DD/YYYY'));
insert into vehicle values('23658965478541258', '008', '002', TO_DATE('09/15/2018', 'MM/DD/YYYY'), 'V6', 'manual', 'blue', '30000', TO_DATE('09/30/2019', 'MM/DD/YYYY'));
insert into vehicle values('58521420249635283', '004', '003', TO_DATE('09/15/2018', 'MM/DD/YYYY'), 'standard', 'automatic', 'black', '40000', TO_DATE('10/31/2019', 'MM/DD/YYYY'));
insert into vehicle values('23568696215486852', '007', '003', TO_DATE('09/15/2017', 'MM/DD/YYYY'), 'standard', 'manual', 'blue', '22200', TO_DATE('10/30/2017', 'MM/DD/YYYY'));
insert into vehicle values('36598647582125469', '010', '001', TO_DATE('01/01/2017', 'MM/DD/YYYY'), 'V6', 'automatic', 'white', '19000', TO_DATE('03/01/2017', 'MM/DD/YYYY'));
insert into vehicle values('86325612365478569', '014', '003', TO_DATE('09/01/2017', 'MM/DD/YYYY'), 'V8', 'manual', 'white', '43000', TO_DATE('12/01/2017', 'MM/DD/YYYY'));
insert into vehicle values('65867412025801461', '016', '001', TO_DATE('09/01/2018', 'MM/DD/YYYY'), 'standard', 'manual', 'blue', '19700', TO_DATE('12/01/2018', 'MM/DD/YYYY'));
insert into vehicle values('45210124536523982', '002', '002', TO_DATE('03/29/2018', 'MM/DD/YYYY'), 'V6', 'manual', 'black', '35700', TO_DATE('5/01/2018', 'MM/DD/YYYY'));
insert into vehicle values('36352781560250640', '013', '003', TO_DATE('03/29/2018', 'MM/DD/YYYY'), 'V6', 'automatic', 'white', '22350', TO_DATE('5/25/2018', 'MM/DD/YYYY'));
insert into vehicle values('41253036503680145', '007', '001', TO_DATE('07/25/2018', 'MM/DD/YYYY'), 'V8', 'automatic', 'red', '27350', TO_DATE('9/25/2018', 'MM/DD/YYYY'));


create table includes
      (option_id varchar(8),
      vin varchar(17),
      primary key (option_id, vin),
      foreign key (option_id) references options(option_id),
      foreign key (vin) references vehicle(vin));

insert into includes values('001', '12345678901264539');
insert into includes values('006', '12345678901264539');
insert into includes values('008', '12345678901264539');
insert into includes values('004', '09876543214536759');
insert into includes values('009', '09876543214536759');
insert into includes values('006', '09876543214536759');
insert into includes values('007', '36589752614898754');
insert into includes values('008', '36589752614898754');
insert into includes values('001', '36589752614898754');
insert into includes values('006', '23658965478541258');
insert into includes values('009', '23658965478541258');
insert into includes values('002', '23658965478541258');
insert into includes values('005', '58521420249635283');
insert into includes values('008', '58521420249635283');
insert into includes values('004', '58521420249635283');
insert into includes values('005', '23568696215486852');
insert into includes values('009', '23568696215486852');
insert into includes values('002', '23568696215486852');
insert into includes values('006', '36598647582125469');
insert into includes values('008', '36598647582125469');
insert into includes values('003', '36598647582125469');
insert into includes values('007', '86325612365478569');
insert into includes values('009', '86325612365478569');
insert into includes values('003', '86325612365478569');
insert into includes values('005', '65867412025801461');
insert into includes values('009', '65867412025801461');
insert into includes values('002', '65867412025801461');
insert into includes values('006', '45210124536523982');
insert into includes values('009', '45210124536523982');
insert into includes values('004', '45210124536523982');
insert into includes values('006', '36352781560250640');
insert into includes values('008', '36352781560250640');
insert into includes values('003', '36352781560250640');
insert into includes values('007', '41253036503680145');
insert into includes values('008', '41253036503680145');
insert into includes values('001', '41253036503680145');


create table may_have
      (model_id varchar(8),
      option_id varchar(8),
      primary key (model_id, option_id),
      foreign key (model_id) references models(model_id),
      foreign key (option_id) references options(option_id));
      
insert into may_have values('001', '001');
insert into may_have values('001', '002');
insert into may_have values('001', '004');
insert into may_have values('001', '005');
insert into may_have values('001', '008');
insert into may_have values('001', '009');
insert into may_have values('003', '001');
insert into may_have values('003', '007');
insert into may_have values('003', '008');
insert into may_have values('003', '009');
insert into may_have values('008', '002');
insert into may_have values('008', '006');
insert into may_have values('008', '009');
insert into may_have values('004', '005');
insert into may_have values('004', '008');
insert into may_have values('004', '004');
insert into may_have values('007', '005');
insert into may_have values('007', '009');
insert into may_have values('007', '002');
insert into may_have values('007', '007');
insert into may_have values('007', '008');
insert into may_have values('007', '001');
insert into may_have values('010', '006');
insert into may_have values('010', '008');
insert into may_have values('010', '003');
insert into may_have values('014', '007');
insert into may_have values('014', '009');
insert into may_have values('014', '003');
insert into may_have values('016', '005');
insert into may_have values('016', '009');
insert into may_have values('016', '002');
insert into may_have values('002', '006');
insert into may_have values('002', '009');
insert into may_have values('002', '004');
insert into may_have values('013', '006');
insert into may_have values('013', '008');
insert into may_have values('013', '003');


create table body_style
      (body_style varchar(25),
      model_id varchar(8),
      description varchar(50),
      foreign key (model_id) references models(model_id));
      
insert into body_style values('sedan', '001', '4 Door Sedan');
insert into body_style values('wagon', '001', 'Station Wagon');
insert into body_style values('coupe', '001', '2 Door Coupe');
insert into body_style values('wagon', '002', 'Station Wagon');
insert into body_style values('sedan', '002', '4 Door Sedan');
insert into body_style values('sedan', '003', '4 Door Sedan');
insert into body_style values('coupe', '004', '2 Door Coupe');
insert into body_style values('sedan', '004', '4 Door Sedan');
insert into body_style values('coupe', '005', '2 Door Coupe');
insert into body_style values('sedan', '006', '4 Door Sedan');
insert into body_style values('coupe', '007', '2 Door Coupe');
insert into body_style values('coupe', '008', '2 Door Coupe');
insert into body_style values('sedan', '009', '4 Door Sedan');
insert into body_style values('sedan', '010', '4 Door Sedan');
insert into body_style values('sedan', '011', '4 Door Sedan');
insert into body_style values('sedan', '012', '4 Door Sedan');
insert into body_style values('sedan', '013', '4 Door Sedan');
insert into body_style values('sedan', '014', '4 Door Sedan');
insert into body_style values('sedan', '015', '4 Door Sedan');
insert into body_style values('sedan', '016', '4 Door Sedan');


create table customer
      (customer_id varchar(8),
      first_name varchar(25),
      middle_initial varchar(1),
      last_name varchar(25),
      addr_country varchar(3),
      addr_state varchar(2),
      addr_city varchar(25),
      addr_zip varchar(5),
      addr_street_name varchar(25),
      addr_street_number varchar(8),
      gender varchar(1),
      phone_area_code varchar(3),
      phone_number varchar(8),
      primary key (customer_id));

insert into customer values('001', 'Alex', 'K', 'Chrystal', 'USA', 'OH', 'Cincinnati', '45207', 'Sunset Blvd', '123', 'M', '513', '555-5551');
insert into customer values('002', 'John', 'A', 'Everyguy', 'USA', 'OH', 'Cincinnati', '45230', 'Mulholland Dr', '321', 'M', '513', '333-3333');
insert into customer values('003', 'Frank', 'V', 'Zappa', 'USA', 'KY', 'Arlington Heights', '12345', 'Chunga Ave', '4444', 'M', '859', '786-9987');
insert into customer values('004', 'Grace', 'C', 'Slick', 'USA', 'CA', 'Los Angeles', '54321', 'Rabbit Ln', '7865', 'F', '674', '453-9087');
insert into customer values('005', 'Sarah', 'M', 'Robb', 'USA', 'WI', 'Green Bay', '34876', 'Another Fake St', '6757', 'F', '765', '421-9322');


create table sells
      (vin varchar(17),
      dealer_id varchar(8),
      customer_id varchar(8),
      sale_price real,
      sale_date date,
      primary key (vin, dealer_id, customer_id),
      foreign key (vin) references vehicle(vin),
      foreign key (dealer_id) references dealer(dealer_id),
      foreign key (customer_id) references customer(customer_id));

insert into sells values('12345678901264539', '002', '001', '19000', TO_DATE('03/03/2019', 'MM/DD/YYYY'));
insert into sells values('09876543214536759', '002', '002', '26500', TO_DATE('04/01/2019', 'MM/DD/YYYY'));
insert into sells values('36589752614898754', '001', '004', '41170', TO_DATE('06/01/2019', 'MM/DD/YYYY'));
insert into sells values('23658965478541258', '002', '005', '29000', TO_DATE('10/30/2019', 'MM/DD/YYYY'));
insert into sells values('58521420249635283', '003', '004', '42000', TO_DATE('11/30/2017', 'MM/DD/YYYY'));
insert into sells values('23568696215486852', '003', '001', '20200.99', TO_DATE('04/01/2017', 'MM/DD/YYYY'));
insert into sells values('36598647582125469', '001', '002', '18000', TO_DATE('12/25/2017', 'MM/DD/YYYY'));
insert into sells values('86325612365478569', '003', '001', '40000', TO_DATE('12/30/2017', 'MM/DD/YYYY'));
insert into sells values('65867412025801461', '001', '005', '19000', TO_DATE('12/30/2018', 'MM/DD/YYYY'));
insert into sells values('45210124536523982', '002', '005', '35000.50', TO_DATE('05/25/2018', 'MM/DD/YYYY'));
insert into sells values('36352781560250640', '003', '003', '22350', TO_DATE('06/25/2018', 'MM/DD/YYYY'));
insert into sells values('41253036503680145', '001', '005', '26350', TO_DATE('09/30/2018', 'MM/DD/YYYY'));


commit;