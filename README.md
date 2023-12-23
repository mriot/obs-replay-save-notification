# <img src="https://github.com/mriot/mriot/assets/24588573/f47f8b7c-591f-48a9-989b-96b3eaec23e2" height="25px" alt="obs logo"> OBS 'Save Replay' Notification

This script for [OBS Studio](https://obsproject.com/) will play a customizable sound when a Replay is saved.  

Tested with OBS Studio 30.0.2 on Windows 10.

## Usage

1. Download `replay_save_notification.lua` and `replay_saved.wav` from the [latest release](https://github.com/mriot/obs-replay-save-notification/releases).
2. In OBS Studio, go to `Tools > Scripts`. This will open the Scripts window.
3. Press the `+` button and drag an drop **both** files into the folder that opens.
4. Select `replay_save_notification.lua` and press `Open`. Now it should look like this:<br><br>
![scripts](https://github.com/mriot/mriot/assets/24588573/c4ef7c21-e9dd-4788-8c2d-2498ab56c9fb)
1. Now, go to `Settings > Hotkeys` and add the **same** hotkey for `Save Replay` and `Save Replay Notification` like in the screenshot below. (which hotkey you use is up to you)<br><br>
![hotkeys](https://github.com/mriot/mriot/assets/24588573/f21f6864-53e4-46c7-8a52-319ae05688b4)

1. Press `OK` and you're done. Now you should hear a sound when you save a Replay with your hotkey.

### Note

Pressing the reload button in the Script window will clear the hotkey. You will have to set it again.

## Custom sound

You can change the sound by replacing `replay_saved.wav` with your own. Just make sure to name it `replay_saved.wav` and that its a `.wav` file.

To open the folder where the script is located, right click on the script in the Scripts window and select `Open file location`.

Tip from experience: adjust the sound volume to avoid it being too loud. 📢🥴

## Resources

- [OBS Studio Documentation](https://docs.obsproject.com/)
- Default sound is from [Fallout 4 "VATS Critical Hit Available"](https://www.youtube.com/watch?v=B5dnWeHFBqg) (I reduced the volume and length)
