
use [TrabajadoresPrueba];
go

if OBJECT_ID('sp_AsignarCategoria') is not null
drop procedure sp_AsignarCategoria
go

create procedure sp_AsignarCategoria
as
/*Declarando variables para asignarle datos a validar*/
declare @sexo AS varchar(1),
@dni AS varchar(1),
@codigo int

/*Declarando cursor que recorrera la tabla trabajadores*/
declare cur_trabajador cursor for select  [Id],substring([NumDocumento],1,1),[Sexo] from [dbo].[Trabajadores]

/*Abrir el cursor*/
open cur_trabajador

/*Recorrer cursor 1era fila*/
fetch cur_trabajador into  @codigo, @dni, @sexo

/*Recorrer cursor fila x fila*/
while (@@FETCH_STATUS=0) 
begin

	if @sexo = 'M' 
		if (convert(int,@dni) % 2) = 0 
			update [dbo].[Trabajadores] set Categoria = 'CATEGORIA A' where [Id] = @codigo; /*dato par*/
		else if (convert(int,@dni) % 2) > 0
			update [dbo].[Trabajadores] set Categoria = 'CATEGORIA B' where [Id] = @codigo; /*dato impar*/
	
	if @sexo = 'F' 
		if (convert(int,@dni) % 2) = 0 
			update [dbo].[Trabajadores] set Categoria = 'CATEGORIA C' where [Id] = @codigo; /*dato par*/
		else if (convert(int,@dni) % 2) > 0
			update [dbo].[Trabajadores] set Categoria = 'CATEGORIA D' where [Id] = @codigo; /*dato impar*/

fetch cur_trabajador into  @codigo, @dni, @sexo /*Siguiente fila*/

end
/*cerrar cursor*/
close cur_trabajador
/*liberar de memoria*/
deallocate cur_trabajador
go


/*Ejecutar procedure*/
exec sp_AsignarCategoria;

/*Consultando*/
select * from [dbo].[Trabajadores];



