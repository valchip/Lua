--Requires a module by its asset id without caching. Make sure you change the "moduleName" to the name of your own module!

local function NoCacheRequire(id)
	local moduleName = "ModuleScript" --change this to the name of your module script
	local LatestVersionOfAsset = game:GetService("InsertService"):GetLatestAssetVersionAsync(id)
	local asset = game:GetService("InsertService"):LoadAssetVersion(LatestVersionOfAsset)
	local module = asset:WaitForChild(moduleName):Clone()
	asset:Destroy()
	return require(module)
end
