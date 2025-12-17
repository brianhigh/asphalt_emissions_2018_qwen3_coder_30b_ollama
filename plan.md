# Implementation Plan

## 1. Data Acquisition
- Download the Excel file from the EPA URL.
- Save it in a `data/` folder.

## 2. Data Processing
- Read the "Output - State" sheet.
- Extract `State` and `Total kg/person`.
- Normalize state names (lowercase).
- Convert `Total kg/person` to numeric.

## 3. Map Creation
- Use `usmap::plot_usmap()` to create a base map including Alaska and Hawaii.
- Overlay the emissions data using `ggplot2`.
- Apply a custom color scale:
  - Low: dark green
  - Medium: yellow
  - High: red
- Add title, subtitle, and caption.

## 4. Visualization
- Remove axis titles and ticks.
- Set background to white.
- Save the plot as a PNG in the `plots/` folder.

## 5. Project Files
- Create necessary markdown files.
- Set up `.gitignore`.
- Document project structure in `README.md`.

