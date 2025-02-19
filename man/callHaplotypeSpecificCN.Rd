% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/callHSCN.R
\name{callHaplotypeSpecificCN}
\alias{callHaplotypeSpecificCN}
\title{Call haplotype specific copy number in single cell datasets}
\usage{
callHaplotypeSpecificCN(
  CNbins,
  haplotypes,
  eps = 0.000000000001,
  loherror = 0.02,
  maxCN = NULL,
  selftransitionprob = 0.95,
  progressbar = TRUE,
  ncores = 1,
  phasebyarm = FALSE,
  minfrac = 0.7,
  likelihood = "binomial",
  minbins = 100,
  minbinschr = 10,
  phased_haplotypes = NULL,
  clustering_method = "copy",
  maxloherror = 0.035,
  mincells = 10,
  overwritemincells = NULL,
  cluster_per_chr = TRUE,
  viterbiver = "cpp",
  filterhaplotypes = 0.1
)
}
\arguments{
\item{CNbins}{single cell copy number dataframe with the following columns: \code{cell_id}, \code{chr}, \code{start}, \code{end}, \code{state}, \code{copy}}

\item{haplotypes}{single cell haplotypes dataframe with the following columns: \code{cell_id}, \code{chr}, \code{start}, \code{end}, \code{hap_label}, \code{allele1}, \code{allele0}, \code{totalcounts}}

\item{eps}{default 1e-12}

\item{loherror}{LOH error rate for initial assignment, this is inferred directly from the data in the second pass, default = 0.02}

\item{maxCN}{maximum copy number to infer allele specific states, default=NULL which will use the maximum state from CNbins}

\item{selftransitionprob}{probability to stay in the same state in the HMM, default = 0.95, set to 0.0 for an IID model}

\item{progressbar}{Boolean to display progressbar or not, default = TRUE, will only show if ncores == 1}

\item{ncores}{Number of cores to use, default = 1}

\item{minfrac}{Minimum proportion of haplotypes to retain when clustering + phasing, default = 0.8}

\item{likelihood}{Likelihood model for HMM, default is \code{binomial}, other option is \code{betabinomial} or use \code{auto} and the algorithm will choose the likelihood that best fits the data.}

\item{minbins}{Minimum number of bins containing both haplotype counts and copy number data for a cell to be included}

\item{minbinschr}{Minimum number of bins containing both haplotype counts and copy number data per chromosome for a cell to be included}

\item{phased_haplotypes}{Use this if you want to manually define the haplotypes phasing if for example the default heuristics used by schnapps does not return a good fit.}

\item{clustering_method}{Method to use to cluster cells for haplotype phasing, default is \code{copy}, other option is \code{breakpoints}}

\item{maxloherror}{Maximum value for LOH error rate}

\item{mincells}{Minimum cluster size used for phasing}

\item{overwritemincells}{Overwrite the the number of cells to use for clustering/phasing}

\item{cluster_per_chr}{Whether to cluster per chromosome to rephase alleles or not}

\item{filterhaplotypes}{filter out haplotypes present in less than X fraction, default is 0.1}
}
\value{
allele specific copy number object which includes dataframe similar to input with additional columns which include
\itemize{
\item \code{Maj} (Major allele copy number)
\item \code{Min} (Minor allele copy number)
\item \code{state_AS_phased} (phased state of the form Maj|Min )
\item \code{state_AS} (mirrored state of the form Maj|Min)
\item \code{LOH} (is bin LOH or not)
\item \code{state_phase} (state describing which is the dominant allele and whether it is LOH or not)
\item \code{state_BAF} (binned discretized BAF value calculated as Min / (Maj + Min))
}
}
\description{
Call haplotype specific copy number in single cell datasets
}
\examples{
sim_data <- simulate_data_cohort(
  clone_num = c(20, 20),
  clonal_events = list(
    list("1" = c(2, 0), "5" = c(3, 1)),
    list("2" = c(6, 3), "3" = c(1, 0))
  ),
  loherror = 0.02,
  coverage = 100
)

results <- callHaplotypeSpecificCN(sim_data$CNbins, sim_data$haplotypes)
}
