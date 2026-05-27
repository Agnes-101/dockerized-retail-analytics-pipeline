import kagglehub
import os
import pandas as pd


def extract():
    # Download latest version
    path = kagglehub.dataset_download("vivek468/superstore-dataset-final")

    print("Path to dataset files:", path)

    df = pd.read_csv(os.path.join(path, "Sample - Superstore.csv"), encoding="latin1")
    output_path = "data/raw_data/superstore_data.csv"

    df.to_csv(output_path, index=False)

    print(f"Raw dataset saved to: {output_path}") 

    return df

# extract()