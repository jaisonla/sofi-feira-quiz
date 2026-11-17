-- Real ou Fake? — Grupo 2 · 9º TA
-- Cole TUDO no Supabase: SQL Editor → New query → Run
-- Pode rodar de novo sem problema (não apaga dados).

-- 1) Tabela do ranking --------------------------------------------------
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

-- 2) Administrador ------------------------------------------------------
-- A senha do admin fica SÓ aqui no banco. Para trocar, mude o texto
-- 'feira9TA' nas três funções abaixo e rode o script de novo.

create or replace function public.admin_check(p_senha text)
returns boolean language sql security definer set search_path = public as $$
  select p_senha = 'feira9TA';
$$;

create or replace function public.admin_delete(p_id bigint, p_senha text)
returns boolean language plpgsql security definer set search_path = public as $$
begin
  if p_senha is distinct from 'feira9TA' then
    raise exception 'senha incorreta';
  end if;
  delete from public.ranking where id = p_id;
  return found;
end $$;

create or replace function public.admin_reset(p_senha text)
returns integer language plpgsql security definer set search_path = public as $$
declare n integer;
begin
  if p_senha is distinct from 'feira9TA' then
    raise exception 'senha incorreta';
  end if;
  delete from public.ranking where true;
  get diagnostics n = row_count;
  return n;
end $$;

revoke all on function public.admin_check(text)          from public;
revoke all on function public.admin_delete(bigint, text) from public;
revoke all on function public.admin_reset(text)          from public;
grant execute on function public.admin_check(text)          to anon;
grant execute on function public.admin_delete(bigint, text) to anon;
grant execute on function public.admin_reset(text)          to anon;
