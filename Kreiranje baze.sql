use fudbalske_slicice
create table Korisnik
(id int primary key identity(1,1), username varchar(30) not null, ime nvarchar(30), prezime nvarchar(30), email varchar(30), pass varchar(30))

create table godina_izdanja
(id int primary key identity(1,1), naziv varchar(4))

create table Izdavac
(id int primary key identity(1,1), naziv varchar(30))

create table Album
(id int primary key identity(1,1), naziv varchar(30), izdavac_id int foreign key references Izdavac(id), godina_izdanja_id int foreign key references godina_izdanja (id))

create table Slicica
(id int primary key identity(1,1), ime varchar(30), prezime varchar(30), album_id int foreign key references Album (id))

create table Slicica_Korisnik
(id int primary key identity(1,1), korisnik_id int foreign key references Korisnik (id), slicica_id int foreign key references Slicica (id))






