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

if not Client.isClassicEra then
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


}

data.coords = {

}
