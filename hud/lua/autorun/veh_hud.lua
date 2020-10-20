surface.CreateFont( "sam_font_01", {
	font = "Purista",
	extended = false,
	size = 30,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
})

hook.Add("HUDPaint", "Veh HUD", function()

	
	

	if !LocalPlayer():IsValid() or !LocalPlayer():Alive() or LocalPlayer():InVehicle() then return end

	local tr = util.TraceLine ({
		start = LocalPlayer():GetShootPos(),
		endpos = LocalPlayer():GetShootPos() + LocalPlayer():GetAimVector() * 60,
		filter = LocalPlayer(),
		mask = MASK_SHOT
	})


	if !tr.Entity or !tr.Entity:IsValid() then return end
	local car = tr.Entity
	if car:GetClass() != "prop_vehicle_jeep" then return end
		surface.SetMaterial( Material "materials/touche_e.png")
		surface.SetDrawColor(255,255,255,255)
		surface.DrawTexturedRect( ScrW() / 2.45, (ScrH() / 1.9) - 60, 50, 50 )
		draw.SimpleText( "Entrer dans le véhicule", "sam_font_01", ScrW() / 2, (ScrH() / 2) - 26, Color(255,255,255), 1 )

		-- Non fonctionnel: en développement (Ca s'affichera sur les portes)

		if car:GetClass() != "prop_door_rotating" then return end
		surface.SetMaterial( Material "materials/touche_e.png")
		surface.SetDrawColor(255,255,255,255)
		surface.DrawTexturedRect( ScrW() / 2.45, (ScrH() / 1.9) - 60, 50, 50 )
		draw.SimpleText( "Ouvrir la porte", "sam_font_01", ScrW() / 2, (ScrH() / 2) - 26, Color(255,255,255), 1 )

		
end)

hook.Add( "HUDShouldDraw", "DefautHUD", function( name )
     if ( name == "CHudHealth" or name == "CHudBattery" or name == "DarkRPHUD2" ) then
         return false
     end
end )
--DarkRP
local hideHUDElements = {
["DarkRP_HUD"] = false,
["DarkRP_EntityDisplay"] = false,
["DarkRP_ZombieInfo"] = false,
["DarkRP_LocalPlayerHUD"] = true,
["DarkRP_Agenda"] = true,
["DarkRP_Hunger"] = true,
}
hook.Add("HUDShouldDraw", "HideDefaultDarkRPHud", function(name)
if hideHUDElements[name] then return false end
end)
