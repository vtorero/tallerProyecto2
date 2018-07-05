CREATE PROC SP_BUSCA_PROYECTO
@nombreProyecto varchar(50)
AS BEGIN
SELECT [codProyecto]
      ,[nombreProyecto]
      ,[fechaInicio]
      ,[fechaFin]
      ,[estado]
      ,[fechaCreacion]
      ,[usuarioCreacion]
  FROM [inspeccion].[dbo].[proyecto] where [nombreProyecto] like '%'+@nombreProyecto+'%';
  END