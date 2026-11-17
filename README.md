# Real ou Fake? — Grupo 2 · 9º TA · Escola Adventista

Quiz sobre fake news para a feira. Integrantes: Sofia Carolina, Karolline Rocha, Letícia Gabriele, Lara Guerra, Arthur Cavalcante e Esther Penha. Orientação: Prof.ª Geisiane.

| Arquivo | O que é |
|---|---|
| `index.html` | O quiz (celular). Endereço do QR code: https://real-ou-fake.netlify.app |
| `painel.html` | Painel do estande para o notebook: https://real-ou-fake.netlify.app/painel.html |
| `setup.sql` | Cria a tabela `ranking` no Supabase (rodar uma vez no SQL Editor) |

## Dados
Cada partida grava `name`, `score`, `hits` e `created_at` na tabela `ranking` do Supabase.
Outra aplicação pode ler pelo endereço:

```
GET https://yqubjyoeycxxslofbbhz.supabase.co/rest/v1/ranking?select=name,score,hits,created_at&order=score.desc
Header: apikey: <publishable key>
```

Sem internet, o quiz guarda a partida no aparelho e envia na próxima vez que conseguir.

## Antes da feira
- Zerar os testes: no SQL Editor, `truncate public.ranking restart identity;`
- Abrir o painel do Supabase na véspera para garantir que o projeto não está pausado.
