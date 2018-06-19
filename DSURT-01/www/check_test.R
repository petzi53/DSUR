check_exer_1_v0 <- function(USER_CODE) {
    code <- for_checkr(USER_CODE)
    desired <- rep(1:4, each = 3)
    line_where(code, insist(all(V == desired), "Your vector is {{V}}. That is not the result asked for."))
}

check_add_two_and_two <- function(USER_CODE) {
    code <- for_checkr(USER_CODE)
    t1 <- line_where(code, insist(all(F == "+"),
          "Your operator is {{F}}. This is not the assigned task."))
    if (failed(t1)) return(t1)
    t2 <- line_where(code, insist(all(V == 4),
         "Your solution is {{V}}. This is not the result (= 4) asked for."))
    if (failed(t2)) return(t2)
    line_binding(code, 2 + 2, failif(FALSE, "The pattern did not match."),
         message = "The result is correct, but I was looking for 2 + 2.")
}

Mode <- function(x, na.rm = FALSE) {
    if (na.rm) {
        x = x[!is.na(x)]
    }
    ux <- unique(x)
    tab <- tabulate(match(x, ux))
    ux[tab == max(tab)]
}

check_compute_median <- function(USER_CODE) {
    code <- for_checkr(USER_CODE)

    t1 <- line_calling(code, median,
         message = "Use function `median()` to compute the median.")
    if (failed(t1)) return(t1)

    t_num <- numeric_arg(code, passif(TRUE, "OK!"),
                         message = "You didn't use a numeric vector!")
    if (failed(t_num)) return(t_num)

    check_binding(code, median(nff), passif(TRUE, "Well done!"),
                 message = "No, you need to call `median()` with `nff` as argument.")

    # How to test if the vector 'nff' is used?
    # check_binding works, but it is not s useful with a more complex task.
}

