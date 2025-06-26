import pandas as pd
from sqlalchemy import create_engine, text


# Update with your MySQL user, password, host, port, and database
user = 'root'
password = 'Loafy12345$'
host = 'localhost'
port = 3306
database = 'bank_db'

connection_string = f"mysql+pymysql://{user}:{password}@{host}:{port}/{database}"
engine = create_engine(connection_string)

df = pd.read_csv("UK-Bank-Customers.csv")

df['Date Joined'] = pd.to_datetime(df['Date Joined'], format="%d.%b.%y")

df.columns = [
    'customer_id', 'first_name', 'last_name', 'gender', 'age',
    'region', 'job_classification', 'date_joined', 'balance'
]

df.to_sql('customers', engine, if_exists='replace', index=False)
print("✅ Data loaded into MySQL successfully.")

with engine.connect() as conn:
    result = conn.execute(text("SELECT COUNT(*) FROM customers;"))
    count = result.scalar()
    print(f"Rows in customers table: {count}")

print(df.head())