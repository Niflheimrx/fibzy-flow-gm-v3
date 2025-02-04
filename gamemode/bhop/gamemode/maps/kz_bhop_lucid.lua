local te = {
	Vector(-1455, 1336, 160),
	Vector(-1104, 1431, 164)
}

local cr = {
	Vector(-1539, 1336, 192),
	Vector(-976, 1431, 277)
}

local fake = {
	Vector(408,2192,-32),
	Vector(1368,2672,-16)
}

local rem = Vector(-1248, 1384.01001, 268)
local rem2 = Vector(880, 2432, 100)

__HOOK[ "InitPostEntity" ] = function()
	Zones.StyleForce = _C.Style.Legit
	Zones.StepSize = 16

	local target = nil
	local target2 = nil
	for _,ent in pairs(ents.FindByClass("trigger_teleport")) do
		if(ent:GetPos() == rem) then
			ent:Remove()
			target = ents.FindByName(ent:GetSaveTable().target)[1]			
		elseif(ent:GetPos() == rem2) then
			ent:Remove()
			target2 = ents.FindByName(ent:GetSaveTable().target)[1]
		end
	end

	local f = ents.Create("TeleporterEnt")
	f:SetPos((te[1]+te[2])/2)
	f.min = te[1]
	f.max = te[2]
	f.targetpos = target:GetPos()
	f.targetang = target:GetAngles()
	f:Spawn()

	f = nil
	f = ents.Create("TeleporterEnt")
	f:SetPos((fake[1]+fake[2])/2)
	f.min = fake[1]
	f.max = fake[2]
	f.targetpos = target2:GetPos()
	f.targetang = target2:GetAngles()
	f:Spawn()
end