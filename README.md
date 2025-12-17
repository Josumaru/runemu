# runemu

## Overview

`runemu` is a lightweight shell script designed to simplify launching **Android Emulator (AVD)** instances on Linux systems. It provides an interactive AVD selection using `fzf` and starts the selected emulator with optimized GPU settings.

## Features

* Interactive AVD selection using `fzf`
* Graceful cancellation handling (ESC / Ctrl+C)
* Automatic GPU-related environment configuration
* Runs emulator with host GPU acceleration
* Disables snapshot for a clean startup

## Requirements

* Android SDK with `emulator` installed and available in `PATH`
* `fzf`
* POSIX-compatible shell (tested on Linux)

## Installation

1. Place the script somewhere in your `PATH`, for example:

   ```bash
   /usr/local/bin/runemu
   ```
2. Make it executable:

   ```bash
   chmod +x runemu
   ```

## Usage

Run the command:

```bash
runemu
```

You will be prompted to select an available AVD from the list. Once selected, the Android Emulator will start automatically.

## Behavior Details

* Retrieves available AVDs using `emulator -list-avds`
* Uses `fzf` for interactive selection
* Exits safely if no AVD is available or if the selection is canceled
* Sets the following environment variables before launching the emulator:

  * `LIBGL_ALWAYS_INDIRECT=0`
  * `MESA_LOADER_DRIVER_OVERRIDE=nvidia`

## Notes

* The GPU configuration is optimized for systems using NVIDIA drivers
* You may adjust or remove the environment variables if you are using a different GPU setup
* Emulator is started with the following options:

  * `-gpu host`
  * `-no-snapshot`

## License

This script is provided as-is. Modify and use it freely according to your needs.
