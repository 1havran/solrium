library("devtools")

res <- revdep_check(threads = 4)
revdep_check_save_summary()
revdep_check_print_problems()
