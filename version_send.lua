local minetest,name = minetest,minetest.localplayer:get_name()
local version_channel = minetest.mod_channel_join(name..":client_version_channel")

-- Storing a semantic versioning in a table like: {"alpha", 0.071}. This is serialized.
local current_development_cycle = "alpha"
-- 0.0.8
local crafter_version = 0.08

-- The client needs to wait a few seconds for the server's mod channel to initialize in singleplayer
minetest.after( 2,function()
    local version_info = minetest.serialize({
        current_development_cycle,
        crafter_version
    })
    version_channel:send_all(version_info)
end )