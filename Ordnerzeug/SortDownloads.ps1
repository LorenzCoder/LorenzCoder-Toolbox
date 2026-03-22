# --- Lorenz' Download-Sortierer ---
# Dieses Skript räumt den Downloads-Ordner auf.

$downDir = "$HOME\Downloads"
Set-Location $downDir

# Definition der Ordner und Dateitypen
$folders = @{
    "Bilder"      = "*.jpg", "*.png", "*.gif", "*.svg", "*.webp"
    "Installer"   = "*.exe", "*.msi"
    "Dokumente"   = "*.pdf", "*.docx", "*.txt", "*.xlsx"
    "Archive"     = "*.zip", "*.7z", "*.rar"
}

foreach ($folder in $folders.Keys) {
    # Erstelle den Ordner, falls er nicht existiert
    if (!(Test-Path $folder)) {
        New-Item -ItemType Directory -Name $folder
    }

    # Verschiebe die passenden Dateien
    $extensions = $folders[$folder]
    Get-ChildItem -File -Include $extensions | Move-Item -Destination $folder -Force
}

Write-Host "Downloads wurden erfolgreich sortiert! 🚀" -ForegroundColor Green