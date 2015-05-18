#########################################################################################
# File:  gsub-commands.R
# Date:  2015-05-18  
# Author:  Joseph Flanagan
# email:    joseph.flanagan@helsinki.fi
# Purpose: explanation of gsub commands used to produce semi-clean-ceec.R 

#########################################################################################
    

    gsub("\\[\\{(.*?)\\{\\]", "\\1", x) #extract everything within [{ }] 
    
	gsub("\\[\\\\[A-Z]{2,}(.*?)\\\\\\]", " ", x) #remove everything within [\ \]if there is more than one capital letter (i.e., don't remove "I")
    
    gsub("\\[\\\\(.*?)\\\\\\]", "\\1", x) # extract everything within [\ \]
   
    gsub("<.*?>"," ", x) #remove everything with <  > 

    gsub("\\[\\}(.*?)\\}\\]", " ", x) # remove everthing within [}  }]

    gsub("\\[.*?\\]", " ", x) #remove everything within [ ]
    
    gsub("\\(\\^(.*?)\\^\\)", "\\1", x) #extract everything within (^  ^)

