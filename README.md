# <img src="https://github.com/mriot/mriot/assets/24588573/f47f8b7c-591f-48a9-989b-96b3eaec23e2" height="25px" alt="obs logo"> OBS 'Save Replay' Notification

This script for [OBS Studio](https://obsproject.com/) will play two sound effects when a Replay is being saved.  

`replay_saved_start.wav` will be played when you press your `save replay` hotkey.  
`replay_saved_end.wav` will be played when the Replay is actually saved.

You can customize this by simply deleting or renaming the sound file you dont need.

> Tested with OBS Studio 30.0.2 on Windows 10.

## Installation

- Download `replay_save_notification.lua` and the desired `.wav` files from the [latest release](https://github.com/mriot/obs-replay-save-notification/releases).
- In OBS Studio, go to `Tools > Scripts`.
- Press `+` and drag an drop the downloaded files into the folder that opens.
- Select `replay_save_notification.lua` and press `Open`. Now it should look like this:
  ![scripts](https://github.com/mriot/obs-replay-save-notification/assets/24588573/8c366b23-35dc-4398-bfb8-18b023f820e4)
- Go to `Settings > Hotkeys` and add the **same** hotkey for `Save Replay` and `Save Replay Notification` like in the screenshot below.  
  (which hotkey you use is up to you)
  ![hotkeys](https://github.com/mriot/mriot/assets/24588573/f21f6864-53e4-46c7-8a52-319ae05688b4)
- Press `OK` and you're done. Now you should hear sounds when you save a Replay with your hotkey.

### Note

Pressing the reload button in the Script window or updating the script may clear the hotkey. Just set it again.

## Customizing the sound effects

You can change the sound by replacing the sound files with your own. Just make sure to name them `replay_saved_start.wav` and `replay_saved_end.wav`.

To open the folder where the script is located, right click on the script and select `Open file location`.

> TIP: Adjust the sound effect volume to avoid it being too loud.  
> You can either adjust the volume of OBS Studio in the Windows volume mixer or edit the files directly (e.g. with [Audacity](https://www.audacityteam.org/)).  
>
> Note that the former will lower all sounds of OBS Studio for you.

## Troubleshooting

To check the script logs go to `Tools > Scripts` and click on the `Script Log` button.  
If you cant fix the problem yourself, [open an issue](https://github.com/mriot/obs-replay-save-notification/issues/new) or contact me on Discord: `mriot`

## Resources

- [OBS Studio Documentation](https://docs.obsproject.com/)
- [replay_saved_start.wav](./replay_saved_start.wav) - by [Kagateni](https://freesound.org/people/Kagateni/sounds/404358/) (slightly edited)
- [replay_saved_end.wav](./replay_saved_end.wav) - by [Unlistenable](https://freesound.org/people/Unlistenable/sounds/391540/) (slightly edited)
