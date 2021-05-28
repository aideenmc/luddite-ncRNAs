#Determining which cell lines in common between Klijn and CCLE
library(readr)
#Import Klijn
klijn <- read_csv("Documents/College Documents/MScProject/Data/klijn_ovary_celllines.csv")

#Import CCLE
CCLE <- read_delim("Documents/College Documents/MScProject/Data/CCLE_Cell_lines_annotations_20181226.txt", "\t", escape_double = FALSE, trim_ws = TRUE)
#subset for ovary
CCLE_ovary <- subset(CCLE, CCLE$Site_Primary == 'ovary')

#Check for lines in common
incommon <- klijn[klijn$`Cell line`%in% CCLE_ovary$Name,]
incommoncheck <- CCLE_ovary[CCLE_ovary$Name %in% klijn$`Cell line`,]

klijn_only <- klijn[!klijn$`Cell line`%in% CCLE_ovary$Name,]
CCLE_only <- CCLE_ovary[!CCLE_ovary$Name %in% klijn$`Cell line`,]
