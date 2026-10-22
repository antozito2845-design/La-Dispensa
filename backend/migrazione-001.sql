-- Migrazione per database creati con la versione precedente dello schema.
-- Eseguire una sola volta: mysql -u TUO_UTENTE -p Ricettario_cucina < migrazione-001.sql
-- Fare prima un backup: mysqldump -u TUO_UTENTE -p Ricettario_cucina > backup.sql

USE Ricettario_cucina;

-- 1. Rimuove la colonna duplicata: la scorta e' solo ingredienti.quantita
ALTER TABLE ingredienti DROP COLUMN giacenza;

-- 2. Impedisce scorte negative (enforced da MySQL 8.0.16+ e MariaDB 10.2+)
ALTER TABLE ingredienti
  ADD CONSTRAINT chk_quantita_non_negativa CHECK (quantita >= 0);

-- 3. Uno stesso ingrediente non puo' comparire due volte nella stessa ricetta.
--    Se fallisce, ci sono duplicati da accorpare prima.
ALTER TABLE ricetta_ingrediente
  ADD CONSTRAINT uq_ricetta_ingrediente UNIQUE (ricetta_id, ingrediente_id);

-- 4. Tabella obsoleta (nome al plurale), vuota e non usata dal codice
DROP TABLE IF EXISTS ricetta_ingredienti;

-- 5. Allinea la lunghezza del nome alla validazione del backend (255)
ALTER TABLE ingredienti MODIFY nome VARCHAR(255) NOT NULL;
