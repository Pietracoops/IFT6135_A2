$mydir = $PSScriptRoot + '\GPU-Usage-PS.txt'
$ErrorActionPreference="SilentlyContinue"
Stop-Transcript | out-null
$ErrorActionPreference = "Continue"
Start-Transcript -path $mydir -append
# Do some stuff



# Example to get GPU usage counters for a specific process:
$p = Get-Process pycharm64
((Get-Counter "\GPU Process Memory(pid_$(9748)*)\Local Usage").CounterSamples | where CookedValue).CookedValue | 
    foreach {Write-Output "Process $($P.Name) GPU Process Memory $([math]::Round($_/1MB,2)) MB"}
((Get-Counter "\GPU Engine(pid_$($p.id)*engtype_3D)\Utilization Percentage").CounterSamples | where CookedValue).CookedValue |
    foreach {Write-Output "Process $($P.Name) GPU Engine Usage $([math]::Round($_,2))%"}


# Example to get total GPU usage counters:
$GpuMemTotal = (((Get-Counter "\GPU Process Memory(*)\Local Usage").CounterSamples | where CookedValue).CookedValue | measure -sum).sum
    Write-Output "Total GPU Process Memory Local Usage: $([math]::Round($GpuMemTotal/1MB,2)) MB"
$GpuUseTotalEngine3D = (((Get-Counter "\GPU Engine(*engtype_3D)\Utilization Percentage").CounterSamples | where CookedValue).CookedValue | measure -sum).sum
$GpuUseTotalVideo = (((Get-Counter "\GPU Engine(*engtype_VideoDecode)\Utilization Percentage").CounterSamples | where CookedValue).CookedValue | measure -sum).sum
$GpuUseTotalCopy = (((Get-Counter "\GPU Engine(*engtype_Copy)\Utilization Percentage").CounterSamples | where CookedValue).CookedValue | measure -sum).sum
$GpuUseTotalVideoProcessing = (((Get-Counter "\GPU Engine(*engtype_VideoProcessing)\Utilization Percentage").CounterSamples | where CookedValue).CookedValue | measure -sum).sum

    Write-Output "Total GPU Engine3D Usage: $([math]::Round($GpuUseTotalEngine3D,2))%"
	Write-Output "Total GPU Video Decode Usage: $([math]::Round($GpuUseTotalVideo,2))%"
	Write-Output "Total GPU Copy Usage: $([math]::Round($GpuUseTotalCopy,2))%"
	Write-Output "Total GPU Video Processing Usage: $([math]::Round($GpuUseTotalVideoProcessing,2))%"
	

	Write-Output "====================== NVIDIA-SMI COMMAND 1 ========================================="
nvidia-smi -q -d MEMORY
	Write-Output "====================== NVIDIA-SMI COMMAND 2 ========================================="
nvidia-smi

Stop-Transcript

pause