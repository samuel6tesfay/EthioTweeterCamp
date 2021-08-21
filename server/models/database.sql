CREATE TABLE users (
            id  bigserial   primary key not null,
            name    varchar(255) not null,
            email    varchar(255) not null,
            password  varchar(255) not null,
            Unique (email)
);