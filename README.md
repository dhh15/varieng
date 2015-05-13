# varieng
GitHub area for code and other stuff relating to the English language variation theme

The data for the shiny app was produced by the following steps:

1. Create a `data/` directory in the root directory of the project
2. Place the `ceec-normalised` directory in the `data/` directory
3. Run the `export-semiclean-ceec.R` script in the `R` directory 
4. Run the `create-subcorpora.R` script in the `R` directory

(create-subcorpora.R will ultimately be converted into a function. Right now, the letter writer needs to be entered at several different points in the script)
