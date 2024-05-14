CREATE DATABASE EShoppingDB;
USE EShoppingDB;
create table tblUsers
(
Uid int identity(1,1) primary key not null,
Username nvarchar(100)Null, 
Password nvarchar(100)Null,
Email nvarchar(100)Null,
Name nvarchar(100)Null,
Gender nvarchar(100)Null,
)

select*From tblUsers;

DELETE FROM tblUsers WHERE Uid=5;

create table ForgotPass
(
Id nvarchar (500)  not null,
Uid int null,
RequestDateTime DATETIME null,
Constraint [FK_ForgotPass_tblUsers] FOREIGN KEY ([Uid]) REFERENCES [tblUsers] ([Uid])

)

CREATE TABLE tblBrands(
	[BrandID] [int] IDENTITY(1,1) NOT NULL primary key,
	[Name] [nvarchar](500) NULL,
)

CREATE TABLE tblCategory(
	[CatID] [int] IDENTITY(1,1) NOT NULL primary key,
	[CatName] [nvarchar](max) NULL,
)

CREATE TABLE tblSubCategory(
	[SubCatID] [int] IDENTITY(1,1) NOT NULL primary key,
	[SubCatName] [nvarchar](max) NULL,
	[MainCatID] [int] NULL,
CONSTRAINT [FK_tblSubCategory_tblCategory] FOREIGN KEY([MainCatID]) REFERENCES tblCategory ([CatID])
)

create table tblGender
(
GenderID int identity(1,1) primary key,
GenderName   nvarchar(MAX)
)

create table tblSizes
(
SizeID int identity(1,1) primary key,
SizeName   nvarchar(500),
BrandID int,
CategoryID int,
SubCategoryID int,
GenderID int,
Constraint [FK_tblSizes_ToBrand] FOREIGN KEY ([BrandID]) REFERENCES [tblBrands] ([BrandID]),
Constraint [FK_tblSizes_ToCat] FOREIGN KEY ([CategoryID]) REFERENCES [tblCategory] ([CatID]),
Constraint [FK_tblSizes_SubCat] FOREIGN KEY ([SubCategoryID]) REFERENCES [tblSubCategory] ([SubCatID]),
Constraint [FK_tblSizes_Gender] FOREIGN KEY ([GenderID]) REFERENCES [tblGender] ([GenderID])

)


create table tblProducts
(
PID int identity(1,1) primary key ,
PName   nvarchar(MAX),
PPrice money,
PSelPrice money,
PBrandID int,
PCategoryID int,
PSubCatID int,
PGender int,

PDescription nvarchar(MAX),
PProductDetails nvarchar(MAX),
PMaterialCare  nvarchar(MAX),
FreeDelivery int,
[30DayRet]  int,
COD       int,
Constraint [FK_tblProducts_ToTable] FOREIGN KEY ([PBrandID]) REFERENCES [tblBrands] ([BrandID]),
Constraint [FK_tblProducts_ToTable1] FOREIGN KEY ([PCategoryID]) REFERENCES [tblCategory] ([CatID]),
Constraint [FK_tblProducts_ToTable2] FOREIGN KEY ([PSubCatID]) REFERENCES [tblSubCategory] ([SubCatID]),
Constraint [FK_tblProducts_ToTable3] FOREIGN KEY ([PGender]) REFERENCES [tblGender] ([GenderID])
)


CREATE TABLE tblProductImages(
	[PIMGID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NULL,
	[Name] [nvarchar](max) NULL,
	[Extention] [nvarchar](500) NULL,
	Constraint [FK_tblProductImages_ToTable] FOREIGN KEY ([PID]) REFERENCES [tblProducts] ([PID])
	)

create table tblProductSizeQuantity
(
PrdSizeQuantID int identity(1,1) primary key,
PID int,
SizeID int,
Quantity int,
Constraint [FK_tblProductSizeQuantity_ToTable] FOREIGN KEY ([PID]) REFERENCES [tblProducts] ([PID]),
Constraint [FK_tblProductSizeQuantity_ToTable1] FOREIGN KEY ([SizeID]) REFERENCES [tblSizes] ([SizeID])
)


CREATE TABLE tblCart(
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [int] NULL,
	[PID] [int] NULL,
	[PName] [nvarchar](max) NULL,
	[PPrice] [money] NULL,
	[PSelPrice] [money] NULL,
	[SubPAmount]  AS ([PPrice]*[Qty]),
	[SubSAmount]  AS ([PSelPrice]*[Qty]),
	[Qty] [int] NULL,
)

SELECT* FROM tblBrands
Select* from tblCategory
SELECT* FROM tblSubCategory
Select * From tblGender
Select* From tblSizes
select* from tblProducts
select*from tblProductImages
select*from tblProductSizeQuantity
select*from tblCart


-------    Stored Procedures -------

---1 : to inser data in table products
Create procedure sp_InsertProduct
(
@PName nvarchar(MAX),
@PPrice money,
@PSelPrice money,
@PBrandID int,
@PCategoryID int,
@PSubCatID int,
@PGender int,
@PDescription nvarchar(MAX),
@PProductDetails nvarchar(MAX),
@PMaterialCare nvarchar(MAX),
@FreeDelivery int,
@30DayRet int,
@COD int
)AS

insert into tblProducts values(@PName,@PPrice,@PSelPrice,@PBrandID,@PCategoryID,
@PSubCatID,@PGender,@PDescription,@PProductDetails,@PMaterialCare,@FreeDelivery,
@30DayRet,@COD) 
select SCOPE_IDENTITY()
Return 0

----2 : to bind all products onproducts page
create procedure procBindAllProducts
AS
select A.*,B.*,C.Name ,A.PPrice-A.PSelPrice as DiscAmount,B.Name as ImageName, C.Name as BrandName from tblProducts A
inner join tblBrands C on C.BrandID =A.PBrandID
cross apply(
select top 1 * from tblProductImages B where B.PID= A.PID order by B.PID desc
)B
order by A.PID desc

Return 0
--select A.*,B.*,C.Name ,A.PPrice-A.PSelPrice as DiscAmount,B.Name as ImageName, C.Name as BrandName from tblProducts A
--inner join tblBrands C on C.BrandID =A.PBrandID
--cross apply(
--select top 1 * from tblProductImages B where B.PID= A.PID order by B.PID desc
--)B
--order by A.PID desc


----3 : to bind details of each product 
CREATE PROCEDURE SP_BindProductDetails
(
@PID int
)
AS
SELECT * FROM tblProducts where PID = @PID
--SELECT * FROM tblProducts where PID = 2--


---- 4
create PROCEDURE SP_BindProductImages
(
@PID int
)
AS
SELECT * FROM tblProductImages where PID = @PID


----5
create PROCEDURE SP_BindCartNumberz
(
@UserID int
)
AS
SELECT * FROM tblCart D CROSS APPLY ( SELECT TOP 1 E.Name,Extention FROM tblProductImages E WHERE E.PID = D.PID) Name where D.UID = @UserID

SELECT * FROM tblCart D CROSS APPLY ( SELECT TOP 1 E.Name,Extention FROM tblProductImages E WHERE E.PID = D.PID) Name where D.UID = 1


----6
CREATE PROCEDURE SP_IsProductExistInCart
(
@PID int,
@UserID int
)
AS
SELECT * FROM tblCart where PID = @PID and UID = @UserID
--SELECT * FROM tblCart where PID = 2 and UID = 2

----7
CREATE PROCEDURE SP_UpdateCart
(
@UserID int,
@CartPID int,
@Quantity int
)
AS
BEGIN
SET NOCOUNT ON;
UPDATE tblCart SET Qty = @Quantity WHERE PID = @CartPID AND UID = @UserID
END

go

----8
CREATE PROCEDURE SP_InsertCart
(
@UID int,
@PID int,
@PName nvarchar(MAX),
@PPrice money,
@PSelPrice money,
@Qty int
)
AS
INSERT INTO tblCart VALUES(@UID,@PID,@PName,@PPrice,@PSelPrice,@Qty)
SELECT SCOPE_IDENTITY()

----9
create PROCEDURE SP_BindUserCart
(
@UserID int
)
AS
SELECT * FROM tblCart D CROSS APPLY ( SELECT TOP 1 E.Name,Extention FROM tblProductImages E WHERE E.PID = D.PID) Name WHERE D.UID = @UserID
---SELECT * FROM tblCart D CROSS APPLY ( SELECT TOP 1 E.Name,Extention FROM tblProductImages E WHERE E.PID = D.PID) Name WHERE D.UID = 1

----10
CREATE PROCEDURE SP_getUserCartItem
(
@PID int,
@UserID int
)
AS
SELECT * FROM tblCart WHERE PID = @PID AND UID = @UserID
--SELECT * FROM tblCart WHERE PID = 1 AND UID = 1

----11
CREATE PROCEDURE SP_DeleteThisCartItem
@CartID int
AS
BEGIN
DELETE FROM tblCart WHERE CartID = @CartID
END