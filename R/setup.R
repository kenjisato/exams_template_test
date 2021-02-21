## Directories ----
#'
#' The test code requires the following files are properly installed.
#' - inst/nops/eval.html
#' - inst/nops/eval.txt
#' - inst/nops/eval.tex
#' - R/nops_eval_write_template.R
#'
#' Since the published development version on R-Forge lists them in .Rbuildignore,
#' please make a local clone and comment out those lines manually.
#' Please specify
#' - path to the local development version (`pkg_dir`).
#' - library path for the development version (`lib_dir`).
#'
#' Then change `is_set` variable to TRUE.
#'

pkg_dir <- "~/OneDrive/R-Packages/exams/pkg/exams"
lib_dir <- "~/.R/lib-dev"
is_set <- TRUE

if (!is_set) {
  stop("In setup.R: Please specify the paths and set `is_set` to TRUE before moving on. \nThe script you are trying to run will produce side effects. Please run it carefully.")
}

## Cleanup ----

try(detach("package:exams", unload = TRUE), silent = TRUE)
unlink(file.path(lib_dir, "exams"), recursive = TRUE)
unlink(list.files(here::here("Results"), full.names = TRUE), recursive = TRUE)

## Install and attach Local Development Version ----
install.packages(pkgs = pkg_dir, lib = lib_dir, repos = NULL)
library(exams, lib.loc = lib_dir)

# Check installation

required_files <- c("nops/eval.html", "nops/eval.txt", "nops/eval.tex")
for (required_file in required_files) {
  stopifnot(file.exists(system.file(required_file, package = "exams")))
}
try(invisible(exams:::nops_eval_write_template))
