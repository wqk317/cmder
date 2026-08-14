if (Test-Path $env:temp\cmder_diag_ps.log) {
  Remove-Item $env:temp\cmder_diag_ps.log
}

$cmder_diag = {
""
"------------------------------------"
"get-childitem env:"
"------------------------------------"
Get-ChildItem env: | Format-Table -AutoSize -Wrap 2>&1

""
"------------------------------------"
"get-command git -all -ErrorAction SilentlyContinue"
"------------------------------------"
Get-Command git -All -ErrorAction SilentlyContinue

""
"------------------------------------"
"get-command clink -all -ErrorAction SilentlyContinue"
"------------------------------------"
Get-Command clink -All -ErrorAction SilentlyContinue

""
"------------------------------------"
"systeminfo"
"------------------------------------"
systeminfo 2>&1

"------------------------------------"
"get-childitem '$env:CMDER_ROOT'"
"------------------------------------"
Get-ChildItem "$env:CMDER_ROOT" | Format-Table LastWriteTime, mode, length, FullName

""
"------------------------------------"
"get-childitem '$env:CMDER_ROOT/vendor'"
"------------------------------------"
Get-ChildItem "$env:CMDER_ROOT/vendor" | Format-Table LastWriteTime, mode, length, FullName

""
"------------------------------------"
"get-childitem -s '$env:CMDER_ROOT/bin'"
"------------------------------------"
Get-ChildItem -Recurse "$env:CMDER_ROOT/bin" | Format-Table LastWriteTime, mode, length, FullName

""
"------------------------------------"
"get-childitem -s '$env:CMDER_ROOT/config'"
"------------------------------------"
Get-ChildItem -Recurse "$env:CMDER_ROOT/config" | Format-Table LastWriteTime, mode, length, FullName

""
"------------------------------------"
"Make sure you sanitize this output of private data prior to posting it online for review by the CMDER Team!"
"------------------------------------"
}

& $cmder_diag | Out-File -FilePath $env:temp\cmder_diag_ps.log

Get-Content "$env:temp\cmder_diag_ps.log"

Write-Output ""
Write-Output "Above output was saved in $env:temp\cmder_diag_ps.log"
