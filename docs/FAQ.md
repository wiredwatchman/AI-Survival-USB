# FAQ

**Is it really free?**
Yes. The guide, the scripts, and Ollama are free. You supply the USB drive.

**Does it need internet?**
Only for setup: installing Ollama and downloading the model. After that, it runs offline.

**Do I need Ollama installed on the PC I run it from?**
The Windows steps in the README copy Ollama onto the USB, so the PC you run it from does not need Ollama installed. Mac and Linux are different: see `docs/MAC_LINUX.md`.

**How much memory do I need?**
8 GB is the minimum for the default model. 16 GB is more comfortable.

**Why is it slow?**
Running from a USB drive is slower than running from a hard drive. Copy the USB folder to `C:\AI-Survival` for everyday use.

**Is the answer always right?**
No. AI models can be wrong and can sound confident when they are. Check important answers, especially medical, electrical, and water-safety advice, against a printed or official source.

**Can I use a different model?**
Yes. Pull it with `ollama pull <name>` while you're online. Then change the `MODEL=` line in `start.bat` (or `start.sh`) to that name, and copy its files to the USB. See `docs/MODELS.md`.

**Is my chat sent anywhere?**
Ollama runs on your computer and does not need an account. Check the settings of any other software you add to the drive.

**Antivirus flagged ollama.exe. Is it safe?**
Confirm you downloaded Ollama from ollama.com. Ollama listens only on your own computer (port 11434). Then add it to your antivirus allow list.

**Can I add my own documents?**
Yes. See `docs/ADVANCED_OFFLINE_REFERENCE.md`.

**Will it work on a phone?**
Not with these scripts.
