print("JDTLS 1")
local config = {
    cmd = {'~/.config/nvim/external/jdt-lsp-1.22.0/bin/jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
require('lsp.java').start_or_attach(config)
print("JDTLS 2")
