# Gerardnico Tap

## About

This is a Homebrew tap - ie a collection of Homebrew Formulae

## Formulae List

### X Extensions Collection

The `X Extensions Collection` is a collection of extensions for clients.

* [direnvx](https://github.com/gerardnico/direnv-x) - Direnv extension with vault secret and multi-env file supports
* [dockx](https://github.com/gerardnico/dock-x) - Docker commands driven by environment variables
* [gitx](https://github.com/gerardnico/git-x) - Git commands based on multiple repos
* [kubex](https://github.com/gerardnico/kube-x) - Kube commands based on app
* [sshx](https://github.com/gerardnico/ssh-x) - SSH commands to get only one agent instance and load private keys.
* [ans-x (ansible)](https://github.com/gerardnico/ansible-x) - One command line Ansible with Extra

### Library

* [bashlib](https://github.com/gerardnico/bash-lib) - A collection of Bash Libraries used by Bash Client

## How do I install these formulae?

`brew install gerardnico/tap/<formula>`

Or `brew tap gerardnico/tap` and then `brew install <formula>`.

Or, in a [`brew bundle`](https://github.com/Homebrew/homebrew-bundle) `Brewfile`:

```ruby
tap "gerardnico/tap"
brew "<formula>"
```

## Dev Support

### How to test docker dependent command such as ans-x

Because docker does not exist in the brew image, we can't use `--group-add docker`
we need to sudo as root.

Example with [ans-x](Formula/ansx.rb)
```bash
docker run --rm --tty --interactive -v /var/run/docker.sock:/var/run/docker.sock $DOCK_X_NAMESPACE/$DOCK_X_NAME:$DOCK_X_TAG bash
# install
brew install --HEAD gerardnico/tap/ansx
# then
sudo su -
export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
ansible --version
```


