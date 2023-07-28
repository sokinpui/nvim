local pair_object = {
    ["{"] = "}",
    ["("] = ")",
    ["["] = "]",
    ["<"] = ">",
    ["`"] = "`",
    ["'"] = "'",
    ['"'] = '"',
}


for key, val in pairs(pair_object) do
    print("key is" .. " " .. key .. " " .. "and value is" .. " " .. val)
end
