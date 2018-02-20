$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName= 'jetbrainstoolbox' # arbitrary name for the package, used in messages
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.6.2914.exe' # download url

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64bit      = $url64

  silentArgs   = '/S'           # NSIS
  validExitCodes= @(0, 3010, 1641)

  softwareName  = 'JetBrains Toolbox*'
  checksum      = '839418d0d61aa92aabe58e6e6a7faed3a2486e5b591cee77aafba78b2eceec8f'
  checksumType  = 'sha256' #default is md5, can also be sha1, sha256 or sha512

}

Install-ChocolateyPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package
