local obs = obslua
local ffi = require("ffi")
local winmm = ffi.load("Winmm")

PROP_AUDIO_FILEPATH = script_path() .. "replay_saved.wav"

ffi.cdef[[
    bool PlaySound(const char *pszSound, void *hmod, uint32_t fdwSound);
]]

function playsound(filepath)
    winmm.PlaySound(filepath, nil, 0x00020000)
end

function on_event(event)
    if event == obs.OBS_FRONTEND_EVENT_REPLAY_BUFFER_SAVED then
      playsound(PROP_AUDIO_FILEPATH)
    end
end

function on_hotkey(pressed)
    if not pressed or not obs.obs_frontend_replay_buffer_active() then
        return
    end
    playsound(PROP_AUDIO_FILEPATH)
end

function script_description()
	return [[
        <span style="color: #4CC355;">
            <b>Play sound on Replay save</b>
        </span>
        <br>
        <b>&nbsp;v.1.0.0</b>
        &nbsp;&nbsp;
        by <a href="https://github.com/mriot">mriot</a>
        <br><br>
        <span style="color: #DA7A55;">
            In <b>Settings > Hotkeys > Save Replay Notification</b> 
            set the same hotkey as for <b>Save Replay</b>.
        </span>
        <br><br>
        <span style="color: #FB1;">
            <small>Ignore the warning emoji ⚠️ about shared hotkeys.</small>
        </span>
        <br><br>
        <span style="color: #DA7A55;">
            To change the sound, replace the <b style="color: #B33F3D;">replay_saved.wav</b> file in the script folder.
            <br>
            <small style="color: #B33F3D;">Needs to be a .wav file.</small>
        </span>
    ]]
end

function script_load(settings)
    obs.obs_hotkey_register_frontend("replay_save_notification", "Save Replay Notification", on_hotkey)
    -- uncomment below if you also want to play a sound when OBS is done saving
    --obs.obs_frontend_add_event_callback(on_event)
end
