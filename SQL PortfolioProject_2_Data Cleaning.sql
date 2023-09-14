



--select *
--from PortfolioProject1.dbo.NashvilleHousing



----Standardize Date Format


--select SaleDate, convert (date,SaleDate)
--from PortfolioProject1..NashvilleHousing


--update PortfolioProject1..NashvilleHousing
--set Saledate = convert (date, Saledate)


--select Saledate
--from PortfolioProject1.dbo.NashvilleHousing


--alter table NashvilleHousing
--Add SaleDateConverted Date;

---- Update is not working

--Update NashvilleHousing
--SET SaleDateConverted = convert (Date,SaleDate)

--select SaleDateConverted
--from PortfolioProject1.dbo.NashvilleHousing


----Populate Property Address data


--select *
--from PortfolioProject1..NashvilleHousing
----where PropertyAddress is null
--order by parcelid



--select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress, b.PropertyAddress)
--from PortfolioProject1..NashvilleHousing a
--JOIN PortfolioProject1..NashvilleHousing b
--	ON a.ParcelID = b.ParcelID
--	and a.[UniqueID ]<>b.[UniqueID ]
--where a.PropertyAddress is null 



--update a 
--set PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
--from PortfolioProject1..NashvilleHousing a
--JOIN PortfolioProject1..NashvilleHousing b
--	ON a.ParcelID = b.ParcelID
--	and a.[UniqueID ]<>b.[UniqueID ]
--where a.PropertyAddress is null 


---- Breaking out PropertyAddress into Individual Columns 


--Select PropertyAddress
--From PortfolioProject1.dbo.NashvilleHousing


--Select 
--substring (PropertyAddress, 1 , CHARINDEX(',',PropertyAddress)-1) as Address
--,substring (PropertyAddress, CHARINDEX(',',PropertyAddress)+1, len (PropertyAddress)) as Address

--From PortfolioProject1.dbo.NashvilleHousing

--alter table PortfolioProject1.dbo.NashvilleHousing
--Add PropertySplitAddress Nvarchar(255);


--Update PortfolioProject1.dbo.NashvilleHousing
--SET PropertySplitAddress = substring (PropertyAddress, 1 , CHARINDEX(',',PropertyAddress)-1)

--alter table PortfolioProject1.dbo.NashvilleHousing
--Add PropertySplitCity  Nvarchar(255);


--Update PortfolioProject1.dbo.NashvilleHousing
--SET PropertySplitCity  = substring (PropertyAddress, CHARINDEX(',',PropertyAddress)+1, len (PropertyAddress))



--Breaking out OwnerAddress into Individual Columns

Select OwnerAddress
From PortfolioProject1.dbo.NashvilleHousing



Select 
Parsename (Replace(OwnerAddress, ',','.'),3)
,Parsename (Replace(OwnerAddress, ',','.'),2)
,Parsename (Replace(OwnerAddress, ',','.'),1)
From PortfolioProject1.dbo.NashvilleHousing



alter table PortfolioProject1.dbo.NashvilleHousing
Add OwnerSplitAddress Nvarchar(255);


Update PortfolioProject1.dbo.NashvilleHousing
SET OwnerSplitAddress = Parsename (Replace(OwnerAddress, ',','.'),3)

alter table PortfolioProject1.dbo.NashvilleHousing
Add OwnerSplitCity  Nvarchar(255);


Update PortfolioProject1.dbo.NashvilleHousing
SET OwnerSplitCity  = Parsename (Replace(OwnerAddress, ',','.'),2)


alter table PortfolioProject1.dbo.NashvilleHousing
Add OwnerSplitState Nvarchar(255);


Update PortfolioProject1.dbo.NashvilleHousing
SET OwnerSplitState = Parsename (Replace(OwnerAddress, ',','.'),1)



Select *
From PortfolioProject1.dbo.NashvilleHousing


---- Change Y and N to Yes and No in "Sold as Vacant" field