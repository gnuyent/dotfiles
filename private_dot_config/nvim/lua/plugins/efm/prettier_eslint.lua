return {
    formatCommand = ([[
        ./node_modules/.bin/prettier-eslint
    ]]):gsub(
        "\n",
        ""
    )
}
