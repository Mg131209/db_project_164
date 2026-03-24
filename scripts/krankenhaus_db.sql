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
        foreign key (abteilung_id) references abteilung (id)
);

create table medikament
(
    id           int auto_increment
        primary key,
    name         varchar(50) not null,
    lagerbestand int         not null
);

create table behandlung_medikament
(
    behandlung_id int not null,
    medikament_id int not null,
    constraint behandlung_medikament_medikament_fk
        foreign key (medikament_id) references medikament (id)
);

create table patient
(
    id           int auto_increment
        primary key,
    vorname      varchar(50) not null,
    nachname     varchar(50) not null,
    patienten_nr int         not null
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

create table zimmer
(
    id           int auto_increment
        primary key,
    zimmer_nr     int not null,
    anz_bett     int not null,
    abteilung_id int not null,
    constraint zimmer_abteilung_fk
        foreign key (abteilung_id) references abteilung (id)
);

create table behandlung
(
    id             int auto_increment
        primary key,
    eintrit_datum  date not null,
    austrits_datum date not null,
    notizen varchar(500),
    artzt_id       int  not null,
    patient_id     int  not null,
    zimmer_id      int  not null,
    constraint behandlung_arzt_fk
        foreign key (artzt_id) references arzt (id),
    constraint behandlung_patient_fk
        foreign key (patient_id) references patient (id),
    constraint behandlung_zimmer_fk
        foreign key (zimmer_id) references zimmer (id)
);

create table pflegekraft_behandlung
(
    pflegekraft_id int not null,
    behandlung_id  int not null,
    constraint pflegekraft_behandlung_behandlug_fk
        foreign key (behandlung_id) references behandlung (id),
    constraint pflegekraft_pflegekraft_pflegekraft_fk
        foreign key (pflegekraft_id) references pflegekraft (id)
);
