import pandas as pd
import sqlite3

# Load CSV file
df = pd.read_csv("tax_returns.csv")

# Connect to SQLite DB (it will create the file if it doesn't exist)
conn = sqlite3.connect("tax_returns.db")

# Insert data into a table named 'tax_returns'
df.to_sql("tax_returns", conn, if_exists="replace", index=False)

# Commit and close connection
conn.commit()
conn.close()

print("Database created and data inserted successfully.")