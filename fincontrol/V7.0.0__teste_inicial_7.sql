﻿CREATE TABLE rafael_account(
    user_id serial PRIMARY KEY,
    username VARCHAR (50) UNIQUE NOT NULL
);