
# Create-AzureVM.ps1
# This script automates the creation of Azure Virtual Machines.

param (
    [string]$ResourceGroupName = "MyResourceGroup",
    [string]$VMName = "MyVM",
    [string]$Location = "EastUS",
    [string]$VMSize = "Standard_B1s"
)

# Login to Azure
Connect-AzAccount

# Create Resource Group
New-AzResourceGroup -Name $ResourceGroupName -Location $Location

# Create Virtual Machine
New-AzVM `
    -ResourceGroupName $ResourceGroupName `
    -Name $VMName `
    -Location $Location `
    -VirtualNetworkName "$VMName-VNet" `
    -SubnetName "$VMName-Subnet" `
    -SecurityGroupName "$VMName-NSG" `
    -PublicIpAddressName "$VMName-PIP" `
    -OpenPorts 80,3389 `
    -Size $VMSize

Write-Output "VM $VMName created successfully in $Location."
