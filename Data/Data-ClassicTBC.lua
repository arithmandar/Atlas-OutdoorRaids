-- $Id$
--[[

	Atlas, a World of Warcraft instance map browser
	Copyright 2005 ~ 2010 - Dan Gilbert <dan.b.gilbert@gmail.com>
	Copyright 2010 - Lothaer <lothayer@gmail.com>, Atlas Team
	Copyright 2011 ~ 2026 - Arith Hsu, Atlas Team 

	This file is part of Atlas.

	Atlas is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	Atlas is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with Atlas; if not, write to the Free Software
	Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

--]]
local _G = getfenv(0)
local _, private = ...

local LibStub = _G.LibStub
---@type AtlasAddon
local Atlas = LibStub("AceAddon-3.0"):GetAddon("Atlas")

local Client = Atlas.Client

if not Client.isTBCClassic then
	return
end

local BZ = Atlas_GetLocaleLibBabble("LibBabble-SubZone-3.0")
local BF = Atlas_GetLocaleLibBabble("LibBabble-Faction-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)
local ALC = LibStub("AceLocale-3.0"):GetLocale("Atlas")

local data = {}
private.data = data

local constants = Atlas.constants
local labelcolors = constants.colors.labels
local BLUE = labelcolors.BLUE
local GREN = labelcolors.GREN
local _RED = labelcolors._RED
local ORNG = labelcolors.ORNG
local PURP = labelcolors.PURP
local WHIT = labelcolors.WHIT
local LBLU = labelcolors.LBLU
local CYAN = labelcolors.CYAN
local GREY = labelcolors.GREY
local INDENT = labelcolors.INDENT

-- local helper functions
local function getBossName(bossname, encounterID, creatureIndex)
	return Atlas:GetBossName(bossname, encounterID, creatureIndex, private.module_name)
end

local function getCreatureName(creatureName, creatureID)
	return Atlas:GetCreatureName(creatureName, creatureID)
end

local function getQuestTitlebyID(title, id)
	return Atlas:GetQuestTitlebyID(title, id)
end

local function getItemTitlebyID(title, id)
	return Atlas:GetItemTitlebyID(title, id)
end

local function getClassName(class)
	return Atlas_GetClassName(class)
end

-- local constants for easier access
local SLASH = ALC["Slash"]
local COLON = ALC["Colon"]
local COMMA = ALC["Comma"]
local L_PAREN = ALC["L-Parenthesis"]
local R_PAREN = ALC["R-Parenthesis"]
local ENTRANCE = ALC["Entrance"]
local WANDERS = ALC["Wanders"]
local UPPER = ALC["Upper"]
local CONNECTION = ALC["Connection"]
local RARE = ALC["Rare"]
local RANDOM = ALC["Random"]
local HYPHEN = ALC["Hyphen"]

-- //////////////////////////////////////////////////////////////////////////////
data.maps = {
	Azuregos = {
		ZoneName = { getBossName("Azuregos") },
		Location = { BZ["Azshara"]..COMMA..BZ["Kalimdor"] },
		LevelRange = "60+",
		PlayerLimit = "40",
		{ WHIT.." 1) "..getBossName("Azuregos") },
	},
	FourDragons = {
		ZoneName = { L["Dragons of Nightmare"] },
		Location = { L["Various"] },
		LevelRange = "60+",
		PlayerLimit = "40",
		{ WHIT.." 1) "..BZ["Twilight Grove"].._RED..COMMA..BZ["Duskwood"]..COMMA..BZ["Eastern Kingdoms"] },
		{ WHIT.." 2) "..BZ["Seradane"].._RED..COMMA..BZ["The Hinterlands"]..COMMA..BZ["Eastern Kingdoms"] },
		{ WHIT..INDENT..getBossName("Rothos") },
		{ WHIT..INDENT..getBossName("Dreamtracker") },
		{ WHIT.." 3) "..BZ["Dream Bough"].._RED..COMMA..BZ["Feralas"]..COMMA..BZ["Kalimdor"] },
		{ WHIT..INDENT..getBossName("Lethlas") },
		{ WHIT..INDENT..getBossName("Dreamroarer") },
		{ WHIT.." 3) "..BZ["Bough Shadow"].._RED..COMMA..BZ["Ashenvale"]..COMMA..BZ["Kalimdor"] },
		{ WHIT..INDENT..getBossName("Phantim") },
		{ WHIT..INDENT..getBossName("Dreamstalker") },
		{ "" };
		{ WHIT..L["The Dragons"] };
		{ WHIT..INDENT..getBossName("Lethon") };
		{ WHIT..INDENT..getBossName("Emeriss") };
		{ WHIT..INDENT..getBossName("Taerar") };
		{ WHIT..INDENT..getBossName("Ysondre") };
	},
	HighlordKruul = {
		ZoneName = { getBossName("Highlord Kruul") };
		Location = { BZ["Blasted Lands"]..COMMA..BZ["Eastern Kingdoms"] };
		LevelRange = "60+";
		MinLevel = "--";
		PlayerLimit = "40";
		{ WHIT.."1) "..getBossName("Highlord Kruul") };
		{ WHIT.."2) "..BZ["Nethergarde Keep"] };
	},
	OR_Skettis = {
		ZoneName = { BZ["Skettis"] },
		Location = { BZ["Blackwind Valley"]..COMMA..BZ["Terokkar Forest"]..COMMA..BZ["Outland"] },
		LevelRange = "70+",
		PlayerLimit = "40",
		{ WHIT.."1) "..BZ["Blackwind Landing"], 10001 },
		{ WHIT..INDENT..L["Sky Commander Adaris"] },
		{ WHIT..INDENT..L["Sky Sergeant Doryn"] },
		{ WHIT..INDENT..L["Skyguard Handler Deesak"] },
		{ WHIT..INDENT..L["Severin <Skyguard Medic>"] },
		{ WHIT..INDENT..L["Grella <Skyguard Quartermaster>"] },
		{ WHIT..INDENT..L["Hazzik"] },
		{ WHIT.."2) "..L["Ancient Skull Pile"], 10002 },
		{ WHIT..INDENT..L["Terokk"]..L_PAREN..ALC["Summon"]..R_PAREN },
		{ WHIT.."3) "..L["Sahaak <Keeper of Scrolls>"], 10003 },
		{ WHIT.."4) "..L["Skyguard Prisoner"]..L_PAREN..RANDOM..R_PAREN, 10004 },
		{ WHIT.."5) "..L["Talonpriest Ishaal"], 10005 },
		{ WHIT.."6) "..L["Talonpriest Skizzik"], 10006 },
		{ WHIT.."7) "..L["Talonpriest Zellek"], 10007 },
		{ WHIT.."8) "..L["Hazzik's Package"], 10008 },
		{ WHIT.."9) "..ALC["Graveyard"], 10009 },
		{ GREN.."1') "..L["Skull Pile"], 10010 },
		{ GREN..INDENT..L["Darkscreecher Akkarai"]..L_PAREN..ALC["Summon"]..R_PAREN },
		{ GREN..INDENT..L["Gezzarak the Huntress"]..L_PAREN..ALC["Summon"]..R_PAREN },
		{ GREN..INDENT..L["Karrog"]..L_PAREN..ALC["Summon"]..R_PAREN },
		{ GREN..INDENT..L["Vakkiz the Windrager"]..L_PAREN..ALC["Summon"]..R_PAREN },
	},
	OR_DoomLordKazzak = {
		ZoneName = { getBossName("Doom Lord Kazzak") },
		Location = { BZ["Hellfire Peninsula"]..COMMA..BZ["Outland"] },
		LevelRange = "70+",
		PlayerLimit = "40",
		{ WHIT.."1) "..getBossName("Doom Lord Kazzak"), 10001 },
		{ WHIT.."2) "..BZ["Invasion Point: Annihilator"], 10002 },
		{ WHIT.."3) "..BZ["Forge Camp: Rage"], 10003 },
		{ WHIT.."4) "..BZ["Forge Camp: Mageddon"], 10004 },
		{ WHIT.."5) "..BZ["Thrallmar"], 10005 },
	},
	OR_Doomwalker = {
		ZoneName = { getBossName("Doomwalker") },
		Location = { BZ["Shadowmoon Valley"]..COMMA..BZ["Outland"] },
		LevelRange = "70+",
		PlayerLimit = "40",
		{ WHIT.."1) "..getBossName("Doomwalker"), 10001 },
	},
}

data.coords = {
	OR_Skettis = { 
		{ 1, 10001, 187, 67 },
		{ 2, 10002, 244, 270 },
		{ 3, 10003, 264, 308 },
		{ 4, 10004, 113, 235 },
		{ 4, 10004, 305, 211 },
		{ 4, 10004, 477, 428 },
		{ 5, 10005, 322, 286 },
		{ 6, 10006, 335, 345 },
		{ 7, 10007, 345, 213 },
		{ 8, 10008, 463, 316 },
		{ 9, 10009, 148, 339 },
		{ "1'", 10010, 137, 223 },
		{ "1'", 10010, 119, 284 },
		{ "1'", 10010, 337, 226 },
		{ "1'", 10010, 347, 307 },
		{ "1'", 10010, 349, 375 },
		{ "1'", 10010, 433, 329 },
		{ "1'", 10010, 401, 457 },
		{ "1'", 10010, 479, 337 },
		{ "1'", 10010, 466, 447 },
	},
	OR_DoomLordKazzak = {
		{ 1, 10001, 296, 206 },
		{ 2, 10002, 139, 334 },
		{ 3, 10003, 234, 369 },
		{ 4, 10004, 326, 357 },
		{ 5, 10005, 158, 430 },
	},
	OR_Doomwalker = {
		{ 1, 10001, 271, 247 },
	},
}
