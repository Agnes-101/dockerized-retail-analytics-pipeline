from sqlalchemy import create_engine
import os

DB_USER = os.getenv("DB_USER")
DB_PASSWORD = os.getenv("DB_PASSWORD")

db_engine = create_engine(f'postgresql+psycopg2://{DB_USER}:{DB_PASSWORD}@localhost:5432/superstore_retail.db')

with db_engine.connect() as con:
    print('Connection to the database is successful!')