DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT,
  lname TEXT
);

DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT,
  body TEXT,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_follows;

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  question_id INTEGER,
  user_id INTEGER,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS replies;

CREATE TABLE replies(
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_id INTEGER,
  user_id INTEGER NOT NULL,
  body TEXT NOT NULL,

  FOREIGN KEY (parent_id) REFERENCES replies(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_likes;

CREATE TABLE question_likes(
  id INTEGER PRIMARY KEY,
  user_id INTEGER,
  question_id INTEGER,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO users(fname, lname)
VALUES
  ("Adrian", "Rivero"),
  ("Priya", "Mangal");


INSERT INTO questions(title, body, user_id)
VALUES
  ("a/A", "How do I get a job after a/A?", (SELECT id FROM users WHERE fname = "Adrian")),
  ("Dog", "Why are dogs so cute?", (SELECT id FROM users WHERE fname = "Priya"));

INSERT INTO question_follows(question_id, user_id)
VALUES
  ((SELECT id FROM questions WHERE title = "a/A"), (SELECT id FROM questions WHERE title = "a/A")),
  ((SELECT id FROM questions WHERE title = "Dog"),(SELECT id FROM questions WHERE title = "Dog"));

INSERT INTO replies(question_id, parent_id, user_id, body)
VALUES
  ((SELECT id FROM questions WHERE title = "a/A"), NULL, (SELECT id FROM users WHERE fname = "Priya"), "Work harder!!"),
  ((SELECT id FROM questions WHERE title = "Dog"), NULL, (SELECT id FROM users WHERE fname = "Adrian"), "Because they are better than Cats.");
