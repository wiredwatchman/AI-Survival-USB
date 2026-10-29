# Mac and Linux setup

These steps are less automatic than the Windows steps in the README. Mac and Linux users run the Ollama program on the same machine, so Ollama must be installed there.

## 1. Install Ollama

- **Mac:** download the app from ollama.com and drag it to Applications. Open it once.
- **Linux:** run the install command shown on ollama.com.

## 2. Download the model (while online)

```bash
ollama pull llama3
```

Wait for it to finish.

## 3. Copy the model to the USB

Quit the Ollama app first (menu bar on Mac, system tray on Linux). Then copy the model folder:

- **Mac:** copy `~/.ollama/models` to `/Volumes/<USB name>/ollama/models`
- **Linux:** copy `~/.ollama/models` to `/media/<you>/<USB name>/ollama/models`

Copy the whole folder, not just one file.

## 4. Copy the start script

Copy `usb-files/start.sh` from this guide to the top level of the USB drive.

## 5. Run it

Open Terminal in the USB folder (on Mac, right-click the folder and choose "New Terminal at Folder," or use `cd`). Then:

```bash
chmod +x start.sh
./start.sh
```

Type `/bye` to leave the chat. The script stops the server when it ends.

## Notes

- If the script says another Ollama server is running, quit the Ollama app and try again.
- On Linux, the script needs `curl`. Install it with your package manager if it's missing.
- The script sets `OLLAMA_MODELS` to the `ollama/models` folder on the USB, so the model is read from the drive.
- To change the model, edit the `MODEL=` line at the top of `start.sh`.
