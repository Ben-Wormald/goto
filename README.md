# goto

Command line tool to jump to a project in your workspace using its initials.

```bash
goto vsnb
~/code/vivo-stream-notification-bridge $
```

## Install

Clone this repo, then add your configuration and an alias to your `.bashrc` or `.zshrc`.

```bash
export GOTO_WORKSPACE="$HOME/code"
export GOTO_IGNORE='professor-cam training'
alias goto="source $HOME/scripts/goto/goto.sh"
alias gocode="$HOME/scripts/goto/goto.sh -c"
```

## Use

`goto` can be used to jump to a project in your workspace by its initials (where the folder name is hyphenated).
For example, `goto igm` is equivalent to `cd $GOTO_WORKSPACE/int-gel-matter`.

Providing the full name of a project also works, for example `goto int-gel-matter`.

Using `goto` with no arguments will take you to the root of your workspace.

Use the `-c` flag to launch the project in VS Code, e.g. `goto -c igm`. 

## Configure

`goto` uses a couple of environment variables to find your project folders.

`GOTO_WORKSPACE` should be the folder containing your projects.
If not specified, this defaults to your home directory.

`GOTO_IGNORE` should be a space-separated list of folder in your workspace to ignore, in case of clashes.
For example, I'm using `'professor-cam training'` so that `goto pc` will match the `passport-control` project instead of `professor-cam`.
Note that you can still use the full name to bypass ignored projects, e.g. `goto professor-cam`.

## Extend

If you want to include folders not in the root of your workspace you can add these to the case statement in the second half of the script.
I've got one set up already to jump to the `passport-control-activity` package within `passport-control`.
