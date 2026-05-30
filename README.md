# josyn-system

**josyn-system** enthält die Systemschicht von **JOSYN** (*JobSystem Next*) —
gemeinsame Bibliotheken und ausführbare Prozesse des JOSYN-Systems.

---

## Bausteine

| Komponente | Typ | Rolle | Abhängigkeiten |
|---|---|---|---|
| [`JOSYN.Jap.Shared.Contract`](josyn-jap-shared/) | NuGet | Applikationsvertrag (JAP) zwischen JobHost und JAPServer | ResultPattern |
| [`JOSYN.Jap.Shared.Log`](josyn-jap-shared/) | NuGet | Prozess-lokaler Datei-Logger für alle JOSYN-EXE-Prozesse | ResultPattern |
| [`JOSYN.Jap.JAPServer`](josyn-jap-japserver/) | Exe | Backend-Prozess — empfängt JAP-Anfragen via JIP, führt Jobs aus | JIP, PropertyBag, ResultPattern, Shared.Contract, Shared.Log |

### Abhängigkeitskette

```
JOSYN.Foundation.ResultPattern
        ↑           ↑          ↑
Shared.Contract  Shared.Log  JIP / PropertyBag
        ↑           ↑          ↑
              JAPServer (Exe)
```

---

## Lokales Arbeiten

Jedes Sub-Repo ist autark. Aus dem jeweiligen Verzeichnis:

```
.local-build\build.cmd      # Release-Build
.local-build\test.cmd       # Tests ausführen
.local-build\pack.cmd       # NuGet-Pakete → ..\..\local-packages\
```

Oder über die Root-Skripte (alle Sub-Repos auf einmal):

```
.local-build\build.cmd      # Release-Build (alle Sub-Repos)
.local-build\test.cmd       # Tests (alle Sub-Repos)
.local-build\pack.cmd       # NuGet-Pakete (alle Sub-Repos)
.local-build\all.cmd        # Clean → Build → Test → Pack
```

**Voraussetzung:** `josyn-foundation-result-pattern` muss zuerst gepackt sein
(liegt in `..\..\local-packages\`).

---

## Status

Reifer PoC — Milestone 1. Die Pakete sind intern produktionsreif;
die `preview`-Kennzeichnung spiegelt den noch offenen Abnahme-Prozess wider.
Bekannte PoC-Einschränkungen:
- [`josyn-jap-shared/POC-HACKS.md`](josyn-jap-shared/POC-HACKS.md)
- [`josyn-jap-japserver/POC-HACKS.md`](josyn-jap-japserver/POC-HACKS.md)

---

*JOSYN System — © 2026 HAEVG AG — MIT License*
