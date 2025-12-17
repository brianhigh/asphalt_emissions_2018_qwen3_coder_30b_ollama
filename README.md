# Asphalt Emissions Map

This repository visualizes asphalt-related emissions data from the U.S. Environmental Protection Agency (EPA) using a choropleth map of U.S. states.

## 🌍 Map Preview

![Asphalt Emissions Map](plots/asphalt_emissions_map.png)

## 📚 Citation

> Anthropogenic secondary organic aerosol and ozone production from asphalt-related emissions, *Environ. Sci.: Atmos.*, 2023,3, 1221-1230  
DOI: [https://doi.org/10.1039/D3EA00066D](https://doi.org/10.1039/D3EA00066D)

## 📁 Project Structure

- `create_asphalt_map.R`: Main R script to generate the map.
- `README.md`: This file.
- `plan.md`: Implementation plan.
- `tasks.md`: Task checklist.
- `walkthrough.md`: Step-by-step guide.
- `.gitignore`: Git ignore file for R projects.
- `data/`: Folder for downloaded data.
- `plots/`: Folder for saved plots.

```
.
├── create_asphalt_map.R
├── README.md
├── plan.md
├── tasks.md
├── walkthrough.md
├── .gitignore
├── data/
│   └── AP_2018_State_County_Inventory.xlsx
└── plots/
    └── asphalt_emissions_map.png
```

## 📁 Markdown Files

- [Plan](plan.md)
- [Tasks](tasks.md)
- [Walkthrough](walkthrough.md)


## Colophon

This project was created using Ollama CLI and qwen3-coder:30b with default Ollama context length (4096 tokens). (See [Modelfile](Modelfile).) The [prompt](prompt.md) is shown in the output below have a token count of 1031 tokens.

```
$ ollama pull qwen3-coder:30b
$ ollama show qwen3-coder:30b --modelfile > Modelfile
$ ollama run --verbose qwen3-coder:30b < prompt.md > output.md

total duration:       1m38.2198885s
load duration:        1m3.464115793s
prompt eval count:    1031 token(s)
prompt eval duration: 1.033089216s
prompt eval rate:     997.98 tokens/s
eval count:           1898 token(s)
eval duration:        33.357411526s
eval rate:            56.90 tokens/s
```

The original script was copied from [output.md](output.md) and saved as [create_asphalt_map.orig.R](create_asphalt_map.orig.R). Bugs were fixed manually and the updated script was saved to the file [create_asphalt_map.R](create_asphalt_map.R). Those edits can be seen in the [create_asphalt_map.R.diff](create_asphalt_map.R.diff) `diff` file created with:

```
diff -u create_asphalt_map.orig.R create_asphalt_map.R > create_asphalt_map.R.diff
```

The other Markdown files were also created from `output.md` by copying and pasting the content into new files and saving with the appropriate file names. Other than this Colophon, the content of the Markdown files was left unchanged.
