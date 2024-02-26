create table customer(
username varchar(50) primary key,
email varchar(50), 
[password] varchar(50),
[address] varchar(255),
phoneNumber varchar(12)
)


create table staff(
username varchar(50) primary key,
email varchar(50), 
[password] varchar(50),
[address] varchar(255),
phoneNumber varchar(12)
)


create table category(
category_id int IDENTITY(1,1) primary key,
[type] varchar(50),
gender varchar(20),
)

create table promo 
(
promo_id int IDENTITY(1,1) primary key,
[promo_percent] int, 
[start_date] date,
end_date date,
)

create table product(
product_id int IDENTITY(1,1) primary key,
[name] varchar(255),
quantity int, 
[description] varchar(255),
pic_url varchar(255),
price int,
category_id int foreign key references category,
promo_id int foreign key references promo
)



create table cart(
cart_id int IDENTITY(1,1) primary key,
quantity int, 
price int,
username varchar(50) foreign key references customer,
product_id int foreign key references product
)


create table orders(
order_id int IDENTITY(1,1) primary key,
[address] varchar(255),
[date] date,
[status] varchar(10),
phone_number varchar(12),
usernameCustomer varchar(50) foreign key references customer,
usernameStaff varchar(50) foreign key references staff,
)

create table feedback(
feedback_id int IDENTITY(1,1) primary key,
content varchar(255),
rate_point int,
username varchar(50) foreign key references customer,
product_id int foreign key references product
)

create table order_detail(
quantity int,
product_id int foreign key references product,
order_id int foreign key references orders,
primary key(order_id, product_id)
)


create table size(
size_name varchar(50) primary key,
[description] varchar(255)
)


create table size_detail
(
size_detail_id int primary key,
quantity int, 
product_id int foreign key references product,
size_name varchar(50) foreign key references size
)

create table import
(
import_id int IDENTITY(1,1) primary key,
importDate date,
username varchar(50) foreign key references staff
)

create table importDetails
(
import_detail_id int IDENTITY(1,1) primary key,
import_id int foreign key references import,
product_id int foreign key references product,
quantity int
)





