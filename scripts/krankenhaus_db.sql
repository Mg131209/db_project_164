drop database if exists krankenhaus;
create database krankenhaus;
use krankenhaus;

create table abteilung
(
    id   int auto_increment
        primary key,
    name varchar(50) not null
);

create table arzt
(
    id           int auto_increment
        primary key,
    vorname      varchar(50) not null,
    nachname     varchar(50) not null,
    abteilung_id int         not null,
    constraint arzt_abteilung_fk
        foreign key (abteilung_id) references abteilung (id) on delete cascade
);

create table patient
(
    id           int auto_increment
        primary key,
    vorname      varchar(50) not null,
    nachname     varchar(50) not null,
    patienten_nr int not null unique
);

create table medikament
(
    id           int auto_increment
        primary key,
    name         varchar(50) not null,
    preis DECIMAL(10,2) CHECK (preis >= 0 OR preis IS NULL),
    lagerbestand int not null check (lagerbestand >= 0)
);

create table zimmer
(
    id           int auto_increment
        primary key,
    zimmer_nr     int not null,
    anz_bett int not null check (anz_bett > 0),
    abteilung_id int not null,
    constraint zimmer_abteilung_fk
        foreign key (abteilung_id) references abteilung (id)
);

create table pflegekraft
(
    id           int auto_increment
        primary key,
    vorname      varchar(50) not null,
    nachname     varchar(50) not null,
    abteilung_id int         not null,
    constraint pflegekraft_abteilung_fk
        foreign key (abteilung_id) references abteilung (id)
);

create table behandlung
(
    id             int auto_increment
        primary key,
    eintritt_datum  date not null,
    austritts_datum date not null,
    notizen varchar(500),
    arzt_id       int,
    patient_id     int  not null,
    zimmer_id      int  not null,
    constraint behandlung_arzt_fk
        foreign key (arzt_id) references arzt (id) on delete set null,
    constraint behandlung_patient_fk
        foreign key (patient_id) references patient (id) on delete cascade,
    constraint behandlung_zimmer_fk
        foreign key (zimmer_id) references zimmer (id) on delete cascade
);

create table behandlung_medikament
(
    primary key (behandlung_id, medikament_id),
    behandlung_id int not null,
    medikament_id int not null,
    constraint behandlung_medikament_behandlung_fk
        foreign key (behandlung_id) references behandlung (id) on delete cascade,
    constraint behandlung_medikament_medikament_fk
        foreign key (medikament_id) references medikament (id) on delete cascade
);

create table pflegekraft_behandlung
(
    pflegekraft_id int not null,
    behandlung_id  int not null,
    constraint pflegekraft_behandlung_behandlung_fk
        foreign key (behandlung_id) references behandlung (id) on delete cascade,
    constraint pflegekraft_pflegekraft_pflegekraft_fk
        foreign key (pflegekraft_id) references pflegekraft (id) on delete cascade
);
