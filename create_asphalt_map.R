# create_asphalt_map.R

# Load required packages
pacman::p_load(
  readxl,
  dplyr,
  ggplot2,
  usmap,
  sf,
  here,
  vroom,
  lubridate,
  stringr
)

# Define paths
data_path <- here("data")
plots_path <- here("plots")
file_name <- "AP_2018_State_County_Inventory.xlsx"
file_url <- "https://pasteur.epa.gov/uploads/10.23719/1531683/AP_2018_State_County_Inventory.xlsx"

# Create folders if they don't exist
if (!dir.exists(data_path)) dir.create(data_path)
if (!dir.exists(plots_path)) dir.create(plots_path)

# Download data if not present
file_path <- file.path(data_path, file_name)
if (!file.exists(file_path)) {
  download.file(file_url, file_path, mode = "wb")
  message("Downloaded data file.")
} else {
  message("Data file already exists.")
}

# Read data from Excel sheet
tryCatch({
  emissions_data <- read_excel(
    file_path,
    sheet = "Output - State",
    .name_repair = "unique_quiet"
  ) %>%
    select(State, `Total kg/person`) %>%
    rename(total_kg_per_person = `Total kg/person`, state = `State`) %>%
    mutate(
      state = str_to_lower(state),
      total_kg_per_person = suppressWarnings(as.numeric(total_kg_per_person))
    )
  
  message("Successfully read emissions data.")
}, error = function(e) {
  stop("Error reading emissions data: ", e$message)
})

# Get state map data
tryCatch({
  us_states <- plot_usmap(data = emissions_data, values = "total_kg_per_person") +
    scale_fill_gradient2(
      low = "darkgreen",
      mid = "yellow",
      high = "red",
      midpoint = median(emissions_data$total_kg_per_person, na.rm = TRUE),
      name = "Total kg/person"
    ) +
    theme_void() +
    theme(
      plot.title = element_text(hjust = 0.5, size = 16),
      plot.subtitle = element_text(hjust = 0.5, size = 12),
      plot.caption = element_text(hjust = 0, size = 10),
      panel.background = element_rect(fill = "white"),
      legend.position = "right"
    ) +
    labs(
      title = "Asphalt Emissions in U.S. States (2018)",
      subtitle = "Total kg/person of asphalt-related emissions from the 2018 State County Inventory",
      caption = "Source: U.S. Environmental Protection Agency (EPA) - 2018 State County Inventory"
    )

  # Save plot
  ggsave(
    filename = file.path(plots_path, "asphalt_emissions_map.png"),
    plot = us_states,
    width = 10,
    height = 6,
    dpi = 300,
    units = "in",
    bg = "white" # Explicitly set background for PNG
  )

  message("Map saved successfully to ", plots_path)

}, error = function(e) {
  stop("Error creating map: ", e$message)
})

