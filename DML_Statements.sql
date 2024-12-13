INSERT INTO gw146864.Player (Email_address, Fname, Lname, Password)
VALUES ('john.doe@example.com', 'John', 'Doe', 'password123');

INSERT INTO gw146864.Member (Member_id, Email_address, Phone_number, Cart_barn_enqueue_date_time)
VALUES (1, 'john.doe@example.com', '123-456-7890', '2024-12-12 08:30:00');


INSERT INTO gw146864.Player VALUES ('graysont.waters@gmail.com', 'Grayson', 'Waters', 'Ketchup456');
INSERT INTO gw146864.Member VALUES(2, 'graysont.waters@gmail.com', '406-370-1234', '2024-12-12 03:45:00');

INSERT INTO gw146864.Player VALUES ('jason.bourne@yahoo.com', 'Jason', 'Bourne', 'Damon360');
INSERT INTO gw146864.Member VALUES (3, 'jason.bourne@yahoo.com', '406-555-8123', NULL);

INSERT INTO gw146864.Player VALUES ('lebronjames@aol.com', 'LeBron', 'James', 'King623');
INSERT INTO gw146864.Member VALUES (4, 'lebronjames@aol.com', '406-370-8354', NULL)

INSERT INTO gw146864.Player VALUES ('payton.manning@gmail.com', 'Payton', 'Manning', 'Broncos18');
INSERT INTO gw146864.Member VALUES ('5', 'payton.manning@gmail.com', '406-321-4567', '2024-10-09 10:15:00')

INSERT INTO gw146864.Player VALUES ('tim.allen@outlook.com', 'Tim', 'Allen', 'InfinityAndBeyond');

INSERT INTO gw146864.Player VALUES ('gordanramsey@cookin.com', 'Gordan', 'Ramsey', 'LetGordanCook');

-- Add Jason to Cart Barn queue
UPDATE gw146864.Member
SET Cart_barn_enqueue_date_time = '2024-03-25 18:45:00'
WHERE Member_id= 3;

UPDATE gw146864.Member
SET Cart_barn_enqueue_date_time = '2024-04-01 18:45:00'
WHERE Member_id= 4;

INSERT INTO gw146864.Player
VALUES ('graysont.waters@gmail.com', 'Grayson', 'Waters', '406-370-1234', 'password123', '2024-12-12 03:45:00');


SELECT * FROM Player; --displays all player info without member info
Select * FROM Member; --diplays member specific info

Select *  FROM Member m JOIN Player p ON m.Email_address = p.Email_address; --displays members with all info
Select *  FROM Member m JOIN Player p ON m.Email_address = p.Email_address ORDER BY Lname ASC; --sorted by last name

INSERT INTO gw146864.Pass VALUES (2, 'Golf', '12-12-2024 03:30:00', 0);
INSERT INTO gw146864.Pass VALUES (2, 'Cart', '12-12-2024 03:30:00', 0);
INSERT INTO gw146864.Pass VALUES (2, 'Range', '12-12-2024 03:30:00', 0);

INSERT INTO gw146864.Pass VALUES (4, 'Golf', '12-13-2024 03:30:00', 1);
INSERT INTO gw146864.PunchCard Values (4, 'Golf', 20);

INSERT INTO gw146864.Pass VALUES (4, 'Golf', '12-13-2024 03:30:00', 1);
INSERT INTO gw146864.PunchCard Values (4, 'Golf', 20);

SELECT * FROM gw146864.Pass WHERE Pass.Member_id = 2;  -- Find pass based member id
Select *  FROM Member m JOIN Pass p ON m.Member_id = p.Member_id;  --Shows member info with Passes

--Shows only members, punchcard and remaining punches
SELECT m.*, p.*, pc.Remaining_punches
FROM Member m
JOIN Pass p ON m.Member_id = p.Member_id
JOIN PunchCard pc ON p.Member_id = pc.Member_id
WHERE p.Is_punchcard = 1;


INSERT INTO gw146864.TeeTime VALUES ('2024-12-13 12:30:00', 'lebronjames@aol.com');
INSERT INTO gw146864.TeeTime VALUES ('2024-12-13 12:30:00', 'payton.manning@gmail.com');
INSERT INTO gw146864.TeeTime VALUES ('2024-12-13 13:30:00', 'jason.bourne@yahoo.com');
INSERT INTO gw146864.TeeTime VALUES ('2024-12-14 15:30:00', 'jason.bourne@yahoo.com');
INSERT INTO gw146864.TeeTime VALUES ('2024-12-14 16:30:00', 'payton.manning@gmail.com');


SELECT * FROM TeeTime; --See all TeeTimes
SELECT * FROM TeeTime t WHERE t.TeeDateTime='2024-12-13 12:30:00'; --See email of players playing at given time.

-- See TeeTimes on given day.
SELECT * 
FROM gw146864.TeeTime
WHERE CAST(TeeTime.TeeDateTIme AS DATE) = '2024-12-13';


INSERT INTO gw146864.CartBarnStall VALUES (1, 2);
INSERT INTO gw146864.CartBarnStall VALUES (2, NULL);
INSERT INTO gw146864.CartBarnStall VALUES (3, 4);
INSERT INTO gw146864.CartBarnStall VALUES (4, 1);
INSERT INTO gw146864.CartBarnStall VALUES (5, 5);
INSERT INTO gw146864.CartBarnStall VALUES (6, NULL);

SELECT * FROM gw146864.CartBarnStall; --Displays Stall number with corresponding Member_id


INSERT INTO gw146864.Coach VALUES ('956857845', 125.00, 'Brandon', 'Perna');
INSERT INTO gw146864.Coach VALUES ('945745912', 99.99, 'Phil', 'Mickelson');
INSERT INTO gw146864.Coach VALUES ('556789452', 275.00, 'John', 'McClain');
INSERT INTO gw146864.Coach VALUES ('459853424', 85, 'Al', 'Horford');
INSERT INTO gw146864.Coach VALUES ('984735446', 215, 'Ricky', 'Fowler')

SELECT * FROM gw146864.Coach;


INSERT INTO gw146864.Cart VALUES(1, 'Gas')
INSERT INTO gw146864.Cart VALUES(2, 'Gas')
INSERT INTO gw146864.Cart VALUES(3, 'Gas')
INSERT INTO gw146864.Cart VALUES(4, 'Electric')
INSERT INTO gw146864.Cart VALUES(5, 'Electric')
INSERT INTO gw146864.Cart VALUES(6, 'Electric')

SELECT * FROM gw146864.Cart;



INSERT INTO gw146864.Merchandise (Plu_code, Price, Cost, Brand, Units_purchased)
VALUES 
('1123', 12.99, 6.99, 'Titleist', 100),  -- Example Ball
('1444', 8.99, 4.99, 'Calaway', 100),
('1555', 11.99, 6.99, 'Bridge Stone', 100),
('2456', 75.00, 50.00, 'Nike', 2),    -- Example Shoe
('2457', 75.00, 50.00, 'Nike', 2),
('2777', 109.99, 95.99, 'Foot Joy', 2),
('2778', 109.99, 95.99, 'Foot Joy', 2),
('3786', 35.99, 25.00, 'Adidas', 4),   -- Example Clothing
('3787', 35.99, 25.00, 'Adidas', 4),  
('3788', 35.99, 25.00, 'Adidas', 4),  
('3245', 65.99, 50.99, 'Calaway', 4),    --
('4123', 129.99, 89.99, 'Titleist', 5), -- Example Club
('4124', 499.99, 319.99, 'Titleist', 5),
('4125', 249.99, 189.99, 'Calaway', 5);

INSERT INTO gw146864.Ball(Plu_code, Count, Skew)
VALUES
('1123', 3, 'Pro V1'),
('1444', 3, 'Supersoft'),
('1555', 3, 'Tour B RXS')

INSERT INTO gw146864.Shoe(Plu_code, Us_shoe_size)
VALUES
('2456', 9),
('2457', 10),
('2777', 9),
('2778', 10);

INSERT INTO gw146864.Clothing(Plu_code, Size, Color, Clothing_type)
VALUES
('3786', 'Small', 'Blue', 'Polo'),
('3787', 'Medium', 'Blue', 'Polo'),
('3788', 'Large', 'Blue', 'Polo'),
('3788', 'Medium', 'Gray', 'Pants');

INSERT INTO gw146864.Clubs(Plu_code, Hand, Number, Type, Series)
VALUES
('4123', 'Right', 3, 'Iron', 'T100'),
('4124', 'Right', NULL, 'Driver', 'GT2'),
('4125', 'Left', 3, 'Wood', 'AI Smooke');


Select* FROM Sale;

INSERT INTO GolfServices(Service_id, Service, Price) 
VALUES
(1, '9 Holes', 25),
(2, '18 Holes', 45),
(3, 'Small Range Bucket', 4),
(4, 'Large Range Bucket', 7),
(5, 'Cart for 9 Holes', 20),
(6, 'Cart for 18 Holes', 35)



INSERT INTO gw146864.Sale(Transaction_number, Sale_date_time)
VALUES
(1, '2024-08-15 13:30:00'),
(2, '2024-08-15 13:45:00'),
(3, '2024-08-15 17:22:00'),
(4, '2024-08-16 12:17:00'),
(5, '2024-08-17 9:51:00');

INSERT INTO gw146864.GolfPurchase (Service_id, Transaction_number, Quantity, Price_at_purchase)
SELECT Service_id, 1, 2, price  
FROM gw146864.GolfServices
WHERE Service_id = 2;

INSERT INTO gw146864.GolfPurchase (Service_id, Transaction_number, Quantity, Price_at_purchase)
SELECT Service_id, 1, 2, price  
FROM gw146864.GolfServices
WHERE Service_id = 6;


INSERT INTO CartRental VALUES (1,1)

INSERT INTO ItemPurchase (Plu_code, Transaction_number, Quantity, Price_at_purchase)
SELECT 1123, 1, 1, Price 
FROM gw146864.Merchandise
WHERE Plu_code =1123;

INSERT INTO CoachingSession (Coach_ssn, Transaction_number, Member_id, Session_date_time, Rate_at_purchase, [Hours])
SELECT '956857845', 1, 2, '2024-12-13 15:30:00', Rate, 2
FROM gw146864.Coach
WHERE Ssn = '956857845';



