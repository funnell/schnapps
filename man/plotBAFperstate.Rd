% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotting.R
\name{plotBAFperstate}
\alias{plotBAFperstate}
\title{Plot BAF distributions per allele specific state}
\usage{
plotBAFperstate(
  cn,
  minpts = 250,
  minfrac = 0.01,
  maxstate = 10,
  dens_adjust = 2,
  mincounts = 6
)
}
\arguments{
\item{cn}{Either a hscn object or a single cell allele specific copy number dataframe with the following columns: `cell_id`, `chr`, `start`, `end`, `state`, `copy`, `BAF`}

\item{minpts}{minimum number of points to include default = 250}

\item{minfrac}{states that are present below this fraction will be removed, default = 0.01}

\item{maxstate}{States with total copy number > maxstate will be removed, default = 10}

\item{dens_adjust}{density adjustment factor in the violin plots}

\item{mincounts}{filter out bins < mincounts from plotting, default = 6

\dontrun{
data("haplotypes")
data("CNbins")
haplotypes <- format_haplotypes_dlp(haplotypes, CNbins)
hscn <- callHaplotypeSpecificCN(CNbins, haplotypes, likelihood = "binomial")
plotBAFperstate(hscn, genes = "MYC")
}}
}
\description{
Plot BAF distributions per allele specific state
}
