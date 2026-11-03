# CloudKeep — a cloud file storage project

**A personal cloud locker for files you want to find again.** CloudKeep pairs a small, friendly file manager with per-user cloud storage. It is deliberately simple to explain: authenticate, save files to a private user path, and retrieve or share them when needed.

## What makes this project distinctive

CloudKeep is designed around a “calm storage” interaction: a searchable visual library, a small set of clear organization tools, and privacy cues beside the files themselves. Its research angle is to evaluate whether transparent storage and access feedback help users understand cloud file privacy. The interface and paper are original work for this project; check originality with your institution's tools and adapt the study to your own data before submission.

## Features

- Responsive file manager with search, folder filters, recent/starred views, and sorting.
- Upload, download, share-link copying, and deletion actions.
- Firebase Email/Password authentication and Firebase Storage when configured.
- A no-account demo mode: uploaded files remain in this browser's local storage; demo file metadata persists, while binary contents are retained only for the current page session.
- Per-user Firebase Storage rules in `firebase.storage.rules`.
- Vercel-ready static build and security headers.

> Demo mode is for exploring the UI, not durable file backup. In cloud mode, private objects are stored in `users/{uid}/files/`. Share-link copying currently uses Firebase download URLs. For production, implement expiring signed URLs through an authenticated server endpoint and add abuse controls.

## Run locally

1. Install Node.js 20 or newer.
2. Run `npm install` and `npm run dev`.
3. Open the local URL Vite prints. The app works in demo mode without credentials.

## Enable Firebase cloud mode

1. Create a Firebase project and register a Web app.
2. Enable **Email/Password** in Authentication.
3. Create a Cloud Storage bucket.
4. Copy `.env.example` to `.env` and fill in the Web app config values. These client config values identify the Firebase app; access is enforced by Authentication and Storage rules.
5. Publish the rules in `firebase.storage.rules` using the Firebase Console or Firebase CLI.
6. Add the same `VITE_FIREBASE_*` values to the Vercel project environment variables, then redeploy.

Do not use open/public Storage rules. Restrict file size and content types in production and set Firebase App Check, quotas, and monitoring. The included simple rule authorizes each signed-in user to access only their own file path; a production system should validate metadata and enforce size/type limits.

## Deploy to Vercel

Import the private GitHub repository in Vercel, set the Firebase environment variables if you want cloud mode, and deploy. Vercel detects Vite automatically (`npm run build`, output directory `dist`). `vercel.json` provides SPA fallback and basic response headers. Keep the GitHub repository private if you want the source to remain private. A public deployment URL is still visible to anyone who receives it; do not put sensitive user data in the demo.

## AWS backup extension (research architecture)

The app's primary store is Firebase Storage. For an independent recovery copy, a small trusted backend can read new objects and write them to a private Amazon S3 bucket with server-side encryption (SSE-S3 or SSE-KMS), bucket versioning, lifecycle retention, and S3 Block Public Access. Use a least-privilege IAM role, object keys partitioned by user and date, and a scheduled reconciliation job. Never ship AWS access keys to the browser. For a student prototype, document the S3 flow and diagram it; add the integration only if AWS credentials and budget are available.

## Architecture

```text
Browser (React + Vite)
  ├─ Demo mode → browser localStorage (metadata) + current-session file bytes
  └─ Cloud mode → Firebase Authentication → Firebase Storage (users/{uid}/files/*)
                                            └─ optional trusted backup worker → private AWS S3
Vercel → static frontend hosting (no secret credentials in the client)
```

See `docs/research-paper-outline.md` for a standardized paper plan and `docs/research-notes.md` for evaluation guidance. Do not report invented results: conduct the user study and replace the placeholders with actual observations.
