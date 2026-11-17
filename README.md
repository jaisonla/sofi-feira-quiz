# Real ou Fake? — Grupo 2 · 9º TA · Escola Adventista

Quiz sobre fake news para a feira. Integrantes: Sofia Carolina, Karolline Rocha, Letícia Gabriele, Lara Guerra, Arthur Cavalcante e Esther Penha. Orientação: Prof.ª Geisiane.

| Arquivo | O que é |
|---|---|
| `index.html` | O quiz (celular). Endereço do QR code: https://real-ou-fake.netlify.app |
| `painel.html` | Painel do estande para o notebook: https://real-ou-fake.netlify.app/painel.html |
| `admin.html` | Administração: lista completa, busca por nome, apagar e zerar — https://real-ou-fake.netlify.app/admin.html |
| `setup.sql` | Cria a tabela `ranking` e as funções do admin no Supabase (rodar no SQL Editor) |

## Dados
Cada partida grava `name`, `score`, `hits` e `created_at` na tabela `ranking` do Supabase.
Outra aplicação pode ler pelo endereço:

```
GET https://yqubjyoeycxxslofbbhz.supabase.co/rest/v1/ranking?select=name,score,hits,created_at&order=score.desc
Header: apikey: <publishable key>
```

Sem internet, o quiz guarda a partida no aparelho e envia na próxima vez que conseguir.

## Antes da feira
- Zerar os testes: em `admin.html` → "Zerar ranking" (ou no SQL Editor, `truncate public.ranking restart identity;`)
- A senha do admin está no `setup.sql` (texto `feira9TA`). Para trocar, edite as três funções e rode de novo.
- Abrir o painel do Supabase na véspera para garantir que o projeto não está pausado.
