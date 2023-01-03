$uppercase = "ABCDEFGHKLMNOPRSTUVWXYZ".tochararray() 
$lowercase = "abcdefghiklmnoprstuvwxyz".tochararray() 
$number = "0123456789".tochararray() 
$special = "$%&/()=?}{@#*+!".tochararray()
$password =($uppercase | Get-Random -count 5) -join ''
$password +=($lowercase | Get-Random -count 5) -join ''
$password +=($number | Get-Random -count 5) -join ''
$password +=($special | Get-Random -count 5) -join ''
$passwordarray=$password.tochararray() 
$scrambledpassword=($passwordarray | Get-Random -Count 20) -join ''
$scrambledpassword
