--//Scripted by vamik64
local Workspace, Players, Lighting, ReplicatedFirst, ReplicatedStorage, ServerScriptService, ServerStorage, StarterGui, StarterPack, StarterPlayer, SoundService, Chat, LocalizationService = game:GetService("Workspace"):GetDescendants(), game:GetService("Players"):GetDescendants(), game:GetService("Lighting"):GetDescendants(), game:GetService("ReplicatedFirst"):GetDescendants(), game:GetService("ReplicatedStorage"):GetDescendants(), game:GetService("ServerScriptService"):GetDescendants(), game:GetService("ServerStorage"):GetDescendants(), game:GetService("StarterGui"):GetDescendants(), game:GetService("StarterPack"):GetDescendants(), game:GetService("StarterPlayer"):GetDescendants(), game:GetService("SoundService"):GetDescendants(), game:GetService("Chat"):GetDescendants(), game:GetService("SoundService"):GetDescendants(), game:GetService("LocalizationService"):GetDescendants()
local all = {}
table.insert(all, Workspace) table.insert(all, Players) table.insert(all, ReplicatedFirst) table.insert(all, ReplicatedStorage) table.insert(all, ServerScriptService) table.insert(all, Lighting) table.insert(all, ServerStorage) table.insert(all, StarterGui) table.insert(all, StarterPack) table.insert(all, StarterPlayer) table.insert(all, SoundService) table.insert(all, Chat) table.insert(all, LocalizationService)
local logs = {}
local results = {
	s = 0;
	ms = 0;
	ls  = 0;
	os1 = 0
}
local t = tick()

function countLines(str)
	local counter = 1
	for line in str:gmatch("%s") do
   	 if line == "\n" then
          counter = counter+1
    end
	end
	return counter
end

for _, Service in pairs (all) do
for i, v in pairs(Service) do
	results.os1 = results.os1 + 1
	if v:IsA("Script") then
		local succ, err = pcall(function() results.s = results.s + 1 local info = table.insert(logs, "Item Scanned: "..v:GetFullName().."(Script)\n".."Amount of Characters: "..#v.Source.."\n".."Amount of Lines:"..countLines(v.Source)) end)
	end
end
end

warn("SCAN COMPLETE!\nScanned "..results.os1.." items in "..tick()-t.." seconds!")
warn("Found:\n"..results.s.." Scripts\n"..results.ms.." Module Scripts\n"..results.ls.." Local Scripts")
print("INFO:")
for i, v in pairs(logs) do print(v) end
