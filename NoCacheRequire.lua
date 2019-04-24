--Requires a module by its asset id without caching.

local function NoCacheRequire(id)
	local succ, err = pcall(function()
	local LatestVersionOfAsset = game:GetService("InsertService"):GetLatestAssetVersionAsync(id)
	asset = game:GetService("InsertService"):LoadAssetVersion(LatestVersionOfAsset)
	end)
	if not succ then return "error" end
	local module = asset:FindFirstChildOfClass("ModuleScript")
	if not succ or module == nil then return "error" end
	asset:Destroy()
	return require(module)
end
