--[[
Non caching require module function.
Programmed by vamik64.

Usage:
local Require = require(Require)
local ARandomModule = Require(moduleIdHere)

or

local Require = require(03111497486)
local ARandomModule = Require(moduleIdHere)

Supports modules being required by their path too.
--]]

local lastVersion;
local lastRequiredModule;
	
return function(id)
	if type(id) == "number" then
	local succ, err = pcall(function()
	LatestVersionOfAsset = game:GetService("InsertService"):GetLatestAssetVersionAsync(id)
	asset = game:GetService("InsertService"):LoadAssetVersion(LatestVersionOfAsset)
	end)
	if (lastVersion == nil) then
		lastVersion = LatestVersionOfAsset
	elseif (lastVersion == LatestVersionOfAsset) then 
		return lastRequiredModule
	end	
	local module = asset:FindFirstChildOfClass("ModuleScript")
	if not succ or module == nil then return "error" end
	asset:Destroy()
	local reqModule = require(module)
	lastRequiredModule = reqModule
	return reqModule
	elseif id:IsA("ModuleScript") then
		return require(id)
	else
		warn("Invalid argument.")
	end		
end
