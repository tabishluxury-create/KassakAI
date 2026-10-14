# HisabAI

HisabAI is a browser-only bookkeeping app. Accounts, sign-in state, settings,
and business records are saved in this browser's local storage. There is no
application backend, server-side account, or cross-device synchronization.

## Build for deployment

Run `sh build.sh` from the project directory. This creates `dist/` with only
the app's runtime files; the development environment and the duplicate files in
`TEE/` are not included. Configure your static host to run `sh build.sh` and
publish `dist/`, or upload the contents of `dist/` to any static host. The
site's root page opens the sign-in page.

Use a static host with HTTPS. No Python server, database, Docker, or API
service is needed, and the app does not send account or business data to a
server.

For local testing, serve `dist/` over HTTP (for example, with your editor's
static server extension) and open its root URL. Browser storage and secure
cryptography may not work correctly when opening files directly with `file://`.

Browser data belongs to the browser profile and website origin where it was
created. It will not automatically appear on another device, in another
browser, or on a different origin. Clearing browser/site data can permanently
remove it. Use the in-app **Download backup** action regularly and keep the
backup somewhere safe; use **Restore backup** to recover it in this browser.

PIN and password verifiers are stored in browser storage. This provides
convenient local sign-in, not server-grade protection: someone with access to
the browser profile or developer tools can access or alter local data. Do not
treat this app as secure storage for confidential records on a shared device.

Existing records already stored in this browser remain under their
browser-storage keys. Accounts and records that existed only in the deleted
SQLite backend are not available to the browser-only app; they must first be
exported from a still-running backend and restored in the browser if a backup
is available.
