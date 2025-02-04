local remove = {
	Vector(-912, -2880, 4510),
	Vector(5408, -7104, 1480),
}

local mi = Vector( -171, -885, 2109 )
local ma = Vector( 0, 372, 2192 )

__HOOK[ "InitPostEntity" ] = function()
	for _,ent in pairs(ents.FindByClass("trigger_teleport")) do
		if(table.HasValue(remove,v:GetPos())) then
			ent:Remove()
		end
	end

	local hullsize = ents.Create( "HullSizeZone" )
	local mid = (mi + ma) / 2
	hullsize:SetPos( mid )
	hullsize.min = mi
	hullsize.max = ma
	hullsize.height = 28
	hullsize:Spawn()
end