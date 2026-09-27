# Candidate rules 

Owner: Antonio. Status: live file, append-only for Claude, never loaded by default. Cap: 40 open entries. Promotion: weekly, by Antonio, with the skill "revisione-regole".

Entry format (one block per candidate):
```
C-<area>-<nn> | date: YYYY-MM-DD
Trigger: <the exact task and what went wrong or what worked>
Proposed rule: <one sentence, checkable if possible>
Layer and file: <core / playbook: which file / skill: which>
Test: <script, regular expression, checklist line, or the observable behaviour>
Source: <Antonio's words on date / observed failure with link>
Expiry: <date + 60 days>
Status: open / promoted on <date> / rejected on <date> (<reason>) / expired
```

Areas: writing, research, sources, tools, domain, delivery, privacy, environment.

## Open candidates

C-tools-01 | date: 2026-09-27
Trigger: first commit of the new site repository was blocked because the pre-commit and Claude hooks scan their own source (which lists the banned words) and the documentation file that lists them, so they flagged themselves.
Proposed rule: any content-scanning git hook must exclude its own script path and any file whose stated purpose is to list the banned patterns, from the scan.
Layer and file: playbook: .githooks/pre-commit, .claude/hooks/blocca-commit-vietati.sh
Test: staging only .githooks/pre-commit or docs/02_scrittura_e_fonti.md (unchanged content) must not block a commit.
Source: observed failure during setup, 2026-09-27
Expiry: 2026-11-26
Status: open

C-tools-02 | date: 2026-09-27
Trigger: the GitHub Pages deploy workflow (withastro/action@v3) failed on the first run because GitHub's ubuntu-latest runner defaults to Node 20, and current Astro requires Node >=22.12.
Proposed rule: the Astro GitHub Pages deploy workflow must pin `node-version: 22` (or newer, matching Astro's current requirement) under `with:` on the withastro/action step.
Layer and file: core: .github/workflows/deploy.yml
Test: `gh run list` shows the "Deploy to GitHub Pages" run as success after a push to main.
Source: observed failure during setup, 2026-09-27
Expiry: 2026-11-26
Status: open

## Promoted (moved to their file; kept here for traceability)

## Rejected or expired
