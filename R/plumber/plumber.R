#* @get /
#* @serializer html
function(res) {
  res$setHeader("Content-Type", "text/html")
  return('
    <html>
      <body>
        <button onclick="location.href=\'http://127.0.0.1:1238/test\'"
        type="button">Test</button>
        <button onclick="location.href=\'http://127.0.0.1:1238/boxplot\'"
        type="button">Boxplot</button>
        <button onclick="location.href=\'http://127.0.0.1:1238/lineplot\'"
        type="button">Lineplot</button>
      </body>
    </html>
  ')
}

"
function(res) {
  res$setHeader("Content-Type", "text/html")
  return(`
    <html>
      <body>
        <button onclick="location.href=window.location.origin + '/test'"
        type="button">Test</button>
        <button onclick="location.href=window.location.origin + '/boxplot'"
        type="button">Boxplot</button>
        <button onclick="location.href=window.location.origin + '/lineplot'"
        type="button">Lineplot</button>
      </body>
    </html>
  `)
}

"



#* @get /test
function(rec, res) {
  print("does testing work")
}

#* @get /boxplot
#* @serializer png
function(rec, res) {
  boxplot(1, 2, 3, 4, 5)
}

#* @get /lineplot\
#* @serializer png
function(rec, res) {
  # Generate random data for demonstration
  set.seed(42)
  x <- runif(50)
  y <- 2 * x + 1 + rnorm(50, mean = 0, sd = 0.1)

  # Perform linear regression
  fit <- lm(y ~ x)

  # Create a scatter plot
  plot(x, y, main = "Scatter Plot with Regression Line", xlab = "X", ylab = "Y")

  # Add regression line
  abline(fit, col = "red")
}
