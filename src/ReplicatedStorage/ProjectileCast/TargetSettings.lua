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

function Settings.CheckHumanoid(hit)
	local playerModel = hit:FindFirstAncestorOfClass("Model")
	if playerModel and playerModel.PrimaryPart and playerModel.PrimaryPart.Name == "HumanoidRootPart" then
		return playerModel
	else 
		return false 
	end
end

function Settings.GetTaggedTargets(hit)
	
	local Character = Settings.CheckHumanoid(hit)
	
	for i,v in pairs (script["Targets"]:GetChildren()) do
		if Character and CollectionService:HasTag(Character, v.Value) then
			return true
		end
	end
	
	if #script["Targets"]:GetChildren() == 0 then
		if Character then
			return true
		end
	end

end

return Settings
