## **CÃO CHUPANDO MANGA**

![](https://github.com/SamVeras/Dotfiles/blob/main/c%C3%A3o%20chupando%20manga.gif)


## **ZSH PLUGIN SETUP**

```Sh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" && \
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab && \
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && \
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```


## **PACOTES**

`zsh kitty ranger micro (micro-editor) lsd stow git opi (on openSUSE) tldr (tlrc, tealdeer) fzf code (vscode) discord steam steam-devices`


## **HOME SETUP**

```
home
└── sam
    ├── .config
    ├── .dots
    ├── apps
    │   └── <app folders>
    ├── bin
    │   ├── <binary executables>
    │   └── <app symlinks>
    ├── desk
    ├── dev
    ├── docs
    │   └── <personal documents>
    ├── lib
    ├── media
    │   ├── music
    │   ├── pics
    │   ├── screenshots
    │   ├── videos
    │   └── wallpapers
    ├── scripts
    ├── share
    │   ├── public
    │   └── templates
    └── tmp
        └── downloads
```


## **EDUROAM SETUP**

```Sh
nmcli con add \
	type wifi \
	ifname wlp1s0 \
	con-name eduroam \
	ssid eduroam \
	ipv4.method auto \
	802-1x.eap peap \
	802-1x.phase2-auth mschapv2 \
	802-1x.identity <USERNAME> \
	802-1x.password <PASSWORD> \
	wifi-sec.key-mgmt wpa-eap
```
