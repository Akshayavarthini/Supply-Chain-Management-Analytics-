import pandas as pd
import random
import os
from faker import Faker
from datetime import datetime, timedelta

# ---------------------------------------------------------
# INITIAL SETUP
# ---------------------------------------------------------

fake = Faker("en_IN")
Faker.seed(100)
random.seed(100)

base_path = r"C:\Users\Akshayavarthini\OneDrive\Desktop\SupplyChain_Analytics_Project\01_Dataset"

os.makedirs(base_path, exist_ok=True)

print("Generating Supply Chain Dataset...")

# ---------------------------------------------------------
# CATEGORIES
# ---------------------------------------------------------

category_list = [

"Electronics",
"Furniture",
"Clothing",
"Grocery",
"Healthcare",
"Sports",
"Automotive",
"Beauty",
"Stationery",
"Home Appliances",
"Books",
"Toys",
"Jewellery",
"Footwear",
"Accessories"

]

categories = []

for i, category in enumerate(category_list, start=1):

    categories.append([
        i,
        category
    ])

category_df = pd.DataFrame(

    categories,

    columns=[
        "CATEGORY_ID",
        "CATEGORY_NAME"
    ]

)

category_df.to_csv(

    os.path.join(base_path,"categories.csv"),

    index=False

)

print("categories.csv Created")

# ---------------------------------------------------------
# PRODUCTS
# ---------------------------------------------------------

brands = [

"Samsung","Apple","Sony","Dell","HP",
"LG","Boat","Nike","Puma","Adidas",
"Lenovo","Asus","Whirlpool","Godrej",
"Prestige","Philips","Bajaj","Havells"

]

product_names = [

"Laptop","Smartphone","Tablet","Monitor",
"Printer","Keyboard","Mouse","Headphones",
"LED TV","Refrigerator","Microwave",
"Washing Machine","Mixer Grinder",
"Office Chair","Study Table",
"Football","Cricket Bat",
"Notebook","Backpack","Water Bottle"

]

products = []

for i in range(1,501):

    category = random.randint(1,15)

    cost = random.randint(500,50000)

    selling = cost + random.randint(300,12000)

    products.append([

        i,

        category,

        random.choice(product_names),

        random.choice(brands),

        cost,

        selling

    ])

product_df = pd.DataFrame(

products,

columns=[

"PRODUCT_ID",
"CATEGORY_ID",
"PRODUCT_NAME",
"BRAND",
"COST_PRICE",
"SELLING_PRICE"

]

)

product_df.to_csv(

os.path.join(base_path,"products.csv"),

index=False

)

print("products.csv Created")

# ---------------------------------------------------------
# SUPPLIERS
# ---------------------------------------------------------

cities = [
    "Chennai","Coimbatore","Madurai","Salem","Trichy",
    "Bengaluru","Mysuru","Hyderabad","Mumbai","Pune",
    "Delhi","Ahmedabad","Kolkata","Kochi","Jaipur"
]

state_map = {
    "Chennai":"Tamil Nadu",
    "Coimbatore":"Tamil Nadu",
    "Madurai":"Tamil Nadu",
    "Salem":"Tamil Nadu",
    "Trichy":"Tamil Nadu",
    "Bengaluru":"Karnataka",
    "Mysuru":"Karnataka",
    "Hyderabad":"Telangana",
    "Mumbai":"Maharashtra",
    "Pune":"Maharashtra",
    "Delhi":"Delhi",
    "Ahmedabad":"Gujarat",
    "Kolkata":"West Bengal",
    "Kochi":"Kerala",
    "Jaipur":"Rajasthan"
}

suppliers = []

for i in range(1,251):

    city = random.choice(cities)

    suppliers.append([
        i,
        fake.company(),
        city,
        state_map[city],
        random.randint(1,5)
    ])

supplier_df = pd.DataFrame(
    suppliers,
    columns=[
        "SUPPLIER_ID",
        "SUPPLIER_NAME",
        "CITY",
        "STATE",
        "RATING"
    ]
)

supplier_df.to_csv(
    os.path.join(base_path,"suppliers.csv"),
    index=False
)

print("suppliers.csv Created")


# ---------------------------------------------------------
# CUSTOMERS
# ---------------------------------------------------------

customer_types = [
    "Regular",
    "Premium",
    "Wholesale"
]

customers = []

for i in range(1,5001):

    city = random.choice(cities)

    customers.append([
        i,
        fake.name(),
        city,
        state_map[city],
        random.choice(customer_types)
    ])

customer_df = pd.DataFrame(
    customers,
    columns=[
        "CUSTOMER_ID",
        "CUSTOMER_NAME",
        "CITY",
        "STATE",
        "CUSTOMER_TYPE"
    ]
)

customer_df.to_csv(
    os.path.join(base_path,"customers.csv"),
    index=False
)

print("customers.csv Created")


# ---------------------------------------------------------
# WAREHOUSES
# ---------------------------------------------------------

warehouses = []

for i in range(1,26):

    city = random.choice(cities)

    warehouses.append([
        i,
        city + " Warehouse",
        city,
        random.randint(5000,50000)
    ])

warehouse_df = pd.DataFrame(
    warehouses,
    columns=[
        "WAREHOUSE_ID",
        "WAREHOUSE_NAME",
        "CITY",
        "CAPACITY"
    ]
)

warehouse_df.to_csv(
    os.path.join(base_path,"warehouses.csv"),
    index=False
)

print("warehouses.csv Created")

# ---------------------------------------------------------
# INVENTORY
# ---------------------------------------------------------

inventory = []

for i in range(1, 8001):

    product_id = random.randint(1, 500)

    warehouse_id = random.randint(1, 25)

    stock_quantity = random.randint(10, 1000)

    reorder_level = random.randint(20, 200)

    inventory.append([
        i,
        product_id,
        warehouse_id,
        stock_quantity,
        reorder_level
    ])

inventory_df = pd.DataFrame(
    inventory,
    columns=[
        "INVENTORY_ID",
        "PRODUCT_ID",
        "WAREHOUSE_ID",
        "STOCK_QUANTITY",
        "REORDER_LEVEL"
    ]
)

inventory_df.to_csv(
    os.path.join(base_path, "inventory.csv"),
    index=False
)

print("inventory.csv Created")

# ---------------------------------------------------------
# ORDERS
# ---------------------------------------------------------

orders = []

order_status_list = [
    "Pending",
    "Shipped",
    "Delivered",
    "Cancelled"
]

start_date = datetime(2024, 1, 1)

# Get product selling prices for revenue calculation
price_lookup = product_df.set_index("PRODUCT_ID")["SELLING_PRICE"].to_dict()

for i in range(1, 30001):

    customer_id = random.randint(1, 5000)
    product_id = random.randint(1, 500)
    supplier_id = random.randint(1, 250)
    warehouse_id = random.randint(1, 25)

    quantity = random.randint(1, 10)

    order_date = start_date + timedelta(days=random.randint(0, 730))

    delivery_date = order_date + timedelta(days=random.randint(2, 10))

    order_status = random.choices(
        order_status_list,
        weights=[10, 20, 60, 10],
        k=1
    )[0]

    selling_price = price_lookup[product_id]

    revenue = round(quantity * selling_price, 2)

    orders.append([
        i,
        customer_id,
        product_id,
        supplier_id,
        warehouse_id,
        quantity,
        order_date.strftime("%Y-%m-%d"),
        delivery_date.strftime("%Y-%m-%d"),
        order_status,
        revenue
    ])

orders_df = pd.DataFrame(
    orders,
    columns=[
        "ORDER_ID",
        "CUSTOMER_ID",
        "PRODUCT_ID",
        "SUPPLIER_ID",
        "WAREHOUSE_ID",
        "QUANTITY",
        "ORDER_DATE",
        "DELIVERY_DATE",
        "ORDER_STATUS",
        "REVENUE"
    ]
)

orders_df.to_csv(
    os.path.join(base_path, "orders.csv"),
    index=False
)

print("orders.csv Created")

# ---------------------------------------------------------
# SHIPMENTS
# ---------------------------------------------------------

shipping_modes = [
    "Road",
    "Air",
    "Rail",
    "Sea"
]

shipments = []

for _, row in orders_df.iterrows():

    order_id = row["ORDER_ID"]

    order_status = row["ORDER_STATUS"]

    if order_status == "Delivered":
        delivery_status = "Delivered"

    elif order_status == "Shipped":
        delivery_status = "In Transit"

    elif order_status == "Pending":
        delivery_status = "In Transit"

    else:
        delivery_status = "Delayed"

    shipping_cost = round(random.uniform(100, 5000), 2)

    shipments.append([

        order_id,                     # SHIPMENT_ID

        order_id,                     # ORDER_ID

        random.choice(shipping_modes),

        shipping_cost,

        delivery_status

    ])

shipment_df = pd.DataFrame(

    shipments,

    columns=[

        "SHIPMENT_ID",

        "ORDER_ID",

        "SHIPPING_MODE",

        "SHIPPING_COST",

        "DELIVERY_STATUS"

    ]

)

shipment_df.to_csv(

    os.path.join(base_path, "shipments.csv"),

    index=False

)

print("shipments.csv Created")


# ---------------------------------------------------------
# PAYMENTS
# ---------------------------------------------------------

payment_methods = [
    "UPI",
    "Credit Card",
    "Debit Card",
    "Net Banking",
    "Cash"
]

payments = []

for _, row in orders_df.iterrows():

    order_id = row["ORDER_ID"]

    revenue = row["REVENUE"]

    order_status = row["ORDER_STATUS"]

    # Payment Status based on Order Status
    if order_status == "Cancelled":
        payment_status = "Failed"

    elif order_status == "Pending":
        payment_status = "Pending"

    else:
        payment_status = "Paid"

    payment_method = random.choices(
        payment_methods,
        weights=[40, 25, 15, 10, 10],
        k=1
    )[0]

    payments.append([

        order_id,              # PAYMENT_ID

        order_id,              # ORDER_ID

        payment_method,

        payment_status,

        revenue

    ])

payment_df = pd.DataFrame(

    payments,

    columns=[

        "PAYMENT_ID",

        "ORDER_ID",

        "PAYMENT_METHOD",

        "PAYMENT_STATUS",

        "AMOUNT"

    ]

)

payment_df.to_csv(

    os.path.join(base_path, "payments.csv"),

    index=False

)

print("payments.csv Created")

# ---------------------------------------------------------
# RETURNS
# ---------------------------------------------------------

return_reasons = [
    "Damaged Product",
    "Wrong Item Delivered",
    "Defective Product",
    "Poor Quality",
    "Customer Changed Mind",
    "Late Delivery",
    "Missing Accessories"
]

# Only Delivered Orders can be Returned
delivered_orders = orders_df[
    orders_df["ORDER_STATUS"] == "Delivered"
]

# Select 10% of Delivered Orders
return_orders = delivered_orders.sample(
    frac=0.10,
    random_state=100
)

returns = []

return_id = 1

for _, row in return_orders.iterrows():

    refund_amount = round(
        row["REVENUE"] * random.uniform(0.70, 1.00),
        2
    )

    returns.append([

        return_id,

        row["ORDER_ID"],

        random.choice(return_reasons),

        refund_amount

    ])

    return_id += 1

returns_df = pd.DataFrame(

    returns,

    columns=[

        "RETURN_ID",

        "ORDER_ID",

        "RETURN_REASON",

        "REFUND_AMOUNT"

    ]

)

returns_df.to_csv(

    os.path.join(base_path, "returns.csv"),

    index=False

)

print("returns.csv Created")