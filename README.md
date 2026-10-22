<div align="center">

# 🥘 La Dispensa

**Il tuo ricettario digitale: organizza ricette e ingredienti in un unico posto.**

![React](https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB)
![TypeScript](https://img.shields.io/badge/TypeScript-3178C6?style=for-the-badge&logo=typescript&logoColor=white)
![Node.js](https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white)
![Express](https://img.shields.io/badge/Express_5-000000?style=for-the-badge&logo=express&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)

</div>

---

## 📖 Descrizione

**La Dispensa** è un'applicazione web full stack per gestire il proprio ricettario. Permette di tenere traccia di ricette e ingredienti attraverso un'interfaccia semplice e reattiva, supportata da un'API REST che salva i dati su un database MySQL.

Il progetto è diviso in due parti indipendenti: un **backend** che espone le API e un **frontend** React che le consuma.

<!-- Facoltativo: aggiungi qui uno screenshot dell'app
<p align="center">
  <img src="docs/screenshot.png" alt="Anteprima di La Dispensa" width="800">
</p>
-->

## ✨ Funzionalità

- 🍝 **Ricette:** elenco con gli ingredienti utilizzati, creazione di nuove ricette con quantità e unità di misura, eliminazione
- 🥕 **Ingredienti:** elenco con scorta disponibile e stato (OK, POCO, ESAURITO), aggiunta, modifica ed eliminazione (bloccata se l'ingrediente è usato in una ricetta)
- 📦 **Gestione automatica delle scorte:** creando una ricetta le quantità vengono scalate (con conversione tra unità compatibili, es. g → kg), eliminandola vengono ripristinate esattamente; la creazione viene rifiutata se la scorta non basta
- 🔒 **Operazioni in transazione:** ricette e scorte restano sempre coerenti, anche in caso di errore o di richieste concorrenti (`SELECT ... FOR UPDATE`)
- 🪟 **Finestre modali** per inserire i dati senza lasciare la pagina
- 💾 **Dati persistenti** salvati su database tramite API REST
- 🎨 **Interfaccia curata**, con fogli di stile dedicati a ogni sezione

## 🛠️ Tecnologie

| Livello | Strumenti |
|---|---|
| **Frontend** | React, TypeScript, Create React App, CSS |
| **Backend** | Node.js, Express 5, TypeScript, CORS, dotenv |
| **Database** | MySQL (driver `mysql2`) |

## 📁 Struttura del progetto

```
La-Dispensa/
├── backend/
│   ├── src/
│   │   ├── api-ricette.ts        # Rotte API delle ricette
│   │   ├── api-ingredienti.ts    # Rotte API degli ingredienti
│   │   ├── connessione-db.ts     # Connessione al database
│   │   └── server-principale.ts  # Avvio del server
│   ├── database.sql              # Creazione del database e delle tabelle
│   ├── .env.example              # Modello delle variabili d'ambiente
│   └── tsconfig.json
└── frontend/
    ├── public/
    └── src/
        ├── componenti/           # Home, Ricette, Ingredienti, Modal
        ├── styles/               # Fogli di stile (global, home, components)
        ├── App.tsx
        └── index.tsx
```

## 🚀 Come avviare il progetto

### Requisiti

- [Node.js](https://nodejs.org/) 18 o superiore
- [MySQL](https://www.mysql.com/) installato e **in esecuzione**
- [Git](https://git-scm.com/)

### 1. Clona il repository

```bash
git clone https://github.com/antozito2845-design/La-Dispensa.git
cd La-Dispensa
```

### 2. Prepara il database

Dal file `backend/database.sql` puoi creare database e tabelle in un solo passaggio.

Da terminale:

```bash
mysql -u TUO_UTENTE -p < backend/database.sql
```

Oppure aprilo con un client grafico (DBeaver, MySQL Workbench) ed eseguilo.

Lo script crea il database `Ricettario_cucina` con le tabelle `ricette`, `ingredienti` e `ricetta_ingrediente`.

### 3. Configura e avvia il backend

```bash
cd backend
npm install
cp .env.example .env
```

Apri il file `.env` e inserisci i tuoi dati di accesso a MySQL. Il file contiene informazioni riservate ed è escluso da Git, quindi non viene mai caricato online.

Poi avvia il server in modalità sviluppo:

```bash
npm run dev
```

Il backend parte su `http://localhost:3001`.

### 4. Avvia il frontend

In un secondo terminale:

```bash
cd frontend
npm install
npm start
```

L'app si apre nel browser su `http://localhost:3000`.

> 💡 **Ricorda:** MySQL deve essere acceso prima di avviare il backend, altrimenti il server non riesce a collegarsi al database.

## 🔐 Variabili d'ambiente

Le impostazioni del backend si trovano in `backend/.env`. Il file `backend/.env.example` è il modello da copiare.

| Variabile | Descrizione |
|---|---|
| `PORT` | Porta del server (3001) |
| `DB_HOST` | Indirizzo del server MySQL (es. `localhost`) |
| `DB_PORT` | Porta di MySQL (di solito `3306`) |
| `DB_USER` | Utente MySQL |
| `DB_PASSWORD` | Password dell'utente MySQL |
| `DB_NAME` | Nome del database (`Ricettario_cucina`) |

## 📜 Script del backend

| Comando | Cosa fa |
|---|---|
| `npm run dev` | Avvia il server con ricarica automatica (nodemon) |
| `npm run build` | Compila il codice TypeScript nella cartella `dist` |
| `npm start` | Avvia la versione compilata |

## 🗺️ Possibili sviluppi futuri

- [ ] Ricerca e filtri per ricette e ingredienti
- [ ] Collegamento tra ricette e ingredienti necessari
- [ ] Foto delle ricette
- [ ] Autenticazione degli utenti
- [ ] Test automatici

## 👤 Autore

Progetto creato da **[antozito2845-design](https://github.com/antozito2845-design)**.

---

<div align="center">

Se il progetto ti è piaciuto, lascia una ⭐ al repository!

</div>

## 🔌 API

| Metodo | Rotta | Descrizione |
|---|---|---|
| GET | `/api/ingredienti` | Elenco con stato delle scorte e `puoEliminare` |
| GET | `/api/ingredienti/:id` | Dettaglio |
| POST | `/api/ingredienti` | Creazione (la quantità è la scorta iniziale) |
| PUT | `/api/ingredienti/:id` | Modifica / rifornimento |
| DELETE | `/api/ingredienti/:id` | Eliminazione (409 se usato in una ricetta) |
| GET | `/api/ricette` | Elenco con riepilogo ingredienti |
| POST | `/api/ricette` | Creazione con scarico scorte in transazione |
| PUT | `/api/ricette/:id` | Modifica di nome, istruzioni e difficoltà |
| DELETE | `/api/ricette/:id` | Eliminazione con ripristino scorte in transazione |
| GET | `/api/stats` | Conteggio ricette e ingredienti |
| GET | `/api/health` | Stato del server e del database |

Gli errori hanno sempre la forma `{ "errore": "messaggio" }` con il codice HTTP appropriato: 400 dati non validi, 404 risorsa inesistente, 409 conflitto (scorta insufficiente, ingrediente in uso), 500 errore interno senza dettagli tecnici.

## 🗄️ Aggiornare un database esistente

Se hai creato il database con una versione precedente dello schema, fai un backup ed esegui una volta `backend/migrazione-001.sql`.

