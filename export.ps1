param (
    #add summary
    [Parameter(Mandatory = $true, HelpMessage = "Path to the ArchiMate model file")]
    [string]$modelPath = "C:\Users\sbuss\Documents\Archi\model-repository\2526-ais-group-9\.git\temp-backup.archimate",
    [Parameter(Mandatory = $true, HelpMessage = "Path to the output folder")]
    [string]$outputPath = "C:\Users\sbuss\OneDrive\Desktop\Archi-images"
)

function GetTitle {
    param (
        [string]$htmlFilePath
    )

    # Load the HTML content
    $htmlContent = Get-Content -Path $htmlFilePath -Raw

    # Use regex to extract the <title> text
    $titleText = [regex]::Match($htmlContent, '<title>(.*?)</title>').Groups[1].Value

    # Output the <title> text
    return $titleText

}

$htmlOutputPath = "$($outputPath)\html"

$process = "C:\Program Files\Archi\Archi.exe"
$arguments = "-application com.archimatetool.commandline.app -consoleLog -nosplash --loadModel $($modelPath) --html.createReport $($htmlOutputPath)"

Write-Host "Creating HTML report..."
Write-Host "`t$process $arguments"
Start-Process -FilePath $process -ArgumentList $arguments -Wait 

$imagesFolder = Get-ChildItem -Path $outputPath -Filter images -Recurse
$viewsFolder = Get-ChildItem -Path $outputPath -Filter views -Recurse


$childItems = Get-ChildItem -Path $imagesFolder[0].FullName

Write-Host ""
Write-Host "Copying images..."
$childItems | ForEach-Object {
    $item = $_;
    $baseName = $item.BaseName;

    $htmlFilePath = "$($viewsFolder[0].FullName)\$($baseName).html";
    $title = GetTitle -htmlFilePath $htmlFilePath;
    Write-Host "`tTitle: $title";

    $destinationFilePath = "$($outputPath)\$($title)$($item.Extension)";
    Copy-Item -Path $item.FullName -Destination $destinationFilePath
}
Write-Host "Remove HTML report..."
Remove-Item -Path $htmlOutputPath -Recurse
Write-Host ""
Write-Host "Done!" -foregroundcolor "Green"
