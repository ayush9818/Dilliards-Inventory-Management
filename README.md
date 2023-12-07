# MLDS_400_G11


## Code Documentation

## Overview
The `codes` folder contains a series of Jupyter notebooks that form the backbone of our data analysis, feature engineering, model training, and evaluation. Each notebook is tailored to handle specific aspects of the machine learning and data science workflow.

## SQL Code
- **trnsact.sql** : Code to generate transact_grp_sku_store_quarter_v1.csv

## Notebooks

### FeatureEngineering_Notebook.ipynb
- **Purpose**: This notebook is dedicated to the feature engineering process, where raw data is transformed and enriched to improve the performance of machine learning models.
- **Brief Summary**:
  - Loads open-source state demographics data.
  - Reads all the tables from the database.
  - Reads the extracted grouped dataframe by SKU, STORE, and Quarter.
  - Merges all the dataframes together to create the final dataframe.
  - Engineers external features such as Menratio, Unemployment rate, Asian Perc, Profit margin, and discounted variables.
- **Data Used**:
  - `data/state_demographics.csv` - Open source data containing state level info of ratio of different ethinicity people, poverty ratio etc
  - `data/transact_grp_sku_store_quarter_v1.csv` - CSV fetched from database, grouped on STORE, SKU and Quarter
- **Note**
  - This notebook generates `df_final_sku_store_quarter_v3.csv` as output which is used in training_data_prep notebook
  - To generate `df_final_sku_store_quarter_v2.csv` for inference notebook below, run this notebook with data `data/transact_grp_sku_store_quarter_v2.csv`

### training_data_prep.ipynb
- **Purpose**: Used for preparing sampled dataset for training experiments. The dataset generated here is use in Modelling_Experiments_Notebook.ipynb
- **Brief Summary**:
  - Loads the feature-engineered dataframe from the file "df_final_sku_store_quarter_v3.csv."
  - Applies logarithm transformations to price variables.
  - Creates dummy variables for categorical variables as needed.
  - Samples 400,000 rows from the dataset.
  - Splits the data into an 80% training set and a 20% validation set.
- **Data Used**:
   - `data/df_final_sku_store_quarter_v3.csv` - sampled dataset containing 400k rows with 320k training samples and 80k validation samples


### Modelling_Experiments_Notebook.ipynb
- **Purpose**: Used for conducting various modeling experiments, fine-tuning hyperparameters, and selecting the best models based on performance metrics.
- **Brief Summary**:
  - Loads a sampled subset of the training dataset and divides it into training and validation sets for model evaluation.
  - Conducts experiments with a variety of machine learning models, including:
    - Linear Regression to establish a baseline performance.
    - Ridge Regression, employing K-fold cross-validation to find the optimal regularization parameter (lambda).
    - Lasso Regression, similarly using K-fold cross-validation to fine-tune the lambda value.
    - XGBoost Regressor, utilizing K-fold cross-validation to optimize its hyperparameters.
    - Decision Trees, evaluated using K-fold cross-validation to assess their performance.
    - Random Forest, to compare ensemble learning performance against other models.
  - Determines that the XGBoost Regressor outperforms other models, achieving an R-squared value of **73.72%** and a Mean Squared Error (MSE) of **0.256**.
- **Data Used**:
   - `data/sample_train_v1.csv` - sampled dataset containing 400k rows with 320k training samples and 80k validation samples

### Model_Inference_Notebook.ipynb
- **Purpose**: Focuses on applying trained models to new data to make predictions or inferences, essential for evaluating model performance on unseen data.
- **Brief Summary**:
   - Loads the dataset and the finalized XGBoost model for making inferences.
   - Applies logarithmic transformations to price-related variables such as cost, retail price, and revenue to normalize the distribution.
   - Generates dummy variables for categorical features to prepare them for model input.Conducts batch inference on the entire dataset, which contains approximately 6 million rows, to efficiently handle large-scale data.
   - Creates a dataframe for ROI analysis that assigns baseline revenue to each record, utilizing the previous quarter's revenue as a baseline for each SKU and store combination.
- **Data Used**:
  - `data/df_final_sku_store_quarter_v2.csv` - final dataframe which contain sku and store level information with engineered features and target values


### ROI_Analysis.ipynb
- **Purpose**: Conduct ROI analysis. We look at SKUs with non-null previous quarter revenues, and we compare our model predictions with a baseline model (predicting revenue as last quarter’s revenue) for overstocked items.
- **Brief Summary:**
  - Data Preparation: The script merges these datasets and filters for SKUs with non-null revenues in the previous quarter. It also calculates actual, baseline, and modelled total costs for each SKU.
  - Total Revenue Prediction: Comparing actual, predicted, and baseline revenues.
  - Number of Items Oversold: Assessing the count of items where predicted or baseline revenues exceeded actual revenues.
  - Dollar Savings from Overstocked Items: Estimating the monetary value saved or lost due to overstocking, as predicted by the models.
  - Cost Savings from Overstocked Items: Calculating cost savings or losses due to overstocking based on the actual cost of goods.
  - Visual Representation: The script generates various plots to visualize the findings, including revenue comparisons and bar charts showing the number of items oversold and the financial impact of these overstocking errors.
- **Data Used**: data/final_roi_analysis_v2.csv - final data frame with predictions of the quarter’s revenue, with a column called base_line which is the previous quarter’s revenue (NaN if not available)

### database_tables_eda.ipynb
- **Purpose**: Contains exploratory data analysis (EDA) on the database tables, providing insights and understanding of the underlying data structure and content.

### engineered_data_eda.ipynb
- **Purpose**: Explores the dataset post feature engineering to assess the quality and potential of the engineered features.

<!--
## Usage
To run these notebooks, ensure that you have Jupyter installed and that all the dependencies listed in `requirements.txt` are satisfied.

## Contributing
Contributions to these notebooks are welcome. Please fork the repository, make your changes, and submit a pull request for review.

## Contact
For any queries or assistance with these notebooks, please raise an issue in the repository or contact the maintainers directly.
-->


## Weekly Updates

<details>
  <summary>1st December</summary>

This week, our team wrapped up all the coding sections of our project, including the final visualizations of the cleaned data and the complete feature engineering process. We also finished training and fine-tuning our models for predicting future selling prices and evaluated their performance using metrics like MSE and R-squared. Alongside this, we compared our model to the basline model and conducted an ROI analysis to see how much we've saved on inventory costs compared to our baseline. 
We're almost done with the draft of our final report and have added some more analysis and visualizations to the appendix. In terms of presentation, we've started building slides and brainstorming how to present our project effectively. Lastly, we made sure all our files are organized and up-to-date on GitHub, including an updated README file.

</details>

<details>
  <summary>24th November</summary>

Now that the team is focusing on predicting the selling price based on store and SKU, we have been underway with data preprocessing and feature engineering phase, where we will clean, transform, and enrich our dataset to ensure it is primed for predictive modeling. This stage will involve scrutinizing data quality, scaling and encoding variables, and creating new features to capture the nuances that influence selling prices. Following this, we will embark on Building and Evaluating the New Model, selecting an algorithm, and training it while assessing its predictive power through validation. The aim is to fine-tune this predictive model to offer precise selling price forecasts.

In parallel, we will conduct business insight research to understand how these price predictions can strategically benefit our operations, influencing decisions from pricing strategies to inventory control. These insights will help in drafting our final report, the model’s performance, and its projected impact on enhancing business efficiency. The report will summarize our findings and recommendations for practical application in ensuring the model’s continued relevance and adaptability to market dynamics.
  
</details>

<details>
  
  <summary>17th November</summary>

**Data Preprocessing:**
This week, we continued refining our dataset through outlier detection and data filtering, focusing on SKUs with over 30 transactions. This has effectively reduced our dataset to around 50,000 rows, optimizing it for analysis.

**Model Development and Challenges:**
We initially shifted our model from regression to classification, categorizing items into three return probability tiers: high, medium, and low. We fitted various models - decision tree, Naive Bayes, logistic regression, random forest, and XGBoost, and conducted hyperparameter tuning. However, we encountered challenges with this approach. The classification model’s performance in predicting returns showed low accuracy, indicating that our current features might not be strong predictors.

**Strategic Pivot in Project:**
After evaluating our approach, we conducted more detailed correlation analysis and data visualization to understand the relationships between different variables better. This led us to a crucial decision to change our project’s direction. Instead of predicting item return probabilities, we are now focusing on predicting the selling price based on store and SKU.

**Business Impact Reassessment:**
Our initial research into the impact of eCommerce returns and business strategies remains valuable. However, we’re now redirecting this understanding towards how accurately predicting selling prices can provide business insights and potentially increase ROI.

**Revised Next Steps:**
With this new direction, our upcoming activities will include:
Data Preprocessing and Feature Engineering: Tailoring our dataset for the new predictive model.
Building and Evaluating the New Model: Developing, training, and testing a model aimed at predicting selling prices.
Business Insight Research: Investigating how knowledge of selling prices can inform and improve business decisions.
Final Report Preparation: Drafting a comprehensive report that details our methodologies, findings, and the potential impact of our new model on business operations.

</details>


<details>
  <summary>10th November</summary>

This week we focused on optimizing our approach by grouping data by SKU and employing word embeddings on two categorical columns: Brand and Color. This technique was particularly beneficial in generating dummy variables, allowing us to effectively account for the variety of brands and colors that regularly enter our data set. After establishing this approach in our dataset, we explored various regression models. 

These models were  tested through cross-validation, with their performance evaluated based on Mean Squared Error (MSE) and R-Squared (R2) metrics. Unfortunately, the results were underwhelming. The models' predictive capability was only marginally better than a simple horizontal line prediction, indicating a significant need for further refinement.

Given these results, we assessed the potential improvements from outlier detection and the transformation of current variables, aiming to enhance model performance. However, these adjustments did not yield the desired effect. Moving forward, we plan to shift our strategy by transforming the problem into a classification task. Our goal will be to predict whether an item falls into low, medium, or high return categories. 

Additionally, we intend to apply the same feature engineering techniques to transaction-level data. By building and assessing a model under these new parameters, we aim to determine if this approach yields more favorable results. This pivot in strategy reflects our commitment to continually adapting our methods to better understand and predict our data trends.
  
</details>

<details>
  <summary>3th November</summary>

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
  <summary>27th October</summary>

###Connection to Postgres via Python

Last week the team was successfully able to connect to the PostGres Database with the intention of working with the data set in Python. This week the team attempted to make the Python connection which included debugging and granting of permissions. The team is slated to be connected via Python by next week.

###Continued Data Cleaning

This past week several tables were being cleaned in small samples. Those changes have now been implemented into the full data set for completeness, though there are still data issues the team is looking into.

###Analytics

Plots have been generated for insights on the overall data that the team will review in the coming week.  An initial model has been built on a regression problem with the target variable is being ‘amount.’ The team will interpret this regression and look into other modeling objectives in the coming week. 

</details>

<details>
  <summary>20th October</summary>

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
  <summary>13th October</summary>
  
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
