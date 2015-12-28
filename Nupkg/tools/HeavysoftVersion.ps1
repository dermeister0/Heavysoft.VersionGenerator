# Copyright (C) 2015 Der_Meister
# Based on original work by Luis Rocha (http://www.luisrocha.net/2009/11/setting-assembly-version-with-windows.html)

$major = 0
$minor = 0
$patch = 0
$changeset = ''

$logPrefix = '[Heavysoft.VersionGenerator]'

if ($env:HVMajor)
{
    $major = $env:HVMajor
    "$logPrefix Major: $major"
}

if ($env:HVMinor)
{
    $minor = $env:HVMinor
    "$logPrefix Minor: $minor"
}

if ($env:HVPatch)
{
    $patch = $env:HVPatch
    "$logPrefix Patch: $patch"
}

if ($env:HVChangeset)
{
    $changeset = $env:HVChangeset
    "$logPrefix Changeset: $changeset"
}

$startDate = Get-Date -Date "2001-10-13 00:00:00Z"
$today = (Get-Date).ToUniversalTime()
$build = ($today - $startDate).Days
"$logPrefix Build: $build"

Get-ChildItem -Recurse -Filter HeavysoftVersion.cs.template | ForEach-Object {
    $templateName = $_.Directory.ToString() + '\' + $_.Name
    $outputName   = $_.Directory.ToString() + '\HeavysoftVersion.cs'

    $lines = Get-Content $templateName | ? { $_ -NotMatch '^#.*$' }
    $lines = (('// HeavysoftVersion.cs is auto-generated.', '// Don''t change it and add to .gitignore.') + $lines)
    $lines | ForEach-Object {
        % {$_ -replace '{major}', $major } |
        % {$_ -replace '{minor}', $minor } |
        % {$_ -replace '{patch}', $patch } |
        % {$_ -replace '{build}', $build } |
        % {$_ -replace '{changeset}', "-$changeset" }
    } | Set-Content $outputName
    
    "$logPrefix Updated $outputName"
}
