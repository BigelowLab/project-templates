#' Read the DMR SST time series from the data directory
#' 
#' @param filename the name and path to the file
#' @return tibble of data
read_bbh <- function(filename = file.path(DATAPATH, "sst.csv")){
  
  x <- readr::read_csv(filename,
                       show_col_types = FALSE)
  return(x)
}

#' Retrieve BBH data from the online portal, write it to the data directory
#' 
#' @seealso \href{https://dmr-maine.opendata.arcgis.com/datasets/5fd6f3e57d794a409d72f47d78f15a32_0/explore?showTable=true}{DMR Data Portal}
#' @export
#' @param uri character, the URI of the dataset 
#' @return tibble of the SST data
fetch_bbh <- function(uri = "https://opendata.arcgis.com/datasets/5fd6f3e57d794a409d72f47d78f15a32_0.geojson"){
  
  x <- try(jsonlite::fromJSON(uri))
  if (inherits(x, "try-error")){
    stop("unable to fecth BBH SST")
  }

  x <- dplyr::as_tibble(x$features$properties) |>
    dplyr::mutate(COLLECTION_DATE = as.Date(COLLECTION_DATE, format = "%Y-%m-%dT05:00:00Z")) |>
    dplyr::rename(date = "COLLECTION_DATE",
                  Tmax = "SEA_SURFACE_TEMP_MAX_C",
                  Tmin = "SEA_SURFACE_TEMP_MIN_C",
                  Tavg = "SEA_SURFACE_TEMP_AVG_C") |>
    dplyr::select(dplyr::all_of(c("date", "Tmin", "Tmax", "Tavg"))) |>
    dplyr::write_csv(file.path(DATAPATH, "sst.csv"))
  return(x)
}
