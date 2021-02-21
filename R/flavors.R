# PDF Writer (LaTeX to PDF) ----

nops_eval_write_pdf <- function(results = "nops_eval.csv",
                                file = "exam_eval",
                                dir = ".", language = "en",
                                template = NULL, encoding = "UTF-8",
                                converter = "none", zip = TRUE,
                                return_scan = TRUE,
                                keep_tex = TRUE,
                                post_process = NULL, ...) {

  if (is.null(post_process)) {
    post_process <- function(x) {
      tinytex::pdflatex(x)
      delete_files <- setdiff(list.files(dirname(x)),
                              list.files(dirname(x), pattern = "\\.pdf$"))
      if (keep_tex) {
        delete_files <- list.files(delete_files, pattern = "(\\.tex$|\\.png$)")
      }
      unlink(delete_files)
    }
  }

  if (is.null(template)) {
    template <- system.file(file.path("nops", "eval.tex"), package = "exams")
  }
  exams:::nops_eval_write_template(results, file, dir, language, template, encoding,
                                   converter, zip, return_scan, post_process = post_process, ...)
}


#---- HTML Writer (HTML to HTML)

nops_eval_write_html <- function(results = "nops_eval.csv",
                                 file = "exam_eval",
                                 dir = ".", language = "en",
                                 template = NULL, encoding = "UTF-8",
                                 converter = "pandoc", zip = TRUE,
                                 return_scan = FALSE,
                                 convert_dcf_to = "html",
                                 post_process = NULL, ...) {

  if (is.null(template)) {
    template <- system.file(file.path("nops", "eval.html"), package = "exams")
  }
  exams:::nops_eval_write_template(results, file, dir, language, template, encoding,
                                   converter, zip, return_scan, convert_dcf_to,
                                   post_process = post_process, ...)
}


#---- Plain text Writer (TXT to TXT)

nops_eval_write_txt <- function(results = "nops_eval.csv",
                                file = "exam_eval",
                                dir = ".", language = "en",
                                template = NULL, encoding = "UTF-8",
                                converter = "pandoc", zip = TRUE,
                                return_scan = TRUE,
                                convert_dcf_to = "markdown_strict",
                                post_process = NULL, ...) {

  if (is.null(template)) {
    template <- system.file(file.path("nops", "eval.txt"), package = "exams")
  }
  exams:::nops_eval_write_template(results, file, dir, language, template, encoding,
                                   converter, zip, return_scan, convert_dcf_to,
                                   post_process = post_process, ...)
}


#---- Pandoc Writer

nops_eval_write_pandoc <- function(results = "nops_eval.csv",
                                   file = "exam_eval",
                                   dir = ".", language = "en",
                                   template = NULL, encoding = "UTF-8",
                                   zip = TRUE, return_scan = TRUE,
                                   convert_dcf_to = "markdown_strict",
                                   post_process = NULL,
                                   pandoc_to = NULL, pandoc_options = NULL, ...) {

  if (is.null(template)) {
    template <- system.file(file.path("nops", "eval.html"), package = "exams")
  }
  pandoc_from <- tools::file_ext(template)
  if (is.null(pandoc_to)) {
    stop("Output format cannot be empty.")
  }

  post_process <- function(x) {
    output <- paste0(tools::file_path_sans_ext(x), ".", pandoc_to)
    invisible(rmarkdown::pandoc_convert(x, to = pandoc_to, from = pandoc_from,
                                        options = pandoc_options,
                                        output = output))
  }

  exams:::nops_eval_write_template(results, file, dir, language, template, encoding,
                                   converter = "pandoc", zip, return_scan,
                                   convert_dcf_to = "markdown_strict",
                                   post_process = post_process, ...)
}


