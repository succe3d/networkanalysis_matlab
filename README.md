# Network Security Analysis using Matlab


## Objective

This project aims to assess the security of Wi-Fi networks in a specific area by analyzing their encryption standards, signal strength, and channel usage. By using a Wi-Fi network scanner tool and MATLAB, we collect and process data on nearby Wi-Fi networks, visualizing the results to better understand the current state of network security. The findings from this analysis can help individuals and organizations identify potential vulnerabilities in their Wi-Fi networks, allowing them to make informed decisions about improving security measures. The project demonstrates the importance of network security in today's increasingly connected world and provides practical insights for enhancing the protection of wireless networks.

## Procedure

### Step 1: Install WiFi Explorer

Download and install WiFi Explorer on your computer from the official website: [WiFi Explorer](https://www.intuitibits.com/products/wifiexplorer/)

### Step 2: Collect Data Using WiFi Explorer

Open WiFi Explorer and start capturing Wi-Fi network packets in your vicinity. The free version will enable you to do this.

### Step 3: Export the Data

After collecting sufficient data, save the capture file as a CSV file by clicking on "File" > "Export All Networks" > "Export...". The captured file will be saved as `wifiexplorer.csv`.

### Step 4: Import the Data into MATLAB

Transfer the exported CSV file to the directory you're working in. Open MATLAB and navigate to the directory where you saved the CSV file. Use the following command to import the data:

```matlab
data = readtable('your_data_file.csv');
```

### Step 5: Process the Data

Identify the appropriate column names corresponding to encryption, signal strength, Band, Mode, MaxRate (Mbps), Generation, and channel usage. Then write computational code based on research to calculate the distribution of encryption standards, average signal strength, and channel usage using MATLAB functions such as `mean`, `median`, `mode`, and `histcounts`.

<img width="207" alt="image" src="https://github.com/user-attachments/assets/ae09b7d4-06a9-402c-ab50-8cabbddb6ff8">


### Step 6: Analyze Channel Usage

Write computational code to calculate the number of networks using each channel and create a bar chart to show the distribution of networks across channels.

### Step 7: Analyze Signal Strength Distribution for Each Encryption Type

Plot a histogram showing the signal strength distribution for each encryption type.

<img width="276" alt="image" src="https://github.com/user-attachments/assets/5a134984-9c7e-4413-8903-0eb8118adf35">

### Step 8: Calculate and Display Statistics for Encryption Types

Write computational code to calculate the percentage of networks using each encryption type and the average signal strength per encryption type. Then display the results in a table and plot a pie chart showing the proportion of networks with different encryption types.

### Step 9: Analyze Bands, Modes, and Generations

Write computational code to calculate the percentage of networks using each band, mode, and generation. Then display the results in separate tables for each attribute.

### Step 10: Visualize the Distribution of Bands, Modes, and Generations

Create pie charts showing the proportion of networks with different bands and modes. Then plot a bar chart showing the proportion of networks by generation.

<img width="252" alt="image" src="https://github.com/user-attachments/assets/cd45426f-9726-4582-bcdb-71530f37ab7c">


<img width="258" alt="image" src="https://github.com/user-attachments/assets/5ed12f7f-6c0e-487c-9fdc-00a7932bfb97">

### Step 11: Analyze the Distribution of Max Rates

Create a histogram showing the distribution of Max Rates (Mbps) for the networks.

<img width="269" alt="image" src="https://github.com/user-attachments/assets/c1d1c70b-67bb-4a9e-a7b4-d53217bc22fc">
