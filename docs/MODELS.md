# Choosing a model

Bigger models usually give better answers, but they need more memory and run more slowly.

| Model | Approx. download | Memory needed | Notes |
|-------|------------------|---------------|-------|
| `llama3` (8B) | about 4.7 GB | 8 GB | The default in these scripts |
| `llama3.2` (3B) | about 2 GB | 4 GB | Smaller and faster, less accurate |
| Larger models (13B and up) | 8 GB and up | 16 GB or more | Better answers if your PC can handle them |

Sizes are approximate and can change.

## How to switch models

1. While online, pull the new model: `ollama pull <name>`
2. Copy the `ollama\models` folder to the USB again.
3. Change the `MODEL=` line in `start.bat` (or `start.sh`) to the same name.

Model names and availability change over time. Check the Ollama model library at ollama.com before you build.
