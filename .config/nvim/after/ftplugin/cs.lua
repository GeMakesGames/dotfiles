vim.keymap.set("n", "<F3>", "<cmd>!dotnet build<CR>")
vim.keymap.set("n", "<F5>", "<cmd>DapContinue<CR>")
vim.keymap.set('n', '<F4>', [[:lua RunDotnet()<CR>]], { noremap = true, silent = true })

function RunDotnet()
    local csproj_files = vim.fn.globpath(vim.fn.getcwd(), '**/*.csproj', 0, 1)
    local opts = {
        format_item = function(path)
            return vim.fn.fnamemodify(path, ':t')
        end,
    }
    local function cont(choice)
        if choice == nil then
            return nil
        else
            vim.fn.system('dotnet run --project ' .. choice)
        end
    end
    vim.ui.select(csproj_files, opts, cont)
end
