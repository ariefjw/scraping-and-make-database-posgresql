# Scraping IKEA Product Data

## Description
This notebook is designed to scrape product data from the IKEA Indonesia website using Selenium and BeautifulSoup. The data collected includes product names, prices, categories, descriptions, product images, and product links. The obtained data is then processed and saved in CSV format for further analysis or storage in a database.

## Notebook Structure
1. **Import Libraries**: Load all the necessary libraries for scraping and data processing.
2. **Data Cleaning Function**: Define functions to clean text and change data formats.
3. **Data Retrieval**: Retrieve data from several product pages on the IKEA site using Selenium to control the browser.
4. **Data Checking**: Check the number of data entries successfully retrieved.
5. **Data Transformation**: Change the data format to facilitate analysis, including changing data types and destructuring the description column.
6. **Data Storage**: Save the processed data into a CSV file.

## How to Use
1. Make sure you have Python and all the required libraries installed. You can install them using pip:
   ```bash
   pip install selenium beautifulsoup4 pandas
   ```
2. Download and install the driver for the browser you are using (for example, ChromeDriver for Google Chrome).
3. Run this notebook in a Jupyter Notebook or JupyterLab environment.
4. After running all the cells, the file `product_ikea.csv` will be generated in your working directory.

## Notes
- Make sure to comply with the scraping policy of the IKEA website and avoid excessive scraping.
- The data collected may change over time, depending on updates made by the IKEA website.

