$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName= 'jetbrainstoolbox' # arbitrary name for the package, used in messages
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.2.2314.exe' # download url

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64bit      = $url64

  silentArgs   = '/S'           # NSIS
  validExitCodes= @(0, 3010, 1641)

  softwareName  = 'JetBrains Toolbox*'
  checksum      = '0b2272dce68995ca9aec290ce82b119fd26f33aec51e72310f76d64399182945'
  checksumType  = 'sha256' #default is md5, can also be sha1, sha256 or sha512

}

Install-ChocolateyPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package
