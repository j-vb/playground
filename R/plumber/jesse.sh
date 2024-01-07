nodemon --exec "Rscript jesse.R" -e R,json --delay 50ms --signal SIGTERM
#R -e "x <- plumber::plumb();\nx$pr_run(host = '0.0.0.0', port = 4000)"
