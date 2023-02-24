--init
local plusLibraryInit = {}

--loadstrings
local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()
local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/zxciaz/VenyxUI/main/Reuploaded"))()
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()


-- define values
if _G.functionsEnabled == nil then _G.functionsEnabled = true end
if _G.plusUIEnabled == nil then _G.plusUIEnabled = true end
local plustheme = "Orion"
local plusmode = "release"

--syntax
if _G.plusUIEnabled == false and plustheme == not nil then
    plusNotification(
                {title = "PlusLib - UITheme", desc = "UITheme not set."},
                {timecolour = Colour3.fromRGB(255, 0, 0), time = 10}
            )
end

--plusfunctions
function plusConfig(libraryTheme, mode)
    if libraryTheme == "orion" or "Orion" then
        plustheme = "orion"
    end
    if libraryTheme == "venyx" or "Venyx" then
        plustheme = "venyx"
    end
    if libraryTheme == "rayfield" or "Rayfield" then
        plustheme = "rayfield"
    end
    if libraryTheme == "minimal" or "min" then
        plustheme = "minimal"
    end
    if mode == "dev" or "development" then
        plusmode = "dev"
    end
    if mode == "release" then
        plusmode = "release"
    end
end



--functions
if functions == true then
    function plusRepeatTimes(amount, script)
        while amount == not 0 do
            loadstring(script)
            amount = amount - 1
        end
    end
    
    function plusRun(script)
        loadstring(script)
    end

    function plusForever(script)
        repeat
            loadstring(script)
        until 1 == not 1
    end

    function plusRepeatFor(time, script, interval)
        if interval == nil then interval = 1 end
        if time == not 0 then
            loadstring(script)
            time = time  - 1
            wait(interval)
        end
    end
end

--remaps
function plusNotification(title, desc, timecolour, time)
    Notification:Notify(
    {Title = title, Description = desc},
    {OutlineColor = timecolour,Time = time})
end

function plusUIwindow(name, icon)
    if plustheme == "minimal" then
        local minimal = Library:NewWindow(name)
        if icon == not nil and plusmode == "dev" then
            plusNotification(
                {title = "PlusLib - UI: "..plustheme, desc = "'"..plustheme.."' does not support icon parameter on window."},
                {timecolour = Colour3.fromRGB(255, 0, 0), time = 10}
            )
        end
    end
    if plustheme == "orion" then
        local Window = OrionLib:MakeWindow({Name = name, Icon = icon})
    end
    if plustheme == "venyx" then
        local venyx = library.new(name, icon)
    end
    if plustheme == "rayfield" then
        local Window = Rayfield:CreateWindow({
            Name = name,
            LoadingTitle = name,
        })
        if icon == not nil and plusmode == "dev" then
            plusNotification(
                {title = "PlusLib - UI: "..plustheme, desc = "'"..plustheme.."' does not support icon parameter on window."},
                {timecolour = Colour3.fromRGB(255, 0, 0), time = 10}
            )
        end
        if name == nil then
            plusNotification(
                {title = "PlusLib - UI: "..plustheme, desc = "Tab name not set; defaulting to '"..plustheme.."'"},
                {timecolour = Colour3.fromRGB(255, 0, 0), time = 10}
            )
            name = plustheme
        end
    end
end

function plusUItab(name, icon)
    if plustheme == "minimal" then
        local tabname = name
        tabname = minimal:NewSection(name)
        if icon == not nil and plusmode == "dev" then
            plusNotification(
                {title = "PlusLib - UI: "..plustheme, desc = "'"..plustheme.."' does not support icon parameter on tab."},
                {timecolour = Colour3.fromRGB(255, 0, 0), time = 10}
            )
        end
        if name == nil then
            plusNotification(
                {title = "PlusLib - UI: "..plustheme, desc = "Tab name not set; defaulting to '"..plustheme.."'."},
                {timecolour = Colour3.fromRGB(255, 0, 0), time = 10}
            )
            name = plustheme
        end
    end
    if plustheme == "orion" then
        local tabname = name
        tabname = Window:MakeTab({
            Name = name,
            Icon = icon,
        })
        if name == nil then
            plusNotification(
                {title = "PlusLib - UI: "..plustheme, desc = "Tab name not set; defaulting to '"..plustheme.."'."},
                {timecolour = Colour3.fromRGB(255, 0, 0), time = 10}
            )
            name = plustheme
        end
    end
    if plustheme == "rayfield" then
        local tabname = name
        tabname = Window:CreateTab(name, icon) -- Title, Image
        if name == nil then
            plusNotification(
                {title = "PlusLib - UI: "..plustheme, desc = "Tab name not set; defaulting to '"..plustheme.."'."},
                {timecolour = Colour3.fromRGB(255, 0, 0), time = 10}
            )
            name = plustheme
        end
    end
    if plustheme == "venyx" then
        local tabname = name
        tabname = venyx:addPage(name, icon)
        if name == nil then
            plusNotification(
                {title = "PlusLib - UI: "..plustheme, desc = "Tab name not set; defaulting to '"..plustheme.."'."},
                {timecolour = Colour3.fromRGB(255, 0, 0), time = 10}
            )
            name = plustheme
        end
    end
end
function plusUIbutton(name, callback, parent)
    if plustheme == "minimal" then
        parent:CreateButton(name, callback)
        if name == nil then
            plusNotification(
                    {title = "PlusLib - UI: "..plustheme, desc = "Button name not set; defaulting to 'Button'."},
                    {timecolour = Colour3.fromRGB(255, 0, 0), time = 10}
            )
            name = "Button"
        end
    end
    if plustheme == "orion" then
        parent:AddButton({
            Name = name,
            Callback = callback
        })
        if name == nil then
            plusNotification(
                    {title = "PlusLib - UI: "..plustheme, desc = "Button name not set; defaulting to 'Button'."},
                    {timecolour = Colour3.fromRGB(255, 0, 0), time = 10}
            )
            name = "Button"
        end
    end
    if plustheme == "rayfield" then
        local Button = parent:CreateButton({
            Name = name,
            Callback = callback
         })
    end
    if plustheme == "venyx" then
        parent:addButton(name, callback)
        if name == nil then
            plusNotification(
                    {title = "PlusLib - UI: "..plustheme, desc = "Button name not set; defaulting to 'Button'."},
                    {timecolour = Colour3.fromRGB(255, 0, 0), time = 10}
            )
            name = "Button"
        end
    end
    if callback == nil then
        plusNotification(
                {title = "PlusLib - UI: "..plustheme, desc = "Callback not set on '"..name.."'."},
                {timecolour = Colour3.fromRGB(255, 0, 0), time = 10}
        )
        name = "Button"
    end
end

function plusUIsection(name, parent, callback)
    if plustheme == "minimal" then
        plusNotification(
                {title = "PlusLib - UI: "..plustheme, desc = "Sections function not required for '"..plustheme.."'; entered values have been voided."},
                {timecolour = Colour3.fromRGB(255, 0, 0), time = 10}
        )
    end
end

return plusLibraryInit
