import pandas as pd
import os

# Paths
excel_file = "/Users/koosha/00-My Files-00/My Works/GitHub/Repositories/BNPL_Customer_Data/BNPL customer data-2nd interview task.xlsx"
csv_output = "/Users/koosha/00-My Files-00/My Works/GitHub/Repositories/BNPL_Customer_Data/data/raw_data.csv"


df = pd.read_excel(excel_file, sheet_name=0)

os.makedirs("../data", exist_ok=True)

df.to_csv(csv_output, index=False)

print(f"✔️ Converted '{excel_file}' to '{csv_output}' successfully.")
