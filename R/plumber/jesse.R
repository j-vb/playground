print("hello")

5 + 4 / 2

library(plumber)
##* @parser json list(simplifyVector = FALSE)
# pr <- Plumber$new()
r <- pr("plumber.R") %>%
  pr_run(port = 1238)


handleSigTerm <- function() {
  r$shutdown()
  # q("no")
}

# Set up a loop to listen for SIGTERM
while (TRUE) {
  # Sleep for a short interval
  Sys.sleep(1)

  # Check if SIGTERM signal is received
  if (file.exists(".sigterm")) {
    # Call the function to handle SIGTERM
    handleSigTerm()
  }
}
