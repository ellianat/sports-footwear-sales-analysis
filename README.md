# Sports Footwear Sales SQL Project

This project explores a sports footwear sales dataset using SQL. The goal was to design a relational database, insert structured data, and perform analytical queries to extract insights about pricing, brands, orders, and customer description. The project demonstrates core and advanced SQL skills including filtering, aggregation, and subqueries.

## Dataset Overview
The dataset consists of 200 sports footwear sales with the following attributes:
Income Level, 
Country (Manufacturing Origin), 
Brand, 
Model, 
Category of Shoe, 
Gender, 
Size, 
Color, 
Base Price (USD),
Order Date,
Payment,
Channel,
Units Sold,
Discount,
Final Price,
Total Sale
- Data was cleaned and standardized for SQL analysis
- **Note:** This dataset is from Kaggle and is intended for practice and analysis; it may not represent real products.


## Database Schema

```sql
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    income_lvl VARCHAR(10),
    country VARCHAR(40)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    brand VARCHAR(20),
    model VARCHAR(20),
    category VARCHAR(20),
    gender VARCHAR(20),
    size DECIMAL(3,1),
    color VARCHAR(10),
    base_price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    orer_date DATE,
    payment VARCHAR(20),
    channel VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    units_sold INT,
    discount DECIMAL(5,2),
    final_price DECIMAL(5,2),
    total_sale DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
```
## Key Takeaways
- **Price Insights:** The expensive shoe category sold the most units. Adidas and Reebok brought in the highest revenue of the brands. December, 2023 had the most revenue. The income level that spent the most was the medium income level and most of the sales were made online, although retail store was close. 
- **Category Trends:** While Nike and Reebok had sold the most units. While lifestyle shoes were the most popular and brought in the most revenue. 
