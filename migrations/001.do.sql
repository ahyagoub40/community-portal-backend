CREATE TABLE organization (
  id          INTEGER PRIMARY KEY AUTOINCREMENT,
  public_id   VARCHAR(255) UNIQUE NOT NULL,
  name        VARCHAR(255) NOT NULL
);

CREATE TABLE user_type (
  id       INTEGER PRIMARY KEY AUTOINCREMENT,
  public_id VARCHAR(255) UNIQUE NOT NULL,
  name     VARCHAR(127) NOT NULL
);

CREATE TABLE user (
  id             INTEGER PRIMARY KEY AUTOINCREMENT,
  public_id       VARCHAR(255) UNIQUE NOT NULL,
  first_name      VARCHAR(255) NOT NULL,
  last_name       VARCHAR(255) NOT NULL,
  username        VARCHAR(255) NOT NULL,
  email           VARCHAR(255) UNIQUE NOT NULL,
  phone_number    VARCHAR(16) NOT NULL,
  user_type_id    INTEGER NOT NULL,
  organization_id INTEGER NOT NULL,
  FOREIGN KEY (user_type_id) REFERENCES user_type(id),
  FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE prayer_type (
  id          INTEGER PRIMARY KEY AUTOINCREMENT,
  public_id   VARCHAR(255) UNIQUE NOT NULL,
  name        VARCHAR(127) NOT NULL
);

CREATE TABLE prayer_call (
  id          INTEGER PRIMARY KEY AUTOINCREMENT,
  public_id   VARCHAR(255) UNIQUE NOT NULL,
  name        VARCHAR(127) NOT NULL
);

CREATE TABLE prayer_time (
  id             INTEGER PRIMARY KEY AUTOINCREMENT,
  public_id       VARCHAR(255) UNIQUE NOT NULL,
  prayer_type_id   INTEGER NOT NULL,
  prayer_call_id   INTEGER NOT NULL,
  organization_id INTEGER NOT NULL,
  time           TIMESTAMP NOT NULL,
  FOREIGN KEY (prayer_type_id) REFERENCES prayer_type(id),
  FOREIGN KEY (prayer_call_id) REFERENCES prayer_call(id),
  FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE INDEX user_email_index ON user (email);