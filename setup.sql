-- Real ou Fake? — Grupo 2 · 9º TA
-- Cole tudo no Supabase: SQL Editor → New query → Run

create table if not exists public.ranking (
  id         bigint generated always as identity primary key,
  name       text        not null check (char_length(name) between 1 and 20),
  score      integer     not null check (score between 0 and 1200),
  hits       integer     check (hits between 0 and 8),
  created_at timestamptz not null default now()
);

alter table public.ranking enable row level security;

drop policy if exists "ranking: qualquer um le" on public.ranking;
create policy "ranking: qualquer um le"
  on public.ranking for select to anon using (true);

drop policy if exists "ranking: qualquer um grava" on public.ranking;
create policy "ranking: qualquer um grava"
  on public.ranking for insert to anon with check (true);

grant usage on schema public to anon;
grant select, insert on public.ranking to anon;

-- Para zerar o ranking antes da feira (apaga os testes):
-- truncate public.ranking restart identity;
