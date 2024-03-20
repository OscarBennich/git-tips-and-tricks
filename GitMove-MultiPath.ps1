param(
    [string]$GitFilterRepoScriptPath
)

python $GitFilterRepoScriptPath `
    --path FolderX `
    --path FolderY `
    --path FileX `
    --path FileY