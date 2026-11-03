# Minor project report guide for CloudKeep

This guide maps CloudKeep to the six-chapter structure in the supplied sample report. It is a **project report format**, not a journal-paper format. Use your college's required font, margins, page numbering, certificate wording, and citation style. Do not copy the sample college's logo, watermark, names, or certificate text.

## Front matter

1. **Cover page** — title: *CloudKeep: A Privacy-Aware Cloud File Storage System Using Supabase*; report type; student name(s) and ID(s); department/institution; guide; academic year. Replace every bracketed field with your own details.
2. **Certificate** — use the official wording and signatures supplied by your department. Do not invent approvals or signatures.
3. **Declaration** — state what you personally built and wrote. Include only accurate originality statements.
4. **Acknowledgements** — thank only people who actually helped.
5. **Abstract** — one concise paragraph describing the problem, objective, design, implementation, evaluation method, actual results, and conclusion. Write the final results after evaluation; do not invent them.
6. **Contents** — generate from the final numbered headings.
7. **List of Figures** and **List of Tables** — include only figures and tables that appear in the report.

## Chapter 1 — Introduction to CloudKeep

### 1.1 Introduction
Introduce cloud file storage, access from multiple devices, and the challenge of helping users understand organization and access. End with the project scope.

### 1.2 Literature Review
Summarize relevant peer-reviewed work on usable security, cloud storage, access control, and backup. Separately describe official Supabase/Vercel/AWS documentation as technical sources, not as independent research evidence.

### 1.3 Motivation
Explain why a small, explainable file manager with clear private-file behavior is useful as a student prototype.

### 1.4 Problem Statement
Example: “Users need a simple way to store and retrieve files remotely while limiting access to their own files and understanding when a share link grants access.” Adjust this to your actual project and evaluation.

### 1.5 Objectives
List measurable objectives: account signup/sign-in; private per-user uploads; list/search files; download/delete; create a time-limited share link; deploy the frontend on Vercel; evaluate task completion and privacy understanding.

### 1.6 Brief Methodology
Describe requirements gathering, architecture/design, implementation, deployment, and your planned user or prototype evaluation. State that the AWS S3 backup is a future extension, not an implemented component.

### 1.7 Assumptions and Constraints
Cover internet access, verified email, Supabase Free quotas, the need to configure a Supabase project, file-size limits, Vercel environment variables, and the lack of independent backup. State that a signed share link can be used by anyone holding it until it expires.

### 1.8 Organization of the Report
Give one sentence about each following chapter and the appendix.

## Chapter 2 — Theory and Fundamentals

### 2.1 Cloud computing and object storage
Explain object buckets, object keys, metadata, and client/server roles.

### 2.2 Authentication and authorization
Explain identity versus permission. Describe Supabase Auth and Storage Row Level Security (RLS), including the user-ID folder rule.

### 2.3 Private buckets and signed URLs
Explain private-by-default storage and the one-hour signed link behavior. Clarify that a signed URL is a bearer link during its validity period.

### 2.4 Hosting and configuration
Describe Vite's static build, Vercel hosting, and the two public frontend settings (`VITE_SUPABASE_URL` and publishable/anon key). Never include a Supabase secret/service-role key.

### 2.5 Backup concepts and AWS S3
Describe versioning, encryption, retention, and least-privilege access as concepts for a future S3 backup path. Mark them as planned; CloudKeep does not currently copy files to S3.

## Chapter 3 — Analysis and Design

### 3.1 Requirements
Separate functional requirements from quality/security requirements.

### 3.2 Use cases
Include a use-case diagram or table for visitor, registered user, and project administrator. Main user tasks are signup/sign-in, upload, search/list, download, share, and delete.

### 3.3 System architecture
Insert the architecture diagram from the README and label every implemented versus planned component.

### 3.4 Data and storage design
Show the bucket `user-files`, the key convention `<auth-user-id>/<generated-id>-<original-filename>`, relevant metadata, and the SQL policies from `supabase/storage-policies.sql`.

### 3.5 Upload/download/share flows
Add sequence or flow diagrams for sign-in, upload, private download, and one-hour signed-link creation.

### 3.6 User interface design
Explain navigation, search, file details, responsive layout, and privacy cues. Use screenshots from your configured application.

## Chapter 4 — Implementation

### 4.1 Development environment
Record actual Node.js, package, browser, operating-system, Supabase, and Vercel details used. Avoid guessing versions.

### 4.2 Authentication and storage implementation
Explain the implemented Supabase client operations, user folder paths, private bucket, and RLS policies.

### 4.3 File management and sharing
Describe upload/list/download/delete/search, and signed URL expiry. Document the file-size cap configured in Supabase.

### 4.4 Deployment
Describe GitHub-to-Vercel deployment, environment variables, allowed auth redirect URL, and the final deployment URL.

### 4.5 Screenshots and code excerpts
Use numbered screenshots of the real deployed/configured app. Include only short code excerpts that explain important choices; put longer code in Appendix A. Never include credentials or real user files.

## Chapter 5 — Results and Discussion

### 5.1 Evaluation setup
State whether you performed a participant study or only prototype verification. Describe participant count, tasks, device/browser, procedure, measures, consent, and limitations. Do not claim a study that did not happen.

### 5.2 Test results
Report only observed outcomes. For a task study, use a table with task, completion count/rate, median time, and observed issue. For prototype verification, list the checks you actually ran (for example signup, upload, retrieval, delete, and signed-link expiry).

### 5.3 Quantitative summary
Define any calculation, denominator, units, and sample size. For example, task completion rate = completed attempts / total attempts × 100. Do not invent values or imply a small convenience sample represents all users.

### 5.4 Interpretation and limitations
Discuss what the results support, privacy comprehension, failure cases, Supabase Free limits, lack of S3 backup, and what the prototype does not provide (for example client-side end-to-end encryption).

## Chapter 6 — Conclusion and Future Scope

### 6.1 Conclusion
Summarize the implemented system and findings that your actual evaluation supports.

### 6.2 Future Scope
Possible work: a server-side AWS S3 backup worker, file version recovery, stronger share-link controls, accessibility testing, larger user studies, and client-side encryption.

### 6.3 Learning Outcomes
List skills you actually gained, such as React UI design, cloud authentication, RLS, object storage, deployment, and evaluation.

## Appendix A — Code

Link to the public repository and include only short, relevant excerpts: RLS policy, Supabase initialization with blank environment variables, and one upload/download flow. Do not paste the entire source tree into the report.

## Bibliography

Use one consistent style (for example IEEE) and cite every borrowed idea, diagram, code sample, and non-obvious claim. Start with the primary sources in `research-notes.md` and add peer-reviewed papers from your library search. Record access dates according to your college's citation rules.

## Final checks

- Replace all bracketed fields and remove instructions to the writer.
- Generate the contents, figure list, and table list after finalizing headings/captions.
- Label each figure/table and refer to it in the text.
- Keep results and claims tied to evidence; mark AWS backup as future work.
- Verify your college's title page and certificate rules with your guide.
