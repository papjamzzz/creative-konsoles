# 5of8eyes — Complete Project Handoff
**The AI Synthesis Consortium**
**Owner:** Jeremiah Smith · jeremiahstephensmith@gmail.com
**GitHub:** papjamzzz · **Brand:** Creative Konsoles
**Last updated:** 2026-03-19

---

## What This Is

A developer-grade multi-AI synthesis instrument. A prompt passes sequentially through 5 AI models (GPT-4 → Claude → Gemini → Mistral → Grok), each one building on the last. The output is synthesized, not just concatenated. The interface is a hardware mixing board — faders, knobs, LED meters, console monitors — not a chat UI.

**The differentiator:** 4 data-driven faders (Cost, Latency, Agreeability, Reliability) that actually re-weight the model chain using real sourced benchmark numbers. This is what a developer would pay for. It's not a toy.

**Business model:** Subscription, targeting developers and researchers. 10 subs ≈ $300/mo passive. Part of the Creative Konsoles product family.

---

## Files in This Project

| File | What It Is |
|------|-----------|
| `5of8eyes-site.html` | **The app** — fully self-contained, no build step, no dependencies except Google Fonts |
| `5OF8EYES_PROJECT.md` | This handoff document |
| `5of8eyes-logo.svg` | Master vector logo (rebuild from HTML canvas code if missing) |
| `render_assets.py` | Generates PNG assets from SVG (requires cairosvg + Pillow) |

**The HTML file is 100% self-contained.** Everything — canvas rendering, fader logic, knob drawing, CPU meter, orbital animation, model data — is embedded. Just open it in a browser.

---

## Visual Design System

### Color Tokens
```css
--bg:          #0B1210   /* deep dark green — the foundation */
--bg2:         #0F1A16
--bg3:         #132018
--border:      #1F5A38
--green:       #58DE83   /* primary signal color */
--green-bright:#69F09B
--mint:        #C3FDD8   /* text */
--amber:       #DA8E20
--ember:       #CD4E14
```

### Planet → AI → Color Mapping
| Planet | Model | Color | Orbit |
|--------|-------|-------|-------|
| 1 | GPT-4 | `#22C55E` green | ORB-1 |
| 2 | Claude | `#7C3AED` violet | ORB-2 |
| 3 | Gemini | `#3B82F6` blue | ORB-3 |
| 4 | Mistral | `#DA8E20` amber | ORB-4 |
| 5 | Grok | `#CD4E14` ember | ORB-5 |

### Synthesis Order
`GPT-4 → Claude → Gemini → Mistral → Grok`
(configurable — MODEL_ORDER array in JS)

### Typography
- **Space Grotesk** — headings, logo text, big UI labels
- **Inter** — body, small labels
- **JetBrains Mono** — everything monospace, values, status, tech labels

---

## The Logo / Hero

The orbital logo is drawn entirely in Canvas 2D. No SVG dependency in the running app.

**Hero canvas:** 400×400px internal resolution, displayed at 200×200px CSS
**Visual treatment:**
- Transparent background (see-through hologram feel)
- 5 concentric orbital rings, each glowing in its planet color
- Slowly rotating planets with specular highlight + glow halos
- Sine wave through center
- Pulsing core (rgba green/white)
- **Hover = freeze** (mouseenter/mouseleave on canvas)
- **Glitch system** — random collisions where 2 planets briefly share an orbit, with ghost flicker effect

**Float animation:** `float 6s ease-in-out infinite` — translateY -14px
**Pulse rings:** Two staggered `pulse-ring` keyframes on ::before and ::after

```css
filter: drop-shadow(0 0 40px rgba(88,222,131,0.55))
        drop-shadow(0 0 90px rgba(88,222,131,0.22))
        drop-shadow(0 0 4px rgba(195,253,216,0.4));
```

---

## The 4 Faders

VST synthesizer hardware aesthetic. Three grip lines on thumb. Deep inset track. Colored fill per dimension.

**Critical:** Thumb-drag ONLY. No click-on-track. `dragStartY` + `dragStartVal` system = zero jump.

| # | Label | Color | Up = | Down = |
|---|-------|-------|------|--------|
| 1 | COST | amber `#DA8E20` | premium models weighted heavier | budget models |
| 2 | LATENCY | blue `#3B82F6` | fast/low-latency | thorough/higher-latency |
| 3 | AGREE | violet `#7C3AED` | high agreeability (consensus) | divergent models |
| 4 | RELY | green `#22C55E` | high reliability/uptime | lower uptime |

**Weight formula:**
```javascript
function lerp(a, b, t) { return a + (b - a) * t; }

// Per model, per fader:
costW  = lerp(m.budgetScore,          m.premiumScore,       faders.cost)
latW   = lerp(1 - m.speedScore,       m.speedScore,         faders.latency)
agreeW = lerp(1 - m.agreeabilityScore, m.agreeabilityScore, faders.agree)
relyW  = lerp(1 - m.reliabilityScore,  m.reliabilityScore,  faders.rely)
weight[model] = (costW + latW + agreeW + relyW) / 4

// Normalize so all weights sum to 1:
total = sum of all weights
weight[k] = weight[k] / total
```

---

## The 4 Knobs (Analysis Tools)

Canvas-drawn VST rotary knobs. Off = indicator at 7 o'clock. On = indicator at 5 o'clock. 270° range arc through 12 o'clock.

| Knob | Tool | Color |
|------|------|-------|
| AGREE DETECT | Agreement Detection | violet `#7C3AED` |
| CONSENSUS MAP | Consensus Map | blue `#3B82F6` |
| DELTA ANALYSIS | Delta Analysis | amber `#DA8E20` |
| CONFIDENCE SCORE | Confidence Score | green `#22C55E` |

Click to toggle. State stored in `knobStates` object. `drawKnob(id, state)` redraws.

---

## Model Data (Full — with sources)

```javascript
const MODELS = {
  claude: {
    name:'Claude', short:'CLD', color:'#7C3AED', colorHi:'#A78BFA',
    // Source: anthropic.com/api
    costPerMOutput:{ budget:1.25, standard:15, premium:75 },
    premiumScore:0.94, budgetScore:0.48,
    // Source: artificialanalysis.ai (TTFT ms)
    ttft:520, speedScore:0.62,
    // Source: status.anthropic.com (90-day rolling)
    reliabilityPct:99.7, reliabilityScore:0.90,
    // Source: LMSYS Chatbot Arena (proxy)
    agreeabilityScore:0.72,
    orbit:2, active:true, apiKey:null,
  },
  gemini: {
    name:'Gemini', short:'GEM', color:'#3B82F6', colorHi:'#93C5FD',
    // Source: ai.google.dev/pricing
    costPerMOutput:{ budget:0.075, standard:1.25, premium:10 },
    premiumScore:0.71, budgetScore:0.80,
    ttft:410, speedScore:0.78,
    reliabilityPct:99.5, reliabilityScore:0.86,
    agreeabilityScore:0.68,
    orbit:3, active:true, apiKey:null,
  },
  gpt: {
    name:'GPT-4', short:'GPT', color:'#22C55E', colorHi:'#86EFAC',
    // Source: openai.com/pricing
    costPerMOutput:{ budget:0.15, standard:10, premium:60 },
    premiumScore:0.88, budgetScore:0.70,
    ttft:680, speedScore:0.50,
    reliabilityPct:99.9, reliabilityScore:0.95,
    agreeabilityScore:0.75,
    orbit:1, active:true, apiKey:null,
  },
  mistral: {
    name:'Mistral', short:'MST', color:'#DA8E20', colorHi:'#FDE68A',
    // Source: mistral.ai/pricing
    costPerMOutput:{ budget:0.25, standard:2, premium:8 },
    premiumScore:0.65, budgetScore:0.92,
    ttft:320, speedScore:0.88,
    reliabilityPct:99.2, reliabilityScore:0.80,
    agreeabilityScore:0.62,
    orbit:4, active:true, apiKey:null,
  },
  grok: {
    name:'Grok', short:'GRK', color:'#CD4E14', colorHi:'#FCA5A5',
    // Source: x.ai/api
    costPerMOutput:{ budget:0.50, standard:5, premium:15 },
    premiumScore:0.78, budgetScore:0.78,
    ttft:580, speedScore:0.58,
    reliabilityPct:98.8, reliabilityScore:0.72,
    agreeabilityScore:0.60,
    orbit:5, active:true, apiKey:null,
  },
};
```

---

## CPU Meter

Uses **W3C Long Tasks API** (`PerformanceObserver` with `entryTypes:['longtask']`). Reports main-thread blocking events >50ms — same data Chrome DevTools Performance panel shows. Labeled "App Thread" not "System CPU" (browser security prevents actual process CPU reads).

Falls back to rAF delta timing if Long Tasks API unavailable.

**Red flash** on header meter = long task detected.
**Electron upgrade path:** Replace with `process.cpuUsage()` for true system CPU %.

---

## Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| `⌘ + ↵` | Synthesize |
| `⌘ + /` | Toggle system prompt |
| `⌘ + O` | Open file |
| `⌘ + R` | Randomize all faders |
| `⌘ + C` | Copy output |
| `⌘ + K` | Clear all |

---

## Layout Structure

```
┌─────────────────────────────────────────────────────────┐
│  HEADER: logo | CPU meter | live status dot              │
├──────────────┬──────────────────────────┬───────────────┤
│  LEFT PANEL  │    CENTER PANEL          │  RIGHT PANEL  │
│  (240px)     │    (flex 1)              │  (260px)      │
│              │                          │               │
│  Hero Logo   │  Synthesis Chain         │  Rankings     │
│  (200px)     │  (model console strip)   │  (medal rows) │
│              │                          │               │
│  Fader Bank  │  Knob Bank               │  Model Monitor│
│  (4 faders)  │  (4 analysis knobs)      │  (console)    │
│              │                          │               │
│  Randomize   │  Prompt Input            │  Shortcuts    │
│              │  + Dev Toolbar           │               │
│  API Keys    │  (file drop, format,     │               │
│              │   sys prompt, token cnt) │               │
│              │                          │               │
│              │  Synthesize Button       │               │
│              │                          │               │
│              │  Results Tabs            │               │
│              │  (Synthesis/Agreement/   │               │
│              │   Delta)                 │               │
└──────────────┴──────────────────────────┴───────────────┘
```

---

## What's Built vs What's Wired

| Feature | Status | Notes |
|---------|--------|-------|
| Visual UI complete | ✅ Done | All panels, faders, knobs, logo, meters |
| Fader weight math | ✅ Done | lerp formula, normalization |
| Rankings (medal table) | ✅ Done | Per category, all 4 dimensions |
| CPU meter (Long Tasks) | ✅ Done | With Electron upgrade path |
| File upload drop zone | ✅ Done | Reads into textarea |
| Format selector | ✅ Done | TEXT / JSON / MD / STREAM |
| System prompt toggle | ✅ Done | ⌘/ |
| Token counter | ✅ Done | Live character/4 estimate |
| Keyboard shortcuts | ✅ Done | All 6 |
| Orbital glitch system | ✅ Done | Random collision events |
| Hover-to-freeze logo | ✅ Done | mouseenter/mouseleave |
| API key modal (per model) | ✅ Done | prompt() — replace with real modal |
| Live API calls | ⬜ TODO | Wire each model's real API |
| Agreement Detection logic | ⬜ TODO | NLP overlap scoring |
| Consensus Map output | ⬜ TODO | Visual cluster output |
| Delta Analysis | ⬜ TODO | Diff per model pass |
| Confidence Score | ⬜ TODO | Aggregate certainty metric |
| Pricing / Gumroad | ⬜ TODO | Gumroad embed or Stripe |
| Auth / user accounts | ⬜ TODO | Optional — can stay API-key-only |
| YouTube demo | ⬜ TODO | Screen record + narrate the faders |

---

## Prompts for Claude Code

### To wire a single model API (example: Claude):
```
In 5of8eyes-site.html, wire the Claude API to the synthesize() function.
When the user hits Synthesize, for each active model in MODEL_ORDER,
call that model's API using the apiKey stored in MODELS[key].apiKey.
Pass the previous model's output as context for the next.
Use fetch() with async/await. Stream the response into the output panel.
Keep all existing UI behavior intact.
```

### To implement Agreement Detection:
```
In 5of8eyes-site.html, implement the Agreement Detection knob (id: 'agreement').
When it's toggled on after a synthesis run, analyze the 5 model outputs
and highlight passages where 3 or more models used substantially similar phrasing.
Output flagged spans in the Agreement tab with a green left-border marker.
Use the existing .agree-marker CSS class.
```

### To add real streaming output:
```
Replace the setTimeout simulation in synthesize() with real streaming.
Each model's response should stream into its own colored output block
in real time as tokens arrive. Use ReadableStream and TextDecoder.
```

---

## Next Session Startup Prompt

Paste this at the start of any new session to restore full context:

---
*"I'm building 5of8eyes — The AI Synthesis Consortium. It's a multi-AI synthesis instrument where a prompt passes through GPT-4, Claude, Gemini, Mistral, and Grok sequentially. The main file is 5of8eyes-site.html — fully self-contained, no build step. It has 4 VST-style faders (Cost/Latency/Agreeability/Reliability) with real benchmark data, canvas-drawn rotary knobs for analysis tools (Agreement Detection / Consensus Map / Delta Analysis / Confidence Score), an animated orbital logo that freezes on hover and glitches orbits, a Long Tasks API CPU meter, and a developer input section with file drop, format selector, and system prompt toggle. The visual language is dark green (#0B1210), mint (#C3FDD8), glowing green (#58DE83), VST hardware instrument aesthetic. Brand is Creative Konsoles, GitHub: papjamzzz. The project handoff doc is 5OF8EYES_PROJECT.md. What needs to be built next is [YOUR TASK HERE]."*

---

## LinkedIn Revival Tasks

> *Added as separate track — run parallel to 5of8eyes development*

- [ ] Rewrite headline: something like "Building AI developer tools | Creative Konsoles founder | ex-restaurant industry → tech"
- [ ] About section: the narrative (outside my industry, building from scratch, here's what I'm shipping)
- [ ] Feature 5of8eyes as a project with screenshot
- [ ] Feature KodeKeeper as a shipped product
- [ ] Post cadence: 1 post/week about the build process (build in public)
- [ ] Connect with indie hacker / developer tool communities

---

## Business Numbers

| Scenario | Subs | Price | MRR |
|----------|------|-------|-----|
| Launch | 10 | $29 | $290 |
| Early traction | 50 | $29 | $1,450 |
| Growth | 200 | $29 | $5,800 |
| Scale | 500 | $29/$99 | $20K+ |

**The math works at 10.** That's the target for v1 launch.

---

*Generated by Claude in Cowork — 2026-03-19*
*Creative Konsoles · papjamzzz*
