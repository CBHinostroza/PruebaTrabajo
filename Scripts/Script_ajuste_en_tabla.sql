
use [TrabajadoresPrueba];
go

/*Consultando tabla*/
select * from [dbo].[Trabajadores];

/*Alterando la tabla trabajadores*/
alter table [dbo].[Trabajadores]
add Categoria varchar(500) null;

/*Consultando tabla*/
select * from [dbo].[Trabajadores];


