require("savipauk.remap")
require("savipauk.set")

-- Set C++ file type
vim.cmd[[autocmd BufNewFile,BufRead *.cpp set filetype=cpp]]

function CompileAndRun()
	local path = vim.fn.expand("%:p")
	local extension = vim.fn.fnamemodify(path, ":e")
	local filename = vim.fn.fnamemodify(path, ":t")
	local filenameOnly = vim.fn.fnamemodify(path, ":t:r")
	if extension == "cpp" then
		local compile = "g++ -std=c++11 -Wall -Wextra -Wpedantic -O2 -o " .. filenameOnly .. ".out " .. filename
		local run = "./" .. filenameOnly .. ".out"
		vim.cmd("term " .. compile .. " && " .. run)
    elseif extension == "hs" then
        local compile = "ghc -rtsopts -O2 -Wall -o " .. filenameOnly .. ".out " .. filename .. " && rm -f *.o *.hi"
        local run = "./" .. filenameOnly .. ".out"
		vim.cmd("term " .. compile .. " && " .. run)
    else
		print("not a valid file")
	end
end



