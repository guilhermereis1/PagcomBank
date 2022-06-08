# App Rails de To Do

Nesse to-do list é possível:

- Adicionar uma tarefa (que é simplesmente um campo de texto) - [x]
- Editar uma tarefa - [x]
- Remover uma tarefa - [x]
- Marcar uma tarefa como completa - [x]

Quando um usuário **marcar** uma tarefa como completa:

- O sistema exibe para o usuário uma bela frase aleatória de "Parabéns" (invente qualquer 5 frases aleatórias) de uma cor hexadecimal aleatória dessa lista [#7B68EE, #6A5ACD, #800000, #2F4F4F]. - [x]

- Além disso, também tem que enviar um evento para o sistema de tracking. Por simplicidade, o sistema de tracking é só uma tabelinha de eventos que tem um **tipo de evento** (string) e um campo **properties** (json) em que você manda dados relevantes. No caso, guardar um tipo 'Congratulations', enquanto que e a cor e a frase aleatória de "Parabéns" são guardadas nesse campo json. - [x]

Quando um usuário **desmarca** a tarefa como completa:

- O sistema exibe para o usuário uma triste frase aleatória de "Poxa vida..." (invente qualquer 5 frases aleatórias) de uma cor hexadecimal aleatória da mesma lista [#7B68EE, #6A5ACD, #800000, #2F4F4F]. - [x]

- Também marca trackeia com o tipo 'Shame' e guardando a cor e frase no campo json. - [x]

Algumas exigências dos usuários muito empolgados com o sistema:

- Usar o [Bootstrap](https://getbootstrap.com/) para o CSS - [x]
- Criar uma rake task que imprime na tela um relatório CSV (não precisa gerar um arquivo; só prints mesmo) de todos os eventos com: usuário, cor hexadecimal, frase e a hora que foi marcada como completa. - [x]

Faça o código exatamente como faria no dia-a-dia de trabalho. Não precisa inventar algo para impressionar : ) Só faça com o que está confortável.

### TDD

### CLEAN CODE

### BEST PRACTICES

### RSPEC

### FACTORY BOT

### FAKER

### DEVISE

## DOCKER

run

```
chmod +x entrypoints/docker-entrypoint.sh

```

run

```
docker-compose up -d

```

run

```
docker-compose exec app bundle exec rake register:users
```
