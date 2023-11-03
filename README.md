# MLDS_400_G11

## Weekly Updates


<details>
  <summary>Until 3th November</summary>

From last week, the team has successfully connected to the PostGres database via python and all members are working with the dataset directly.

**Model Development:**
This week, our team has formulated a problem statement for the machine learning model designed as a regression problem: calculating the percentage of times an item has been returned. This model is not only predicting the probability of purchase or return of items but also serves as an inventory management strategy. By predicting these probabilities, we aim to enhance our understanding of customer behavior and refine our inventory control measures.

To perform this we have streamlined the transaction data by grouping it by SKU and store, which has effectively reduced the training data volume. This optimization has led to a decrease in computing expenses without compromising the model's integrity.

**Feature Engineering:**
This week we have started to perform feature engineering, adding new features that will likely enhance the model's predictive capabilities:

**Profit Margin per SKU:** This feature considers the profitability of individual items, which could influence their likelihood of being returned.

**Discount Flag:** We're now distinguishing SKUs based on whether they are sold at a discount. This is based on selling prices being lower or higher than the original price, which might affect both purchase and return probabilities.

**Store Inventory Levels:** We hypothesize that stores with a larger inventory might experience higher purchase and return rates. This feature has been added to our model to test this theory.

**Demographic Data Integration:** The data set has been enriched with demographic data by state to provide a more nuanced view of customer profiles and behaviors.


Preparations are underway for addressing the following areas in the coming week:
**Feature Reductions:** We plan to implement feature reduction strategies to minimize overfitting and improve model generalization.

**Dummy Variable Reduction:** To streamline the model, we will be reducing dummy variables which can lead to a bloated model with unnecessary complexity.

**Hyperparameter Tuning:** Adjusting the model parameters to find the most effective settings for optimal model performance.

**Feature Optimization and Modeling:** We will analyze different effects on the output to optimize the features for the model, and continue modeling the rest of the data.
  
</details>

<details>
  <summary>Until 27th October</summary>

###Connection to Postgres via Python

Last week the team was successfully able to connect to the PostGres Database with the intention of working with the data set in Python. This week the team attempted to make the Python connection which included debugging and granting of permissions. The team is slated to be connected via Python by next week.

###Continued Data Cleaning

This past week several tables were being cleaned in small samples. Those changes have now been implemented into the full data set for completeness, though there are still data issues the team is looking into.

###Analytics

Plots have been generated for insights on the overall data that the team will review in the coming week.  An initial model has been built on a regression problem with the target variable is being ‘amount.’ The team will interpret this regression and look into other modeling objectives in the coming week. 

</details>

<details>
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

</details>

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
