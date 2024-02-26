insert into customer(username, password, email, address, phoneNumber)
values
('khanh', CONVERT(varchar(32), HASHBYTES('MD5','123456'),2), 'khanh@gmail.com', 'Soc Trang', '0123456789'),
('son', CONVERT(varchar(32), HASHBYTES('MD5','123456'),2), 'son@fpt.edu.vn', 'Can Tho', '0123456789'),
('thinh', CONVERT(varchar(32), HASHBYTES('MD5','123456'),2), 'thinhldce171774@fpt.edu.vn', 'Tra Vinh', '0123456789')


insert into staff(username, password, email, address, phoneNumber)
values
('nhanvien1', CONVERT(varchar(32), HASHBYTES('MD5','123456'),2), 'nhanvien1@gmail.com', 'Soc Trang', '0123456789'),
('nhanvien2', CONVERT(varchar(32), HASHBYTES('MD5','123456'),2), 'nhanvien2@gmail.com', 'Can Tho', '0123456789')

insert into promo(promo_percent, [start_date], end_date)
values 
(50, '2024-02-26','2024-04-01'),
(20, '2024-02-26','2024-04-01')

insert category([type],gender)
values
('ao', 'nam'),
('quan', 'nam'),
('ao', 'nu'),
('quan', 'nu')

insert into product([name], quantity, [description], pic_url, price, category_id, promo_id)
values
('ao test',10,'day la cai ao', 'https://order.tokago.vn/uploads/2020/3/12/11//534d96efe0ad13793eefb6fd1033d43c.png',100000,1,1),
('quan test',10,'day la cai quan', 'https://order.tokago.vn/uploads/2020/3/12/12//af83a502fdf71775a3a2d873901769e7.png',150000,2,2)



