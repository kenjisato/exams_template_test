# exams_template_test
Test code for nops_eval_write_template()

## Prepare

The test code requires the following files are properly installed.
- inst/nops/eval.html
- inst/nops/eval.txt
- inst/nops/eval.tex
- R/nops_eval_write_template.R

Since the published development version on R-Forge lists them in `.Rbuildignore`, please make a local clone and comment out those lines manually. 

Please modify setup.R to specify
- `pkg_dir`: path to the local development version.
- `lib_dir`: library path for the development version.

Then change `is_set` variable to TRUE.


## Run 

Notice that the scripts assume that the working directory is set to where `exams_template_test.Rproj` exists.

Run the following code:

```
source("R/test.R")
```

## Flavors 

In `R/flavors.R`, four flavors that are derived from `nops_eval_write_template()` are included. 

- `nops_eval_write_pdf`
- `nos_eval_write_html`
- `nops_eval_write_txt`
- `nops_eval_write_pandoc`

Except for `nops_eval_write_pandoc`, the final term in the function name tells the output formats. The templates are chosen accordingly. For `nops_eval_write_pandoc`, where pandoc carries out the post conversion, `pandoc_to` option is required. 

In the current test script, `nops_eval_write_pandc` is used to produce MS Word output. See `test.R`.

## Extension

Those who want to define their own template and post-processing procedure can do so by modifying the sample functions in `nops_eval_write_*`. We don't have to extend the package to meet (potentially diverse) users' demands since the flavors are written as user-defined functions. 


