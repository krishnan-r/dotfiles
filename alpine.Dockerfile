FROM alpine:3

RUN apk add --no-cache zsh bash curl vim git
RUN sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --verbose --yes

# Create a test user with zsh as default shell
RUN adduser -D test -s /bin/zsh
USER test
WORKDIR /home/test

COPY ./ ./dotfiles/
RUN ls && ls $HOME/dotfiles/
# Configure VIM
RUN $HOME/dotfiles/vim.sh

# Configure zsh shell
RUN echo 'source "$HOME/dotfiles/init.zsh"' >> ~/.zshrc

CMD ["zsh"]
