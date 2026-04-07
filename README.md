# Resume King

> Single source of truth for all resume versions, profiles, and career history.
> Everything derives from `master/master_profile.md`.

---

## Structure

```
resume-king/
├── master/
│   └── master_profile.md          ← Complete career history, full bullet bank,
│                                     all skills. Never delete. Only add.
├── profiles/
│   ├── ai-engineer/
│   │   ├── CURRENT                ← Filename of the active version
│   │   ├── VERSION_LOG.md         ← Version history with notes
│   │   └── Shreyas_Khandare_AI_Engineer_v1.docx
│   ├── forward-deployed-engineer/
│   │   ├── CURRENT
│   │   ├── VERSION_LOG.md
│   │   └── Shreyas_Khandare_FDE_v1.docx
│   └── software-engineer/
│       ├── CURRENT
│       ├── VERSION_LOG.md
│       └── Shreyas_Khandare_SWE_v1.docx
├── active/
│   ├── current_resume.docx        ← What your website points to (always latest active)
│   ├── ACTIVE_META                ← Which profile/version is currently active
│   └── history.log                ← Full audit trail of every set_active call
└── scripts/
    ├── set_active.sh              ← Set a version as the live resume
    └── new_version.sh             ← Scaffold a new version slot
```

---

## Profiles

| Profile | Use For |
|---|---|
| `ai-engineer` | LLM Engineer, AI Engineer, GenAI Engineer, Applied AI, ML Engineer |
| `forward-deployed-engineer` | FDE, FDSE, Solutions Engineer, Technical Delivery, Customer-embedded AI roles |
| `software-engineer` | SWE, Full-Stack Engineer, Backend Engineer, Systems Engineer |

---

## Workflow

### Set a new version as active

```bash
./scripts/set_active.sh ai Shreyas_Khandare_AI_Engineer_v2.docx
./scripts/set_active.sh fde Shreyas_Khandare_FDE_v1.docx
./scripts/set_active.sh swe Shreyas_Khandare_SWE_v1.docx
```

This copies the file to `active/current_resume.docx`, updates `profiles/<profile>/CURRENT`, and appends to `active/history.log`.

### Check what's currently active

```bash
./scripts/set_active.sh --status
```

### List versions for a profile

```bash
./scripts/set_active.sh --list ai
./scripts/set_active.sh --list fde
```

### Scaffold a new version

```bash
./scripts/new_version.sh ai v2 "tailored for FinTech startups"
./scripts/new_version.sh fde v2 "Palantir FDSE application"
```

This creates the version slot in `VERSION_LOG.md` and tells you exactly what filename to drop in. Then `set_active.sh` from there.

---

## Versioning Convention

```
Shreyas_Khandare_{PROFILE}_{VERSION}.docx

Examples:
  Shreyas_Khandare_AI_Engineer_v1.docx
  Shreyas_Khandare_AI_Engineer_v2_fintech.docx   ← optional tag for job-specific variants
  Shreyas_Khandare_FDE_v1.docx
  Shreyas_Khandare_SWE_v1.docx
```

For job-specific tailored variants, add a short tag after the version:
```
Shreyas_Khandare_AI_Engineer_v2_sardine.docx
Shreyas_Khandare_FDE_v1_palantir.docx
```
These go in the same profile folder. Only the generic version gets set as `CURRENT` — job-specific files are archived there but not promoted to `active/`.

---

## Commit Convention

```bash
# Adding a new version
git commit -m "feat(resume): add ai-engineer v2"

# Setting active
git commit -m "chore(resume): set active → ai-engineer v2"

# Updating master profile
git commit -m "update(master): add LangGraph + MCP server experience"

# Job-specific tailored variant (don't promote to active)
git commit -m "feat(resume): add ai-engineer v2-sardine (job-specific)"
```

---

## Website Integration

Your portfolio's resume button points to:
```
https://github.com/ShreyasKhandare/resumes/blob/main/active/current_resume.docx
```

Whenever you run `set_active.sh` and push, the website automatically serves the new version. No manual URL update needed.

For a direct download link (bypasses GitHub UI):
```
https://raw.githubusercontent.com/ShreyasKhandare/resumes/main/active/current_resume.docx
```

Update `SocialIcons.tsx` in your portfolio to use the raw URL if you want a direct download instead of a GitHub preview page:
```tsx
href="https://raw.githubusercontent.com/ShreyasKhandare/resumes/main/active/current_resume.docx"
```

---

## Master Profile

`master/master_profile.md` is the single source of truth for all tailoring. It contains:

- Complete work history with full bullet banks per role
- All projects with multiple framing angles (AI Engineer vs FDE vs SWE lens)
- Complete skill inventory
- ATS keyword lists by domain
- Notes on what to emphasize or omit per profile

**Rule:** Never delete from master. Every resume version is a curated subset of it. When you learn something new, add it to master first, then propagate to whichever profile resumes need it.

---

## Scripts Reference

### `set_active.sh`

```
Usage: ./scripts/set_active.sh <profile> <filename>
       ./scripts/set_active.sh --status
       ./scripts/set_active.sh --list <profile>

Profile aliases:
  ai-engineer  | ai  | aie
  fde          | forward-deployed-engineer
  swe          | software-engineer | se
```

### `new_version.sh`

```
Usage: ./scripts/new_version.sh <profile> <version_tag> [note]

Examples:
  ./scripts/new_version.sh ai v2
  ./scripts/new_version.sh fde v2 "tailored for Palantir FDSE"
```

---

*Last updated: April 2026*
