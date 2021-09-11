CREATE TABLE admins (
        id  bigserial   primary key not null,
        name    varchar(255) not null,
        email    varchar(255) not null,
        password  varchar(255) not null,
        Unique (email)
);
CREATE TABLE thread(
     id serial primary key,
     name varchar(255),
     date DATE NOT NULL DEFAULT CURRENT_DATE,
     username varchar(255),
     body varchar(255),
     admin_id   INT  references admins(id)
 );

CREATE TABLE trends(
     id serial primary key,
     body varchar(255),
     admin_id   INT  references admins(id)
 
 );

CREATE TABLE relevant_people(
     id serial primary key,
     name varchar(255),
     admin_id   INT  references admins(id)
);
