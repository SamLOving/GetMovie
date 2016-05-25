/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     24/05/2016 22:57:07                          */
/*==============================================================*/


drop table if exists ACTOR;

drop table if exists DIRECTOR;

drop table if exists GENERO;

drop table if exists PELICULA;

drop table if exists PRODUCTORA;

drop table if exists USUARIO;

/*==============================================================*/
/* Table: ACTOR                                                 */
/*==============================================================*/
create table ACTOR
(
   IDACTOR              int not null,
   NOMBREACTOR          varchar(50) not null,
   FOTOACTOR            varchar(100),
   primary key (IDACTOR)
);

/*==============================================================*/
/* Table: DIRECTOR                                              */
/*==============================================================*/
create table DIRECTOR
(
   IDDIRECTOR           int not null,
   NOMBREDIRECTOR       varchar(50),
   FOTODIRECTOR         varchar(100),
   primary key (IDDIRECTOR)
);

/*==============================================================*/
/* Table: GENERO                                                */
/*==============================================================*/
create table GENERO
(
   IDGENERO             int not null,
   NOMBREGENERO         varchar(50) not null,
   DESCRIPCIONGENERO    varchar(150) not null,
   primary key (IDGENERO)
);

/*==============================================================*/
/* Table: PELICULA                                              */
/*==============================================================*/
create table PELICULA
(
   IDPELICULA           int not null,
   IDACTOR              int,
   IDPRODUCTORA         int,
   IDGENERO             int,
   IDDIRECTOR           int,
   CORREOUSR            varchar(50),
   NOMBREPELICULA       varchar(150) not null,
   SINOPSISPELICULA     varchar(300) not null,
   FOTOPELICULA         varchar(100),
   RATINGPELICULA       decimal not null,
   LANZAMIENTOPELICULA  date not null,
   primary key (IDPELICULA)
);

/*==============================================================*/
/* Table: PRODUCTORA                                            */
/*==============================================================*/
create table PRODUCTORA
(
   IDPRODUCTORA         int not null,
   NOMBREPRODUCTORA     varchar(50) not null,
   primary key (IDPRODUCTORA)
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO
(
   NOMBREUSR            varchar(50) not null,
   CORREOUSR            varchar(50) not null,
   CLAVEUSR             varchar(16) not null,
   ESTADOUSR            tinyint,
   ISADMIN              tinyint,
   primary key (CORREOUSR)
);

alter table PELICULA add constraint FK_RELATIONSHIP_1 foreign key (IDACTOR)
      references ACTOR (IDACTOR) on delete restrict on update restrict;

alter table PELICULA add constraint FK_RELATIONSHIP_2 foreign key (IDDIRECTOR)
      references DIRECTOR (IDDIRECTOR) on delete restrict on update restrict;

alter table PELICULA add constraint FK_RELATIONSHIP_3 foreign key (IDGENERO)
      references GENERO (IDGENERO) on delete restrict on update restrict;

alter table PELICULA add constraint FK_RELATIONSHIP_4 foreign key (CORREOUSR)
      references USUARIO (CORREOUSR) on delete restrict on update restrict;

alter table PELICULA add constraint FK_RELATIONSHIP_5 foreign key (IDPRODUCTORA)
      references PRODUCTORA (IDPRODUCTORA) on delete restrict on update restrict;

