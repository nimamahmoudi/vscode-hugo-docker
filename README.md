# vscode-hugo-docker

vscode-hugo-docker is a Hugo development environment inside a Docker container. It consists of a Visual Studio Code and various extensions to help you write and build Hugo websites.

## Build

You can also build it yourself:

```plain
./scripts/build-vscode-hugo-docker.sh
```

## Run

After build (described above), run the following script to initialize and to start the container:

```plain
./scripts/run-vscode-hugo-docker.sh [PROJECT_PATH]
```

Note that you need to have the script somewhere in your `$PATH`. If you don't have it, install it using following commands:

```plain
sudo cp ./scripts/run-vscode-hugo-docker.sh /usr/local/bin
```

Finally, run it using following:

```plain
run-vscode-hugo-docker.sh [PROJECT_PATH]
```

The script `run-vscode-hugo-docker.sh` accepts an optional argument called `PROJECT_PATH`. `PROJECT_PATH` is a folder in which the source code of your Hugo website will be stored. `PROJECT_PATH` will also contain Visual Studio Code configuration data.

If this is your first time that you start `run-vscode-hugo-docker.sh` script, it will take a little while to initialize the `PROJECT_PATH`, so be patient.

By default if not specifed, `PROJECT_PATH` will be set to `$HOME/vscode-hugo-docker`.

After the script `run-vscode-hugo-docker.sh` is finally started, it will give you a shell from which you can run Visual Studio Code by running:

```plain
code
```
