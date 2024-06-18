require("savipauk.remap")
require("savipauk.set")

vim.cmd [[autocmd BufNewFile,BufRead *.ejs set filetype=html]]

function CompileAndRun()
    local path = vim.fn.expand("%:p")
    local extension = vim.fn.fnamemodify(path, ":e")
    local filename = vim.fn.fnamemodify(path, ":t")
    local filenameOnly = vim.fn.fnamemodify(path, ":t:r")
    if extension == "cpp" or extension == "c" then
        local compile = "g++ -std=c++11 -Wall -Wextra -Wpedantic -O2 -pthread -o " ..
        "out_" .. filenameOnly .. ".out " .. filename
        local run = "./out_" .. filenameOnly .. ".out"
        vim.cmd("term " .. compile .. " && " .. run)
    elseif extension == "hs" then
        local compile = "ghc -rtsopts -O2 -Wall -o " ..
        "out_" .. filenameOnly .. ".out " .. filename .. " && rm -f *.o *.hi"
        local run = "./out_" .. filenameOnly .. ".out"
        vim.cmd("term " .. compile .. " && " .. run)
    elseif extension == "py" then
        local run = "python3 " .. filename
        vim.cmd("term " .. run)
    elseif extension == "go" then
        local run = "go mod tidy && go run ."
        vim.cmd("term " .. run)
    else
        print("not a valid file")
    end
end
