# --- Lorenz' Download-Sortierer V5 ---
$downDir = "$HOME\Downloads"

# 1. Definition der Ziel-Kategorien
$folders = @{
    "Bilder"      = ".jpg", ".jpeg", ".png", ".gif", ".svg", ".webp", ".ico"
    "Videos"      = ".mp4", ".mkv", ".mov", ".avi", ".wmv"
    "Audio"       = ".mp3", ".wav", ".flac", ".ogg", ".m4a"
    "Installer"   = ".exe", ".msi", ".bat", ".ps1"
    "Dokumente"   = ".pdf", ".docx", ".txt", ".xlsx", ".pptx", ".md", ".csv", ".winmd"
    "Archive"     = ".zip", ".7z", ".rar", ".tar", ".gz", ".iso"
}

# Name des Sammelordners für alle anderen Ordner
$miscFoldersDirName = "Eigene_Ordner_Sammlung"
$miscFoldersPath = Join-Path $downDir $miscFoldersDirName

# --- SCHRITT A: Dateien sortieren (wie gehabt) ---
foreach ($folderName in $folders.Keys) {
    $targetDir = Join-Path $downDir $folderName
    if (!(Test-Path $targetDir)) { New-Item -ItemType Directory -Path $targetDir | Out-Null }

    $extensions = $folders[$folderName]
    Get-ChildItem -Path $downDir -File | Where-Object { $extensions -contains $_.Extension.ToLower() } | ForEach-Object {
        Move-Item -Path $_.FullName -Destination $targetDir -Force
    }
}

# --- SCHRITT B: Fremde Ordner einsammeln ---
# Erstelle den Sammelordner für Ordner
if (!(Test-Path $miscFoldersPath)) { New-Item -ItemType Directory -Path $miscFoldersPath | Out-Null }

# Alle Ordner finden, die NICHT in unserer Liste sind und NICHT der Sammelordner selbst sind
$systemFolders = $folders.Keys + $miscFoldersDirName

Get-ChildItem -Path $downDir -Directory | Where-Object { $systemFolders -notcontains $_.Name } | ForEach-Object {
    Write-Host "Verschiebe fremden Ordner: $($_.Name) nach $miscFoldersDirName" -ForegroundColor Yellow
    Move-Item -Path $_.FullName -Destination $miscFoldersPath -Force
}

Write-Host "Alles blitzblank sauber! 🚀" -ForegroundColor Green