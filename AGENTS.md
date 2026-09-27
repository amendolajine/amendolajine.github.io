# Personal website - repository rules (copy to CLAUDE.md at the repository root, keep under 80 lines)

# Site
- Static site built with Astro, content in Markdown under `src/content/`, published by GitHub Pages through the Actions workflow on every merge into `main` (address: https://<user>.github.io). After the initial setup, never push to `main` directly; open a pull request. A custom domain and Cloudflare come later, if Antonio wants them.
- Run: `npm run dev` (preview), `npm run build` (must pass before any pull request; the Stop hook enforces it).
- Design tokens: `src/styles/tokens.css` is the only place colours, fonts, spacing and radius are defined. See @DESIGN.md. After any token change, remind Antonio to run `/design-sync` so Claude Design stays aligned.
- Every page carries Person or ProfilePage structured data with `sameAs` links to his other profiles; an RSS feed and a sitemap exist; every image has alt text.

# Writing
- Site copy in English. Only the short hyphen "-". The anti-slop checklist (section A of `docs/02_scrittura_e_fonti.md`) is the last pass on any copy; section B is the source-vetting protocol for any research.
- No claims about employers, clients or numbers without a source Antonio gives. Photos only from the archive project's `public` export.

# Working with Antonio
- Not a developer. Before changing more than one file, state the plan in three lines and wait.
- After a change, show the preview and the build result, not a description.
- No new dependency, plugin, service or paid tool without asking, with the reason and monthly cost.

# Git
- One branch per task (`git switch -c <type>/<short-name>`), small commits, pull request into `main`, merge only with the build check green. `git push` always asks. Never force-push, never skip hooks.

# Continuous improvement
- At session end, append candidates to `candidati_regole.md`; never edit this file yourself.
