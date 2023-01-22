local functioname = "InputBegan"
local functionn 

for i , v in pairs (getgc()) do
    if type(v) == "function" then
        if getinfo(v).name == functioname then
            functionn = v
        end
    end
end

local inputbegan 
inputbegan = hookfunction(functionn, function(...)
    inputbegan(...)
    debug.setupvalue(inputbegan, 4, 0) 
end)
