$fso = new-object -com Scripting.FileSystemObject
gci -Path u:\Target -Recurse -Depth 2 `
  | select @{l='Size'; e={$fso.GetFolder($_.FullName).Size}},FullName `
  | sort Size -Descending `
  | ft @{l='Size [MB]'; e={'{0:N2}    ' -f ($_.Size / 1MB)}},FullName