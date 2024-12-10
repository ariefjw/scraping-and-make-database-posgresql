

--Membuat database
CREATE DATABASE product_ikea;


--Membuat table staging untuk menampung data import file csv
CREATE TABLE staging(
	id	SERIAL PRIMARY KEY,
	name VARCHAR(50),
	price INTEGER,
	product_category TEXT[],
	images TEXT[],
	link_product VARCHAR(500),
	product_type VARCHAR(100),
	color_material VARCHAR(100),
	size VARCHAR(100)
);

--Memasukkan data dari file csv ke dalam table staging.
COPY staging(name, price, product_category, images, link_product, product_type, color_material, size)
FROM 'C:\tmp\product_ikea.csv'
DELIMITER ','
CSV HEADER;

--Membuat table product untuk menormalisasi data pada table staging karena masih memiliki kolom 
--yang memuat redundant data
CREATE TABLE product(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	product_type VARCHAR(100),
	color_material VARCHAR(100),
	size VARCHAR(100),
	price INTEGER,
	link_product VARCHAR(500)
);

--Memasukkan data ke dalam table product
INSERT INTO product(name, product_type, color_material, size, price, link_product) 
SELECT name, product_type, color_material, size, price, link_product
FROM staging;

--Membuat table category yang memiliki relasi dengan table product
CREATE TABLE category(
	id SERIAL PRIMARY KEY,
	product_id INTEGER REFERENCES product(id), --Mendefinisikan letak relasi dengan table product
	category VARCHAR(50)
);

--Memasukkan data ke dalam table category
INSERT INTO category(product_id, category)
SELECT c.id, REPLACE(c.category,'''','') --Langkah ini digunakn untuk menghilangkan single quote yang ada di setiap data
FROM(SELECT a.id, UNNEST(product_category) AS category-- UNNEST digunakan untuk destructure data list menjadi kolom yang berbeda
FROM product AS a
JOIN staging AS b ON a.id = b.id) AS c;

--Membuat table image yang memiliki relasi dengan table product
CREATE TABLE image(
	id SERIAL PRIMARY KEY,
	product_id INTEGER REFERENCES product(id), --Mendefinisikan letak relasi kolom pada table product
	url_image VARCHAR(500)
);

--Memasukkan data ke dalam table image
INSERT INTO image(product_id, url_image)
SELECT c.id, REPLACE(c.image,'''','')--Langkah ini digunakn untuk menghilangkan single quote yang ada di setiap data
FROM(SELECT a.id , UNNEST(b.images) AS image --UNNEST digunakan untuk destructure data list menjadi kolom yang berbeda
FROM product AS a
JOIN staging AS b ON a.id = b.id) AS c;

--Cek isi table
SELECT * FROM product;
SELECT * FROM category;
SELECT * FROM image;