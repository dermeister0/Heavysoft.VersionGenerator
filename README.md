Heavysoft.VersionGenerator
==========================

Project file changes
--------------------

    <PropertyGroup>
      <PowerShellExe Condition=" '$(PowerShellExe)'=='' ">%WINDIR%\System32\WindowsPowerShell\v1.0\powershell.exe</PowerShellExe>
      <HeavysoftVersionPs1>$(MSBuildProjectDirectory)\..\packages\Heavysoft.VersionGenerator.1.1.0.0\tools\HeavysoftVersion.ps1</HeavysoftVersionPs1>
    </PropertyGroup>
  ---
    <Target Name="BeforeBuild">
      <Exec Command="$(PowerShellExe) -NonInteractive -NoProfile -ExecutionPolicy Bypass -Command &quot;&amp;{ $(HeavysoftVersionPs1); exit $LastExitCode }&quot;" />
    </Target>

.gitignore
----------

    HeavysoftVersion.cs
