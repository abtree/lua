--[==[
    定义为非全局的会更安全
]==]--
local help = {
    getVersion = function()
       return "1.0.0.1" 
    end
}

local tool ={
    getMode = function()
        return "product"
    end 
}

return {help=help, tool=tool}