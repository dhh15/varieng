# varieng
GitHub area for code and other stuff relating to the English language variation theme

The data for the shiny app was produced by the following steps:

1. Create a `data/` directory in the root directory of the project
2. Place the `ceec-normalised/` directory in the `data/` directory
3. Run the `pos-tagging.R` script in the `R/` directory 
4. Run the `export-semiclean-ceec.R` script in the `R/` directory
5. Run the `create-scottish-subcorpora.R` script in the `R/` directory

(The scripts used to produce this data should be rewritten to be more streamlined)

To run the shiny app, simply type `runApp("shiny")` in the R console window (you may have to install some packages)
