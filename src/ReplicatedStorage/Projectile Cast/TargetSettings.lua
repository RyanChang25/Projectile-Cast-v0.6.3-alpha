local CollectionService = game:GetService("CollectionService")

local Settings = {}

function CreateFolder()
	if script.Parent:FindFirstChild("Targets") == nil then
		local FolderTargets = Instance.new("Folder", script)
		FolderTargets.Name = "Targets"
	end
end

local function SetTags(value, targetType)
	for i,v in pairs(value) do
		local newTarget = Instance.new("StringValue", script[targetType])
		newTarget.Name = v
		newTarget.Value = v
	end
end

function Settings.SetTaggedTargets(value)
	CreateFolder()
	SetTags(value, "Targets")
end

function Settings.GetTaggedTargets(hit)
	for i,v in pairs (script["Targets"]:GetChildren()) do
		if CollectionService:HasTag(hit, v.Value) or CollectionService:HasTag(hit.Parent, v.Value) then
			return true
		end
	end
end

return Settings
