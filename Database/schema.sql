//creating the required tables in MySQL

//1. User Table
CREATE TABLE "User" (
    userId SERIAL PRIMARY KEY,
    userName VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    fName VARCHAR(100),
    lName VARCHAR(100),
    email VARCHAR(150) UNIQUE NOT NULL,
    role VARCHAR(100),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Customer Table
CREATE TABLE Customer (
    customerId SERIAL PRIMARY KEY,
    fname VARCHAR(150),
    lname VARCHAR(150),
    address VARCHAR(250),
    email VARCHAR(150) UNIQUE,
    mobile VARCHAR(20),
    joinedDate DATE DEFAULT CURRENT_DATE,
    EarnedPoints INT DEFAULT 0,
    availablePoints INT DEFAULT 0,
    redeemedPoints INT DEFAULT 0
);

-- 3. Loyalty Program Table
CREATE TABLE LoyaltyProgram (
    programId SERIAL PRIMARY KEY,
    pointsStructure INT NOT NULL,  -- E.g., points per LKR spent
    tier VARCHAR(50),
    rewardsSetting VARCHAR(100),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. Rewards Table
CREATE TABLE Rewards (
    rewardId SERIAL PRIMARY KEY,
    rewardName VARCHAR(150),
    pointsRequired INT NOT NULL,
    discount INTEGER  -- Discount percentage or fixed value
);

-- 5. Customer Segment Table
CREATE TABLE CustomerSegment (
    segmentId SERIAL PRIMARY KEY,
    segmentName VARCHAR(100),
    filterSetting TEXT,
    customerList TEXT  
);

-- 6. Product Table
CREATE TABLE Product (
    productId SERIAL PRIMARY KEY,
    productName VARCHAR(150),
    category VARCHAR(100),
    sellingPrice DECIMAL(10, 2),
    discount INTEGER DEFAULT 0
);

-- 7. Transaction Table
CREATE TABLE Transaction (
    invoiceId SERIAL PRIMARY KEY,
    customerId INT REFERENCES Customer(customerId) ON DELETE CASCADE,
    totalAmount DECIMAL(10, 2),
    pointsEarned INT,
    pointsRedeemed INT,
    invoiceDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 8. ProductPurchased Table (Many-to-many between Product and Transaction)
CREATE TABLE ProductPurchased (
    productId INT REFERENCES Product(productId) ON DELETE CASCADE,
    invoiceId INT REFERENCES Transaction(invoiceId) ON DELETE CASCADE,
    quantity INT,
    discount INT,
    amount DECIMAL(10, 2),
    PRIMARY KEY (productId, invoiceId)
);

-- 9. Loyalty History Table (tracks earning/redemption activities)
CREATE TABLE LoyaltyHistory (
    loyaltyId SERIAL PRIMARY KEY,
    customerId INT REFERENCES Customer(customerId) ON DELETE CASCADE,
    invoiceId INT REFERENCES Transaction(invoiceId),
    pointsEarned INT,
    pointsRedeemed INT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
