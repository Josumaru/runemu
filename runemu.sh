#!/usr/bin/sh

# get AVD list from emulator
avd_list=($(emulator -list-avds))

if [[ ${#avd_list[@]} -eq 0 ]]; then
  echo "No AVDs available."
  exit 1
fi

# choose AVD with fzf (arrow keys, colored highlight)
DEVICE=$(printf '%s\n' "${avd_list[@]}" | fzf --prompt="Select AVD > " --height=40% --reverse --ansi)

# if user cancels (ESC / Ctrl-C)
if [[ -z "$DEVICE" ]]; then
  echo "Canceled."
  exit 1
fi

export LIBGL_ALWAYS_INDIRECT=0
export MESA_LOADER_DRIVER_OVERRIDE=nvidia

echo "Starting emulator: $DEVICE"
emulator -avd "$DEVICE" -gpu host -no-snapshot