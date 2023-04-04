CREATE TABLE Empresas
 (
 Codigo int  auto_increment primary key not null,
 NombreComercial varchar (100) not null,
 RazonSocial Varchar (100) not null,
 Ruc varchar (11) not null,
 Direccion varchar (100) not null,
 Direccion2 varchar (100),
 Telefono int(15) not null,
 Telefono2 int(15),
 Telefono3 int(15),
 Correo varchar(30) not null,
 Correo1 varchar(30),
 Fregistro date,
 Hora time
 );


CREATE TABLE Agencias
 (
 Codigo int auto_increment primary key not null,
 NombreComercial varchar (100) not null,
 RazonSocial Varchar (100) not null,
 Ruc varchar (11) not null,
 Direccion varchar (100) not null,
 Direccion2 varchar (100),
 Telefono int(15) not null,
 Telefono2 int(15),
 Telefono3 int(15),
 Correo varchar(30) not null,
 Correo1 varchar(30),
 Fregistro date,
 Hora time
 );
 
CREATE TABLE Logos
(
  Codigo int auto_increment primary key not null,
  CodigoAgencia int not null,
  Logo LONGBLOB not null,
  FOREIGN KEY (CodigoAgencia) REFERENCES Agencias(Codigo)
);

CREATE TABLE Tour (
  Codigo int auto_increment primary key not null,
  Nombre varchar(50) not null
);
CREATE TABLE Hotel (
  Codigo int auto_increment primary key not null,
  Nombre varchar(50) not null
);

 CREATE TABLE PrecioInvoice(
 Codigo int auto_increment primary key not null,
 Formapago ENUM('efectivo','tarjeta') not null,
 Preciotour decimal(10,2),
 Madelantado decimal(10,2),
 Mtotal decimal(10,2)
 );

CREATE TABLE Reservas
(
  Codigo int primary key not null,
  Fechapartida date not null,
  Fechallegada date not null,
  Tipopersona ENUM('adulto','niño') not null,
  TourCodigo int not null,
  HotelCodigo int not null,
  ClientesCodigo int not null,
  FOREIGN KEY (TourCodigo) REFERENCES Tour(Codigo),
  FOREIGN KEY (HotelCodigo) REFERENCES Hotel(Codigo),
  FOREIGN KEY (ClientesCodigo) REFERENCES Clientes(Codigo)
);

CREATE TABLE Clientes
 (
 Codigo int auto_increment primary key not null,
 Nombres varchar (100) not null,
 Tipodocumento ENUM ('DNI','Pasaporte','Tarjeta') not null,
 Numdoc int(20) not null,
 Telefono int(15) not null,
 Correo varchar(30) not null,
 Fnacimiento date,
 Fregistro date,
 Hora time,
 ReservasCodigo int not null,
 FOREIGN KEY (ReservasCodigo) REFERENCES Reservas(Codigo)
 );

CREATE TABLE Invoice(
 Codigo varchar(10) primary key not null DEFAULT (UUID()),
 Observaciones varchar(200),
 Finvoice date,
 Hora time,
 FOREIGN KEY (AgenciasCodigo) REFERENCES Agencias(Codigo),
 FOREIGN KEY (ClientesCodigo) REFERENCES Clientes(Codigo),
 FOREIGN KEY (ReservasCodigo) REFERENCES Reservas(Codigo),
 FOREIGN KEY (HotelCodigo) REFERENCES Hotel(Codigo),
 FOREIGN KEY (PrecioInvoiceCodigo) REFERENCES PrecioInvoice(Codigo)
 );

CREATE TABLE Roles (
  Codigo int auto_increment primary key not null,
  Nombre varchar(50) not null,
);

CREATE TABLE Usuarios (
  Codigo varchar(10) primary key not null DEFAULT (UUID()),
  Nombre varchar(50) not null,
  Contrasena varchar(50) not null
);

CREATE TABLE Roles (
  Codigo int auto_increment primary key not null,
  Nombrerol varchar(50) not null
);

CREATE TABLE UsuariosRoles (
  Codigo int auto_increment primary key not null,
  Codigousuario int not null,
  Codigorol int not null,
  FOREIGN KEY (CodigoUsuario) REFERENCES Usuarios(Codigo),
  FOREIGN KEY (CodigoRol) REFERENCES Roles(Codigo)
);