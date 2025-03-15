step_rolling_mean <- function(recipe,
                              ...,
                              role = NA,
                              trained = FALSE,
                              size = 3,
                              columns = NULL,
                              skip = FALSE,
                              id = rand_id("rolling_mean")) {
  add_step(
    recipe,
    step_rolling_mean_new(
      terms = ellipse_check(...),
      role = role,
      trained = trained,
      size = size,
      columns = columns,
      skip = skip,
      id = id
    )
  )
}

step_rolling_mean_new <- function(terms,
                                  role,
                                  trained,
                                  size,
                                  columns,
                                  skip,
                                  id) {
  step(
    subclass = "rolling_mean",
    terms = terms,
    role = role,
    trained = trained,
    size = size,
    columns = columns,
    skip = skip,
    id = id
  )
}


prep.step_rolling_mean <- function(x, training, info = NULL, ...) {
  col_names <- recipes_eval_select(x$terms, training, info)

  check_type(training[, col_names], types = c("double", "integer"))

  step_rolling_mean_new(
    terms = x$terms,
    role = x$role,
    trained = TRUE,
    size = x$size,
    columns = col_names,
    skip = x$skip,
    id = x$id
  )
}

bake.step_rolling_mean <- function(object, new_data, ...) {
  for (rolling_size in object$size) {
    for (col_name in object$columns) {
      new_col_name <- paste0("rolling_mean", rolling_size, "_", col_name)

      new_data[[new_col_name]] <- slider::slide_dbl(new_data[[col_name]],
                                                    mean,
                                                    .before = rolling_size - 1,
                                                    .complete = TRUE)
    }
  }

  new_data
}

print.step_rolling_mean <-
  function(x, width = max(20, options()$width - 30), ...) {
    title <- "Rolling mean "
    print_step(x$columns, x$terms, x$trained, title, width)
    invisible(x)
  }
