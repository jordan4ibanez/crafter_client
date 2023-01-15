local minetest,name = minetest,minetest.localplayer:get_name()
local version_channel = minetest.mod_channel_join(name..":client_version_channel")

local current_development_cycle = "alpha"
local crafter_version = 0.071


minetest.after(2,function() -- this needs a few seconds for the mod channel to open up
    version_channel:send_all("0.07000")
end)