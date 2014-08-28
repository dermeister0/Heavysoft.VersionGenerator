Heavysoft.VersionGenerator
==========================

Project file changes
--------------------

    <PropertyGroup>
      <PowerShellExe Condition=" '$(PowerShellExe)'=='' ">%WINDIR%\System32\WindowsPowerShell\v1.0\powershell.exe</PowerShellExe>
    </PropertyGroup>
  ---
    <Target Name="BeforeBuild">
      <Exec Command="$(PowerShellExe) -NonInteractive -Command &quot;&amp;{ $(ProjectDir)Properties\HeavysoftVersion.ps1 }&quot;" />
    </Target>

.gitignore
----------

    HeavysoftVersion.cs
