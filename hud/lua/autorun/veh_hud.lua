surface.CreateFont( "sam_font_01", {
	font = "Purista",
	size = 30,
	weight = 500,
})

hook.Add("HUDPaint", "VHUD_HUDPaint", function()
	if !IsValid(LocalPlayer()) or !LocalPlayer():Alive() or LocalPlayer():InVehicle() then return end

	local tr = LocalPlayer():GetEyeTrace()
	local ent = tr.Entity

	if !IsValid(ent) then return end

	if ent:GetClass() == "prop_vehicle_jeep" then
		surface.SetMaterial( Material "materials/touche_e.png")
		surface.SetDrawColor(255,255,255,255)
		surface.DrawTexturedRect( ScrW() / 2.45, (ScrH() / 1.9) - 60, 50, 50 )
		draw.SimpleText( "Entrer dans le véhicule", "sam_font_01", ScrW() / 2, (ScrH() / 2) - 26, Color(255,255,255), 1 )
	elseif ent:GetClass() == "prop_door_rotating" then
		surface.SetMaterial( Material "materials/touche_e.png")
		surface.SetDrawColor(255,255,255,255)
		surface.DrawTexturedRect( ScrW() / 2.45, (ScrH() / 1.9) - 60, 50, 50 )
		draw.SimpleText( "Ouvrir la porte", "sam_font_01", ScrW() / 2, (ScrH() / 2) - 26, Color(255,255,255), 1 )
	end	
end)

local hideHUDElements = {
	["DarkRP_HUD"] = false,
	["DarkRP_EntityDisplay"] = false,
	["DarkRP_ZombieInfo"] = false,
	["DarkRP_LocalPlayerHUD"] = true,
	["DarkRP_Agenda"] = true,
	["DarkRP_Hunger"] = true,
	["CHudHealth"] = true,
	["CHudBattery"] = true,
	["DarkRPHUD2"] = true
}
hook.Add("HUDShouldDraw", "HideDefaultHud", function(name)
	if hideHUDElements[name] then return false end
end)
