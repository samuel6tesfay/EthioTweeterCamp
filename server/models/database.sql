CREATE TABLE users (
        id  bigserial   primary key not null,
        name    varchar(255) not null,
        email    varchar(255) not null,
        password  varchar(255) not null,
        isAdmin BOOLEAN not null default 'false',
        Unique (email)
);
CREATE TABLE threads(
     id serial primary key,
     username varchar(255),
     body varchar,
     link varchar(255),
     filename varchar(255),
     filepath varchar(255),
     date DATE NOT NULL DEFAULT CURRENT_DATE,
     user_id   INT  references users(id)
 );

CREATE TABLE trends(
     id serial primary key,
     body varchar(255),
     link varchar(255),
     user_id   INT  references users(id)
 
 );

CREATE TABLE relevant_people(
     id serial primary key,
     name varchar(255),
     body varchar,
     link varchar(255),
     user_id   INT  references users(id)
);
