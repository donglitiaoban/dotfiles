# todo: download and install vs buildtools
# which is equivalent to xcode-select --install

$url = "https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=Community&channel=Release&version=VS2022&source=VSLandingPage&passive=false&cid=2030"
if ($MyInvocation.CommandOrigin -eq 'Runspace') {
  $response = Invoke-WebRequest -Uri $url
  Write-Host $response
}
