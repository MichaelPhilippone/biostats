# Working Directory
setwd("C:/Users/philipm3/OneDrive - Cleveland Clinic/Academics/_Biostatistics")

# Load the XL file
CHAOSS <- 
  readXL("C:/Users/philipm3/OneDrive - Cleveland Clinic/Academics/_Biostatistics/Handedness in Surgery Study data.xlsx",
   rownames=FALSE, header=TRUE, na="", sheet="Sheet1", stringsAsFactors=TRUE)
str(CHAOSS)

# Subset of only R-hand surgeons:
Righthanders <- subset(CHAOSS, subset=Hand=="right")
str(Righthanders)

# Create variabe of 'Quick' to categorize fast vs not surgery times (<5 or >5)
CHAOSS <- within(CHAOSS, {
  Quick <- Recode(Time, '0:5="1"; 5.01:1000="0"; else="NA"', as.factor=TRUE,
   to.value="=", interval=":", separator=";")
})
str(CHAOSS)

