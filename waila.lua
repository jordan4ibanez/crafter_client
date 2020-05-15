local hud_item_name = ""


local hud_bg = minetest.localplayer:hud_add({
				hud_elem_type = "image", -- see HUD element types, default "text"
				position = {x=0.5, y=0},
				name = "",    -- default ""
				scale = {x=2.25, y=2.25}, -- default {x=0,y=0}
				text = "waila.png",    -- default ""
				offset = { x = 0, y = 29.25},
				z_index = 0,
			})

local hud_name = minetest.localplayer:hud_add({
		name = "hud_name",
		position = {x=0.5,y=0},
		hud_elem_type = "text",
		number = 0xFFFFFF,
		alignment = 0,
		offset = { x = 0, y = 17},
		text = "",
		z_index = 1,
	})
local hud_node = minetest.localplayer:hud_add({
		name = "hud_node",
		position = {x=0.5,y=0},
		hud_elem_type = "text",
		number = 0xFFFFFF,
		alignment = 0,
		offset = { x = 0, y = 36},
		text = "",
		z_index = 1,
	})


local function update()
	if minetest.camera then
		local pos = minetest.camera:get_pos()
		local pos2 = vector.add(pos,vector.multiply(minetest.camera:get_look_dir(), 4))
		local ray = minetest.raycast(pos, pos2, false, false)
		
		local pointed_thing = ray:next()
		if pointed_thing and pointed_thing.under then
			local node = minetest.get_node_or_nil(pointed_thing.under).name
			if hud_item_name ~= node then
				local def = minetest.get_item_def(node)
				minetest.localplayer:hud_change(hud_name, "text", def.description)
				minetest.localplayer:hud_change(hud_node, "text", node)
				minetest.localplayer:hud_change(hud_bg,   "text", "waila.png")
				hud_item_name = node
			end
		else
			--make hud invisible
			minetest.localplayer:hud_change(hud_name, "text", "")
			minetest.localplayer:hud_change(hud_node, "text", "")
			minetest.localplayer:hud_change(hud_bg,   "text", "")
			hud_item_name = ""
		end
	end
	minetest.after(0.01, function()
		update()
	end)
end

update()
