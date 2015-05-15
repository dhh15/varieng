# varieng
GitHub area for code and other stuff relating to the English language variation theme

## Shiny app
The data for the shiny app was produced by the following steps:

1. Create a `data/` directory in the root directory of the project
2. Download the `ceec-normalised/` directory and place it in the `data/` directory
3. Download the `ceec-metadata/` directory and place it in the `data/` directory
3. Run the `pos-tagging.R` script in the `R/` directory 
4. Run the `export-semiclean-ceec.R` script in the `R/` directory
5. Run the `create-period-subcorpora.R` script in the `R/` directory

(The scripts used to produce this data should be rewritten so they are are more streamlined)

To run the shiny app, open `varieng.Rproj` and type `runApp("shiny")` in the R console window. If you receive an error message, check that `varieng/` is the root directory. You may also have to install some packages. 

The shiny app can be viewed [here]("https://jflanagan.shinyapps.io/shiny/")
