default:

zsh:
	git submodule update --init --recursive $(CURDIR)/zsh
	ln -i -s $(CURDIR)/zsh/zshrc ~/.zshrc

tmux:
	git submodule update --init --recursive $(CURDIR)/tumx
	ln -i -s $(CURDIR)/tmux/tmux.conf ~/.tmux.conf
	mkdir -p ~/.tmux/plugins/
	ln -i -s $(CURDIR)/tmux/tpm/ ~/.tmux/plugins/tpm
