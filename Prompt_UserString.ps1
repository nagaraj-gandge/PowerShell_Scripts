function Get-NonNullString{
param([string]$Prompt=("You must provide text as a prompt"))
    $Output = Read-Host $prompt
    while([string]::IsNullOrWhiteSpace($Output)){
        write-host "`nYou must enter a response!`n" -ForegroundColor Red
        $Output = Read-Host $prompt
    }
}
Get-NonNullString