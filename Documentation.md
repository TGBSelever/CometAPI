# CometAPI Documentation

### SUPPORT: [Discord](https://discord.com/users/1343301126581387345)

#### Current Version: 1.0.0

## Functions
### API:CreateWindow(ID: string) : Window
**Example Code**
```lua
local API = loadstring(game:HttpGet("https://raw.githubusercontent.com/TGBSelever/CometAPI/refs/heads/main/API/Latest.luau"))()
API:CreateWindow("mywindow")
```
Creates a Window with a given ID. There can only exist one Window.

Returns: Window

**Parameters:**

ID: `string`: A indentifier of the element.

ID *Should* be lowercase, otherwise it **will** be converted to lowercase. Nor shouldn't it be `nil`.







### Window:CreateTab(ID: string, Idx: number) : Tab
**Example Code**
```lua
local API = loadstring(game:HttpGet("https://raw.githubusercontent.com/TGBSelever/CometAPI/refs/heads/main/API/Latest.luau"))()
local MyWindow = API:CreateWindow("mywindow")
MyTab:CreateTab("tab",1)
```
**OR** ***[BOTH OF THESE HAVE THE SAME OUTPUT, SAME WITH OTHER EXAMPLES.]***
```lua
local API = loadstring(game:HttpGet("https://raw.githubusercontent.com/TGBSelever/CometAPI/refs/heads/main/API/Latest.luau"))()
API:CreateWindow("mywindow"):CreateTab("tab",1)
```
Creates a Tab with a given ID and Index. There can only exist many Tabs.

Returns: Tab

**Parameters:**

ID: `string`: A indentifier of the element.

ID *Should* be lowercase, otherwise it **will** be converted to lowercase. Nor shouldn't it be `nil`.

Idx: `number`: The order of the element. Higher = Lower.

Idx **MUST** be a number otherwise it will error.





### Tab:CreateLeftSection(ID: string, Idx: number) : Section
**Example Code**
```lua
local API = loadstring(game:HttpGet("https://raw.githubusercontent.com/TGBSelever/CometAPI/refs/heads/main/API/Latest.luau"))()
local MyWindow = API:CreateWindow("mywindow")
local MyTab = MyTab:CreateTab("tab",1)
MyTab:CreateLeftSection("section",1)
```
***FUNCTION :CreateRightSection() HAS EVERYTHING THE SAME SO IT ISN'T SHOWN IN THE DOCUMENTATION.***

Creates a Section with a given ID. There can exist infinite Sections.

Returns: Section

**Parameters:**

ID: `string`: A indentifier of the element.

ID *Should* be lowercase, otherwise it **will** be converted to lowercase. Nor shouldn't it be `nil`.

Idx: `number`: The order of the element. Higher = Lower.

Idx **MUST** be a number otherwise it will error.






### Section:AddLabel(ID: string, Idx: number) : Label
**Example Code**
```lua
local API = loadstring(game:HttpGet("https://raw.githubusercontent.com/TGBSelever/CometAPI/refs/heads/main/API/Latest.luau"))()
local MyWindow = API:CreateWindow("mywindow")
local MyTab = MyTab:CreateTab("tab",1)
local MySection = MyTab:CreateLeftSection("section",1)
MySection:AddLabel("text",1)
```
Creates a Label with a given ID and Index. There can exist infinite Labels.

Returns: Label

**Parameters:**

ID: `string`: A indentifier of the element.

ID *Should* be lowercase, otherwise it **will** be converted to lowercase. Nor shouldn't it be `nil`.

Idx: `number`: The order of the element. Higher = Lower.

Idx **MUST** be a number otherwise it will error.





### Section:AddDivider(ID: string, Idx: number) : Divider
**Example Code**
```lua
local API = loadstring(game:HttpGet("https://raw.githubusercontent.com/TGBSelever/CometAPI/refs/heads/main/API/Latest.luau"))()
local MyWindow = API:CreateWindow("mywindow")
local MyTab = MyTab:CreateTab("tab",1)
local MySection = MyTab:CreateLeftSection("section",1)
MySection:AddDivider("divider",1)
```
Creates a Divider with a given ID and Index. There can exist infinite Dividers.

Returns: Divider

**Parameters:**

ID: `string`: A indentifier of the element.

ID *Should* be lowercase, otherwise it **will** be converted to lowercase. Nor shouldn't it be `nil`.

Idx: `number`: The order of the element. Higher = Lower.

Idx **MUST** be a number otherwise it will error.





### Section:AddButton(ID: string, Idx: number) : Button
**Example Code**
```lua
local API = loadstring(game:HttpGet("https://raw.githubusercontent.com/TGBSelever/CometAPI/refs/heads/main/API/Latest.luau"))()
local MyWindow = API:CreateWindow("mywindow")
local MyTab = MyTab:CreateTab("tab",1)
local MySection = MyTab:CreateLeftSection("section",1)
MySection:AddButton("btn",1)
```
Creates a Button with a given ID and Index. There can exist infinite Buttons.

Returns: Button

**Parameters:**

ID: `string`: A indentifier of the element.

ID *Should* be lowercase, otherwise it **will** be converted to lowercase. Nor shouldn't it be `nil`.

Idx: `number`: The order of the element. Higher = Lower.

Idx **MUST** be a number otherwise it will error.





### Section:AddToggle(ID: string, Idx: number, Default: boolean) : Toggle
**Example Code**
```lua
local API = loadstring(game:HttpGet("https://raw.githubusercontent.com/TGBSelever/CometAPI/refs/heads/main/API/Latest.luau"))()
local MyWindow = API:CreateWindow("mywindow")
local MyTab = MyTab:CreateTab("tab",1)
local MySection = MyTab:CreateLeftSection("section",1)
MySection:AddToggle("tgle",1)
```
Creates a Toggle with a given ID, Index and a Default value. There can exist infinite Toggles.

Returns: Toggle

**Parameters:**

ID: `string`: A indentifier of the element.

ID *Should* be lowercase, otherwise it **will** be converted to lowercase. Nor shouldn't it be `nil`.

Idx: `number`: The order of the element. Higher = Lower.

Idx **MUST** be a number otherwise it will error.

Default: `boolean`: Depicts the default value of the toggle.

Default **MUST** be either `true` or `false`





### Section:AddSlider(ID: string, Idx: number, Min: number, Max: number, Default: number) : Slider
**Example Code**
```lua
local API = loadstring(game:HttpGet("https://raw.githubusercontent.com/TGBSelever/CometAPI/refs/heads/main/API/Latest.luau"))()
local MyWindow = API:CreateWindow("mywindow")
local MyTab = MyTab:CreateTab("tab",1)
local MySection = MyTab:CreateLeftSection("section",1)
MySection:AddSlider("walkspeed",1,1,100,16)
```
Creates a Slider with a given ID, Index, Minimum value, Maximum value and a Default value. There can exist infinite Sliders.

Returns: Slider

**Parameters:**

ID: `string`: A indentifier of the element.

ID *Should* be lowercase, otherwise it **will** be converted to lowercase. Nor shouldn't it be `nil`.

Idx: `number`: The order of the element. Higher = Lower.

Idx **MUST** be a number otherwise it will error.

Min: `number`: The lower-end value of the slider.

Min *Should* be smaller than `Max`.

Max: `number`: The higher-end value of the slider.

Max *Shouldn't* be higher than `Min`

Default: `number`: The default value of the slider.

Default *Should* be in the range in between `Min` and `Max`



## Properties

### Window

Visible: `boolean` - Depicts either the Window is visible or not. **MUST** be `true` or `false`.

Title: `string` - The title of the Window.

Footer: `string` - The string below the Title.

HomeTab: `Tab` - The default Tab when used the `API:CreateWindow()` function.

HomeTabPage: `Frame` - The page of the Tab used by the HomeTab.

HomeTabButton: `TextButton` - The button that is on the left-hand side saying "Home"

Obj: `Frame` - The frame of the Window.

Changed: `function` - The function that can be used to detect when a property gets changed.

### Tab

Visible: `boolean` - Depicts either the Tab is visible or not. **MUST** be `true` or `false`.

Text: `string` - The text on the button of the Tab.

Image: `string` or `number` - The image on the button of the Tab.

Page: `Frame` - The page of the Tab used by the HomeTab.

Button: `TextButton` - The button that is on the left-hand side saying "Home"

Obj: `TextButton` - The button of the Tab. **[NOT RECOMMENDED, USE `.Button` INSTEAD.]**

Changed: `function` - The function that can be used to detect when a property gets changed. 

### Section

Visible: `boolean` - Depicts either the Section is visible or not. **MUST** be `true` or `false`.

Title: `string` - The title on top of the Section.

Obj: `Frame` - The frame of the Section.

Changed: `function` - The function that can be used to detect when a property gets changed. 

### Label

Visible: `boolean` - Depicts either the Label is visible or not. **MUST** be `true` or `false`.

Text: `string` - The text of the Label.

Obj: `Frame` - The frame of the Label.

Changed: `function` - The function that can be used to detect when a property gets changed. 

### Divider

Visible: `boolean` - Depicts either the Divider is visible or not. **MUST** be `true` or `false`.

Obj: `Frame` - The frame of the Divider.

Changed: `function` - The function that can be used to detect when a property gets changed. 

### Button

Visible: `boolean` - Depicts either the Button is visible or not. **MUST** be `true` or `false`.

Text: `string` - The text displayed on the Button.

Value: `boolean` - The value of the Button. When pressed turns to  `true` for a frame, then goes back to `false`.

Obj: `Frame` - The frame of the Button.

Changed: `function` - The function that can be used to detect when a property gets changed. 

### Toggle

Visible: `boolean` - Depicts either the Toggle is visible or not. **MUST** be `true` or `false`.

Text: `string` - The text displayed on the Toggle.

Value: `boolean` - The value of the Toggle. Toggles between `true` and `false` when pressed.

Default: `boolean` - The default value of the Toggle.

Obj: `Frame` - The frame of the Toggle.

Changed: `function` - The function that can be used to detect when a property gets changed. 

### Slider

Visible: `boolean` - Depicts either the Slider is visible or not. **MUST** be `true` or `false`.

Text: `string` - The text displayed on the Slider.

Min: `number` - The low-end value that the Slider can show.

Max: `number` - The high-end value that the Slider can show.

Value: `number` - The value of the Slider. Stays in between of `Min` and `Max`. Unless set with `Default` outside of the range.

Default: `number` - The default value of the Slider.

Obj: `Frame` - The frame of the Slider.

Changed: `function` - The function that can be used to detect when a property gets changed. 

## Notes

### .Changed function

To up hook a function with the .Changed property use:
```lua
[OBJECT].Changed = function(property, value) ... end
```
`property` Depicts what property changed. Ex. `Visible`, `Value`.

`value` Depicts what the `property` changed to. Ex. `true`, `15`

### When you take the API and modify it, please credit me. 
