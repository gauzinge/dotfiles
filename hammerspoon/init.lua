
-- capslock as control when pressed with other key, escape otherwise
send_escape = false
last_mods = {}

control_key_handler = function()
  send_escape = false
end

control_key_timer = hs.timer.delayed.new(0.08, control_key_handler)

control_handler = function(evt)
  local new_mods = evt:getFlags()
  if last_mods["ctrl"] == new_mods["ctrl"] then
    return false
  end
  if not last_mods["ctrl"] then
    last_mods = new_mods
    send_escape = true
    control_key_timer:start()
  else
    if send_escape then
      hs.eventtap.keyStroke({}, "ESCAPE")
    end
    last_mods = new_mods
    control_key_timer:stop()
  end
  return false
end

control_tap = hs.eventtap.new({hs.eventtap.event.types.flagsChanged}, control_handler)
control_tap:start()

other_handler = function(evt)
  send_escape = false
  return false
end

other_tap = hs.eventtap.new({hs.eventtap.event.types.keyDown}, other_handler)
other_tap:start()


------ CAFFEINE ------
-- caffeine
local caffeine = hs.menubar.new()

function setCaffeineDisplay(state)
    local result
    if state then
        result = caffeine:setIcon("icons/caffeine-on.pdf")
    else
        result = caffeine:setIcon("icons/caffeine-off.pdf")
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

if caffeine then
    setCaffeineDisplay(nil)
    caffeine:setClickCallback(caffeineClicked)
end

---mute on wakeup
function muteOnWake(eventType)
  if (eventType == hs.caffeinate.watcher.systemDidWake) then
    local output = hs.audiodevice.defaultOutputDevice()
    output:setMuted(true)
  end
end
caffeinateWatcher = hs.caffeinate.watcher.new(muteOnWake)
caffeinateWatcher:start()

-- quick jump to important applications
hs.grid.setMargins({0, 0})
local hyper={'alt', 'cmd'}
hs.hotkey.bind(hyper, 'm', function () hs.application.launchOrFocus("MailMate") end)
hs.hotkey.bind(hyper, 's', function () hs.application.launchOrFocus("Safari") end)
hs.hotkey.bind(hyper, 'w', function () hs.application.launchOrFocus("WhatsApp") end)
hs.hotkey.bind(hyper, 'i', function () hs.application.launchOrFocus("iTerm") end)
hs.hotkey.bind(hyper, 'r', function () hs.application.launchOrFocus("VimR") end)
hs.hotkey.bind(hyper, 'f', function () hs.application.launchOrFocus("Finder") end)


--- Tiling WM
local tiling = require "hs.tiling"
local hotkey = require "hs.hotkey"
local mash = {"ctrl", "cmd"}

hotkey.bind(mash, "c", function() tiling.cycleLayout() end)
hotkey.bind(mash, "j", function() tiling.cycle(1) end)
hotkey.bind(mash, "h", function() tiling.cycle(1) end)
hotkey.bind(mash, "l", function() tiling.cycle(-1) end)
hotkey.bind(mash, "k", function() tiling.cycle(-1) end)
hotkey.bind(mash, "space", function() tiling.promote() end)
hotkey.bind(mash, "f", function() tiling.goToLayout("fullscreen") end)

-- If you want to set the layouts that are enabled
tiling.set('layouts', {
  'fullscreen', 'gp-vertical', 'vertical'
})
