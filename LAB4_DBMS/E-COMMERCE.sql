CREATE TABLE category (
  cat_id int(5) NOT NULL AUTO_INCREMENT,
  cat_name varchar(15) NOT NULL,
  PRIMARY KEY (cat_id));

INSERT INTO category (cat_id, cat_name) VALUES
(1, 'BOOKS'),
(2, 'GAMES'),
(3, 'GROCERIES'),
(4, 'ELECTRONICS'),
(5, 'CLOTHES');

CREATE TABLE product (
  pro_id int(5) NOT NULL AUTO_INCREMENT,
  pro_name varchar(15) NOT NULL,
  pro_desc varchar(50) DEFAULT NULL,
  cat_id int(5) DEFAULT NULL,
  PRIMARY KEY (pro_id),
  KEY cat_id (cat_id));

INSERT INTO product (pro_id, pro_name, pro_desc, cat_id) VALUES
(1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
(2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5),
(3, 'ROG LAPTOP', 'Windows 10 with 15inch screen i7 processor 1TB S', 4),
(4, 'OATS', 'Highly Nutritious from Nestle', 3),
(5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
(6, 'MILK', '1L Toned MIlk', 3),
(7, 'Boat EarPhones', '1.5Meter long Dolby Atmos', 4),
(8, 'Jeans', 'Stretchable Denim Jeans with various sizes and col', 5),
(9, 'Project IGI', 'compatible with windows 7 and above', 2),
(10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5),
(11, 'Rich Dad Poor D', 'Written by RObert Kiyosaki', 1),
(12, 'Train Your Brai', 'By Shireen Stephen', 1);

CREATE TABLE supplier (
  supp_id int(5) NOT NULL,
  supp_name varchar(15) NOT NULL,
  supp_city varchar(15) NOT NULL,
  supp_phone varchar(10) NOT NULL,
  PRIMARY KEY (supp_id));

INSERT INTO supplier (supp_id, supp_name, supp_city, supp_phone) VALUES
(1, 'Rajesh Retails', 'Delhi', 1234567890),
(2, 'Appario Ltd.', 'Mumbai', 2589631470),
(3, 'Knome products', 'Banglore', 9785462315),
(4, 'Bansal Retails', 'Kochi', 8975463285),
(5,' Mittal Ltd.', 'Lucknow', 7898456532);

CREATE TABLE supplier_pricing (
  pricing_id int(5) NOT NULL AUTO_INCREMENT,
  pro_id int(5) NOT NULL,
  supp_id int(5) NOT NULL,
  supp_price int(5) DEFAULT 0,
  PRIMARY KEY (pricing_id),
  KEY pro_id (pro_id),
  KEY supp_id (supp_id));
  
  INSERT INTO supplier_pricing (pricing_id, pro_id, supp_id, supp_price) VALUES
(1, 1, 2, 1500),
(2, 3, 5, 30000),
(3, 5, 1, 3000),
(4, 2, 3, 2500),
(5, 4, 1, 1000),
(6, 12, 2, 780),
(7, 12, 4, 789),
(8, 3, 1, 31000),
(9, 1, 5, 1450),
(10, 4, 2, 999),
(11, 7, 3, 549),
(12, 7, 4, 529),
(13, 6, 2, 105),
(14, 6, 1, 99),
(15, 2, 5, 2999),
(16, 5, 2, 2999);

CREATE TABLE customer (
  cus_id int(5) NOT NULL AUTO_INCREMENT,
  cus_name varchar(15) NOT NULL,
  cus_phone varchar(10) NOT NULL,
  cus_city varchar(10) NOT NULL,
  cus_gender char(1) NOT NULL,
  PRIMARY KEY (cus_id));

INSERT INTO customer (cus_id, cus_name, cus_phone,cus_city, cus_gender) VALUES
(1, 'AAKASH', 9999999999, 'DELHI', 'M'),
(2, 'AMAN', 9785463215, 'NOIDA', 'M'),
(3, 'NEHA', 9999999999, 'MUMBAI', 'F'),
(4, 'MEGHA', 9994562399, 'KOLKATA', 'F'),
(5, 'PULKIT', 7895999999, 'LUCKNOW', 'M');

CREATE TABLE orders (
  ord_id int(5) NOT NULL AUTO_INCREMENT,
  ord_amount int(10) NOT NULL,
  ord_date date DEFAULT NULL,
  cus_id int(5) DEFAULT NULL,
  pricing_id int(5) DEFAULT NULL,
  PRIMARY KEY (ord_id),
  KEY cus_id (cus_id),
  KEY pricing_id (pricing_id));

INSERT INTO orders (ord_id, ord_amount, ord_date, cus_id, pricing_id) VALUES
(101, 1500, '2021-10-06' , 2, 1),
(102, 1000, '2021-10-12' , 3, 5),
(103, 30000, '2021-09-16' , 5, 2),
(104, 1500, '2021-10-05' , 1, 1),
(105, 3000, '2021-08-16' , 4, 3),
(106, 1450, '2021-08-18' , 1, 9),
(107, 789, '2021-09-01' , 3, 7),
(108, 780, '2021-09-07' , 5, 6),
(109, 3000, '2021-09-10' , 5, 3),
(110, 2500, '2021-09-10' , 2, 4),
(111, 1000, '2021-09-15' , 4, 5),
(112, 789, '2021-09-16' , 4, 7),
(113, 31000, '2021-09-16' , 1, 8),
(114, 1000, '2021-09-16' , 3, 5),
(115, 3000, '2021-09-16' , 5, 3),
(116, 99, '2021-09-17' , 2, 14);

CREATE TABLE rating (
  rat_id int(5) NOT NULL AUTO_INCREMENT,
  ord_id int(5) DEFAULT NULL,
  rat_ratstars int(1) NOT NULL ,
  PRIMARY KEY (rat_id),
  KEY ord_id (ord_id));

INSERT INTO rating (rat_id, ord_id, rat_ratstars) VALUES
(1, 101, 4),
(2, 102, 3),
(3, 103, 1),
(4, 104, 2),
(5, 105, 4),
(6, 106, 3),
(7, 107, 4),
(8, 108, 4),
(9, 109, 3),
(10, 110, 5),
(11, 111, 3),
(12, 112, 4),
(13, 113, 2),
(14, 114, 1),
(15, 115, 1),
(16, 116, 0);


/*Display the total number of customers based on gender who have placed individual orders of worth at least Rs.3000.

SELECT p.cus_gender AS Gender, COUNT(cus_gender) AS NoOfCustomers
FROM (SELECT c.cus_id, cus_gender
FROM customer c
JOIN `orders` o ON c.cus_id = o.cus_id
WHERE ord_amount >= 3000
GROUP BY c.cus_id) p
GROUP BY p.cus_gender;     */

/*Display all the orders along with product name ordered by a customer having Customer_Id=2

SELECT o.ord_id, o.ord_amount, o.ord_date, p.pro_name
FROM `orders` AS o
JOIN supplier_pricing AS s ON o.pricing_id = s.pricing_id
JOIN product p ON s.pro_id = p.pro_id
WHERE cus_id = 2;   */
  
/*Display the Supplier details who can supply more than one product.
  
SELECT * FROM supplier
WHERE supp_id IN (SELECT supp_id 
FROM (SELECT supp_id, pro_count
FROM (SELECT COUNT(pro_id) AS pro_count, supp_id
FROM supplier_pricing
GROUP BY supp_id) AS merge_table
WHERE pro_count > 1) AS final_table);    */

/*Find the least expensive product from each category and print the table with category id, name, product name and price of the product

select category.cat_id, category.cat_name,min(t3.min_price)
as min_price from category
inner join (select product.cat_id,product.PRO_NAME,t2.* from product
inner join (select PRO_ID,min(SUPP_PRICE) as min_price from supplier_pricing group by PRO_ID)
as t2 where t2.PRO_ID=product.PRO_ID)
as t3 where t3.cat_id=category.cat_id group by t3.cat_id;    */

/*Display the Id and Name of the Product ordered after “2021-10-05”.

select product.PRO_ID, product.PRO_NAME from `orders`
join supplier_pricing
on supplier_pricing.PRICING_ID=`orders`.pricing_id
join product
on product.pro_id=supplier_pricing.pro_id
where `orders`.ord_date>"2021-10-05";    */

/*Display customer name and gender whose names start or end with character 'A'.

select customer.CUS_NAME,customer.CUS_GENDER
from customer where customer.CUS_NAME
like'A%' or customer.CUS_NAME like'%A';   */

/*Create a stored procedure to display supplier id, name, Rating(Average rating of all the products sold by every customer) and
Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average
Service” else print “Poor Service”. Note that there should be one rating per supplier.

select report.supp_id, report.supp_name, report.average,
case 
when average = 5 then 'Excellent Service'
when average > 4 then 'Good Service'
when average > 2 then 'Average Service'
else 'poor service'
end as type_of_service
from (select final.supp_id, supplier.supp_name, final.average
from (select test2.supp_id, sum(test2.RAT_RATSTARS)/count(test2.RAT_RATSTARS) as average
from (select supplier_pricing.supp_id, test.ord_id, test.RAT_RATSTARS from supplier_pricing
inner join (select `orders`.pricing_id, rating.ord_id, rating.RAT_RATSTARS
from `orders` inner join rating on rating. `ord_id` = `orders`.ord_id) as test
on test.pricing_id = supplier_pricing.pricing_id) as test2
group by supplier_pricing.supp_id) as final
inner join supplier
where final.supp_id = supplier.supp_id) as report;  */
