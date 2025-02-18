# ShinyAnonymizer - README

## Overview
ShinyAnonymizer is a powerful tool designed for anonymizing and encrypting sensitive datasets using R and PostgreSQL. It provides various anonymization techniques, encryption algorithms, and hashing methods to ensure data privacy and security, complying with regulations like GDPR.

## Dependencies
To successfully install and run ShinyAnonymizer, ensure you have the following components installed:

### Required Software
- **R (Version 4.4.2 or later)** - Programming language required for running the tool.
- **RStudio** - IDE for running R scripts efficiently.
- **PostgreSQL (Version 12.22 or later)** - Database management system for handling datasets.

## Installation Guide

### Step 1: Install R and RStudio
1. Download R version 4.4.2 from the official website: [CRAN R Project](https://cran.r-project.org/).
2. Follow the on-screen instructions to install R.
3. Download RStudio from: [Posit RStudio](https://posit.co/download/rstudio-desktop/).
4. Install RStudio and ensure it detects your R installation.

### Step 2: Install PostgreSQL
1. Download PostgreSQL 12.22 from the official website: [PostgreSQL Download](https://www.postgresql.org/download/).
2. Run the executable file and follow the installation instructions.
3. During installation, select the **12.22 v1** package.
4. Set up a secure password.
5. Use **port 5432** (recommended) for PostgreSQL.

### Step 3: Configure RStudio
1. Open RStudio.
2. Install all recommended updates.
3. Install the required R packages by running the following command in the R console:
   ```R
   install.packages(c("digest", "RPostgreSQL", "plotly", "dplyr", "shiny"))
   ```

### Step 4: Configure PostgreSQL Database
1. Open **pgAdmin** (PostgreSQL's GUI management tool).
2. Create a new database for storing datasets.
3. Load your dataset into the newly created database.
4. Once the data is uploaded, you can close pgAdmin.

## Usage
Once all dependencies are installed and configured, you can run the ShinyAnonymizer app by following these steps:

1. Ensure your ShinyAnonymizer app script (e.g., `app.R`) is in your working directory.
2. Run the following command in RStudio:
   ```R
   library(shiny)
   runApp("path/to/your/app.R", launch.browser = TRUE)
   ```
   If the script is in the working directory, simply run:
   ```R
   shiny::runApp()
   ```

### Step 5: Interact with the App
Once the app starts, your default web browser should open the ShinyAnonymizer interface. From there, you can:

- Load datasets from PostgreSQL.
- Apply anonymization, encryption, and hashing.
- Visualize anonymized data with Plotly.

## Key Features
- **Data Anonymization:** Suppression, Generalization, Removing Information, and Bottom Coding.
- **Data Encryption:** DES, XDES, BLOWFISH, and AES-512 encryption methods.
- **Hashing Algorithms:** MD5, SHA-512, CRC32, and XXHASH64.
- **Database Integration:** Securely store and retrieve data from PostgreSQL.
- **Data Visualization:** Generate graphical representations of anonymized datasets.

## Troubleshooting
- If PostgreSQL does not connect, ensure **port 5432** is open and the correct credentials are used.
- Ensure all required R packages are installed before executing the scripts.
- Restart RStudio if you encounter package dependency errors.

## License
ShinyAnonymizer is a proprietary software product available under the author's license. Unauthorized distribution, modification, or commercial use without prior approval is strictly prohibited.

## Conclusion
- **Standalone library** that can be easily integrated into other systems.
- **Extendable** to support additional anonymization and encryption algorithms.
- **Well-tested and carefully documented** for ease of use.
- **Robust environment** for developing novel privacy models.
