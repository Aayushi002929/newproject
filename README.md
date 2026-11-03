# CloudKeep

CloudKeep is a private file organizer built with React, Supabase Auth/Storage, and Vercel. It uses Supabase's **Free** plan so you can try real cloud uploads without enabling pay-as-you-go billing. Free plan limits apply (currently 1 GB file storage and 5 GB egress); Supabase may pause inactive free projects. Stay on Free and watch the dashboard usage. [Current plan details](https://supabase.com/pricing).

## Features

- Email/password signup and sign-in with Supabase Auth.
- Private object storage: each user's files are stored under their auth user ID.
- Upload, list, download, delete, search, favorite, and one-hour signed share links.
- Responsive Vite/React UI deployed as a static Vercel site.

## Set up the free cloud backend

1. Create a free Supabase account and a new Free project at [supabase.com/dashboard](https://supabase.com/dashboard). Do not select a paid plan or add an upgrade.
2. In **Storage**, create a bucket named `user-files`. Leave **Public bucket** turned off and set the maximum file size to 50 MB.
3. Open **SQL Editor** and run all statements from `supabase/storage-policies.sql`. These policies limit list, upload, and delete access to a signed-in user’s own folder.
4. In **Authentication → URL Configuration**, add your Vercel domain (for example `https://newproject-one-flax.vercel.app`) to the allowed redirect URLs.
5. In **Project Settings → API**, copy the Project URL and the Publishable key (or legacy anon key). Do not use a `service_role` or secret key in the browser.
6. In the Vercel project’s **Settings → Environment Variables**, add `VITE_SUPABASE_URL` and `VITE_SUPABASE_PUBLISHABLE_KEY`. You may instead set `VITE_SUPABASE_ANON_KEY` for a legacy anon key.
7. Redeploy Vercel. Sign up in CloudKeep, confirm the email if requested, sign in, then upload a file.

The `.env.example` is for local development. Copy it to `.env` and add the same two values to run locally with `npm install` and `npm run dev`.

## Privacy and limits

Files are in a private bucket. **Share** creates a signed URL that expires after one hour. Anyone who receives that URL can access the file until expiry, so share it carefully. Never commit `.env` values or a Supabase secret/service-role key. Supabase Free is suitable for a student prototype, not a durability guarantee; export important files separately and review current quotas.

## Architecture

```text
Browser (React + Vite) → Supabase Auth → private Supabase Storage bucket
                                      → per-user folder enforced by Storage RLS
Vercel → static app hosting
```

AWS S3 backup remains a future research extension; this no-cost setup does not create a second backup.

## Minor project report format

The report guide maps CloudKeep to the six-chapter structure of the supplied sample: front matter, introduction, theory, analysis/design, implementation, results/discussion, conclusion/future scope, code appendix, and bibliography. Use your institution's own certificate and formatting requirements. See docs/minor-project-report-guide.md.

