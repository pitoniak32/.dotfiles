FROM ubuntu:latest

RUN apt update && apt install -y \
  # cloning dotfiles
  git \ 
  # setting default shell
  zsh \
  # installing rust
  curl \
  vim \
  fzf \
  # cargo install 
  g++ \
  # cargo install starship
  cmake 

RUN git clone https://github.com/pitoniak32/.dotfiles.git

# testing install command
# docker build . -t testing --no-cache && docker run -it testing /bin/bash
