## Step 1: Setup

Ensure you have the following packages installed:
```r
install.packages(c("readxl", "dplyr", "ggplot2", "usmap", "sf", "here", "vroom", "lubridate"))
```

## Step 2: Folder Creation

The script will automatically create `data/` and `plots/` folders.

## Step 3: Download Data

If `AP_2018_State_County_Inventory.xlsx` does not exist in `data/`, it will be downloaded from the EPA URL.

## Step 4: Read Data

The script reads the "Output - State" sheet and extracts the relevant columns.

## Step 5: Map Creation

A choropleth map is created using `usmap::plot_usmap()` and styled with `ggplot2`.

## Step 6: Save Plot

The final plot is saved as a PNG in `plots/`.

## Step 7: Review Output

Check `plots/asphalt_emissions_map.png` for the visualization.

