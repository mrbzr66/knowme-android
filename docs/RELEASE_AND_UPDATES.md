# Release and update checklist

- Keep `applicationId` exactly `com.mrbzr66.knowme`.
- Keep and back up the same release keystore. Never commit it to Git.
- Add the four `ANDROID_*` GitHub Actions secrets described in the README.
- Increase the integer build number after `+` in `pubspec.yaml` for every published build.
- Test an upgrade by installing the old signed APK, then installing the new APK over it without uninstalling.
- Keep user data migrations backward-compatible; prefer additive database changes and handle missing fields.
- Debug APKs are smoke-test artifacts only; their signing key is not guaranteed stable between CI runs.
