<div align="center">
    <img src="https://raw.githubusercontent.com/phellams/phellams-general-resources/main/logos/csverify/dist/png/csverify-128x128.png" alt="PWSL Logo">
    <h1><strong>CSVerify</strong></h1>
    <p><b>Powershell Checksum Verification Module</b></p>
    <hr>
    <h2>About This Project</h2>
    <p>Powershell Module Designed to assist in ensuring the integrity of a codebase by generating and verifying a <b>VERIFICATION.txt</b> file, created for poweshell packages distributed via chocolatey, can be used to verify the integrity of any codebase.</p>
    <small>Available on <strong>MacOS</strong>, <strong>Linux</strong>, and <strong>Windows</strong></small>
    <br>
    <span>
        <a href="https://gitlab.com/phellams/csverify#CMDLET-Reference">CMDLET-Reference</a> |
        <a href="https://github.com/phellams/csverify">GitHub</a> |
        <a href="https://www.powershellgallery.com/packages/csverify">PSGallery</a> |
        <a href="https://chocolatey.org/packages/csverify">Chocolatey</a>
    </span>
    <hr>

![license][license-badge]

</div>

<details>
<summary><strong>📚Table of Contents</strong></summary>

- [About This Project](#about-this-project)
- [**Features**](#features)
- [**Workflow**](#workflow)
  - [Verification File](#verification-file)
  - [Verification](#verification)
- [**Installation**](#installation)
  - [Additinonal Installation Options:](#additinonal-installation-options)
    - [📦 GitLab Packages](#-gitlab-packages)
    - [🧺 Generic Asset](#-generic-asset)
    - [💾 Git Clone](#-git-clone)
- [**Build**](#build)
  - [`localbuilder` Script Parameters](#localbuilder-script-parameters)
  - [Depenedencies Modules(linux/Winx64)](#depenedencies-moduleslinuxwinx64)
  - [Dependecies Binaries(linux/Winx64)](#dependecies-binarieslinuxwinx64)
- [**Building Using Automator**](#building-using-automator)
- [**Building Using PowerShell 7.x**](#building-using-powershell-7x)
- [**CMDLET Reference**](#cmdlet-reference)
    - [***`New-CheckSum`***](#new-checksum)
    - [***`Read-CheckSum`***](#read-checksum)
    - [***`New-VerificationFile`***](#new-verificationfile)
    - [***`Test-Verification`***](#test-verification)
</details>

## **Features**

 - Generates and returns `sha256` hash for each file within the specified folder contained within a VERIFICATION.txt file.
 - Reads the verification file and returns a `PSCustomObject` *array* containg the file, path, size and 256 hash.
 - Unitilizes `New-Checksum` & `Read-CheckSum` to generate and read the verification file.
 - Read and save checksums to `VERIFICATION.txt` file with `New-VerificationFile`.

## **Workflow**

### Verification File

**`New-VerificationFile`** generates the verification file. recersivlly compiles a list of all files present. For each file, it computes the SHA256 hash and records the **file**, **path**, **size** and its **hash** in the verification file(**VERIFICATION.txt**).

>Default output .\tools\VERIFICATION.txt

```powershell
cd /path/to/folder
New-VerificationFile 
```

⚪ **VERIFICATION.txt** output example:

<pre>
VERIFICATION
Verification is intended to assist the moderators and community
in verifying that this package's contents are trustworthy.

To Verify the files in this package, please download/Install module csverify from chocalatey.org or from the powershell gallery.
Get-CheckSum -Path $Path
e
-[checksum hash]-
___________________
1.23KB | 37511B972FBE38C353B680D55EC5CFE51C04C79CA3304922301C5AB44BAC94F9 | .\README.md
1.05KB | D3FF5A1DB41D78399BD676A16C9321F127BB52B7E7EBF56B14EC5ABC21971213 | .\LICENSE
0.34KB | 813818335A37527755ABDCF200322962E340E2278BBF3E515B21D4D232D9A92A | .\csverify.psm1
4.44KB | 394B7998E79D6DDE3B6FF1318550ED21BC9671F2C8F1AA2354861A120738B422 | .\csverify.psd1
</pre>

### Verification

**`Test-Verification`** is used to verify the integrity of the codebase base it compares the `SHA256` values from **VERIFICATION.txt** file and Returns file report

⚪ Verification output
<pre>
Running Verification: Hashed Checksums
  └─ Verified o--(5 / 5 Files » Found 1 that could not be verified)
Status   hash                                                             Path                                Size
------   ----                                                             ----                                ----
Verified 0DC558C6B5C5B34D9B77D177AEE6130AEAF75C10A0948C635AEC98F5C445790E .\README.md                         0.95KB
Verified D3FF5A1DB41D78399BD676A16C9321F127BB52B7E7EBF56B14EC5ABC21971213 .\LICENSE                           1.05KB
Verified F5CEFD9EE2498D5A6BB80F3F26A6B07FD405F3AB3AB63917426CB31EBF5719B9 .\csverify.psm1                     0.35KB
Verified EB749553314E1280C22EB6CD2E7CF3687EBF0A8D6C259A59C33AA4DFB215D85D .\csverify.psd1                     4.44KB                1.14KB
</pre>


## **Installation**

Phellams modules are available from [**PowerShell Gallery**](https://www.powershellgallery.com/packages/commitfusion) and [**Chocolatey**](https://chocolatey.org/packages/commitfusion). you can access the raw assets via [**Gitlab Generic Assets**](https://gitlab.com/phellams/commitfusion/-/packages?orderBy=name&sort=desc&search[]=commitfusion) or nuget repository via [**Gitlab Packages**](https://gitlab.com/phellams/commitfusion/-/packages/?orderBy=name&sort=desc&search[]=commitfusion&type=NuGet).

|▓▓▓▓▒▒▒▒░░░|▓▓▓▓▒▒▒▒░░░|▓▓▓▓▒▒▒▒░░░|
|-|-|-|
|📦 PSGallery | <a href="https://www.powershellgallery.com/packages/csverify"> <img src="https://img.shields.io/powershellgallery/v/csverify?label=version&style=flat-square&logoColor=blue&labelColor=23CD5C5C&color=%231E3D59" alt="powershellgallery"></a> | <img src="https://img.shields.io/powershellgallery/dt/csverify?style=flat-square&logoColor=blue&label=downloads&labelColor=23CD5C5C&color=%231E3D59" alt="powershellgallery-downloads"> |
|📦 Chocolatey | <a href="https://community.chocolatey.org/packages/csverify/"><img src="https://img.shields.io/chocolatey/v/csverify?label=version&include_prereleases&style=flat-square&logoColor=blue&labelColor=23CD5C5C&color=%231E3D59" alt="chocolatey"/></a> | <img src="https://img.shields.io/chocolatey/dt/csverify?style=flat-square&logoColor=blue&label=downloads&include_prereleases&labelColor=23CD5C5C&color=%231E3D59" alt="chocolatey-downloads"> |

### Additinonal Installation Options:
 
|▓▓▓▓▒▒▒▒░░░|▓▓▓▓▒▒▒▒░░░|▓▓▓▓▒▒▒▒░░░|
|-|-|-|
|💼 Releases/Tags | <a href="https://gitlab.com/phellams/csverify/-/releases"> <img src="https://img.shields.io/gitlab/v/release/phellams%2Fcsverify?include_prereleases&style=flat-square&logoColor=%2300B2A9&labelColor=%23CD5C5C&color=%231E3D59" alt="gitlab-release"></a> | <a href="https://gitlab.com/phellams/csverify/-/tags"> <img src="https://img.shields.io/gitlab/v/tag/phellams%2Fcsverify?include_prereleases&style=flat-square&logoColor=%&labelColor=%23CD5C5C&color=%231E3D59" alt="gitlab tags"></a> |

#### 📦 GitLab Packages

Using `nuget`: See the [**packages**](https://gitlab.com/phellams/csverify/-/packages?orderBy=name&sort=asc&search[]=csverify&type=NuGet) page for installation instructions.

> For instructions on adding `nuget` **sources** packages from *GitLab* see [**Releases**](https://github.com/sgkens/csverify/releases) artifacts or via the [**Packages**](https://gitlab.com/phellams/csverify/-/packages?orderBy=name&sort=asc&search[]=csverify&type=NuGet) page.

#### 🧺 Generic Asset

The latest release artifacts can be downloaded from the [**Generic Assets Artifacts**](https://gitlab.com/phellams/csverify/-/packages?orderBy=type&sort=desc&type=Generic) page.

#### 💾 Git Clone

```bash
# Clone the repository
git clone https://gitlab.com/phellams/csverify.git
cd csverify
import-module .\
```

## **Build**

**Phellams** modules are built using either the [**phellams-automator**](https://gitlab.com/phellams/phellams-automator) Docker image paired with the [**Automator-Devops**](https://gitlab.com/phellams/automator-devops) scripts to build and publish modules to:

* [**PowerShell Gallery (PSGallery)**](https://www.powershellgallery.com/packages/csverify)
* [**Chocolatey**](https://chocolatey.org/packages/csverify)
* [**GitHub Packages**](https://github.com/phellams/nuget/tree/main/packages/csverify)

If you prefer not to use the Docker image, you can run the [**automator-devops**](https://gitlab.com/phellams/automator-devops) scripts locally using **PowerShell 7.x**.

Dependencies must be installed manually, either from the [PowerShell Gallery](https://www.powershellgallery.com) or by cloning the module directly from the GitHub/GitLab source repository (see below).

---

### `localbuilder` Script Parameters

All build metadata is stored in the `./build_config.json` file. See [**Build Config**](./templates/build_config.template.json) for additional information.

```text
local-builder [-Automator (switch)]
              [-build_dotnet_lib (switch)]
              [-PhWriter (switch)]
              [-Pester (switch)]
              [-Build (switch)] 
              [-PsGal (switch)]
              [-Nuget (switch)] 
              [-ChocoNuSpec (switch)] 
              [-ChocoPackage (switch)] 
              [-ChocoPackageWindows (switch)]
              [-Cleanup (switch)]
```

| Parameter                                   | Description                                                                                                                                                                          |
| ------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **`-Automator`**                            | Builds using the `phellams-automator` Docker image. If not specified, the script will use the local PowerShell installation. All dependencies must be installed locally (see below). |
| **`-build_dotnet_lib`**                     | Calls `build-dotnet-library.ps1`, which runs `dotnet build` and `dotnet pack` to build and package .NET libraries (`.nupkg`). *(WIP – functional but requires refinement.)*          |
| **`-PhWriter`**                             | Generates the `phwriter-metadata.ps1` file using the `phwriter` module.                                                                                                              |
| **`-Pester`**                               | Calls `test-pester-before-build.ps1`, which runs `Invoke-Pester` from the `Pester` module.                                                                                           |
| **`-Sa`**                                   | Calls `test-sa-before-build.ps1`, which runs `Invoke-ScriptAnalyzer` from the `PSScriptAnalyzer` module.                                                                             |
| **`-Build`**                                | Calls `build-module.ps1` from the `psmpacker` module. Copies the built module to the `dist` folder and generates the `VERIFICATION.txt` file.                                        |
| **`-Nuget`**                                | Calls `build-package-generic-nuget.ps1`, which runs `New-NuspecPackageFile` and `New-NupkgPackage` from the `nupsforge` module.                                                      |
| **`-PsGal`**                                | Calls `build-package-psgallery.ps1`, which runs `New-NuspecPackageFile` from the `nupsforge` module for PowerShell Gallery publishing.                                               |
| **`-ChocoNuSpec`**                          | Calls `build-nuspec-choco.ps1`, which runs `New-ChocoNuspecFile` from the `nupsforge` module.                                                                                        |
| **`-ChocoPackage`** *(Docker only)*         | Calls `build-package-choco.sh` (Linux only). Runs `choco pack` and `choco push` using the `choco/choco:latest` Docker image.                                                         |
| **`-ChocoPackageWindows`** *(Windows only)* | Calls `build-package-choco-windows.ps1`, which runs `New-ChocoNuspecFile` and `New-ChocoPackage` from the `nupsforge` module. **Requires Chocolatey to be installed.**               |

---

### Depenedencies Modules(linux/Winx64)

  - [colorconsole](https://gitlab.com/phellams/colorconsole)
  - [tadpol](https://gitlab.com/phellams/tadpol)
  - [GetAutoVersion](https://gitlab.com/phellams/phellams-utils/semver/Get-GitAutoVersion)
  - [quicklog](https://gitlab.com/phellams/quicklog)
  - [shelldock](https://gitlab.com/phellams/shelldock)
  - [psmpacker](https://gitlab.com/phellams/psmpacker)
  - [nupsforge](https://gitlab.com/phellams/nupsforge)
  - [csverify](https://gitlab.com/phellams/csverify)

### Dependecies Binaries(linux/Winx64)
  - [git](https://git-scm.com/)
  - [choco](https://chocolatey.org/)
  - [nuget](https://www.nuget.org/downloads) v6.x

---

## **Building Using Automator**

Build the module locally using the **phellams-automator** Docker image.

> **Note:** Chocolatey build and publish requires the choco Docker image to be built and published.

```powershell
pwsh -c ./automator-devops/localbuilder.ps1 -Automator -Build -Nuget -ChocoNuSpec -ChocoPackage -PsGal -Cleanup
```

---

## **Building Using PowerShell 7.x**

> **Note (Windows):** Chocolatey can be installed easily via [https://chocolatey.org/install](https://chocolatey.org/install).
> **Note (Non-Windows):** Chocolatey build and publish requires the choco Docker image if not running on Windows.

```powershell
pwsh -c ./automator-devops/localbuilder.ps1 -Build -Nuget -ChocoNuSpec -ChocoPackage -PsGal -Cleanup
```

## **CMDLET Reference**

List of available cmdlets provided by the module.

#### ***New-CheckSum***

New-CheckSum generates and returns sha256 hash for each within the specified folder. New-Verification unitilizes `New-Checksum` & `Read-CheckSum`.

*Syntax*:

<pre>
New-CheckSum -Path (String) [-FromString (string)] [(CommonParameters)]
</pre>

*Parameters*:

| Name | Type | Description | Required |
| --- | --- | --- | --- |
| **Path** | *String* | The path to generate the checksum file for | Yes |
| **FromString** | *String* | The string to generate the checksum file for | No |

```powershell
New-CheckSum -Path ./
```

*Example*:

#### ***Read-CheckSum***
Read-CheckSum reads the verification file and returns a `PSCustomObject` *array* containg the file, path, size and hash.

*Syntax*:

<pre>
Read-CheckSum -Path (String) [(CommonParameters)]
</pre>

*Parameters*:

| Name | Type | Description | Required |
| --- | --- | --- | --- |
| **Path** | *String* | The path to generate the checksum file for | Yes |

*Example*:

```powershell
Read-CheckSum -RootPath ./
```

#### ***New-VerificationFile***

New-VerificationFile generates the verification file. recersivlly compiles a list of all files present. For each file, i  t computes the SHA256 hash and records the **file**, **path**, **size** and its **hash** in the verification file(**VERIFICATION.txt**).

*Syntax*:

<pre>
New-VerificationFile -RootPath (String) -OutPutPath (String) [(CommonParameters)]
</pre>

*Parameters*:

| Name | Type | Description | Required |
| --- | --- | --- | --- |
| **RootPath** | *String* | The path to the folder to generat | Yes |
| **OutputPath** | *String* | The output path to generate the verification file to | Yes |

*Example*:

```powershell
New-VerificationFile ./ ./dist/choco
```

#### ***Test-Verification***

Test-Verification is used to verify the integrity of the codebase base it compares the `SHA256` values from **VERIFICATION.txt** file and Returns file report.

*Syntax*:

<pre>
Test-Verification -Path (String) [(CommonParameters)]
</pre>

*Parameters*:

| Name | Type | Description | Required |
| --- | --- | --- | --- |
| **Path** | *String* | The path to the verification file | Yes |

*Example*:

```powershell 
Test-Verification
```


## **Contributing**

Feel free to contribute! Fork the repo and submit a **merge request** with your improvements. Or, open an **issue** with the `enhancement` tag to discuss ideas.

1. Fork the Project and clone it: `git clone https://gitlab.com/YOUR_USERNAME/pwsl.git`
2. Switch to dev and create your branch: `git checkout develop; git checkout -b feature/AmazingFeature`
3. Commit your changes: `git commit -m 'Add some AmazingFeature'`
4. Push to the branch: `git push origin feature/AmazingFeature`
5. Open a Merge Request:
   
   [<img src="https://img.shields.io/badge/Open_Merge_Request-gitlab-orange?style=for-the-badge&logo=gitlab">](https://gitlab.com/phellams/csverify/-/merge_requests/new)

---


## **License**

This project is licensed under the MIT Licence, see the [LICENSE](LICENSE) file for details

<!--LINKS AND BADGES-->
[psgallary-badge]: https://img.shields.io/powershellgallery/v/csverify?include_prereleases&style=for-the-badge&logo=powershell
[psgallary-link]: https://www.powershellgallery.com/packages/csverify
[choco-badge]: https://img.shields.io/chocolatey/v/csverify?style=for-the-badge&logo=chocolatey
[choco-link]: https://chocolatey.org/packages/csverify
[build-status]: https://img.shields.io/gitlab/pipeline-status/csverify?style=for-the-badge&logo=Gitlab&logoColor=%233478BD&labelColor=%232D2D34
[build-url]: https://gitlab.com/phellams/csverify/-/pipelines
[gitlab-badge]: https://img.shields.io/badge/gitlab-4B0082?style=for-the-badge&logo=gitlab&logoColor=orange
[github-badge]: https://img.shields.io/badge/github-383838?style=for-the-badge&logo=github&logoColor=white
[license-badge]: https://img.shields.io/badge/License-MIT-Blue?style=for-the-badge&labelColor=%232D2D34&color=%**2317202a**