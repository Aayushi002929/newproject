# Research paper framework

## Suggested title
**CloudKeep: Designing a Privacy-Aware, Usable Cloud File Storage Prototype with Firebase and an AWS Backup Path**

## Abstract (write after the study)
In 150–250 words, state the storage problem, project objective, prototype method, evaluation method, measured results, and conclusion. Replace every bracketed item with your actual work. Do not claim encryption, performance, reliability, or usability outcomes that you did not measure.

## 1. Introduction
Explain why people need accessible file storage, and the risks around account access, accidental sharing, loss, and confusing interfaces. State the problem narrowly: how can a small cloud-storage prototype make organization and access understandable while retaining a simple architecture? List contributions: (1) a responsive file-manager prototype, (2) Firebase per-user access control, (3) an AWS S3 backup design, and (4) an exploratory usability evaluation.

## 2. Background and related work
Review primary documentation and peer-reviewed literature on cloud storage, usable security, access-control models, Firebase security rules, AWS S3 data protection, and backup/recovery. Compare prior work by scope and evaluation method. Cite original sources; avoid relying on vendor marketing as evidence of security effectiveness.

## 3. Requirements and threat model
Functional requirements: account creation/sign-in, upload, retrieval, deletion, search, organization, and controlled sharing. Security goals: confidentiality between users, authenticated access, least privilege, secure transport, recovery from accidental loss. Threats include guessed object paths, stolen credentials, accidental public rules, malicious uploads, compromised client devices, and deletion/ransomware. State that client-side encryption and expiring share links are not implemented in this educational prototype.

## 4. System design
Describe the React/Vite client, Firebase Authentication, Firebase Storage, Vercel static hosting, and optional server-side S3 backup worker. Explain why browser code never receives AWS secrets. Include the architecture diagram from README, a data-flow diagram, Firebase rules, and a short sequence diagram for upload and download. Explain demo mode separately from cloud mode.

## 5. Implementation
Record tools, versions, configuration, storage path convention (`users/{uid}/files/{object}`), rules, upload flow, metadata handling, error cases, responsive UI decisions, and deployment setup. Include screenshots captured from your own running application. Do not publish real user files or credentials.

## 6. Evaluation methodology
Use a small formative study (for example 5–8 consenting participants) or a task-based self-evaluation if participant recruitment is not possible. Tasks: upload a file, locate it with search, star it, download it, and explain who can access it. Measure task completion, time, misclicks, and a brief 1–5 confidence rating. Record device/browser and study conditions. Obtain instructor/institutional approval when required; avoid collecting personal files. Explain sample limitations and anonymize notes.

## 7. Results
Insert real participant counts and results. A compact table can report task completion rate, median completion time, and median confidence by task. Include failures and qualitative observations. With no user study, label the section “Prototype verification” and report only checks you actually performed.

## 8. Discussion
Interpret usability and access-understanding findings, discuss Firebase rules and the difference between access control and encryption, assess backup recovery assumptions, cost/scale boundaries, and limitations. Distinguish implemented features from planned AWS backup and future improvements.

## 9. Conclusion and future work
Summarize what was built and what the evaluation supports. Future work could include expiring share links, server-verified Firebase tokens for S3 backup, file size/type limits, client-side encryption, version recovery, accessibility evaluation, and larger studies.

## References
Use your institution's required style (IEEE/APA/ACM) consistently. Cite Firebase Storage Rules documentation, Firebase Authentication documentation, AWS S3 security/encryption/versioning documentation, Vercel deployment documentation, and relevant peer-reviewed usable-security/cloud-storage research. Verify access dates and bibliographic metadata.

## Submission checklist
- Replace all bracketed text and placeholders with observed facts.
- Include source citations, figures, and captions; number sections consistently.
- State what the prototype does not implement.
- Use only consented, anonymized study data.
- Check your university's formatting and originality rules. This outline is a starting framework, not a completed study or a claim of guaranteed uniqueness.
