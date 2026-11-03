create policy "Users read own files" on storage.objects
for select to authenticated
using (bucket_id = 'user-files' and (storage.foldername(name))[1] = (select auth.uid()::text));

create policy "Users upload own files" on storage.objects
for insert to authenticated
with check (bucket_id = 'user-files' and (storage.foldername(name))[1] = (select auth.uid()::text));

create policy "Users delete own files" on storage.objects
for delete to authenticated
using (bucket_id = 'user-files' and (storage.foldername(name))[1] = (select auth.uid()::text));
