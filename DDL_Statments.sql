CREATE TABLE gw146864.Player(
    Email_address VARCHAR(255) CONSTRAINT PK_PLAYER PRIMARY KEY,
    Fname VARCHAR(25) NOT NULL,
    Lname VARCHAR(25) NOT NULL,
    [Password] Varchar(30) NOT NULL,
);

CREATE TABLE gw146864.Member(
    Member_id INT CONSTRAINT PK_MEMBER PRIMARY KEY,                          -- Primary key column for Member_id
    Email_address VARCHAR(255) CONSTRAINT FK_MEMBER_EMAIL REFERENCES Player(Email_address),   -- Column for email address, references Player
    Phone_number VARCHAR(20) NOT NULL,                           -- Column for phone number
    Cart_barn_enqueue_date_time DATETIME                       -- Column for cart barn enqueue date 
);
ALTER TABLE gw146864.Member
DROP FK_MEMBER_EMAIL;

ALTER TABLE gw146864.Member
ADD CONSTRAINT FK_MEMBER_EMAIL
FOREIGN KEY (Email_address) REFERENCES gw146864.Player(Email_address)
ON DELETE CASCADE;


CREATE TABLE gw146864.Pass (
    Member_id INT,
    Type VARCHAR(6) CONSTRAINT CK_PASS_VALID_TYPE CHECK(Type IN ('Golf', 'Range', 'Cart')),
    Date_initialized DATETIME NOT NULL,
    CONSTRAINT PK_PASS PRIMARY KEY (Member_id, Type),
    CONSTRAINT FK_PASS_MEMBER_ID FOREIGN KEY (Member_id) REFERENCES Member(Member_id)
);
ALTER TABLE gw146864.Pass
ADD Is_punchcard BIT DEFAULT 0;


CREATE TABLE gw146864.PunchCard (
    Member_id INT,
    Type VARCHAR(6) CONSTRAINT CK_PUNCHCARD_VALID_TYPE CHECK(Type IN ('Golf', 'Range', 'Cart')),
    Remaining_punches INT,
    CONSTRAINT PK_PUNCHCARD PRIMARY KEY (Member_id, Type),
    CONSTRAINT FK_PUNCHCARD_PASS FOREIGN KEY (Member_id, Type) REFERENCES Pass(Member_id, Type)
);
ALTER TABLE gw146864.PunchCard
ALTER COLUMN Remaining_punches INT NOT NULL;

CREATE TABLE gw146864.TeeTime(
    TeeDateTime DATETIME,
    Email_address VARCHAR(255),
    CONSTRAINT PK_TEETIME PRIMARY KEY(TeeDateTime, Email_address)
)
ALTER TABLE gw146864.TeeTime
ADD CONSTRAINT FK_TEETIME_PLAYER
FOREIGN KEY (Email_address) REFERENCES gw146864.Player(Email_address)
ON DELETE CASCADE;

CREATE TABLE gw146864.CartBarnStall(
    Stall_number INT CONSTRAINT PK_CARTBARNSTALL PRIMARY KEY,
    Member_id INT,
)

CREATE TABLE gw146864.Coach(
    Ssn VARCHAR(9) CONSTRAINT PK_COACH PRIMARY KEY,
    Rate DECIMAL(5,2) NOT NULL,
    Fname VARCHAR(30) NOT NULL,
    Lname VARCHAR(30) NOT NULL,
)

CREATE TABLE gw146864.Sale(
    Transaction_number INT CONSTRAINT PK_SALE PRIMARY KEY,
    Sale_date_time DATETIME,
)


CREATE TABLE gw146864.CoachingSession(
    Coach_ssn VARCHAR(9),
    Transaction_number INT,
    Member_id INT,
    Session_date_time DATETIME,
    Rate_at_purchase DECIMAL(5,2) NOT NULL,
    Hours DECIMAL(3,2) NOT NULL,
    CONSTRAINT PK_COACHINGSESSION PRIMARY KEY(Coach_ssn, Transaction_number, Member_id, Session_date_time),
    CONSTRAINT FK_COACHINGSESSION_COACH_SSN FOREIGN KEY(Coach_ssn) REFERENCES Coach(Ssn),
    CONSTRAINT FK_COACHINGSESSION_TRANSACTION_NUMBER FOREIGN KEY (Transaction_number) REFERENCES Sale(Transaction_number),
    CONSTRAINT FK_COACHINGSESSION_MEMBER_ID FOREIGN KEY(Member_id) REFERENCES Member(Member_id)
)


CREATE TABLE gw146864.Cart(
    Cart_number INT CONSTRAINT PK_CART PRIMARY KEY,
    Gas_or_electric VARCHAR(8) CONSTRAINT CK_GAS_OR_ELECTRIC CHECK(Gas_or_electric in ('Gas', 'Electric')) 
)

CREATE TABLE gw146864.CartRental(
    Transaction_number INT,
    Cart_number INT,
    CONSTRAINT PK_CARTRENTAL PRIMARY KEY(Transaction_number, Cart_number),
    CONSTRAINT FK_CARTRENTAL_TRANSACTION_NUMBER FOREIGN KEY(Transaction_number) REFERENCES Sale(Transaction_number),
    CONSTRAINT FK_CARTRENTAL_CART_NUMBER FOREIGN KEY(Cart_number) REFERENCES Cart(Cart_number)
)


CREATE TABLE gw146864.GolfServices (
    Service_id INT CONSTRAINT PK_GOLF_SERVICES PRIMARY KEY,
    Quantity INT NOT NULL,
    Price DECIMAL(7, 2) NOT NULL
);
ALTER TABLE gw146864.GolfServices DROP COLUMN Quantity;
ALTER TABLE gw146864.GolfServices ADD Service VARCHAR(255);

CREATE TABLE gw146864.GolfPurchase (
    Service_id INT,
    Transaction_number INT,
    Quantity INT NOT NULL,
    Price_at_purchase DECIMAL(7, 2) NOT NULL,
    CONSTRAINT PK_GOLF_PURCHASE PRIMARY KEY (Service_id, Transaction_number),
    CONSTRAINT FK_GOLF_PURCHASE_SERVICE_ID FOREIGN KEY (Service_id) REFERENCES GolfServices(Service_id),
    CONSTRAINT FK_GOLF_PURCHASE_TRANSACTION_NUMBER FOREIGN KEY (Transaction_number) REFERENCES Sale(Transaction_number)
);


CREATE TABLE gw146864.ItemPurchase (
    Plu_code VARCHAR(20),
    Transaction_number INT,
    Quantity INT NOT NULL,
    Price_at_purchase DECIMAL(7, 2) NOT NULL,
    CONSTRAINT PK_ITEM_PURCHASE PRIMARY KEY (Plu_code, Transaction_number),
    CONSTRAINT FK_ITEM_PURCHASE_TRANSACTION_NUMBER FOREIGN KEY (Transaction_number) REFERENCES Sale(Transaction_number)
);

CREATE TABLE gw146864.Merchandise (
    Plu_code VARCHAR(20) CONSTRAINT PK_MERCHANDISE PRIMARY KEY,
    Price DECIMAL(7, 2) NOT NULL,
    Cost DECIMAL(7, 2),
    Brand VARCHAR(50),
    Units_purchased INT
);

CREATE TABLE gw146864.Ball (
    Plu_code VARCHAR(20) CONSTRAINT FK_BALL_PLU_CODE REFERENCES Merchandise(Plu_code),
    Count INT NOT NULL,
    Skew VARCHAR(20)
);

CREATE TABLE gw146864.Shoe (
    Plu_code VARCHAR(20) CONSTRAINT FK_SHOE_PLU_CODE REFERENCES Merchandise(Plu_code),
    Us_shoe_size DECIMAL(3, 1) NOT NULL
);

CREATE TABLE gw146864.Clothing (
    Plu_code VARCHAR(20) CONSTRAINT FK_CLOTHING_PLU_CODE REFERENCES Merchandise(Plu_code),
    Size VARCHAR(10),
    Color VARCHAR(20)
);
ALTER TABLE gw146864.Clothing ADD Clothing_type VARCHAR(50) NOT NULL;

CREATE TABLE gw146864.Clubs (
    Plu_code VARCHAR(20) CONSTRAINT FK_CLUBS_PLU_CODE REFERENCES Merchandise(Plu_code),
    Hand VARCHAR(5),
    Number INT,
    Type VARCHAR(20),
    Series VARCHAR(20)
);
ALTER TABLE gw146864.Clubs
ADD CONSTRAINT CK_HAND CHECK (Hand IN ('Right', 'Left'));

ALTER TABLE gw146864.Clubs
ADD CONSTRAINT CK_TYPE CHECK (Type IN ('Driver', 'Wood', 'Iron', 'Wedge', 'Putter'));

CREATE TABLE gw146864.Event (
    Event_name VARCHAR(100) CONSTRAINT PK_EVENT PRIMARY KEY,
    Start_time DATETIME NOT NULL,
    End_time DATETIME NOT NULL
);
