--COMET API BY @TGB_Selever
local Version="1.0.0"
local cgui = game:GetService("CoreGui")
local uis = game:GetService("UserInputService")
local ts = game:GetService("TweenService")
local plrs = game:GetService("Players")
local Theme = "Comet"
local lplr = plrs.LocalPlayer
local togglekey = Enum.KeyCode.RightShift
local themes={
	Comet = {
		Primary = Color3.fromRGB(122, 50, 255),
		Secondary = Color3.fromRGB(60, 20, 120),
		Tertiary = Color3.fromRGB(100, 25, 190),
		Quaternary = Color3.fromRGB(180, 100, 255),
		Text = Color3.fromRGB(255, 255, 255),
		ButtonHover = Color3.fromRGB(220, 200, 255),
		Topbar = Color3.fromRGB(40, 40, 40),
		Background = Color3.fromRGB(20, 20, 20),
		ButtonBackground = Color3.fromRGB(0, 0, 0),
	},
	tEStdONotuSE = { -- ONLY A TESTING THEME, FOR THE SAKE OR YOUR EYES DO NOT PICK IT
		Primary = Color3.fromRGB(195, 164, 231),
		Secondary = Color3.fromRGB(50, 255, 120),
		Tertiary = Color3.fromRGB(10, 25, 100),
		Quaternary = Color3.fromRGB(100, 100, 100),
		Text = Color3.fromRGB(255, 0, 255),
		ButtonHover = Color3.fromRGB(220, 0, 0),
		Topbar = Color3.fromRGB(40, 40, 255),
		Background = Color3.fromRGB(20, 255, 20),
		ButtonBackground = Color3.fromRGB(255, 0, 0),
	},
}
local changelog = {
	[1] = {
		Index = 1,
		Title = "Release",
		Desc= "- Release of the <font color='rgb(122,50,255)'><i>Comet API.</i></font>\n- Bugs are <font color='rgb(255,0,0)'><b><i>guaranteed.</i></b></font>",
		Ver="1.0.0",
		},
	}
local api = {}
local window = {
	Footer="",
	Title="Window",
	Obj = nil,
	Changed = nil,
	HomeTabPage = nil,
	HomeTabButton = nil,
	HomeTab = nil,
}
window.__index = function(self, key)
	local frame = rawget(self, "Obj")
	if frame then
		if key == "Visible" then
			return frame.Visible
		elseif key == "Title" and frame:FindFirstChild("Topbar") and frame.Topbar:FindFirstChild("Label") then
			local text = frame.Topbar.Label.Text
			local lines = text:split("\n")
			return lines[1] or "window"
		elseif key == "Footer" and frame:FindFirstChild("Topbar") and frame.Topbar:FindFirstChild("Label") then
			local text = frame.Topbar.Label.Text
			local lines = text:split("\n")
			if lines[2] then
				return lines[2]:match("size='3'>(.-)%s*--Comet") or ""
			end
			return ""
		end
	end
	local cachedValue = rawget(self, key)
	if cachedValue ~= nil then
		return cachedValue
	end
	return window[key]
end
window.__newindex = function(self, prop, val)
	if prop == "Changed" then
		rawset(self, "Changed", val)
		return
	end

	if prop == "Visible" then
		local frame = rawget(self, "Obj")
		if frame then frame.Visible = val end
	elseif prop == "Footer" then
		local frame = rawget(self, "Obj")
		if frame and frame:FindFirstChild("Topbar") and frame.Topbar:FindFirstChild("Label") then
			local currentTitle = self.Title or "window"
			frame.Topbar.Label.Text = currentTitle.."\n<b><font color='rgb(122,30,255)' size='3'>"..val.."  --Comet API V"..Version.."</font></b>"
		end
	elseif prop == "Title" then
		local frame = rawget(self, "Obj")
		if frame and frame:FindFirstChild("Topbar") and frame.Topbar:FindFirstChild("Label") then
			local currentFooter = self.Footer or ""
			frame.Topbar.Label.Text = val.."\n<b><font color='rgb(122,30,255)' size='3'>"..currentFooter.."  --Comet API V"..Version.."</font></b>"
		end
	else
		rawset(self, prop, val)
	end

	local func = rawget(self, "Changed")
	if prop ~= "Changed" and typeof(func) == "function" then
		pcall(func, prop, val)
	end
end

local tab = {
	Visible=true,
	Obj = nil,
	Image = "rbxassetid://4509163032",
	Text = "Tab",
	Changed = nil,
	Page = nil,
	Button = nil,
}
tab.__index = function(self, key)
	local frame = rawget(self, "Obj")
	if key == "Visible" then
		if frame then return frame.Visible end
	elseif key == "Text" then
		if frame and frame:FindFirstChild("Txt") then return frame.Txt.Text end
	end
	local cachedValue = rawget(self, key)
	if cachedValue ~= nil then return cachedValue end
	return tab[key]
end
tab.__newindex = function(self, prop, val)
	if prop == "Changed" then rawset(self, "Changed", val) return end
	if prop == "Visible" then
		local frame = rawget(self, "Obj")
		if frame then frame.Visible = val; frame.Parent.Parent.TabFrame[frame.Name].Visible = val end
	elseif prop == "Text" then
		local frame = rawget(self, "Obj")
		if frame then frame.Txt.Text = val end
	elseif prop == "Image" then
		local frame = rawget(self, "Obj")
		val = string.gsub(val, "rbxassetid://", "")
		val = string.gsub(val, "rbxassetid", "")
		val = string.gsub(val, "://", "")
		val = string.gsub(val, "rbxassetid:", "")
		val = string.gsub(val, "rbxassetid:/", "")
		val = string.gsub(val, "rbxassetid//", "")
		if frame then frame.Image.Image = "rbxassetid://"..val end
	else
		rawset(self, prop, val)
	end
	local func = rawget(self, "Changed")
	if prop ~= "Changed" and typeof(func) == "function" then pcall(func, prop, val) end
end

local slider = {
	Visible=true,
	Min=1,
	Max=100,
	Default=5,
	--Tooltip="",
	Text= "Slider",
	Value=5,
	Obj = nil,
	Changed = nil,
}
slider.__index = function(self, key)
	if key == "Visible" then
		local frame = rawget(self, "Obj")
		if frame then return frame.Visible end
	elseif key == "Min" then
		local frame = rawget(self, "Obj")
		if frame then return frame:GetAttribute("Minimum") end
	elseif key == "Max" then
		local frame = rawget(self, "Obj")
		if frame then return frame:GetAttribute("Maximum") end
	elseif key == "Value" then
		local frame = rawget(self, "Obj")
		if frame then return frame:GetAttribute("Value") end
	else
	end
	local cachedValue = rawget(self, key)
	if cachedValue ~= nil then return cachedValue end
	return slider[key]
end
slider.__newindex = function(self, prop, val)
	if prop == "Changed" then rawset(self, "Changed", val) return end
	if prop == "Visible" then
		local frame = rawget(self, "Obj")
		if frame then frame.Visible = val end
	elseif prop == "Min" then
		local frame = rawget(self, "Obj")
		if frame then frame:SetAttribute("Minimum", val) end
	elseif prop == "Max" then
		local frame = rawget(self, "Obj")
		if frame then frame:SetAttribute("Maximum", val) end
	elseif prop == "Value" then
		local frame = rawget(self, "Obj")
		if frame then frame:SetAttribute("Value", val) end
	else
		rawset(self, prop, val)
	end
	local func = rawget(self, "Changed")
	if prop ~= "Changed" and typeof(func) == "function" then pcall(func, prop, val) end
end

local button = {
	Visible=true,
	Text="Button",
	--Tooltip="",
	Value=false,
	Obj = nil,
--	DoubleClick = false,
	Changed = nil,
}
button.__index = function(self, key)
	if key == "Visible" then
		local frame = rawget(self, "Obj")
		if frame then return frame.Visible end
	elseif key == "Text" then
		local frame = rawget(self, "Obj")
		if frame then return frame.Button.Text end
	elseif key == "Value" then
		local frame = rawget(self, "Obj")
		if frame then return frame:GetAttribute("Value") end
	end
	local cachedValue = rawget(self, key)
	if cachedValue ~= nil then return cachedValue end
	return button[key]
end
button.__newindex = function(self, prop, val)
	if prop == "Changed" then rawset(self, "Changed", val) return end
	if prop == "Visible" then
		local frame = rawget(self, "Obj")
		if frame then frame.Visible = val end
	elseif prop == "Text" then
		local frame = rawget(self, "Obj")
		if frame then frame.Button.Text = val end
	elseif prop == "Value" then
		local frame = rawget(self, "Obj")
		if frame then frame.Button:SetAttribute("Value",val) end
	else
		rawset(self, prop, val)
	end
	local func = rawget(self, "Changed")
	if prop ~= "Changed" and typeof(func) == "function" then pcall(func, prop, val) end
end

local toggle = {
	Visible=true,
	Text="Toggle",
	--Tooltip="",
	Default=false,
	Value=false,
	Obj = nil,
	Changed = nil,
}
toggle.__index = function(self, key)
	if key == "Visible" then
		local frame = rawget(self, "Obj")
		if frame then return frame.Visible end
	elseif key == "Text" then
		local frame = rawget(self, "Obj")
		if frame then return frame.Text.Text end
	elseif key == "Value" then
		local frame = rawget(self, "Obj")
		if frame then return frame:GetAttribute("Value") end
	end
	local cachedValue = rawget(self, key)
	if cachedValue ~= nil then return cachedValue end
	return toggle[key]
end
toggle.__newindex = function(self, prop, val)
	if prop == "Changed" then rawset(self, "Changed", val) return end
	if prop == "Visible" then
		local frame = rawget(self, "Obj")
		if frame then frame.Visible = val end
	elseif prop == "Text" then
		local frame = rawget(self, "Obj")
		if frame then frame.Text.Text = val end
	elseif prop == "Value" then
		local frame = rawget(self, "Obj")
		if frame then frame.Button:SetAttribute("Value",val) end
		rawset(self, prop, val)
	end
	local func = rawget(self, "Changed")
	if prop ~= "Changed" and typeof(func) == "function" then pcall(func, prop, val) end
end

local divider = {
	Visible = true,
	Obj = nil,
	Changed = nil,
}
divider.__index = function(self, key)
	if key == "Visible" then
		local frame = rawget(self, "Obj")
		if frame then return frame.Visible end
	end
	local cachedValue = rawget(self, key)
	if cachedValue ~= nil then return cachedValue end
	return divider[key]
end
divider.__newindex = function(self, prop, val)
	if prop == "Changed" then rawset(self, "Changed", val) return end
	if prop == "Visible" then
		local frame = rawget(self, "Obj")
		if frame then frame.Visible = val end
	else
		rawset(self, prop, val)
	end
	local func = rawget(self, "Changed")
	if prop ~= "Changed" and typeof(func) == "function" then pcall(func, prop, val) end
end

local label = {
	Visible = true,
	Text = "Text",
	Obj = nil,
	Changed = nil,
}
label.__index = function(self, key)
	if key == "Visible" then
		local frame = rawget(self, "Obj")
		if frame then return frame.Visible end
	elseif key == "Text" then
		local frame = rawget(self, "Obj")
		if frame then return frame.Text end
	end
	local cachedValue = rawget(self, key)
	if cachedValue ~= nil then return cachedValue end
	return label[key]
end
label.__newindex = function(self, prop, val)
	if prop == "Changed" then rawset(self, "Changed", val) return end
	if prop == "Visible" then
		local frame = rawget(self, "Obj")
		if frame then frame.Visible = val end
	elseif prop == "Text" then
		local frame = rawget(self, "Obj")
		if frame then frame.Text = val end
	else
		rawset(self, prop, val)
	end
	local func = rawget(self, "Changed")
	if prop ~= "Changed" and typeof(func) == "function" then pcall(func, prop, val) end
end

local section = {
	Visible = true,
	Title = "Section",
	Obj = nil,
	Changed = nil,
}
section.__index = function(self, key)
	local frame = rawget(self, "Obj")
	if key == "Visible" then
		if frame then return frame.Visible end
	elseif key == "Title" then
		if frame and frame:FindFirstChild("Title") then return frame.Title.Text end
	end
	local cachedValue = rawget(self, key)
	if cachedValue ~= nil then return cachedValue end
	return section[key]
end
section.__newindex = function(self, prop, val)
	if prop == "Changed" then rawset(self, "Changed", val) return end
	if prop == "Visible" then
		local frame = rawget(self, "Obj")
		if frame then frame.Visible = val end
	elseif prop == "Title" then
		local frame = rawget(self, "Obj")
		if frame then frame.Title.Text = val end
	else
		rawset(self, prop, val)
	end
	local func = rawget(self, "Changed")
	if prop ~= "Changed" and typeof(func) == "function" then pcall(func, prop, val) end
end


local isdebug = false

function api:CreateWindow(id: string)
	local search = self
	local me = window
	local self = setmetatable({}, me)
	id = tostring(id)
	
	if id == "nil" then 
		local temp = math.random(0, 99999)
		warn("ID is nil. Changed to "..temp.." .")
		id = tostring(temp)
	end
	
	if id:lower() ~= id then 
		warn("ID "..id.." has been changed to lowercase.")
		id = id:lower()
	end
	local sgui = cgui:FindFirstChild("Comet") or Instance.new("ScreenGui")
	local frame = sgui:FindFirstChild("Window") or Instance.new("Frame")
	local framecorner = frame:FindFirstChild("UICorner") or Instance.new("UICorner")
	framecorner.CornerRadius = UDim.new(0,20)
	framecorner.TopRightRadius = UDim.new(0, 0)
	framecorner.Parent = frame
	sgui.Name = "Comet"
	sgui.Parent = cgui
	frame.Parent = sgui
	frame.Name = "Window"
	frame.Size = UDim2.fromScale(.4, .5)
	frame.Position = UDim2.fromScale(.25, .2)
	frame.BorderSizePixel=0
	frame.BackgroundColor3 = themes[Theme].Background
	
	local tabframe = frame:FindFirstChild("Tabs") or Instance.new("ScrollingFrame")
	tabframe.Parent = frame
	tabframe.Size = UDim2.fromScale(.2, 1)
	tabframe.VerticalScrollBarPosition = "Left"
	tabframe.CanvasSize = UDim2.fromScale(0, 0)
	tabframe.AutomaticCanvasSize = "Y"
	tabframe.BackgroundColor3 = themes[Theme].ButtonBackground
	tabframe.BorderSizePixel=0
	tabframe.Name = "Tabs"
	
	local tabframecorner = tabframe:FindFirstChild("UICorner") or Instance.new("UICorner")
	tabframecorner.CornerRadius = UDim.new(0, 0)
	tabframecorner.BottomLeftRadius = UDim.new(0,20)
	tabframecorner.TopLeftRadius = UDim.new(0,20)
	tabframecorner.Parent = tabframe
	
	local tablist = tabframe:FindFirstChild("UIListLayout") or Instance.new("UIListLayout")
	tablist.Parent = tabframe
	tablist.HorizontalAlignment = "Center"
	tablist.VerticalAlignment = "Top"
	tablist.Padding = UDim.new(0, 0)
	
	local tabtemplate = tabframe:FindFirstChild("Template") or Instance.new("TextButton")
	tabtemplate.Parent = tabframe
	tabtemplate.Name = "Template"
	tabtemplate.Size = UDim2.new(1,0,0,50)
	tabtemplate.BorderSizePixel = 0
	tabtemplate.BackgroundTransparency = 1
	tabtemplate.Text = ""
	tabtemplate.Visible = isdebug
	
	local templateimg = tabtemplate:FindFirstChild("Image") or Instance.new("ImageLabel")
	templateimg.Parent = tabtemplate
	templateimg.Name = "Image"
	templateimg.Size = UDim2.fromScale(.25, 1)
	templateimg.BorderSizePixel=0
	templateimg.BackgroundTransparency = 1
	templateimg.ScaleType = "Fit"
	templateimg.Image = "rbxassetid://11150992908"
	
	local templatetxt = tabtemplate:FindFirstChild("Txt") or Instance.new("TextLabel")
	templatetxt.Name = "Txt"
	templatetxt.BackgroundTransparency = 1
	templatetxt.BorderSizePixel = 0
	templatetxt.Parent = tabtemplate
	templatetxt.TextColor3 = themes[Theme].Text
	templatetxt.Size = UDim2.fromScale(.75, 1)
	templatetxt.Font = "Roboto"
	templatetxt.TextScaled = true
	templatetxt.Position = UDim2.new(.25, 0, 0, 0)
	templatetxt.Text = tab.Text
	templatetxt.RichText=true
	
	local tabsfr = frame:FindFirstChild("TabFrame") or Instance.new("Frame")
	tabsfr.Name = "TabFrame"
	tabsfr.Parent = frame
	tabsfr.BorderSizePixel=0
	tabsfr.BackgroundTransparency = 1
	tabsfr.Size = UDim2.fromScale(.8, .9)
	tabsfr.Position = UDim2.fromScale(.2, 0.1)

	local temptab = frame.TabFrame:FindFirstChild("Template") or Instance.new("Frame")
	temptab.Parent = frame.TabFrame
	temptab.Name = "Template"
	temptab.Size = UDim2.fromScale(1, 1)
	temptab.Position = UDim2.fromScale(0, 0)
	temptab.BorderSizePixel=0
	temptab.BackgroundTransparency = 1
	temptab.ClipsDescendants = true
	temptab.Visible = isdebug

	local templeft = frame.TabFrame.Template:FindFirstChild("Left") or Instance.new("ScrollingFrame")
	templeft.Parent = temptab
	templeft.Name = "Left"
	templeft.Size = UDim2.fromScale(.5,1)
	templeft.BorderSizePixel = 0
	templeft.BackgroundTransparency = 1
	templeft.ClipsDescendants=true
	templeft.CanvasSize = UDim2.fromScale(0, 0)
	templeft.AutomaticCanvasSize = "Y"
	templeft.ScrollBarThickness = 0

	local tempright = frame.TabFrame.Template:FindFirstChild("Right") or Instance.new("ScrollingFrame")
	tempright.Parent = temptab
	tempright.Name = "Right"
	tempright.Size = UDim2.fromScale(.5,1)
	tempright.Position = UDim2.fromScale(.5,0)
	tempright.BorderSizePixel = 0
	tempright.BackgroundTransparency = 1
	tempright.ClipsDescendants=true
	tempright.CanvasSize = UDim2.fromScale(0, 0)
	tempright.AutomaticCanvasSize = "Y"
	tempright.ScrollBarThickness = 0

	local rlist = tempright:FindFirstChild("UIListLayout") or Instance.new("UIListLayout")
	rlist.Parent = tempright
	rlist.SortOrder = "LayoutOrder"
	rlist.Padding = UDim.new(0, 5)
	rlist.HorizontalAlignment = "Center"

	local llist = templeft:FindFirstChild("UIListLayout") or Instance.new("UIListLayout")
	llist.Parent = templeft
	llist.SortOrder = "LayoutOrder"
	llist.Padding = UDim.new(0, 5)
	llist.HorizontalAlignment = "Center"

	local sectiontemp = temptab:FindFirstChild("SectionTemplate") or Instance.new("Frame")
	sectiontemp.Name = "SectionTemplate"
	sectiontemp.Parent = temptab
	sectiontemp.Size = UDim2.fromScale(.9,0)
	sectiontemp.AutomaticSize = "Y"
	sectiontemp.BorderSizePixel = 0
	sectiontemp.BackgroundTransparency = 1
	sectiontemp.Visible = isdebug

	local sts = sectiontemp:FindFirstChild("UIStroke") or Instance.new("UIStroke")
	sts.Parent = sectiontemp
	sts.Thickness = 3
	sts.Color = themes[Theme].Primary
	sts.BorderStrokePosition = "Inner"
	sts.ZIndex = 99999

	local stc = sectiontemp:FindFirstChild("UICorner") or Instance.new("UICorner")
	stc.Parent = sectiontemp
	stc.CornerRadius = UDim.new(0, 20)
	
	local stl = sectiontemp:FindFirstChild("UIListLayout") or Instance.new("UIListLayout")
	stl.Parent = sectiontemp
	stl.SortOrder = "LayoutOrder"
	stl.Padding = UDim.new(0, 2)
	stl.HorizontalAlignment = "Center"

	local stt = sectiontemp:FindFirstChild("Title") or Instance.new("TextLabel")
	stt.Parent = sectiontemp
	stt.Name = "Title"
	stt.RichText=true
	stt.LayoutOrder = -99999
	stt.Text = section.Title
	stt.BorderSizePixel = 0
	stt.TextScaled = true
	stt.BackgroundTransparency = 1
	stt.TextColor3 = themes[Theme].Text
	stt.Font = "Roboto"
	stt.Size = UDim2.new(1, 0, 0, 20)
	local lt = stt:Clone()
	lt.Parent = sectiontemp
	lt.Name = "LabelTemplate"
	lt.Visible =false
	
	local ws = frame:FindFirstChild("UIStroke") or sts:Clone()
	ws.Parent = frame
	ws.BorderStrokePosition = "Outer"
	ws.Thickness = 5
	ws.Color = themes[Theme].Primary

	local dividr = sectiontemp:FindFirstChild("DividerTemplate") or Instance.new("Frame")
	dividr.Visible = isdebug
	dividr.Name = "DividerTemplate"
	dividr.Parent = sectiontemp
	dividr.Size = UDim2.new(1, 0, 0, 15)
	dividr.BorderSizePixel = 0
	dividr.BackgroundTransparency = 1
	local dividrh = dividr:FindFirstChild("Frame") or Instance.new("Frame")
	dividrh.Parent = dividr
	dividrh.Size = UDim2.new(.8, 0, 0, 1)
	dividrh.BorderSizePixel=0
	dividrh.Position = UDim2.new(.1, 0, 0.5, 0)
	dividrh.BackgroundTransparency = 1
	local dividrc = dividrh:FindFirstChild("UICorner") or Instance.new("UICorner")
	dividrc.Parent = dividrh
	dividrc.CornerRadius = UDim.new(999, 99)
	local dividrs = dividrh:FindFirstChild("UIStroke") or ws:Clone()
	dividrs.Color = themes[Theme].Quaternary
	dividrs.BorderStrokePosition = "Center"
	dividrs.Parent = dividrh
	dividrs.Thickness = 3

	local hometabbtn = frame.Tabs:FindFirstChild("Home") or frame.Tabs.Template:Clone()
	hometabbtn.Name = "Home"
	hometabbtn.Parent = frame.Tabs
	hometabbtn.ZIndex = -1
	hometabbtn.Txt.Text = "Home"
	hometabbtn.Image.Image = "rbxassetid://13060262529"
	hometabbtn.Visible = true
	hometabbtn.BackgroundColor3 = themes[Theme].Primary
	hometabbtn.ZIndex = 1
	hometabbtn.BackgroundTransparency=.5
	hometabbtn.LayoutOrder = -9999
	hometabbtn.Activated:Connect(function()
		for i, fr in frame.TabFrame:GetChildren() do
		if not fr:IsA("Frame") then continue end
			fr.Visible = false
		end
		for i, fr in frame.Tabs:GetChildren() do
		if not fr:IsA("TextButton") then continue end
			ts:Create(fr,TweenInfo.new(.25, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0),{BackgroundTransparency = 1}):Play()
		end
		ts:Create(frame.Tabs.Home,TweenInfo.new(.25, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0),{BackgroundTransparency = .5}):Play()
		frame.TabFrame.Template.Visible = true
	end)
	local btnround = hometabbtn:FindFirstChild("UICorner") or Instance.new("UICorner")
	btnround.Parent = hometabbtn
	btnround.CornerRadius = UDim.new(0, 10)
	
	local topbar = frame:FindFirstChild("Topbar") or Instance.new("Frame")
	topbar.Parent = frame
	topbar.Name="Topbar"
	topbar.Size = UDim2.fromScale(.8,.1)
	topbar.Position = UDim2.fromScale(.2, 0)
	topbar.BorderSizePixel = 0
	topbar.BackgroundTransparency = 0
	topbar.BackgroundColor3 = themes[Theme].Topbar

	local bt = sectiontemp:FindFirstChild("ButtonTemplate") or Instance.new("Frame")
	bt.Name = 'ButtonTemplate'
	bt.Parent = sectiontemp
	bt.Size = UDim2.new(.9, 0, 0, 30)
	bt.BackgroundTransparency = 1
	bt.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	bt.BorderSizePixel=0
	bt.Visible = isdebug

	local btc = bt:FindFirstChild("UICorner") or Instance.new("UICorner")
	btc.Parent = bt
	btc.CornerRadius = UDim.new(0, 10)

	local btb = bt:FindFirstChild("Button") or Instance.new("TextButton")
	btb.Parent = bt
	btb.Name = "Button"
	btb.Size = UDim2.new(.8, 0, 0, 15)
	btc:Clone().Parent = btb
	btb.BackgroundColor3 = themes[Theme].Tertiary
	btb.Font = "Roboto"
	btb.TextColor3 = themes[Theme].Text
	btb.TextScaled = true
	btb.Position = UDim2.fromScale(.1, .25)
	btb.Text = button.Text
	btb.RichText = true

	local btbs = btb:FindFirstChild("UIStroke") or Instance.new("UIStroke")
	btbs.Parent = btb
	btbs.Thickness = 3
	btbs.ApplyStrokeMode='Border'
	btbs.Color = themes[Theme].Primary

	local tt = sectiontemp:FindFirstChild("ToggleTemplate") or bt:Clone()
	tt.Name = "ToggleTemplate"
	tt.Parent = sectiontemp
	tt.Visible = isdebug
	tt.Button.Text = ""
	local off = UDim2.new(.8, -15, .25, 0)
	local on = UDim2.new(.9, -15, .25, 0)
	tt.Button.Size = UDim2.fromOffset(15, 15)
	tt.Button.Position = if toggle.Default then on else off
	tt.Button.ZIndex = 9
	
	local ttb = tt:FindFirstChild("ToggleBg") or Instance.new("Frame")
	ttb.Name = "ToggleBg"
	ttb.Parent = tt 
	ttb.Size = UDim2.new(.1, 0, .2, 0)
	ttb.Position = UDim2.new(.8,-7.5, .5,-3)
	ttb.BorderSizePixel =0
	tt.Button.UICorner:Clone().Parent = ttb
	ttb.BackgroundColor3 = themes[Theme].Secondary

	local ttt = tt:FindFirstChild("Text") or Instance.new("TextLabel")
	ttt.Name = "Text"
	ttt.Parent = tt
	ttt.Size = UDim2.fromScale(.5, 1)
	ttt.BackgroundTransparency = 1
	ttt.BorderSizePixel=0
	ttt.TextColor3=themes[Theme].Text
	ttt.Font = "Roboto"
	ttt.Text = toggle.Text
	ttt.TextScaled = true
	ttt.RichText = true

	local dragging = false
local dragInput = nil
local dragStart = nil
local startPosition = nil

local function update(input)
	local delta = input.Position - dragStart
	frame.Position = UDim2.new(
		startPosition.X.Scale, 
		startPosition.X.Offset + delta.X, 
		startPosition.Y.Scale, 
		startPosition.Y.Offset + delta.Y
	)
end

topbar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPosition = frame.Position
		
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

topbar.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

uis.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)

	local title = topbar:FindFirstChild("Label") or Instance.new("TextLabel")
	title.Name = "Label"
	title.Parent=topbar
	title.BorderSizePixel=0
	title.BackgroundTransparency=1
	title.TextColor3= themes[Theme].Text
	title.RichText = true
	title.Font = "Roboto"
	title.Size = UDim2.fromScale(1, 1)
	title.Text = self.Title.."\n<b><font color='rgb(122,30,255)' size='3'>Comet API V"..Version..self.Footer.."</font></b>"
	title.TextScaled = true
	title.RichText = true

	local st = sectiontemp:FindFirstChild("SliderTemplate")or  tt:Clone()
	st.Name = "SliderTemplate"
	st.Parent = sectiontemp
	st.Button.Size = UDim2.fromScale(.8, .8)
	st.Button.Position = UDim2.fromScale(.1, .1)
	st.Button.Text = ""
	st.Button:ClearAllChildren()
	st.Button.BackgroundTransparency =1
	st.Visible = isdebug
	local stb = st.ToggleBg
	stb.Name = "Bg"
	stb.Size = UDim2.fromScale(.8,.8)
	stb.UICorner.CornerRadius = UDim.new(0, 10)
	stb.Position = UDim2.fromScale(.1, .1)
	stb.Parent = st
	local stt = st.Text
	stt.Size = UDim2.fromScale(.8, .8)
	stt.Position = UDim2.fromScale(.1, .1)
	stt.ZIndex = 100
	stt.RichText = true
	stt.Text = slider.Text..": "..slider.Default
	local sts = stb:FindFirstChild("Slider") or Instance.new("Frame")
	sts.Size = UDim2.fromScale(.5, 1)
	sts.Position = UDim2.fromScale(0, 0)
	sts.ZIndex = 99
	sts.BackgroundColor3 = themes[Theme].Primary
	sts.BorderSizePixel=0
	sts.Name = "Slider"
	sts.Parent = stb
	stb.UICorner:Clone().Parent = sts

	local hometab = frame.TabFrame:FindFirstChild("Home") or temptab:Clone()
	hometab.Name = "Home"
	hometab.Parent = frame.TabFrame
	hometab.Visible = true


	local hometabs= setmetatable({}, tab)
	hometabs.Page = hometab
	hometabs.Button = hometabbtn
	hometabs.Text = "Home"
	hometabs.Image = "rbxassetid://13060262529"
	hometabs.Obj = hometab

	self.HomeTab = hometabs
	self.Obj = frame
	search[id] = self
	self.HomeTabPage = hometab
	self.HomeTabButton = hometabbtn

	uis.InputBegan:Connect(function(inp)
	if inp.KeyCode == togglekey then frame.Visible = not frame.Visible end
	end)
	hometabs:CreateRightSection("changelog",9)
	hometabs.changelog.Title = "Comet API ChangeLog"
	hometabs.changelog.Obj.Title.TextColor3 = Color3.fromRGB(220, 200, 255)
	hometabs.changelog.Obj.Title.Size = UDim2.new(.95, 0, 0, 25)
	for i, log in changelog do
		hometabs.changelog:AddDivider("d"..log.Index,log.Index*-1)
		hometabs.changelog:AddLabel("l"..log.Index,log.Index*-1)
		hometabs.changelog["l"..i].Obj.AutomaticSize = "Y"
		hometabs.changelog["l"..i].Obj.TextScaled = false
		hometabs.changelog["l"..i].Obj.TextSize = 30
		hometabs.changelog["l"..i].Obj.TextXAlignment = "Left"
		hometabs.changelog["l"..i].Obj.Size = UDim2.new(.95, 0, 0, 15)
		if log.Ver == Version then
		hometabs.changelog["l"..i].Text = ("<b><font color='rgb(0,255,0)' size='15'>[CURRENT]</font></b>\n".."<font color='rgb(122,50,255)'>Version <b>"..log.Ver.."</b>;</font>\n<i><font color='rgb(200,150,255)'> *"..log.Title.."* :</font></i>\n"..log.Desc)
		else
		hometabs.changelog["l"..i].Text = ("<font color='rgb(122,50,255)'>Version <b>"..log.Ver.."</b>;</font>\n<i><font color='rgb(200,150,255)'> *"..log.Title.."* :</font></i>\n"..log.Desc)
		end		
	end
	return self
end

function window:CreateTab(id: string,idx: number)
	local search = self
	local me = tab
	local self = setmetatable({}, me)
	id = tostring(id)
	
	if id== "nil" then 
		local temp = math.random(0, 99999)
		warn("ID is nil. Changed to "..temp.." .")
		id = tostring(temp)
	end
	
	if id:lower() ~= id then 
		warn("ID "..id.." has been changed to lowercase.")
		id = id:lower()
	end

	local frame = cgui:WaitForChild("Comet").Window
	local tabs = frame.Tabs
	local tabframe = frame.TabFrame
	local newtab = tabs.Template:Clone()
	newtab.LayoutOrder = idx
	newtab.Name = id
	newtab.Visible = true
	newtab.Parent = tabs
	newtab.BorderSizePixel=0
	newtab.BackgroundColor3 = themes[Theme].Primary
	local btnround = newtab:FindFirstChild("UICorner") or Instance.new("UICorner")
	btnround.Parent = newtab
	btnround.CornerRadius = UDim.new(0, 10)
	newtab.Activated:Connect(function(inp)
		for i, fr in tabframe:GetChildren() do
		if not fr:IsA("Frame") then continue end
			fr.Visible = false
		end
		for i, fr in tabs:GetChildren() do
		if not fr:IsA("TextButton") then continue end
			ts:Create(fr,TweenInfo.new(.25, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0),{BackgroundTransparency = 1}):Play()
		end
				ts:Create(tabs[id],TweenInfo.new(.25, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0),{BackgroundTransparency = .5}):Play()
		tabframe[id].Visible = true
	end)

	tabframe.Template.Visible = true 
	local ntab = tabframe.Template:Clone()
	tabframe.Template.Visible = false 
	ntab.Parent = tabframe
	ntab.Name = id
	ntab.Visible = false

	search[id] = self
	self.Button = newtab
	self.Page = ntab
	self.Obj = newtab
	return self
end

function tab:CreateLeftSection(id: string,idx: number)
	local search = self
	local me = section
	local self = setmetatable({}, me)
	id = tostring(id)
	
	if id== "nil" then 
		local temp = math.random(0, 99999)
		warn("ID is nil. Changed to "..temp.." .")
		id = tostring(temp)
	end
	
	if id:lower() ~= id then 
		warn("ID "..id.." has been changed to lowercase.")
		id = id:lower()
	end

	local frame = cgui:WaitForChild("Comet").Window
	local tabframe = frame.TabFrame
	local parent = search.Page
	local ns = parent.Parent.Template.SectionTemplate:Clone()
	ns.Parent = parent.Left
	ns.Name = id
	ns.LayoutOrder = idx
	ns.Title.Text = section.Title
	ns.Visible = true
	search[id] = self
	self.Obj = ns
	return self
end

function tab:CreateRightSection(id: string,idx: number)
	local search = self
	local me = section
	local self = setmetatable({}, me)
	id = tostring(id)
	
	if id== "nil" then 
		local temp = math.random(0, 99999)
		warn("ID is nil. Changed to "..temp.." .")
		id = tostring(temp)
	end
	
	if id:lower() ~= id then 
		warn("ID "..id.." has been changed to lowercase.")
		id = id:lower()
	end

	local frame = cgui:WaitForChild("Comet").Window
	local tabframe = frame.TabFrame
	local parent = search.Page
	local ns = parent.Parent.Template.SectionTemplate:Clone()
	ns.Parent = parent.Right
	ns.Name = id
	ns.LayoutOrder = idx
	ns.Title.Text = section.Title
	ns.Visible = true
	search[id] = self
	self.Obj = ns
	return self
end

function section:AddDivider(id: string,idx: number)
	local search = self
	local me = divider
	local self = setmetatable({}, me)
	id = tostring(id)
	
	if id== "nil" then 
		local temp = math.random(0, 99999)
		warn("ID is nil. Changed to "..temp.." .")
		id = tostring(temp)
	end
	
	if id:lower() ~= id then 
		warn("ID "..id.." has been changed to lowercase.")
		id = id:lower()
	end

	local frame = cgui:WaitForChild("Comet").Window
	local tabframe = frame.TabFrame
	local ns = search.Obj.DividerTemplate:Clone()
		ns.Name = id
		ns.LayoutOrder = idx
	ns.Visible = true
	ns.Parent = search.Obj
	search[id] = self
	self.Obj = ns
	return self
end


function section:AddLabel(id: string, idx:number)
	local search = self
	local me = label
	local self = setmetatable({}, me)
	id = tostring(id)
	
	if id== "nil" then 
		local temp = math.random(0, 99999)
		warn("ID is nil. Changed to "..temp.." .")
		id = tostring(temp)
	end
	
	if id:lower() ~= id then 
		warn("ID "..id.." has been changed to lowercase.")
		id = id:lower()
	end

	local frame = cgui:WaitForChild("Comet").Window
	local tabframe = frame.TabFrame
	local ns = search.Obj.LabelTemplate:Clone()
	ns.Name = id
	ns.Parent = search.Obj
	ns.Visible = true
		ns.LayoutOrder = idx

	ns.Text = label.Text
	search[id] = self
	self.Obj = ns
	return self
end
function section:AddButton(id: string, idx:number)
	local search = self
	local me = button
	local self = setmetatable({}, me)
	id = tostring(id)
	
	if id== "nil" then 
		local temp = math.random(0, 99999)
		warn("ID is nil. Changed to "..temp.." .")
		id = tostring(temp)
	end
	
	if id:lower() ~= id then 
		warn("ID "..id.." has been changed to lowercase.")
		id = id:lower()
	end

	local frame = cgui:WaitForChild("Comet").Window
	local tabframe = frame.TabFrame
	local ns = search.Obj.ButtonTemplate:Clone()
	ns.Name = id
	ns.Parent = search.Obj
	ns.Visible = true
		ns.LayoutOrder = idx

	ns.Button.Text = button.Text
	ns.Button.FontFace = Font.fromName("Roboto", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
	ns.Button.AutoButtonColor = false
	ns.Button.MouseEnter:Connect(function()
		ts:Create(ns.Button,TweenInfo.new(.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{TextColor3 = themes[Theme].ButtonHover}):Play()
	end)
	ns.Button.MouseLeave:Connect(function()
		ts:Create(ns.Button,TweenInfo.new(.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{TextColor3 = themes[Theme].Text}):Play()
	end)
	ns:SetAttribute("Value", false)
	ns.Button.Activated:Connect(function()
		self.Value = true
		ns:SetAttribute("Value", true)
		wait()
		self.Value=false
		ns:SetAttribute("Value", false)
	end)
	search[id] = self
	self.Obj = ns
	return self
end
function section:AddToggle(id: string, idx:number, default:boolean)
	local search = self
	local me = toggle
	local self = setmetatable({}, me)
	id = tostring(id)
	
	if id== "nil" then 
		local temp = math.random(0, 99999)
		warn("ID is nil. Changed to "..temp.." .")
		id = tostring(temp)
	end
	
	if id:lower() ~= id then 
		warn("ID "..id.." has been changed to lowercase.")
		id = id:lower()
	end

	local frame = cgui:WaitForChild("Comet").Window
	local tabframe = frame.TabFrame
	local ns = search.Obj.ToggleTemplate:Clone()
	local off = UDim2.new(.8, -15, .25, 0)
	local on = UDim2.new(.9, -15, .25, 0)
	self.Default = default
	self.Value = default
	ns.Name = id
		ns.LayoutOrder = idx

	ns.Parent = search.Obj
	ns.Button.Position = if default then on else off
	ns.Visible = true
	ns.Text.Text = toggle.Text
	ns:SetAttribute("Value", self.Default)
	ns.Button.AutoButtonColor = false
	ns.Button.Activated:Connect(function()
		self.Value = not self.Value
		ns:SetAttribute("Value", self.Value)
		if self.Value then
			ts:Create(ns.Button,TweenInfo.new(.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{Position = on}):Play()
		else
			ts:Create(ns.Button,TweenInfo.new(.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{Position = off}):Play()
		end
	end)
	search[id] = self
	self.Obj = ns
	return self
end
function section:AddSlider(id: string, idx:number, min:number,max:number,default:number)
	local search = self
	local me = slider
	local self = setmetatable({}, me)
	id = tostring(id)
	
	if id== "nil" then 
		local temp = math.random(0, 99999)
		warn("ID is nil. Changed to "..temp.." .")
		id = tostring(temp)
	end
	
	if id:lower() ~= id then 
		warn("ID "..id.." has been changed to lowercase.")
		id = id:lower()
	end

	local frame = cgui:WaitForChild("Comet").Window
	local tabframe = frame.TabFrame
	local ns = search.Obj.SliderTemplate:Clone()
	local mouse = lplr:GetMouse()
	local slidr = ns.Bg.Slider
	local bg = ns.Bg
	local btn = ns.Button
	local active = false
	ns.LayoutOrder = idx

	self.Default = default
	self.Min = min 
	self.Max = max 
	self.Value = default
	slidr.Size = UDim2.fromScale((default - min) / (max - min),1)
	ns.Name = id
	ns.Bg.ClipsDescendants = true
	ns.Parent = search.Obj
	ns.Visible = true
	ns.Text.Text = slider.Text..": "..math.floor(default)
	ns:SetAttribute("Value", self.Default)
	ns:SetAttribute("Minimum", min)
	ns:SetAttribute("Maximum", max)
	
	search[id] = self
	self.Obj = ns
	btn.MouseButton1Down:Connect(function(i)
	--if not i.UserInputType == "MouseButton1" and not i.UserInputType == "Touch" then return end
	active = true
	while active do
		task.wait()
		slidr.Size= UDim2.fromScale((mouse.X-slidr.Parent.AbsolutePosition.X)/slidr.Parent.AbsoluteSize.X,1)
		if slidr.Size.X.Scale > 1 then slidr.Size = UDim2.fromScale(1, 1) elseif slidr.Size.X.Scale<0 then slidr.Size = UDim2.fromScale(0, 1) end
				ns.Text.Text =self.Text..": "..math.round(ns:GetAttribute("Minimum") + (ns:GetAttribute("Maximum") - ns:GetAttribute("Minimum")) * slidr.Size.X.Scale)
				ns:SetAttribute("Value", ns:GetAttribute("Minimum") + (ns:GetAttribute("Maximum") - ns:GetAttribute("Minimum")) * slidr.Size.X.Scale)
				self.Value = ns:GetAttribute("Minimum") + (ns:GetAttribute("Maximum") - ns:GetAttribute("Minimum")) * slidr.Size.X.Scale
		if isdebug then	
		print("SLIDER "..id.." ATTRIBUTES: MIN", ns:GetAttribute("Minimum"), "MAX", ns:GetAttribute("Maximum"), "VAL", ns:GetAttribute("Value"), "TABLE MIN", self.Min, "MAX", self.Max, "VAL", self.Value)
		end
	end end)
	
	uis.InputEnded:Connect(function(i)
	if not i.UserInputType == "MouseButton1" and not i.UserInputType == "Touch" then return end
	active = false
	end)

	return self
end
getgenv().CometAPI = api
return api 
-- :D
