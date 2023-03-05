FROM ubuntu

#01° stage faz o build da aplicação
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y golang-go
COPY app.go .

RUN CGO_ENABLED=0 go build app.go

FROM alpine:3.15

#removendo permissão de escrita em /etc
RUN chmod a-w /etc

#criando um grupo chamado docker e adicionando o user aplicacao ao grupo
RUN addgroup -S docker && adduser -S aplicacao -G docker -h /home/aplicacao

#removendo os binários do container
RUN rm -rf /bin/*

#copiando o output ou seja a aplicação compilado para o segundo stage
COPY --from=0 /app /home/aplicacao

#alternando o usuário responsável pela execução dos comandos ao container
USER aplicacao

#comando padrão
CMD ["/home/aplicacao/app"]
