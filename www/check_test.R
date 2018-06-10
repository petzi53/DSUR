check_exer_1_v0 <- function(USER_CODE) {
    code <- for_checkr(USER_CODE)
    desired <- rep(1:4, each = 3)
    line_where(code, insist(all(V == desired), "Your vector is {{V}}. That is not the result asked for."))
}

check_add_two_and_two <- function(USER_CODE) {
    code <- for_checkr(USER_CODE)
    t1 <- line_where(code, insist(all(F == "+"), "Your operator is {{F}}. This is not the assigned task."))
    if (failed(t1)) return(t1)
    t2 <- line_where(code, insist(all(V == 4), "Your solution is {{V}}. This is not the result (= 4) asked for."))
    if (failed(t2)) return(t2)
    line_binding(code, 2 + 2, failif(FALSE, "The pattern did not match."), message = "The result is correct, but I was looking for 2 + 2.")
}

