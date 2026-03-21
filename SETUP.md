# Creative Konsoles — Domain & Infrastructure Setup

## Domain
- **Domain:** creativekonsoles.com
- **Registrar:** Namecheap (account: miah3335)
- **Auto-renew:** ON (expires Mar 21, 2027)

## DNS Records (Namecheap Advanced DNS)
| Type | Host | Value | Purpose |
|------|------|-------|---------|
| A | @ | 185.199.108.153 | GitHub Pages |
| A | @ | 185.199.109.153 | GitHub Pages |
| A | @ | 185.199.110.153 | GitHub Pages |
| A | @ | 185.199.111.153 | GitHub Pages |
| CNAME | www | papjamzzz.github.io | GitHub Pages www redirect |

## Email Addresses (Namecheap Email Forwarding — free)
All addresses forward to personal Gmail.

| Address | Forwards To | Purpose |
|---------|------------|---------|
| jeremiah@creativekonsoles.com | personal Gmail | Founder |
| support@creativekonsoles.com | personal Gmail | Support |
| sales@creativekonsoles.com | personal Gmail | Sales |

Set up via: Namecheap → Domain List → Manage → Domain tab → REDIRECT EMAIL

## Website
- **Live at:** https://creativekonsoles.com
- **GitHub repo:** https://github.com/papjamzzz/creative-konsoles
- **Hosting:** GitHub Pages (free, auto-deploys on push to main)
- **SSL:** Automatic via GitHub Pages (Let's Encrypt)
- **To update the site:** edit index.html → git commit → git push → live in ~60s

## All CK Projects
| App | Repo | Port | Status |
|-----|------|------|--------|
| 5i | papjamzzz/5i | 5562 | Live on Railway |
| Kalshi Konnektor | papjamzzz/kalshi-konnektor | 5555 | Local |
| Stream Fader | papjamzzz/Stream-Fader | 5556 | Local |
| Track Tracks | papjamzzz/Track-Tracks | 5557 | Local |
| DAW Doctor | papjamzzz/Daw-Doctor | 5558 | Local |
| KK Trader | papjamzzz/kalshi-trader | 5559 | Local (private) |
| Kode Keeper | papjamzzz/kodekeeper | 5560 | Local |
| Pipeline | internal | 5561 | Local |

---
*Last updated: 2026-03-21*
