from sqlalchemy import create_engine
from dotenv import load_dotenv
from urllib.parse import quote_plus
import os
import pandas as pd

load_dotenv()

DB_USER = os.getenv("DB_USER")
DB_PASSWORD = quote_plus(os.getenv("DB_PASSWORD"))
DB_HOST = os.getenv("DB_HOST")
DB_PORT = os.getenv("DB_PORT")
DB_NAME = os.getenv("DB_NAME")

db_engine = create_engine(
    f"postgresql+psycopg2://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}"
)
df = pd.read_csv('data/processed_data/superstore_data_transformed.csv')

with db_engine.connect() as con:
    print('Connection to the database is successful!')
    df.to_sql( "staging_sales", con = con, if_exists="replace", index=False)


                       