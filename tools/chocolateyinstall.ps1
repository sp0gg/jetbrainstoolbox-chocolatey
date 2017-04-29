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
  checksum      = 'd9734c1f43f89813cedbb8238df4f2103d697a7f392c7f9e422a6a37933bc572'
  checksumType  = 'sha256' #default is md5, can also be sha1, sha256 or sha512

}

Install-ChocolateyPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package
