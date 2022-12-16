SELECT *
FROM Project.dbo.NashvilleHousing



-- Populate Property Address Data


SELECT *
FROM Project.dbo.NashvilleHousing
--WHERE PropertyAddress is null
ORDER BY ParcelID



SELECT a.parcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, isnull(a.PropertyAddress, b.PropertyAddress)
FROM Project.dbo.NashvilleHousing a
JOIN Project.dbo.NashvilleHousing b
	ON a.ParcelID = b.ParcelID
	AND a.[uniqueID] <> b.[uniqueID]
WHERE a.PropertyAddress is null


UPDATE a
SET PropertyAddress = isnull(a.PropertyAddress, b.PropertyAddress)
FROM Project.dbo.NashvilleHousing a
JOIN Project.dbo.NashvilleHousing b
	ON a.ParcelID = b.ParcelID
	AND a.[uniqueID] <> b.[uniqueID]
WHERE a.PropertyAddress is null



-- Breaking out Address into Individual Columns (Address, City, State)


SELECT PropertyAddress
FROM Project.dbo.NashvilleHousing
--WHERE PropertyAddress is null
--ORDER BY ParcelID

SELECT
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1) as Address,
SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1,LEN(PropertyAddress)) as Address

FROM Project.dbo.NashvilleHousing



ALTER TABLE NashvilleHousing
ADD PropertySplitAddress Nvarchar(255);

UPDATE NashvilleHousing
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1)



ALTER TABLE NashvilleHousing
ADD PropertySplitCity Nvarchar(255);

UPDATE NashvilleHousing
SET PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1,LEN(PropertyAddress))


SELECT *
FROM Project.dbo.NashvilleHousing




SELECT OwnerAddress
FROM Project.dbo.NashvilleHousing




SELECT
PARSENAME(REPLACE(OwnerAddress,',','.'),3),
PARSENAME(REPLACE(OwnerAddress,',','.'),2),
PARSENAME(REPLACE(OwnerAddress,',','.'),1)
FROM Project.dbo.NashvilleHousing




ALTER TABLE NashvilleHousing
ADD OwnerSplitAddress Nvarchar(255);

UPDATE NashvilleHousing
SET OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress,',','.'),3)



ALTER TABLE NashvilleHousing
ADD OwnerSplitCity Nvarchar(255);

UPDATE NashvilleHousing
SET OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress,',','.'),2)



ALTER TABLE NashvilleHousing
ADD OwnerSplitState Nvarchar(255);

UPDATE NashvilleHousing
SET OwnerSplitState = PARSENAME(REPLACE(OwnerAddress,',','.'),1)



SELECT *
FROM Project.dbo.NashvilleHousing



-- Change Y and N to Yes and No in "Sold and Vacant" field


SELECT DISTINCT(SoldAsVacant), count(SoldAsVacant)
FROM Project.dbo.NashvilleHousing
GROUP BY SoldAsVacant
ORDER BY 2



-- Remove Duplicates


WITH RowNumCTE AS(
SELECT *,
	ROW_NUMBER() OVER(
	PARTITION BY ParcelID,
				 PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
				 ORDER BY
					UniqueID
					) row_num

FROM Project.dbo.NashvilleHousing
--order by ParcelID
)
SELECT *
FROM RowNumCTE
WHERE row_num > 1
--order by PropertyAddress



--Delete Unused Columns

SELECT *
FROM Project.dbo.NashvilleHousing

ALTER TABLE Project.dbo.NashvilleHousing
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress


ALTER TABLE Project.dbo.NashvilleHousing
DROP COLUMN SaleDate