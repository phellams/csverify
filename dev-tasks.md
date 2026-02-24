# Dev Tasks

## Path concatanation for all pathing variables for consistancy

> use [system.io.path](https://learn.microsoft.com/en-us/dotnet/api/system.io.path?view=net-7.0) for pathing

> Question: does join-path use system.io.path? 
> Answer: yes, it does so no point in creating a new function as it is just a wrapper for the system.io.path

```powershell
$rootpath = Join-Path -Path $PSScriptRoot -ChildPath 'libs'
$outPath = Join-Path -Path $PSScriptRoot -ChildPath 'out'
$outPath = Join-Path -Path $outPath -ChildPath 'out'
```

or 

```powershell
$rootpath = [system.io.path]::combine($PSScriptRoot, 'libs')
$outPath = [system.io.path]::combine($PSScriptRoot, 'out')
$outPath = [system.io.path]::combine($outPath, 'out')
```