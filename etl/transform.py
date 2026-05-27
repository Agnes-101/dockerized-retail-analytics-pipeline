"""
This script is responsible for transforming the raw data into a format suitable for analysis.
Things needed to be handled include:
    > Streamline column names (lowercase, underscores instead of spaces)
    > Check and handle missing values
    > Check and handle duplicates
    > Set dates to datetime format
    > Check that datatype formats are correct
    > Further processing of columns:
        - Extracting year and month from order_date
        - Extracting first name and last name from customer_name
"""
"""
Column names in the dataset:
            'row_id',     'order_id',     'order_date',     'ship_date', 
            'ship_mode',   'customer_id', 'customer_name', 
            'segment',     'country',      'city',             'state', 
            'postal_code', 'region',       'product_id',
            'category',    'sub_category',  'product_name', 
            'sales',        'quantity',       'discount',       'profit'
"""

import pandas as pd

def transform(df):
    # df = pd.read_csv('data/raw_data/superstore_data.csv')
    print("First 5 rows of the dataset:")   
    pd.set_option('display.max_columns', None)
    # print(df.columns.tolist())

    df.columns = df.columns.str.lower().str.replace(' ', '_').str.replace('-', '_')
    # print('Transformed column names:', df.columns.tolist())

    # print(df.info())
    # print('Duplicate rows:', df.duplicated().sum())
    # print('Missing values per column:\n', df.isnull().sum())
    # print('Data types of columns:\n', df.dtypes)

    df['order_date']= pd.to_datetime(df['order_date'], format='%m/%d/%Y')
    df['ship_date']= pd.to_datetime(df['ship_date'], format='%m/%d/%Y')

    df["order_year"] = df["order_date"].dt.year
    df["order_month"] = df["order_date"].dt.month
    df['order_day'] = df['order_date'].dt.day

    df['ship_year'] = df['ship_date'].dt.year
    df['ship_month'] = df['ship_date'].dt.month
    df['ship_day'] = df['ship_date'].dt.day 

    df["customer_first_name"] = df["customer_name"].str.split().str[0]
    df["customer_last_name"] = df["customer_name"].str.split().str[-1]

    # Additional columns for analysis
    df['profit_margin'] = df['profit'] / df['sales']
    df['shipping_days'] = (df['ship_date'] - df['order_date']).dt.days    

    df.drop(columns=['customer_name'], inplace=True)
    # print(df.head())

    output_path = 'data/processed_data/superstore_data_transformed.csv'
    df.to_csv(output_path, index=False)
    print(f"Transformed dataset saved to: {output_path}")

    return df

# transform()