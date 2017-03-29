local caffeine = require('caffeine')
prefix = require('prefix')
utils=require('utils')
--require('keymaps')
hs.window.animationDuration = 0

--------------------------------------------------------------------
--- some utility keychords
--------------------------------------------------------------------
hyper = {"cmd", "alt"}
hypershift = {"cmd", "alt", "shift"}
--------------------------------------------------------------------
--- some utility keychords
--------------------------------------------------------------------
prefix.bind('', 'd', hs.toggleConsole)
prefix.bind('', 'r', hs.reload)
prefix.bind('', 'c', toggle)
prefix.bind('', 'l', hs.caffeinate.lockScreen)

--------------------------------------------------------------------
-- quick jump to important applications
--------------------------------------------------------------------
prefix.bind('', 'w', function () hs.application.launchOrFocus("WhatsApp") end)
prefix.bind('', 'm', function () hs.application.launchOrFocus("MailMate") end)
prefix.bind('', 's', function () hs.application.launchOrFocus("Safari") end)
prefix.bind('', 'i', function () hs.application.launchOrFocus("iTerm") end)
prefix.bind('', 'v', function () hs.application.launchOrFocus("VimR") end)
prefix.bind('', 'f', function () hs.application.launchOrFocus("Finder") end)
prefix.bind('', 'n', function () hs.application.launchOrFocus("Notes") end)
prefix.bind('', 'y', function () hs.application.launchOrFocus("Skype") end)

--------------------------------------------------------------------
-- application switcher better
--------------------------------------------------------------------
hs.hotkey.bind('alt', 'tab', function()
    hs.hints.windowHints()
end)

--------------------------------------------------------------------
-- capslock as control when pressed with other key, escape otherwise
--------------------------------------------------------------------
send_escape = false
last_mods = {}

control_key_handler = function()
  send_escape = false
end

control_key_timer = hs.timer.delayed.new(0.12, control_key_handler)

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

--------------------------------------------------------------------
--- GRID and focus switching
--------------------------------------------------------------------

-- change focus
hs.hotkey.bind(hyper, 'h', function() hs.window.focusedWindow():focusWindowWest() end)
hs.hotkey.bind(hyper, 'l', function() hs.window.focusedWindow():focusWindowEast() end)
hs.hotkey.bind(hyper, 'k', function() hs.window.focusedWindow():focusWindowNorth() end)
hs.hotkey.bind(hyper, 'j', function() hs.window.focusedWindow():focusWindowSouth() end)

hs.hotkey.bind(hyper, 'm', hs.grid.maximizeWindow)

-- Window Hints
hs.hotkey.bind(hyper, '.', hs.hints.windowHints)

--------------------------------------------------------------------
--- Tiling WM
--------------------------------------------------------------------
local tiling = require "hs.tiling"
local hotkey = require "hs.hotkey"

--local mash = {"ctrl", "cmd"}

hotkey.bind(hyper, "c", function() tiling.cycleLayout() end)
--hotkey.bind(hyper, "j", function() tiling.cycle(1) end)
--hotkey.bind(hyper, "h", function() tiling.cycle(1) end)
--hotkey.bind(hyper, "l", function() tiling.cycle(-1) end)
--hotkey.bind(hyper, "k", function() tiling.cycle(-1) end)
hotkey.bind(hyper, "p", function() tiling.promote() end)
--hotkey.bind(mash, "f", function() tiling.goToLayout("fullscreen") end)

 --If you want to set the layouts that are enabled
tiling.set('layouts', {
  'fullscreen', 'gp-vertical'
})


--------------------------------------------------------------------
-- WiFi
--------------------------------------------------------------------
local wifiWatcher = nil
local homeSSID = "gbv-45948"
local lastSSID = hs.wifi.currentNetwork()

function ssidChangedCallback()
  newSSID = hs.wifi.currentNetwork()

  if newSSID == homeSSID and lastSSID~=homeSSID then
    -- We just joined our home WiFi network
    hs.audiodevice.defaultOutputDevice():setVolume(50)
    hs.notify.new({title="WIFI", informativeText="Connected to home WIFI, audio on"}):send()
  elseif newSSID ~= homeSSID and lastSSID == homeSSID then
    -- We just departed our home WiFi network
    hs.audiodevice.defaultOutputDevice():setVolume(0)
    hs.notify.new({title="WIFI", informativeText="Connected to other WIFI, audio off"}):send()
  end

  lastSSID = newSSID
end

wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
wifiWatcher:start()


--------------------------------------------------------------------
-- Battery / Power
--------------------------------------------------------------------

-- Disable spotlight indexing while on battery.
--
-- In order for this to work, add this to a file in `/etc/sudoers.d/`:
-- <username> ALL=(root) NOPASSWD: /usr/bin/mdutil -i on /
-- <username> ALL=(root) NOPASSWD: /usr/bin/mdutil -i off /
-- Verify with `sudo -l`
--
local currentPowerSource = hs.battery.powerSource();
function batteryWatchUnplugged()
  newPowerSource = hs.battery.powerSource();
  if newPowerSource ~= currentPowerSource then
    alert(string.format("New power source: %s", newPowerSource), 1);

    function taskCb(code, stdout, stderr)
      if code ~= 0 then
        alert("Failed, check console.");
      end
      print("stdout: "..stdout);
      print("stderr: "..stderr)
    end
    if newPowerSource == 'Battery Power' then
      alert("Disabling spotlight.", 1);
      hs.task.new("/usr/bin/sudo", taskCb, {"/usr/bin/mdutil", "-i", "off", "/"}):start()
    else
      alert("Enabling spotlight.", 1);
      hs.task.new("/usr/bin/sudo", taskCb, {"/usr/bin/mdutil", "-i", "on", "/"}):start()
    end
    currentPowerSource = newPowerSource;
  end
end
local batteryWatcher = hs.battery.watcher.new(batteryWatchUnplugged):start();

--------------------------------------------------------------------
---mute on wakeup
--------------------------------------------------------------------

--function muteOnWake(eventType)
  --if (eventType == hs.caffeinate.watcher.systemDidWake) then
    --local output = hs.audiodevice.defaultOutputDevice()
    --output:setMuted(true)
  --end
--end
--caffeinateWatcher = hs.caffeinate.watcher.new(muteOnWake)
--caffeinateWatcher:start()

--------------------------------------------------------------------
--- Experimenting with new tiling
--------------------------------------------------------------------

local position = require('position')

