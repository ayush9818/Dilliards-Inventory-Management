# MLDS_400_G11

## Weekly Updates

  <summary>Until 20th October</summary>

 ### Setup the Postgres for all the teammates

 This week, we successfully set up PostgresSQL for the entire team, and we also connected to the database as outlined by the GitHub instructions.

 ### Completed the data ingestion in the database

 We successfully uploaded all the data into PostgreSQL (especially transact.csv), and we conducted simple queries to ensure that all the data 
 uploaded were correct. 

 ### Write Scripts in Python to access the data from the Postgres Database

While this was not officially completed, we were able to make significant progress in terms of connecting to the Postgres database from Python, which will make our workflow much more efficient.  We also tried integrating PySpark, but there are errors which needs to be fixed

### More Data Cleaning & Analysis 

Finally, we conducted more extensive data cleaning with the following findings on columns: 

Department info:
No signs of missing data, no data like “NA” or 0.

SKU info:
‘NA’ exists in Color and Size columns, the proportions of ‘NA’ with respect to the total number of rows are 0.001584 and 0.000447 respectively. Since they are categorical variables and need further cleaning, I replace them with ‘unknown’. I think we can also drop them as they only consist of a small proportion of data.
0 exists in column Package Size. I believe they are missing data because the package size should be at least 1. Proportion of rows with PACKSIZE=0: 2.19e-05. I dropped them as there are so few of them.  

STR info:
Three rows with zip code 99999, which does not exist.
Skst info:
Less than 1 percent of cost and Retails have prices at 0.  Can do imputation but not sure if it is missing data or the actual price is 0. 
Transact info: 
about 1 percent of the three prices column has value 0. Not sure if it is missing data or the actual price is 0. 



<details>
  <summary>Until 13th October</summary>
  
  ### Data Subsampling and Formatting [CodeLink](https://github.com/ayush9818/ESWD_Group11_Project/blob/main/DataPrep.ipynb)
  1. Subsampled 1% data from Transact.csv and Skuinfo.csv files using Python for exploratory purposes as the original files were too large to load in Python or R. 
  2. There were some issues in matching column names from DBSchema and CSV data in Transact.csv and Skuinfo.csv. Tried fixing those issues by refering to column names description. Still few column names are left due to similar values.
  <details>
       <summary>Click for More Details</summary>
        In reviewing the spreadsheets for identifying data quality and understanding, we were able to outline a handful of columns within three spreadsheets that need treatment. The ‘Skuinfo’ spreadsheet needs attention on ‘COLOR’ and ‘SIZE’ columns. The ‘Trnsact_sample’ sheet needs clarity on the meaning of ‘AMT’ value. Furthermore, we found that the data in many columns are similar to each other, especially in the transaction data frame. There are three floating point columns in the transactions data instead of two, which is inconsistent with the schema, and SPRICE is the column description that never appeared on the schema
   </details>
   
  ### Postgres and Database Setup
   1. Setup the Postgres database using command line as well as Dbeaver
   2. Created Tables in the Database. Data Population is left as there were some datatype issues, which will be fixed in the next update.

  ### Data Exploration [CodeLink](https://github.com/ayush9818/MLDS_400_G11/blob/main/EDA.ipynb)
  After loading in the subsampled data into Jupyter, we ran exploratory data analysis on the four datasets. We found that there are around 15 million SKUs and approximately 41.4 million 
  transactions. This shows that if we were to conduct a machine learning problem with each row being a SKU or transaction, it would be computationally expensive. Furthermore, we found that 
  there are approximately 350 distinct stores in our resampled data. In the resampled transaction  data, Store 320 is the busiest store with other 17k transactions, and the ratio of purchases to returns is approximately 11:1. We also analyzed the ROI data, which outlines yearly revenue and expenses of coats along  with price markdown figures. Included are two months of revenue compared to pay and computing costs. The yearly revenue figures display an ROI of 11.1% while the data over two months provided show a dollar value ROI of $25.7k or 41.51% when compared to costs. We will further explore how this data will be useful to our project in the next week.

  ### Next Steps
  1. Populate Data in database
  2. Continue with Data Exploration
  3. Define Problem Statement
  4. Run POC on small dataset to validate the feasibility of problem statement
</details>
