# Ableton Project Folder Structure
## Jeremiah Stephen Smith — Creative Konsoles Audio System

---

## Master Folder Layout

```
~/Music/
└── Productions/
    ├── _TEMPLATES/
    │   ├── BEAT_TEMPLATE.als
    │   ├── FULLBAND_TEMPLATE.als
    │   ├── GUITAR_SESSION_TEMPLATE.als
    │   └── SAMPLE_FLIP_TEMPLATE.als
    ├── _SAMPLES/
    │   ├── Drums/
    │   ├── Bass/
    │   ├── Keys/
    │   ├── Guitar/
    │   ├── Vocals/
    │   ├── FX/
    │   └── Loops/
    ├── _EXPORTS/
    │   ├── WAV/
    │   ├── MP3/
    │   └── Stems/
    ├── _RELEASES/
    │   ├── 2025/
    │   └── 2026/
    ├── Active/
    │   └── [PROJECT_NAME]/
    │       ├── [PROJECT_NAME].als
    │       ├── Samples/
    │       │   ├── Imported/
    │       │   └── Recorded/
    │       ├── Exports/
    │       │   ├── Draft/
    │       │   └── Final/
    │       └── Notes/
    │           └── session-notes.txt
    ├── Backburner/
    └── Archived/
```

---

## Project Naming Convention

```
YYYY-MM-DD_ProjectName_BPM_KEY

Examples:
2026-03-27_MidnightRun_90_Gmin
2026-03-27_PushSession_140_Cmaj
2026-04-01_GuitarFlip_72_Amin
```

---

## Session Notes Template
(Save as `session-notes.txt` in every project's Notes/ folder)

```
PROJECT:
DATE STARTED:
BPM:
KEY:
VIBE/CONCEPT:

GEAR USED:
[ ] Push 2
[ ] MPK Mini
[ ] Scarlett 2i2
[ ] AKG Mic
[ ] PreSonus
[ ] Sire Guitar
[ ] Ibanez Bass
[ ] MicroKorg
[ ] Novation SL MK III
[ ] Korg Turntable

SESSION LOG:
[DATE] -

NEXT STEPS:

STATUS: [ ] In Progress  [ ] Needs Mix  [ ] Mixed  [ ] Mastered  [ ] Released
```

---

## Track Naming Convention (inside Ableton)

```
[Category] - [Description]

Examples:
DRUMS - Kick Layer
DRUMS - Snare Top
BASS - 808 Main
BASS - Guitar DI
KEYS - Pad Rhodes
KEYS - Lead Synth
GTR - Rhythm Clean
GTR - Lead Distort
VOX - Lead Take 1
VOX - BG Harmonies
FX - Riser Build
FX - Impact Hit
MIX - Reverb Return
MIX - Delay Return
MIX - Master
```

---

## Color Coding (Ableton Track Colors)

| Color  | Category       |
|--------|---------------|
| Red    | Drums / Perc  |
| Orange | Bass          |
| Yellow | Keys / Synths |
| Green  | Guitar        |
| Blue   | Vocals        |
| Purple | FX / Ambient  |
| White  | Mix / Returns |
| Grey   | Reference/Archive |

---

## Pre-Session Checklist

```
[ ] Interface (Scarlett 2i2) recognized
[ ] Sample rate: 44.1kHz (or 48kHz for video)
[ ] Buffer size: 128 (live play) / 512 (mixing)
[ ] Project folder created with naming convention
[ ] Template loaded
[ ] Session notes file open
[ ] Push 2 mapped
[ ] Tuner on for guitar/bass if recording live
```

---

## Export / Release Checklist

```
MIXING
[ ] All tracks named and colored
[ ] All plugins checked (no cracked/missing)
[ ] Gain staging — peaks around -6dB
[ ] EQ sweeps done on all tracks
[ ] Compression applied where needed
[ ] Reference track A/B'd

MASTERING PREP
[ ] Stereo bus clear (no master limiter during mix)
[ ] Exported WAV: 24bit / 44.1kHz
[ ] Exported to /Exports/Draft/

FINAL EXPORT
[ ] WAV 24bit → /Exports/Final/
[ ] MP3 320kbps → /Exports/Final/
[ ] Stems exported if needed → /Exports/Stems/

RELEASE
[ ] Cover art ready (3000x3000px JPG)
[ ] Credits written
[ ] BPM + Key noted for metadata
[ ] Moved to /_RELEASES/[YEAR]/
[ ] Project archived in /Archived/
```
