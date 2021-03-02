## Edit setup.R first! ----

source("R/setup.R")

## NPS Write Flavors ----
# They are in the package now.
# source("R/flavors.R")


## Evaluation Tests ----

register <- "Data/Exam-2015-07-29.csv"
solutions <- "Data/metainfo.rds"
scans <- "Data/nops_scan_20210219121814.zip"

dir.create("Results/pdf")
nops_eval(register, solutions, scans, language = "ja",
          flavor = "pdf", zip = FALSE, dir = "Results/pdf")

dir.create("Results/html")
nops_eval(register, solutions, scans, language = "ja",
          flavor = "html", zip = FALSE, dir = "Results/html")

dir.create("Results/txt")
nops_eval(register, solutions, scans, language = "de",
          flavor = "txt", zip = FALSE, dir = "Results/txt")

dir.create("Results/pandoc_docx")
nops_eval(register, solutions, scans, language = "de",
          flavor = "pandoc", zip = FALSE, dir = "Results/pandoc_docx", return_scan = FALSE,
          pandoc_to = "docx")

dir.create("Results/pandoc_html")
nops_eval(register, solutions, scans, language = "de",
          flavor = "pandoc", zip = FALSE, dir = "Results/pandoc_html", return_scan = FALSE,
          pandoc_to = "html")

dir.create("Results/pandoc_pdf")
nops_eval(register, solutions, scans, language = "hr",
          flavor = "pandoc", zip = FALSE, dir = "Results/pandoc_pdf", return_scan = FALSE,
          pandoc_to = "pdf")

