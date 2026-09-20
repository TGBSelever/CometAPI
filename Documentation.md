# CometAPI Documentation

#### Current Version: 1.0.0

## Table of contents

## Functions
#### API:CreateWindow(ID: string) : Window
**Example Code**
```lua
local API = loadstring(game:HttpGet("https://raw.githubusercontent.com/TGBSelever/CometAPI/refs/heads/main/API/Latest.luau"))()
API:CreateWindow("mywindow")
```
Creates a Window with a given ID. There can only exist one Window per game.

Returns: Window

**Parameters:**

ID: `string` 

ID *Should* be lowercase, otherwise it **will** be converted to lowercase. Nor should'nt it be `nil`.

