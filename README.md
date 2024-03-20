# Git Tips & Tricks

## How to split code from a repository into a new one and only keep relevant history
Expanded from [these instructions](https://docs.github.com/en/get-started/using-git/splitting-a-subfolder-out-into-a-new-repository).

1. Follow [these instructions](https://github.com/newren/git-filter-repo/blob/main/INSTALL.md) and download the `git-filter-repo` script and put it somewhere on your machine - also make sure you have Python installed.
2. Make a fresh clone of the repo from this branch (a fresh clone is required for the `git-filter-repo` tool):

   ```
   git clone --single-branch --branch {{BRANCHNAME}} {{ORIGINAL-REPO-ADDRESS}}
   ```
3. 
3. Run the `--subdirectory-filter` command using the `git-filter-repo` tool in the freshly cloned repo:

   **MAKE SURE TO USE "/" and not "\\" to delimit folders on Windows**

   ```
   python {{PATH-TO-GIT-FILTER-REPO-SCRIPT}} --subdirectory-filter {{PATH-TO-FOLDER}}
   ```

7. Create a new repository
8. Push these changes to the new remote:

   ```
   git push {{NEW-REPO-ADDRESS}} {{BRANCH-NAME}}
   ```

9. Create a `main` branch from this branch in the new repo, delete the old branch in the new remote
10. Set up build validation, policies, etc.

> This new repository will contain only the relevant commit history for the files you chose to include
>
> Keep in mind that the commit hashes **will be changed**

Optional:

- Delete the files in the old repo and push these changes to the trunk if you do not want to keep the files in both repos
