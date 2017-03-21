------ CAFFEINE ------
local caffeine = hs.menubar.new()

function setCaffeineDisplay(state)
    local result
    if state then
        result = caffeine:setIcon("~/.hammerspoon/icons/caffeine-on.pdf")
    else
        result = caffeine:setIcon("~/.hammerspoon/icons/caffeine-off.pdf")
    end
end

function caffeineClicked(t)
    local c = hs.caffeinate
    if c.get("systemIdle") or c.get("displayIdle") then
        c.set("systemIdle",nil,true)
        c.set("displayIdle",nil,true)
        setCaffeineDisplay(nil)
        return
    end
    if t["shift"] then
        if not c.get("systemIdle") then
            c.set("systemIdle",true,true)
        end
    else
        if not c.get("displayIdle") then
            c.set("displayIdle",true,true)
        end
    end
    setCaffeineDisplay(true)
end

function toggle()
    --local c = hs.caffeinate.toggle('system')
    local c = hs.caffeinate
    --the system is already idle and i am turning caffeine off
    if c.get("systemIdle") or c.get("displayIdle") then
        c.set("systemIdle", nil, true)
        c.set("displayIdle", nil, true)
        setCaffeineDisplay(nil)
        return
    --end
    --if not c.get("systemIdle") then
    else
        c.set("systemIdle", true, true)
        c.set("displayIdle", true, true)
        setCaffeineDisplay(true)
    --else
        --setCaffeineDisplay(false)
    end
end

if caffeine then
    setCaffeineDisplay(nil)
    caffeine:setClickCallback(caffeineClicked)
end

