### --- constants ---
label_pnml <- "Population-Normalised Mass Load\n(mg/day/1000 people)"

# inclusive interval on both boundaries
period_leuven <- interval(ymd("2019-09-02"), ymd("2022-04-20"))

# period_brussels <-  dmy("29/02/2020") %--% dmy("27/10/2021")
period_brussels <- interval(ymd("2020-04-17"), ymd("2021-04-16"))

# population fluctuation events
population_fluctuation_events <- tribble(
  ~location, ~category, ~start_date, ~end_date,
  # lockdown A
  "Leuven", "lockdown", ymd("2020-03-18"), ymd("2020-05-04"),
  "Brussel-Noord", "lockdown", ymd("2020-03-18"), ymd("2020-05-04"),

  # lockdown B
  "Leuven", "lockdown", ymd("2020-10-19"), ymd("2021-05-08"),
  "Brussel-Noord", "lockdown", ymd("2020-10-19"), ymd("2021-05-08"),

  # holiday periods
  "Leuven", "holiday winter", ymd("2019-12-21"), ymd("2020-01-05"),
  "Leuven", "holiday winter", ymd("2020-12-19"), ymd("2021-01-03"),
  "Leuven", "holiday winter", ymd("2021-12-25"), ymd("2022-01-09"),

  "Leuven", "holiday summer", ymd("2020-07-01"), ymd("2020-08-31"),
  "Leuven", "holiday summer", ymd("2021-07-01"), ymd("2021-08-31"),


  "Brussel-Noord", "holiday winter", ymd("2020-12-19"), ymd("2021-01-03"),
  "Brussel-Noord", "holiday summer", ymd("2020-07-01"), ymd("2020-08-31")
)

# colour blind friendly
col_green <- "#009E73"
col_orange <- "#E69F00"
col_red <- "#CC79A7"

col_location_values <- c("Antwerpen-Zuid" = "#F8766D",
                         "Boom" = "#7CAE00",
                         "Brussel-Noord" = "#00BFC4",
                         "Leuven" = "#C77CFF")

### --- visualisation functions ---



geom_cutoff <- function(ycutoff) {

  geom_hline(yintercept = ycutoff,
             colour = "black",
             linetype = "dashed")
}

