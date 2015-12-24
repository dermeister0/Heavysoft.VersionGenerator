Heavysoft.VersionGenerator
==========================

Project file changes
--------------------

    <PropertyGroup>
      <PowerShellExe Condition=" '$(PowerShellExe)'=='' ">%WINDIR%\System32\WindowsPowerShell\v1.0\powershell.exe</PowerShellExe>
    </PropertyGroup>
  ---
    <Target Name="BeforeBuild">
      <Exec Command="$(PowerShellExe) -NonInteractive -NoProfile -ExecutionPolicy Bypass -Command &quot;&amp;{ $(ProjectDir)Properties\HeavysoftVersion.ps1 }&quot;" />
    </Target>
You can also move the script to solution root directory and delete it from Properties.

    <Target Name="BeforeBuild">
      <Exec Command="$(PowerShellExe) -NonInteractive -NoProfile -ExecutionPolicy Bypass -Command &quot;&amp;{ $(SolutionDir)HeavysoftVersion.ps1 }&quot;" />
    </Target>
.gitignore
----------

    HeavysoftVersion.cs
