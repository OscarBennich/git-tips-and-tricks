# Git Tips & Tricks

## How to split code from a repository into a new one and only keep relevant history

Expanded from [these instructions](https://docs.github.com/en/get-started/using-git/splitting-a-subfolder-out-into-a-new-repository).

The [Git-filter-repo tool](https://github.com/newren/git-filter-repo).

1. Follow [these instructions](https://github.com/newren/git-filter-repo/blob/main/INSTALL.md) and download the `git-filter-repo` script and put it somewhere on your machine - also make sure you have Python installed.
2. Make a fresh clone of the repo from this branch (a fresh clone is required for the `git-filter-repo` tool):

   ```
   git clone --single-branch --branch {{BRANCHNAME}} {{ORIGINAL-REPO-ADDRESS}}
   ```

3. Figure out what folders & files that need to be moved to the new repo
   > Any folders will be automatically added if you move a file in that folder
4. Open the [script](GitMove-MultiPath.ps1) in the root of this repo and add the path(s) from the root of the cloned repo
5. CD into the cloned repo and run the script from inside it:

   ```
   .\{{RELATIVE-PATH-TO-UTILITY-SCRIPT}} {{PATH-TO-GIT-FILTER-REPO-SCRIPT}}
   ```

   For example:

   ```
   .\..\GitMove-ViedocDesigner.ps1 C:\Users\my-user\source\repos\test\git-filter-repo
   ```

6. Create a new repository
7. Push these changes to the new remote:

   ```
   git push {{NEW-REPO-ADDRESS}} {{BRANCH-NAME}}
   ```

8. Create a `main` branch from this branch in the new repo, delete the old branch in the new remote
9. Set up build validation, policies, etc.

> This new repository will contain only the relevant commit history for the files you chose to include
>
> Keep in mind that the commit hashes **will be changed**

Optional:

- Delete the files in the old repo and push these changes to the trunk if you do not want to keep the files in both repos
