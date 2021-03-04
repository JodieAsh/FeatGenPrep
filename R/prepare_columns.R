#' Adds columns to data in preparation for feature generation using the epitopes package
#'
#' @param data a *data.table*
#'
#' @return Data table of class *windowed_epit_dt* containing the new columns.
#'
#' @author Jodie Ashford (\email{ashfojsm@@aston.ac.uk})

#' @export
prepare_columns <- function(data){
  data <- data.table::as.data.table(data)
  class(data) <- c(class(data), "windowed_epit_dt")
  data$Info_sourceOrg_id <- "0000"
  data$Info_protein_id <- "0000"
  data$Info_epitope_id <- "0000"
  data$Info_center_pos <- 1:nrow(data)
  data$Info_host_id <- '0000'
  data$Info_n_Positive <- '0'
  data$Info_n_Negative <- '0'
  data$Info_TSeq_accver <- '0000'
  data$Info_TSeq_taxid <- '0000'
  data$Info_TSeq_orgname <- 'name'

  data <- epitopes::calc_features(data, max.N = 2)
  return(data)

}
