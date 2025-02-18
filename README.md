# ShinyAnonymizer - README

## Overview
ShinyAnonymizer is a powerful tool designed for anonymizing and encrypting sensitive datasets using R and PostgreSQL. It provides various anonymization techniques, encryption algorithms, and hashing methods to ensure data privacy and security, complying with regulations like GDPR.

## Dependencies
To successfully install and run ShinyAnonymizer, ensure you have the following components installed:

## Required Software
- **R (Version 4.4.2 or later)** - Programming language required for running the tool.
- **R-Studio** - IDE for running R scripts efficiently.
- **PostgreSQL (Version 12.22 or later)** - Database management system for handling datasets.

## Installation Guide

## Step 1: Install R and R-Studio
1. Download R version 4.4.2 from the official website: [https://cran.r-project.org/](https://cran.r-project.org/).
2. Install R following the on-screen instructions.
3. Download R-Studio from: [https://posit.co/download/rstudio-desktop/](https://posit.co/download/rstudio-desktop/).
4. Install R-Studio and ensure it detects your R installation.

## Step 2: Install PostgreSQL
1. Download PostgreSQL 12.22 from the official website: [https://www.postgresql.org/download/](https://www.postgresql.org/download/).
2. Run the executable file and follow the installation instructions.
3. During installation, select the 12.22 v1 package from the available package options.
4. Set up a password (choose a secure password of your liking).
5. Use port 5432 (recommended) for PostgreSQL.

## Step 3: Configure R-Studio
1. Open R-Studio.
2. Install all recommended packages and updates for R-Studio.
3. Navigate to Tools → Install Packages and install the required R packages:
   - `digest`
   - `RPostgreSQL`
   - `Plotly`
   - `dplyr`
   - `Shiny`

## Step 4: Configure PostgreSQL Database
1. Open PGAdmin (PostgreSQL's GUI management tool).
2. Create a new database for storing datasets.
3. Load your dataset into the newly created database.
4. Once the data is uploaded, you can close PGAdmin.

## Usage
Once all dependencies are installed and configured, to run the ShinyAnonymizer app:
1. Ensure your ShinyAnonymizer app script (e.g., `app.R`) is in your working directory.
2. Run the following command:
```R
runApp("path/to/your/app.R", launch.browser = TRUE)
```
or if the script is in the working directory:
```
shiny::runApp()
```
## Step 5: Interact with the App

Once the app starts, your default web browser should open the ShinyAnonymizer interface. From there, you can:

1.Load datasets from PostgreSQL.
2.Apply anonymization, encryption, and hashing.
3.Visualize anonymized data with Plotly.



The GUI of the system


![Load Data](https://user-images.githubusercontent.com/47419196/65087774-9e571980-d9bf-11e9-9473-ba93d5991cd4.jpg)

Encrypted Data

![All_encryption Algorithms together](https://user-images.githubusercontent.com/47419196/65088223-30135680-d9c1-11e9-938e-d09f9a64fb27.jpg)

Hashed Data

![Hashing Algorithms All together](https://user-images.githubusercontent.com/47419196/65088372-c9426d00-d9c1-11e9-8081-41823373503a.jpg)

Anonymized Data

![Anonymization_Algorithms All together](https://user-images.githubusercontent.com/47419196/65088516-68fffb00-d9c2-11e9-8a33-97eae0436af6.jpg)

Visualized Data

![DashBoard](https://user-images.githubusercontent.com/47419196/65088707-fba09a00-d9c2-11e9-9287-821b8ae5291a.jpg)

Summary Statistics

![Summary_Statistics](https://user-images.githubusercontent.com/47419196/65088788-53d79c00-d9c3-11e9-911f-87d530bd6923.jpg)


## Key Features
1.Data Anonymization: Suppression, Generalization, Removing Information, and Bottom Coding.
2.Data Encryption: DES, XDES, BLOWFISH, and AES-512 encryption methods.
3.Hashing Algorithms: MD5, SHA-512, CRC32, and XXHASH64.
4.Database Integration: Securely store and retrieve data from PostgreSQL.
5.Data Visualization: Generate graphical representations of anonymized datasets.

## Troubleshooting
1.If PostgreSQL does not connect, ensure port 5432 is open and the correct credentials are used.
2.Ensure all required R packages are installed before executing the scripts.
3.Restart R-Studio if you encounter package dependency errors.

## License

ShinyAnonymizer is a proprietary software product available under the author's license. Unauthorized distribution, modification, or commercial use without prior approval is strictly prohibited.


Conclusion

•	Stand-alone software library that can be easily integrated and used into other systems

•	Extendable to many more algorithms 

•	Well-tested and carefully documented  

•	Robust environment for developing novel privacy models








