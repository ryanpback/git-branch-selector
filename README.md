# Git Branch Selector

Git Branch Selector is a tool the provides easy navigation of your most recently checked-out branches.

* View list of most recent branches in order of checkout
* Quickly choose a branch and copy to your clipboard
* Quickly choose a branch and switch to it

## Usage
### Install Git Branch Selector
```sh
gem install git-branch-selector
```
### Run the Git Branch Selector Tool
```sh
git-branch-selector [-n COUNT] [-c] [-l]
```
### Nice to have
Add a function to you shell configuration of choice with a shortcut to the `git-branch-selector` command in the terminal.
Example:
```
<!-- .zshrc -->
<function-name>() {
  git-branch-selector "$@"
}
```

### Available Command Line Options
1. No flag is the default select functionality. The branch selected from the select menu will be checked out.
2. `-l` or `--list`: Displays a numbered list of your most recently checked-out branch in descending order (1 being the most recent). Cannot be used with `-c` flag.
3. `-c` or `--copy`: Displays a select menu. On select of the menu item, the selected branch will be added to your clipboard. Cannot be used with `-l` flag.
4. `-n COUNT` or `--num=COUNT`: The number of branches to display in either list, copy, or select mode. Default is 15 branches

### Select Menu Usage
When using the select or copy functionality, a select menu is presented.
1. To navigate the list, use the ↑/↓ keys.
2. To select an option, use the `Enter` key on the highlighted branch.
3. Begin typing to filter the list.
