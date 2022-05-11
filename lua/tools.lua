vim.cmd([[ let extension = expand('%:e') ]]) -- criamos a variável no ambiente da API

function get_extension( var ) -- recebe o argumento para a variável
  return vim.api.nvim_get_var( var ) -- retornamos a variável
end

local ext = get_extension("extension") -- dizemos qual o nome da variável que queremos

print("A extensão desse arquivo é: " .. ext) -- usamos a extensão como quisermos
