# Mettre Mon Panel en ligne (gratuit)

Le panel devient un vrai site, à ton adresse, protégé par ton email et ton mot de passe.
- **Supabase** garde tes données (planning, notes, tâches) et gère la connexion.
- **GitHub Pages** héberge les pages du site.

Les deux sont gratuits. Compte environ 15 minutes.

---

## 1. Supabase : la base de données

1. Va sur **supabase.com** et crée un compte (bouton *Start your project*).
2. Clique sur **New project** :
   - Name : `mon-panel`
   - Database password : clique sur *Generate* (tu n'en auras pas besoin ensuite)
   - Region : **Paris (eu-west-3)** ou la plus proche de chez toi
   - Clique sur **Create new project** et attends 1 à 2 minutes.
3. Dans le menu de gauche, ouvre **SQL Editor**, puis **New query**.
   Ouvre le fichier `supabase.sql` (dans le dossier My Panel), copie tout son contenu, colle-le et clique sur **Run**.
   Le message « Success. No rows returned » doit apparaître.
4. **Crée ton compte de connexion** : ouvre **Authentication**, puis **Users**, puis **Add user**, puis **Create new user**.
   Mets ton email et un mot de passe solide, et coche **Auto Confirm User**.
5. **Empêche les autres de créer un compte** : ouvre **Authentication**, puis **Sign In / Providers** (ou *Settings*).
   Désactive **Allow new users to sign up** et enregistre.
6. **Récupère tes clés** : ouvre **Project Settings** (l'engrenage), puis **Data API** / **API Keys**.
   Copie :
   - le **Project URL** (`https://xxxx.supabase.co`)
   - la clé **anon public** (elle commence par `eyJ...`). Si on te propose plutôt une *publishable key* (`sb_publishable_...`), prends-la.
7. Ouvre `site/config.js` avec le Bloc-notes et remplace les deux `COLLE_ICI_...` par ces valeurs. Enregistre.

> Ne copie **jamais** la clé `service_role` / `secret` : elle donne accès à tout.

---

## 2. GitHub Pages : le site

1. Va sur **github.com** et crée un compte.
2. Clique sur **+**, puis **New repository** :
   - Repository name : `mon-panel`
   - Laisse le dépôt en **Public** (obligatoire pour que GitHub Pages soit gratuit). Tes données ne sont pas dans ces fichiers : seul le code du site est visible.
   - Clique sur **Create repository**.
3. Sur la page du dépôt, clique sur **uploading an existing file**.
   Glisse les **5 fichiers** du dossier `site` (`index.html`, `config.js`, `manifest.webmanifest`, `icon-180.png`, `icon-512.png`), puis clique sur **Commit changes**.
4. Ouvre **Settings**, puis **Pages**. Dans *Branch*, choisis **main** et **/ (root)**, puis clique sur **Save**.
5. Attends 1 à 2 minutes et recharge la page : ton adresse s'affiche, par exemple
   **`https://ton-pseudo.github.io/mon-panel/`**

---

## 3. Sur ton iPhone 15 Pro

1. Ouvre **Safari** (pas Chrome : seul Safari peut ajouter une app à l'écran d'accueil de façon fiable).
2. Va sur ton adresse `https://ton-pseudo.github.io/mon-panel/`.
3. Touche le bouton **Partager** (le carré avec une flèche), puis **Sur l'écran d'accueil**, puis **Ajouter**.
4. Ouvre l'icône **Panel** et connecte-toi une fois. Tu restes connecté ensuite.

Le panel s'ouvre alors en plein écran, comme une vraie app. Les changements faits sur le PC apparaissent sur l'iPhone, et l'inverse.

---

## Modifier le site plus tard

Modifie les fichiers dans `site`, puis renvoie-les sur GitHub (*Add file*, puis *Upload files*, en écrasant les anciens). Le site se met à jour en 1 à 2 minutes. Tes données ne bougent pas.

## Si ça ne marche pas

| Ce que tu vois | Ce qu'il faut faire |
|---|---|
| « Configuration manquante » | `config.js` n'est pas rempli, ou pas envoyé sur GitHub. |
| « Email ou mot de passe incorrect » | Vérifie l'utilisateur créé à l'étape 1.4 (avec *Auto Confirm* coché). |
| « Impossible de charger tes données » | Le script `supabase.sql` n'a pas été lancé, ou la connexion internet est coupée. |
| Le projet Supabase est en pause | Les projets gratuits se mettent en pause après 7 jours sans aucune utilisation. Clique sur *Restore* dans Supabase. |
