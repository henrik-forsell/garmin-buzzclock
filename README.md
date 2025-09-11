# BuzzClock — Garmin widget (Fenix 5)

A tiny Connect IQ widget that vibrates the hour (N times) then the quarter (0–3 times) when you press OK.

## How to use

1. Create a GitHub repo and push this project (or fork & edit).
2. On GitHub go to **Actions → Build .prg** and run the workflow manually (or push to `main`).
3. When the workflow completes, download the `prg` artifact from the workflow run.
4. Sideload to your Fenix 5:
   - Connect the watch to your computer (USB).
   - Copy the `.prg` file into the watch's `GARMIN/Apps` folder. (On macOS, you may need Android File Transfer.) After copying disconnect the watch — the widget should appear in the widget list (swipe up/down).
   - Open the widget and press **OK** to hear the clock-tower buzz.

## If you want stable signing (optional)
If you want to sign with your own developer key (instead of the workflow's temporary key), generate `developer_key.der` and save it **BASE64** encoded as a GitHub secret `DEV_KEY_DER_B64`. Then add a workflow step to restore that secret into a file and pass it to the action/container. See repository `README` notes for a sample.

## Quick alternatives
- If you want a no-code online builder to produce a `.prg`, try **Watchface Builder** (garmin.watchfacebuilder.com) — it can export `.prg` files for many devices. :contentReference[oaicite:3]{index=3}

## References
- Connect IQ / WatchUi docs (views/widgets). :contentReference[oaicite:4]{index=4}  
- Attention.vibrate API (vibration patterns). :contentReference[oaicite:5]{index=5}  
- `matco/connectiq-tester` (Docker image and GitHub Action used for CI builds). :contentReference[oaicite:6]{index=6}
