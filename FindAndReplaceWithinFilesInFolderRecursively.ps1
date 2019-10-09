$search = 'sp_add_jobstep'
$replace_with = 'usp_add_jobstep_wrapper'
$base_dir = 'D:\P_Drive\SQL2016Migration\Test\SQLAgentJobs\Scripts'
$text_file_ext = 'sql'
 
Get-ChildItem $base_dir -Recurse -Include "*.$text_file_ext" |
    ForEach-Object { (Get-Content $_.FullName) | 
    ForEach-Object {$_ -replace $search, $replace_with} | 
    Set-Content $_.FullName }