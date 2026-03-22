# 📂 Ordnerzeug

Hier sammle ich Skripte, die mir dabei helfen, Ordnung im Windows-Dateisystem zu halten.

## 🛠️ Verfügbare Skripte

### [Download-Sortierer](./SortDownloads.ps1)
Ein PowerShell-Skript, das den oft chaotischen Downloads-Ordner automatisch aufräumt.

**Was es macht:**
* Erstellt Unterordner für verschiedene Dateitypen (Bilder, Installer, Dokumente, Archive).
* Verschiebt vorhandene Dateien automatisch in die passenden Kategorien.
* Ignoriert Dateien, die nicht in das Schema passen, um nichts Wichtiges zu verlieren.

**Verwendung:**
1. Öffne die PowerShell im Verzeichnis `Ordnerzeug`.
2. Führe das Skript aus:
   ```powershell
   .\SortDownloads.ps1