
# ExMonApi

[![Actions Status](https://github.com/adrianomota/ex_mon_aoi/workflows/CI/badge.svg)](https://github.com/{adrianomota/ex_mon_aoi/CI)

Esta aplicação consiste de uma api rest json que se integra com a api pública
de pokemons.

Nesta aplicação é possível:
`Criar, deletar, atualizar e ler dados de um treinador`
`Criar um time, deletar um time e atualizar um time`
`Ler informações de um pokemon utilizando a api de pokemons pokeapi.co` website: https://pokeapi.co

Algumas rotas são protegidas por `Bearer authentication` com o Guardian website: https://hexdocs.pm/guardian/Guardian.html

## Iniciar a aplicação:

- Instalando as dependências `mix deps.get`
- Criando e migrando o banco de dados `mix ecto.setup`
- Iniciando o phoenix (api json) `mix phx.server`

Acesse [`localhost:4000`](http://localhost:4000) no seu browser.

## mais informaões

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix

