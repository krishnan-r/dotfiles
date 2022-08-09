FROM alpine:3

RUN apk add --no-cache \
            bash \
            curl \
            vim \
            git \
            direnv \
            starship

# Create a test user with bash as default shell
RUN adduser -D test -s /bin/bash
USER test
WORKDIR /home/test

COPY ./ ./dotfiles/
RUN ls && ls $HOME/dotfiles/

# Configure VIM
RUN $HOME/dotfiles/vim.sh

# Configure zsh shell
RUN echo 'source "$HOME/dotfiles/bashrc"' >> ~/.bashrc

CMD ["bash"]
