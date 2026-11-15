-- À coller dans Supabase > SQL Editor > New query, puis "Run".
-- Crée la table du panel et la verrouille : chaque compte ne voit et ne modifie que ses propres données.

create table if not exists public.panel_items (
  id          text primary key,
  user_id     uuid not null default auth.uid() references auth.users (id) on delete cascade,
  col         text not null check (col in ('events', 'notes', 'todos')),
  data        jsonb not null default '{}'::jsonb,
  updated_at  timestamptz not null default now()
);

alter table public.panel_items enable row level security;

drop policy if exists "lecture perso"      on public.panel_items;
drop policy if exists "ajout perso"        on public.panel_items;
drop policy if exists "modification perso" on public.panel_items;
drop policy if exists "suppression perso"  on public.panel_items;

create policy "lecture perso"      on public.panel_items for select using (auth.uid() = user_id);
create policy "ajout perso"        on public.panel_items for insert with check (auth.uid() = user_id);
create policy "modification perso" on public.panel_items for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "suppression perso"  on public.panel_items for delete using (auth.uid() = user_id);

-- Synchronisation en direct entre PC et iPhone
alter publication supabase_realtime add table public.panel_items;
