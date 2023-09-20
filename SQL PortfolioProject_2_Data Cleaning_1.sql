



select *
from PortfolioProject1.dbo.NashvilleHousing1



--Standardize Date Format


select SaleDate, convert (date,SaleDate)
from PortfolioProject1..NashvilleHousing1


update PortfolioProject1..NashvilleHousing1
set Saledate = convert (date, Saledate)


select Saledate
from PortfolioProject1.dbo.NashvilleHousing1


alter table PortfolioProject1.dbo.NashvilleHousing1
Add SaleDateConverted Date;

-- Update is not working

Update PortfolioProject1.dbo.NashvilleHousing1
SET SaleDateConverted = convert (Date,SaleDate)

select SaleDateConverted
from PortfolioProject1.dbo.NashvilleHousing1


--Populate Property Address Data


select *
from PortfolioProject1..NashvilleHousing1
--where PropertyAddress is null
order by parcelid



select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress, b.PropertyAddress)
from PortfolioProject1..NashvilleHousing1 a
JOIN PortfolioProject1..NashvilleHousing1 b
	ON a.ParcelID = b.ParcelID
	and a.[UniqueID ]<>b.[UniqueID ]
where a.PropertyAddress is null 



update a 
set PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
from PortfolioProject1..NashvilleHousing1 a
JOIN PortfolioProject1..NashvilleHousing1 b
	ON a.ParcelID = b.ParcelID
	and a.[UniqueID ]<>b.[UniqueID ]
where a.PropertyAddress is null 


-- Breaking out PropertyAddress into Individual Columns 


Select PropertyAddress
From PortfolioProject1.dbo.NashvilleHousing1


Select 
substring (PropertyAddress, 1 , CHARINDEX(',',PropertyAddress)-1) as Address
,substring (PropertyAddress, CHARINDEX(',',PropertyAddress)+1, len (PropertyAddress)) as Address
From PortfolioProject1.dbo.NashvilleHousing1

alter table PortfolioProject1.dbo.NashvilleHousing1
Add PropertySplitAddress Nvarchar(255);


Update PortfolioProject1.dbo.NashvilleHousing1
SET PropertySplitAddress = substring (PropertyAddress, 1 , CHARINDEX(',',PropertyAddress)-1)

alter table PortfolioProject1.dbo.NashvilleHousing1
Add PropertySplitCity  Nvarchar(255);


Update PortfolioProject1.dbo.NashvilleHousing1
SET PropertySplitCity  = substring (PropertyAddress, CHARINDEX(',',PropertyAddress)+1, len (PropertyAddress))


Select PropertySplitAddress, PropertySplitCity
From PortfolioProject1.dbo.NashvilleHousing1



--Breaking out OwnerAddress into Individual Columns

Select OwnerAddress
From PortfolioProject1.dbo.NashvilleHousing1



Select 
Parsename (Replace(OwnerAddress, ',','.'),3)
,Parsename (Replace(OwnerAddress, ',','.'),2)
,Parsename (Replace(OwnerAddress, ',','.'),1)
From PortfolioProject1.dbo.NashvilleHousing1



alter table PortfolioProject1.dbo.NashvilleHousing1
Add OwnerSplitAddress Nvarchar(255);


Update PortfolioProject1.dbo.NashvilleHousing1
SET OwnerSplitAddress = Parsename (Replace(OwnerAddress, ',','.'),3)

alter table PortfolioProject1.dbo.NashvilleHousing1
Add OwnerSplitCity  Nvarchar(255);


Update PortfolioProject1.dbo.NashvilleHousing1
SET OwnerSplitCity  = Parsename (Replace(OwnerAddress, ',','.'),2)


alter table PortfolioProject1.dbo.NashvilleHousing1
Add OwnerSplitState Nvarchar(255);


Update PortfolioProject1.dbo.NashvilleHousing1
SET OwnerSplitState = Parsename (Replace(OwnerAddress, ',','.'),1)



Select OwnerAddress, OwnerSplitAddress, OwnerSplitCity, OwnerSplitState
From PortfolioProject1.dbo.NashvilleHousing1


-- Change Y and N to Yes and No in "Sold as Vacant" field

Select SoldAsVacant
From PortfolioProject1.dbo.NashvilleHousing1
where SoldAsVacant = 'No'

Select Distinct(SoldAsVacant), Count(SoldAsVacant)
From PortfolioProject1.dbo.NashvilleHousing1
Group by SoldAsVacant
order by 2


Select SoldAsVacant
, case	when SoldAsVacant = 'Y' Then 'Yes'
		when SoldAsVacant = 'N' Then 'No'
		Else SoldAsVacant
		end
From PortfolioProject1.dbo.NashvilleHousing1


Update PortfolioProject1.dbo.NashvilleHousing1
Set SoldAsVacant= case	when SoldAsVacant = 'Y' Then 'Yes'
		when SoldAsVacant = 'N' Then 'No'
		Else SoldAsVacant
		end



-- Remove Duplicates


Select *
From PortfolioProject1.dbo.NashvilleHousing1

with RowNumCTE as(
Select *,
	ROW_NUMBER() OVER (
	PARTITION BY ParcelID,
				 PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
				 ORDER BY UniqueID ) as row_num

From PortfolioProject1.dbo.NashvilleHousing

)

delete
from RowNumCTE
where row_num > 1

Select *
from RowNumCTE
where row_num > 1
order by PropertyAddress



-- Delete unnecessary columns

Select *
From PortfolioProject1.dbo.NashvilleHousing1


ALTER TABLE PortfolioProject1.dbo.NashvilleHousing1
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress, SaleDate
