from extract import extract
from transform import transform
from load import load
from execute_sql import execute_sql_file

def main():

    df = extract()

    transformed_df = transform(df)

    load(transformed_df)

    execute_sql_file("sql/schema.sql")

    execute_sql_file("sql/tables.sql")
    
    print("ETL pipeline executed successfully!")
if __name__ == "__main__":
    main()