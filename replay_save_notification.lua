local obs = obslua
local ffi = require("ffi")
local winmm = ffi.load("Winmm")


SOUND_START = script_path() .. "replay_saved_start.wav"
SOUND_END = script_path() .. "replay_saved_end.wav"

ffi.cdef [[
    bool PlaySound(const char *pszSound, void *hmod, uint32_t fdwSound);
]]

function fileExists(path)
    return io.open(path, "r") ~= nil
end

function playsound(filepath)
    if filepath and fileExists(filepath) then
        winmm.PlaySound(filepath, nil, 0x00020000)
    else 
        obs.script_log(obs.LOG_INFO, "Sound not found: " .. filepath)
    end
end

function on_event(event)
    if event == obs.OBS_FRONTEND_EVENT_REPLAY_BUFFER_SAVED then
        playsound(SOUND_END)
    end
end

function on_hotkey(pressed)
    if pressed and obs.obs_frontend_replay_buffer_active() then
        playsound(SOUND_START)
    end
end

function script_load(settings)
    -- save replay hotkey to trigger the first sound immediately
    hotkey_id = obs.obs_hotkey_register_frontend("replay_save_notification", "Save Replay Notification", on_hotkey)
    local hotkey_save_array = obs.obs_data_get_array(settings, hotkey_id)
    obs.obs_hotkey_load(hotkey_id, hotkey_save_array)
    obs.obs_data_array_release(hotkey_save_array)

    -- subscribe to replay buffer events to trigger the second sound
    obs.obs_frontend_add_event_callback(on_event)
end

function script_save(settings)
    -- for some reason this is needed to persist the hotkey across OBS restarts
    -- thanks @ https://obsproject.com/forum/threads/hotkey-not-saved-for-script.81794/post-343300
    local hotkey_save_array = obs.obs_hotkey_save(hotkey_id)
    obs.obs_data_set_array(settings, hotkey_id, hotkey_save_array)
    obs.obs_data_array_release(hotkey_save_array)
end

function script_description()
    return [[
        <span style="color: #4CC355;">
            <b>Play sound on Replay save</b>
        </span>
        <br>
        <b>&nbsp;v.1.2</b>
        &nbsp;&nbsp;
        by <a href="https://github.com/mriot/obs-replay-save-notification">mriot</a>
        <br><br>
        <span style="color: #DA7A55;">
            Go to <b>Settings > Hotkeys</b> and make sure, that the hotkeys for <b>'Save Replay'</b> and <b>'Save Replay Notification'</b> are identical. 
        </span>
        <br><br>
        <span style="color: #FB1;">
            <small>⚠️ Ignore the warning about shared hotkey conflicts.</small>
        </span>
    ]]
end
