% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calc_assoc_metrics.R
\name{calc_assoc_metrics}
\alias{calc_assoc_metrics}
\title{Calculate Association Metrics for Bigrams}
\usage{
calc_assoc_metrics(
  data,
  doc_index,
  token_index,
  type,
  association = "all",
  verbose = FALSE
)
}
\arguments{
\item{data}{A data frame containing the corpus.}

\item{doc_index}{Column in 'data' which represents the document index.}

\item{token_index}{Column in 'data' which represents the token index.}

\item{type}{Column in 'data' which represents the tokens or terms.}

\item{association}{A character vector specifying which metrics to calculate.
Can be any combination of 'pmi', 'dice_coeff', 'g_score', or 'all'.
Default is 'all'.}

\item{verbose}{A logical value indicating whether to keep the intermediate
probability columns. Default is FALSE.}
}
\value{
A data frame with one row per bigram and columns for each
calculated metric.
}
\description{
This function calculates various association metrics
(PMI, Dice's Coefficient, G-score) for bigrams in a given corpus.
}
\examples{
data_path <- system.file("extdata", "bigrams_data.rds", package = "qtkit")
data <- readRDS(data_path)

calc_assoc_metrics(data, doc_index, token_index, type)

}
