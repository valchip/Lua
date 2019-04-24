--Requires a module by its asset id without caching. Make sure you change the "moduleName" to the name of your own module!

local function NoCacheRequire(id)
	local LatestVersionOfAsset = game:GetService("InsertService"):GetLatestAssetVersionAsync(id)
	local asset = game:GetService("InsertService"):LoadAssetVersion(LatestVersionOfAsset)
	local module = asset:FindFirstChildOfClass("ModuleScript")
	asset:Destroy()
	return require(module)
end
