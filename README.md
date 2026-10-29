# AI Survival USB: a free offline AI helper on a USB drive

**From [The Wired Watchman](https://thewiredwatchman.com).** Free. No subscription. No account.

> **Watch the episode first:** [INSERT YOUTUBE LINK] ("Free Survival USB: Build Your Own Offline AI for Prep")

This guide shows you how to put a local AI assistant on a USB drive. Once it's set up, you can ask it questions with no internet connection. You build it yourself, one step at a time.

> **Read this first:** The AI can be wrong. Check anything important, especially medical, electrical, and water-safety answers, against a printed or official source. It is not a replacement for a doctor, emergency services, or a trained professional. In an emergency, call 911.

---

## What you need

| Item | What to get | Notes |
|------|-------------|-------|
| A Windows PC | 8 GB of memory (RAM) minimum, 16 GB is better | Mac and Linux: see `docs/MAC_LINUX.md` |
| Internet | Only for setup | Setup downloads about 5 GB |
| A USB drive | 16 GB or larger, 32 GB gives room to spare | You supply the drive. USB 3.0 is faster |
| Time | About an hour | Most of it is download time |
| Printer (optional) | Paper for the quick card | Keep a paper copy in the storage can |

---

## Step 1: Install Ollama on your PC

Ollama is the free program that runs the AI on your computer.

1. Go to **ollama.com** and download the Windows installer.
2. Run it. It does not need an administrator account.
3. Open **Command Prompt** (press the Windows key, type `cmd`, press Enter).
4. Type this and press Enter:

   ```
   ollama --version
   ```

   If it shows a version number, Ollama is installed.

---

## Step 2: Download the AI model

Still in Command Prompt, type this and press Enter:

```
ollama pull llama3
```

Wait until it says **success**. This is a one-time download of about 4.7 GB.

> Model names change over time. `docs/MODELS.md` explains how to choose one.

---

## Step 3: Test it while you're online

1. In Command Prompt, type:

   ```
   ollama run llama3
   ```

2. Type a question, such as `How long should I boil water to purify it?`, and press Enter.
3. Type `/bye` and press Enter to leave the chat.

If it answers, your setup works. Next, copy it to the USB.

---

## Step 4: Put the files on your USB drive

You will copy three things from your PC and four files from this guide.

**From your PC (Ollama program):**

1. Open File Explorer and paste this into the address bar, then press Enter:

   ```
   %LOCALAPPDATA%\Programs\Ollama
   ```

2. Copy **`ollama.exe`** and the **`lib`** folder to the root of your USB drive.

**From your PC (AI model):**

3. Open File Explorer and paste this into the address bar, then press Enter:

   ```
   %USERPROFILE%\.ollama\models
   ```

   (This folder is hidden by default. Typing the path in the address bar still opens it.)

4. Create a folder on the USB drive named **`ollama`**. Inside it, create a folder named **`models`**.
5. Copy **everything** from the `.ollama\models` folder into the USB's `ollama\models` folder.

   > Copy the whole folder contents. Copying only one file will not work.

**From this guide:**

6. Open the **`usb-files`** folder in this repository. Copy these files to the **root** of the USB drive:
   - `start.bat`
   - `stop.bat`
   - `QUICK-CARD.txt`
   - `START-HERE.txt`

When you're done, the USB's top level should look like this:

```
ollama.exe
lib\
ollama\
    models\
start.bat
stop.bat
QUICK-CARD.txt
START-HERE.txt
```

Not sure something is in the right place? Open `START-HERE.txt` on the drive. It has the same checklist.

---

## Step 5: Test it with the internet off

1. Turn off Wi-Fi on the PC.
2. Plug in the USB drive.
3. Open the USB drive in File Explorer and **double-click `start.bat`**.
4. Wait about 30 seconds. When it says **READY**, type a question and press Enter.
5. Type `/bye` to leave the chat.
6. Double-click **`stop.bat`** and wait for the message that says it's safe to eject.
7. Eject the drive from File Explorer.

If it answers with Wi-Fi off, the drive works without internet.

---

## Step 6: Store it

- Keep the USB drive in a **metal ammo can with a tight lid**. A metal container may block some electromagnetic interference. It is **not** a guaranteed shield against an electromagnetic pulse (EMP), so don't rely on it for that.
- Put a printed copy of `QUICK-CARD.txt` in the can with the drive.
- Print key medical and water guides too. Keep those paper copies with the drive.
- Check the drive every few months. Run `start.bat` once to make sure it still works.

---

## Make it faster

Running from a USB drive is slower than running from a hard drive. For everyday use, copy the whole USB folder to `C:\AI-Survival` and run `start.bat` from there. Keep the USB copy as your backup.

---

## Troubleshooting

| What you see | What to do |
|--------------|------------|
| "ollama.exe is not on this drive" | Copy `ollama.exe` to the top level of the USB. See Step 4. |
| "The model folder is missing" | Copy the `ollama\models` folder. See Step 4. |
| Very slow answers | Copy the USB folder to `C:\AI-Survival` and run it from there. |
| "Not enough memory" | Close other programs. A smaller model is in `docs/MODELS.md`. |
| Antivirus warning | Ollama only listens on this computer (port 11434). Allow it if you downloaded Ollama from ollama.com. |
| Server did not start | Run `stop.bat`, restart the PC, and try `start.bat` again. |

More questions? See `docs/FAQ.md`.

---

## Other options

- **Mac or Linux:** `docs/MAC_LINUX.md`
- **Choosing a different model:** `docs/MODELS.md`
- **A bigger build with offline reference files:** `docs/ADVANCED_OFFLINE_REFERENCE.md`
- **Free reference material to download:** `resources/FREE_RESOURCES.md`

## Files in this repository

| File | Purpose |
|------|---------|
| `README.md` | This guide |
| `usb-files/` | Files to copy onto the USB drive |
| `docs/` | Deeper guides and answers to common questions |
| `resources/` | Links to free reference material |
| `LICENSE` | MIT License. You may copy, change, and share this guide. |

---

Free to use, share, and change. See `LICENSE`.
