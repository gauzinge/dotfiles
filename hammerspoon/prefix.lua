-- Tmux style hotkey binding: prefix + hotkey

local module = {}

local TIMEOUT = 3

local modal = hs.hotkey.modal.new('ctrl', 'space')

function modal:entered()
    modal.alertId = hs.alert.show("Prefix Mode Keybindings:\nd ... toggle console\nr ... reload config\nc ... caffeine\nl ... lock screen\n\nApps:\nf ... Finder\nn ... Notes\ni ... iTerm\ns ... Safari\ny ... Skype\nw ... WhatsApp\nm ... Mail\nv ... VimR", 9999)
    modal.timer = hs.timer.doAfter(TIMEOUT, function() modal:exit() end)
end

function modal:exited()
    if modal.alertId then
        hs.alert.closeSpecific(modal.alertId)
    end
    module.cancelTimeout()
end

function module.exit()
    modal:exit()
end

function module.cancelTimeout()
    if modal.timer then
        modal.timer:stop()
    end
end

function module.bind(mod, key, fn)
    modal:bind(mod, key, nil, function() fn(); module.exit() end)
end

function module.bindMultiple(mod, key, pressedFn, releasedFn, repeatFn)
    modal:bind(mod, key, pressedFn, releasedFn, repeatFn)
end

module.bind('', 'escape', module.exit)
module.bind('ctrl', 'space', module.exit)

--module.bind('', 'd', hs.toggleConsole)
--module.bind('', 'r', hs.reload)
--module.bind('', 'c', hs.caffeinate)
--module.bind('', 's', hs.caffeinate.startScreensaver)

return module

