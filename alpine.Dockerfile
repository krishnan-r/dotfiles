FROM alpine:3

RUN apk add --no-cache zsh curl vim
RUN sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --verbose --yes

RUN adduser -D test -s /bin/zsh
USER test
WORKDIR /home/test

RUN echo 'eval "$(starship init zsh)"' >> ~/.zshrc

CMD ["zsh"]
