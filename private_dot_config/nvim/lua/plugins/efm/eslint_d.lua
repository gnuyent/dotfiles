return {
  lintCommand = "./node_modules/.bin/eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintIgnoreExitCode = true,
}
