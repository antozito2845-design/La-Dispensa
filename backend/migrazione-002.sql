-- Migrazione 002: rende obbligatorie le colonne che il database
-- creato prima della migrazione 001 lasciava facoltative (NULL).
-- Eseguire una sola volta, dopo un backup:
--   mysqldump -u TUO_UTENTE -p Ricettario_cucina > backup.sql
--   mysql -u TUO_UTENTE -p Ricettario_cucina < migrazione-002.sql
-- Non serve per i database creati da zero con database.sql.

USE Ricettario_cucina;

-- Ogni collegamento deve avere ricetta, ingrediente e unità
ALTER TABLE ricetta_ingrediente
  MODIFY ricetta_id INT NOT NULL,
  MODIFY ingrediente_id INT NOT NULL,
  MODIFY unita VARCHAR(20) NOT NULL DEFAULT '';

-- Ogni ingrediente deve avere un'unità di misura
ALTER TABLE ingredienti
  MODIFY unita VARCHAR(20) NOT NULL;
