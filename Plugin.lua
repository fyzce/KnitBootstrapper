--[[
	Knit Bootstrapper
	V1.2.0
	
	Knit was created by @sleitnick & you can find the original packages here:
	Roblox: https://create.roblox.com/marketplace/asset/5530714855/Knit
	GitHub: https://github.com/Sleitnick/Knit
	
	This plugin will set up a base project of Knit with a few examples in it, these examples
	came from sleitnick's YouTube tutorial on using Knit, which I will link below:
	https://www.youtube.com/watch?v=0Ty2ojfdOnA
	
	Note: This code is not very clean. I'll eventually improve it but it gets the job done, right?
]]

-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------

local ChangeHistoryService = game:GetService("ChangeHistoryService")
local ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local InsertService = game:GetService("InsertService")
local ServerStorage = game:GetService("ServerStorage")
local StarterPlayer = game:GetService("StarterPlayer")

local Configurations = require(script.Configurations)

-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------

local _errCount = 0
local _errLimit = Configurations.ERROR_LIMIT
local _errMax = Configurations.ERROR_MAX

-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------

local Toolbar = plugin:CreateToolbar("Knit Bootstrapper")
local Button = Toolbar:CreateButton(Configurations.PLUGIN_NAME, Configurations.PLUGIN_DESC, Configurations.PLUGIN_LOGOMARK)

-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------

local function _onButtonClicked()
		local KnitModel = InsertService:LoadAsset(5530714855)
		local Knit = KnitModel:FindFirstChild("Packages")
	if not ReplicatedStorage:FindFirstChild("Packages") then
		Knit.Parent = ReplicatedStorage
		KnitModel:Destroy()
	else
		Knit:Destroy()
		KnitModel:Destroy()
		warn(Knit.Name.." already exists in ReplicatedStorage!")
		_errCount = _errCount + 1
	end

		local ServerModel = InsertService:LoadAsset(13233543826)
		local Server = ServerModel:FindFirstChild("Server")
	if not ServerScriptService:FindFirstChild("Server") then
		Server.Parent = ServerScriptService
		ServerModel:Destroy()
	else
		Server:Destroy()
		ServerModel:Destroy()
		warn(Server.Name.." already exists in ServerScriptService!")
		_errCount = _errCount + 1
	end

		local ClientModel = InsertService:LoadAsset(13233624424)
		local Client = ClientModel:FindFirstChild("Client")
	if not StarterPlayer.StarterPlayerScripts:FindFirstChild("Client") then
		Client.Parent = StarterPlayer.StarterPlayerScripts
		ClientModel:Destroy()
	else
		Client:Destroy()
		ClientModel:Destroy()
		warn(Client.Name.." already exists in StarterPlayerScripts!")
		_errCount = _errCount + 1
	end

		local ServicesModel = InsertService:LoadAsset(13233635768)
		local Services = ServicesModel:FindFirstChild("Services")
	if not ServerStorage:FindFirstChild("Services") then
		Services.Parent = ServerStorage
		ServicesModel:Destroy()
	else
		Services:Destroy()
		ServicesModel:Destroy()
		warn(Services.Name.." already exists in ServerStorage!")
		_errCount = _errCount + 1
	end
		

		local ControllersModel = InsertService:LoadAsset(13233652411)
		local Controllers = ControllersModel:FindFirstChild("Controllers")
	if not StarterPlayer.StarterPlayerScripts:FindFirstChild("Controllers") then
		Controllers.Parent = StarterPlayer.StarterPlayerScripts
		ControllersModel:Destroy()
	else
		Controllers:Destroy()
		ControllersModel:Destroy()
		warn(Controllers.Name.." already exists in StarterPlayerScripts!")
		_errCount = _errCount + 1
	end
	
	if _errCount > _errLimit then
		warn("Knit ran into ".._errCount.."/".._errMax.." errors while attempting setup.")
		ChangeHistoryService:SetWaypoint("Knit was set up [".._errCount.."/".._errMax.." errors]")
		_errCount = 0
	else
		warn("Knit has been set up!")
		_errCount = 0
		ChangeHistoryService:SetWaypoint("Knit was set up")
	end
end

-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------

Button.Click:Connect(_onButtonClicked)