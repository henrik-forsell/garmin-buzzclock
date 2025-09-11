# Garmin BuzzClock for Garmin Fenix 5

A Connect IQ widget that buzzes the current time:
- Vibrates once per hour
- Pauses
- Vibrates 1–3 times for the quarter past

## 🚀 Build in GitHub Actions

1. Generate a developer key locally (one time):

  ```bash
  monkeyc --generate-key developer_key.der
Encode it in base64:

bash
Copy code
base64 developer_key.der > developer_key.b64
Copy the contents of developer_key.b64.

In GitHub → Repo → Settings → Secrets → Actions → New secret:

Name: DEVELOPER_KEY_B64

Value: paste contents of developer_key.b64

Go to Actions tab → choose Build BuzzClock → Run workflow.

When it finishes, scroll to Artifacts → download BuzzClock-prg.zip.

Extract BuzzClock.prg and copy it to your watch’s GARMIN/APPS/ folder.

📥 Install
Plug in your Garmin Fenix 5.

Copy BuzzClock.prg into GARMIN/APPS/.

Safely eject.

Swipe through widgets → BuzzClock.

Press OK to feel the time buzzed out 🎉
