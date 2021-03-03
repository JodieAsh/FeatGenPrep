prepare_columns <- function(data){
  data <- as.data.table(data)
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

  # res <- epitopes::calc_features(synthetic_data, max.N = 2)
  return(data)

}
