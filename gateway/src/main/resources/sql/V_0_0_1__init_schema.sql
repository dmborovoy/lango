CREATE TABLE word_form (
  id          VARCHAR(2) PRIMARY KEY,
  description CHARACTER VARYING,
  created_on  TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  modified_on TIMESTAMP WITH TIME ZONE
);

CREATE TABLE translation_direction (
  id          VARCHAR(7) PRIMARY KEY,
  description CHARACTER VARYING,
  created_on  TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  modified_on TIMESTAMP WITH TIME ZONE
);

CREATE TABLE word (
  id          BIGSERIAL PRIMARY KEY,
  form_id     VARCHAR(2)               NOT NULL,
  rate        INTEGER                  NOT NULL DEFAULT 0,
  direction   VARCHAR(7)               NOT NULL,
  word        CHARACTER VARYING UNIQUE NOT NULL,
  translation VARCHAR                  NOT NULL,
  example     VARCHAR,
  created_on  TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  modified_on TIMESTAMP WITH TIME ZONE,
  FOREIGN KEY (form_id) REFERENCES word_form (id),
  FOREIGN KEY (direction) REFERENCES translation_direction (id)
);

CREATE TABLE customer (
  id          BIGSERIAL PRIMARY KEY,
  login       VARCHAR UNIQUE           NOT NULL,
  password    VARCHAR(255)             NOT NULL,
  created_on  TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  modified_on TIMESTAMP WITH TIME ZONE
);

CREATE TABLE schedule (
  id          BIGSERIAL PRIMARY KEY,
  is_active   BOOLEAN,
  cron        VARCHAR                  NOT NULL,
  created_on  TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  modified_on TIMESTAMP WITH TIME ZONE
);

CREATE TABLE lesson (
  id           BIGSERIAL PRIMARY KEY,
  customer_id  BIGINT                   NOT NULL,
  schedule_id  BIGINT,
  title        VARCHAR                  NOT NULL,
  is_enabled   BOOLEAN                           DEFAULT FALSE,
  is_completed BOOLEAN                           DEFAULT FALSE,
  created_on   TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  modified_on  TIMESTAMP WITH TIME ZONE,
  FOREIGN KEY (customer_id) REFERENCES customer (id),
  FOREIGN KEY (schedule_id) REFERENCES schedule (id),
  UNIQUE (customer_id, title)--lessons tittle must be unique per user
);

CREATE TABLE lesson_word_map (
  lesson_id BIGINT  NOT NULL,
  word_id   BIGINT  NOT NULL,
  is_asked  BOOLEAN NOT NULL DEFAULT FALSE, --true=was asked, false=not asked yet
  is_ok     BOOLEAN, --NULL=was no asked, true=user guessed, false=user not guessed
  PRIMARY KEY (lesson_id, word_id),
  FOREIGN KEY (lesson_id) REFERENCES lesson (id),
  FOREIGN KEY (word_id) REFERENCES word (id)
);