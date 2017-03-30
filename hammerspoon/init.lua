--------------------------------------------------------------------
--- My awesome hammerspoon config!
--------------------------------------------------------------------
-- caffeine
local caffeine = require('caffeine')
-- something
utils=require('utils')
-- for prefix
prefix = require('prefix')
-- hyper key
hyper = {"cmd", "ctrl"}
hs.window.animationDuration = 0

--------------------------------------------------------------------
--- some utility keychords
--------------------------------------------------------------------
--hypershift = {"cmd", "alt", "shift"}
--
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
appbindings = {
    {'w', 'WhatsApp'},
    {'m', 'MailMate'},
    {'s', 'Safari'},
    {'i', 'iTerm'},
    {'v', 'VimR'},
    {'f', 'Finder'},
    {'n', 'Notes'},
    {'y', 'Skype'},
}

for i, app in ipairs(appbindings) do
    prefix.bind('',app[1], function() hs.application.launchOrFocus(app[2]) end)
end

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
--- Focus switching, tiling, window management
--------------------------------------------------------------------
local tiling = require "hs.tiling"
-- change focus
hs.hotkey.bind(hyper, 'h', function() hs.window.focusedWindow():focusWindowWest(nil, true, true) end)
hs.hotkey.bind(hyper, 'l', function() hs.window.focusedWindow():focusWindowEast(nil, true, true) end)
hs.hotkey.bind(hyper, 'k', function() hs.window.focusedWindow():focusWindowNorth(nil, true, true) end)
hs.hotkey.bind(hyper, 'j', function() hs.window.focusedWindow():focusWindowSouth(nil, true, true) end)
-- multi monitor
hs.hotkey.bind(hyper, 'n', function() hs.window.moveOneScreenEast() end)
hs.hotkey.bind(hyper, 'p', function() hs.window.moveOneScreenWest() end)
-- maximize
hs.hotkey.bind(hyper, 'm', hs.grid.maximizeWindow)
-- Push the window into the exact center of the screen
local function center(window)
  frame = window:screen():frame()
  frame.x = (frame.w / 2) - (frame.w / 4)
  frame.y = (frame.h / 2) - (frame.h / 4)
  frame.w = frame.w / 2
  frame.h = frame.h / 2
  window:setframe(frame)
end
-- make window float
hs.hotkey.bind(hyper, "f", function() tiling.togglefloat(center) end)
-- tile windows
tiling.set('layouts', {'gp-vertical'})
hs.hotkey.bind(hyper, "t", function() tiling.cycleLayout() end)
-- promote currently focussed window
hs.hotkey.bind(hyper, "space", function() tiling.promote() end)
-- Window Hints
hs.hotkey.bind(hyper, '.', hs.hints.windowHints)
hs.hotkey.bind('alt', 'tab', function() hs.hints.windowHints() end)

-- Expose
expose = hs.expose.new(nil,{showThumbnails=true}) -- default windowfilter, no thumbnails
hs.hotkey.bind(hyper,'e','Expose',function()expose:toggleShow()end)

-- move and resize windows with hyper + arrows
local position = require('position')

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
