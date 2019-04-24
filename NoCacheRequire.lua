--Requires a module by its asset id without caching. Make sure you change the "moduleName" to the name of your own module!

local function NoCacheRequire(id)
	local succ, err = pcall(function()
	local LatestVersionOfAsset = game:GetService("InsertService"):GetLatestAssetVersionAsync(id)
	asset = game:GetService("InsertService"):LoadAssetVersion(LatestVersionOfAsset)
	end)
	if not succ then return "error" end
	local module = asset:FindFirstChildOfClass("ModuleScript")
	asset:Destroy()
	return require(module)
end
