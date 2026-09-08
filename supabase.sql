create table if not exists public.alderia_state (
  id text primary key,
  data jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.alderia_state enable row level security;

drop policy if exists "public can read alderia state" on public.alderia_state;
drop policy if exists "public can write alderia state" on public.alderia_state;

create policy "public can read alderia state"
  on public.alderia_state for select
  to anon
  using (true);

create policy "public can write alderia state"
  on public.alderia_state for all
  to anon
  using (true)
  with check (true);

insert into public.alderia_state (id, data)
values ('main', '{}'::jsonb)
on conflict (id) do nothing;
