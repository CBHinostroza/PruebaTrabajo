

use [TrabajadoresPrueba];
go


if OBJECT_ID('view_trabajadores') is not null
drop view view_trabajadores
go

create view view_trabajadores
as
select [NumDocumento],[Nombres],[Categoria] from [dbo].[Trabajadores];

go

/*consultando*/

select * from view_trabajadores;
