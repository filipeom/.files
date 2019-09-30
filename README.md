# dotfiles

My dotfile configuration. work in progress

## Getting Started
### Prerequisites - TODO

### Installing onto a new system

* Make sure the source repository ignores the folder where you'll clone it

```
echo ".dotfiles" >> .gitignore
```

* Now clone your dotfiles into a bare repository in a `.` directory of your `$HOME`

```
git clone --bare https://github.com/filipeom/.dotfiles.git $HOME/.dotfiles
```

* Define the `alias` in the current shell scope:

```
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

* Checkout the actual content from the bare repository to your `$HOME`

```
dotfiles checkout
```
* Set the flag `status.showUntrackedFiles no` on this specific (local) repository

```
dotfiles config --local status.showUntrackedFiles no
```

## Built With

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Authors

* **Filipe Marques** - *Maintainer* - [filipeom](https://github.com/filipeome)

See also the list of [contributors](https://github.com/filipeom/dotfiles/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* [How to store dotfiles](https://www.atlassian.com/git/tutorials/dotfiles)
