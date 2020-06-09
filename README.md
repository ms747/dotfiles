#### How to install
```console
$ cd ~/.config
$ find ~/$SCRIPT_FOLDER/ -maxdepth 1 -type d -not -path ~/$SCRIPT_FOLDER/ -exec ln -s "{}" . \;
```
