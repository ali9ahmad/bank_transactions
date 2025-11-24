Bank Project

Creating Fake Data Sources
First, we generated artificial data based on the project’s dataset requirements.

The first dataset was for customers and was in CSV format. To simulate a more realistic experience, I aimed to clean and sort the data, which is why I requested more realistic entries.
The second dataset focused on transactions and needed to be in JSON format.
The third dataset included branch logs to track which transactions occurred at each bank branch. This initial step is referred to as the bronze layer of the dataset.
Next Steps
I explored various methods for uploading the data. The Customer.csv file was uploaded directly into SSMS using the SSMS wizard, and I worked with it utilizing DDL and DML commands.

The other two datasets were transferred to VS Code for further practice using Pandas. I cleaned and transformed the data into a usable format with the help of Pandas and regular expressions. Once the files were ready, I used the to_csv command to convert them into CSV format. My goal was to have all files in one folder and in a uniform format to facilitate future automation as much as possible. With these steps completed, the silver layer of the dataset was finalized.

Next came the gold layer of the dataset. This involved using SSMS to create a single database and prepare all datasets for table usage. After consolidating all necessary data sources into one folder in CSV format, I bulk-inserted them into SSMS. I then reviewed the data again, improved its quality, and eliminated unnecessary information. Using MS SQL with closures and joins, I created dimension and fact tables.

Once I was confident that my database was ready, I proceeded to the next step of creating visual representations.

The visualizations included a line chart displaying the trend of expenses over the year, along with bar charts comparing the performance of different branches to identify which one handled the most transactions. Additionally, a scatter chart illustrated the relationship between customers' income and their expenses.

Issues Faced
I encountered some challenges, such as data type mismatches. While collaborating closely with ChatGPT, I discovered that defining a column as varchar(10) and then attempting to insert data longer than 10 characters caused issues. Fortunately, this was easily resolved. Additionally, transferring data from Python to SSMS and Power BI presented some challenges, including various errors.

![Image](https://github.com/user-attachments/assets/cba6c5eb-b18f-406b-8b29-7733af4b92d8)

