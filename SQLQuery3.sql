create table Kolekcionar
(id int primary key identity(1,1), username varchar(30) not null, ime nvarchar(25), prezime nvarchar(25), email varchar(30) not null, pass varchar(30) not null);

create table Kolekcija
(id int primary key identity(1,1), naziv nvarchar(30) not null, kolekcionar_id int foreign key references Kolekcionar(id))

create table Slicice
(id int primary key identity(1,1), opis nvarchar(50), kolekcija_id int foreign key references Kolekcija(id))

alter table Slicice
add slika VARBINARY(MAX)

create procedure insert_kolekcionar @id int, @user varchar(30), @ime nvarchar(25), @prezime nvarchar(25), @email varchar(30), @pass varchar(30)
as 
begin 
insert into Kolekcionar (id, username, ime, prezime, email ,pass)
values (@id, @user,@ime,@prezime,@email,@pass)

end

alter procedure delete_kolekcionar @id int, @user varchar(30), @ime nvarchar(25), @prezime nvarchar(25), @email varchar(30), @pass varchar(30)
as 
begin
delete from Kolekcionar
where id = @id 
end

create procedure update_kolekcija @id int, @naziv nvarchar(30), @kolekcionar_id int
as
begin
update Kolekcija
set naziv=@naziv, kolekcionar_id = @kolekcionar_id
where id=@id
end

create procedure insert_kolekcija @id int, @naziv nvarchar(30), @kolekcionar_id int
as 
begin
insert into Kolekcija (id, naziv, kolekcionar_id)
values (@id,@naziv,@kolekcionar_id)
end

alter procedure delete_kolekcija @id int, @naziv nvarchar(30), @kolekcionar_id int
as
begin
delete from Kolekcija
where id = @id 
end

create procedure insert_slicice @id int , @opis nvarchar(50), @kolekcija_id int
as
begin
insert into Slicice (id,opis,kolekcija_id)
values (@id,@opis,@kolekcija_id)
end

create procedure update_slicice @id int , @opis nvarchar(50), @kolekcija_id int
as
begin
update Slicice
set opis=@opis, kolekcija_id=@kolekcija_id
where id=@id
end 

create procedure delete_slicice @id int, @opis nvarchar(50), @kolekcija_id int
as
begin
delete from Slicice
where id=@id
end





