﻿CREATE TABLE contas_legais(
    user_id serial PRIMARY KEY,
    username VARCHAR (50) UNIQUE NOT NULL
);