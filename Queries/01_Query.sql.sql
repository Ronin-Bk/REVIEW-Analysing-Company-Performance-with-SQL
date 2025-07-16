SELECT
    product_name AS Product_Name,
    unit_price AS Unit_Price
FROM
    products
WHERE
    unit_price BETWEEN 20 AND 50
    AND discontinued = 0  -- Assuming 'discontinued' is a boolean column where 0 means not discontinued
ORDER BY
    unit_price DESC;