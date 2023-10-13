# ESWD_Group11_Project

## Weekly Updates

<details>
  <summary>Until 13th October</summary>
  
  ### Data Subsampling and Formatting
  1. Subsampled 1% data from Transact.csv and Skuinfo.csv files using Python for exploratory purposes as the original files were too large to load in Python or R.
  2. There were some issues in matching column names from DBSchema and CSV data in Transact.csv and Skuinfo.csv. Tried fixing those issues by refering to column names description. Still few column names are left due to similar values.
    <details>
       <summary>Click for More Details</summary>
        In reviewing the spreadsheets for identifying data quality and understanding, we were able to outline a handful of columns within three spreadsheets that need treatment. The ‘Skuinfo’ spreadsheet needs attention on ‘COLOR’ and ‘SIZE’ columns. The ‘Trnsact_sample’ sheet needs clarity on the meaning of ‘AMT’ value. Furthermore, we found that the data in many columns are similar to each other, especially in the transaction data frame. There are three floating point columns in the transactions data instead of two, which is inconsistent with the schema, and SPRICE is the column description that never appeared on the schema
   </details>

   ### 

</details>
