use [TrabajadoresPrueba];
go

create procedure sp_ListarDepartamento
as
select * from [dbo].[Departamento];
go


create procedure sp_ListarProvincia
@iddepartamento int
as
select [Id],[NombreProvincia] from [dbo].[Provincia] where [IdDepartamento] = @iddepartamento;
go

create procedure sp_ListarDistrito
@idprovincia int
as
select [Id],[NombreDistrito] from [dbo].[Distrito] where [IdProvincia] = @idprovincia;
go

create procedure sp_RetornarIdDistrito
@idprovincia int,
@nombdistrito varchar(500)
as
select [Id] from [dbo].[Distrito] where 
[IdProvincia] =  @idprovincia and [NombreDistrito] = @nombdistrito;
go

create procedure sp_ListarTrabajadores
as
select t.Id,
t.TipoDocumento as [Tipo Documento],
t.NumDocumento as Número,
t.Nombres as Nombres, 
t.Sexo as Sexo, 
d.NombreDepartamento as Departamento,
p.NombreProvincia as Provincia,
dis.NombreDistrito as Distrito
from Trabajadores t inner join 
Departamento d on t.IdDepartamento = d.Id inner join 
Provincia p on t.IdProvincia = p.Id inner join
Distrito dis on t.IdDistrito = dis.Id;
go

create procedure sp_RegistrarTrabajador
@tipoDocumento varchar(3),
@numDocumento varchar(30),
@nombres varchar(500),
@sexo char(1),
@iddepartamento int,
@idprovincia int,
@iddistrito int
as
insert into [dbo].[Trabajadores]
([TipoDocumento],[NumDocumento],[Nombres],[Sexo],[IdDepartamento],[IdProvincia],[IdDistrito])
values(@tipoDocumento,@numDocumento,@nombres,@sexo,@iddepartamento,@idprovincia,@iddistrito);
go


create procedure sp_ActualizarTrabajador
@id int,
@tipoDocumento varchar(3),
@numDocumento varchar(30),
@nombres varchar(500),
@sexo char(1),
@iddepartamento int,
@idprovincia int,
@iddistrito int
as
update [dbo].[Trabajadores]
set 
[TipoDocumento] = @tipoDocumento,
[NumDocumento] = @numDocumento,
[Nombres] = @nombres,
[Sexo] = @sexo,
[IdDepartamento] = @iddepartamento,
[IdProvincia] = @idprovincia,
[IdDistrito] = @iddistrito where [Id] = @id;
go

create procedure sp_EliminarTrabajador
@id int
as
delete from [dbo].[Trabajadores] where [Id] = @id;
go


