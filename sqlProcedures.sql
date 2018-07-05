USE [inspeccion]
GO
/****** Object:  StoredProcedure [dbo].[SP_BUSCA_PROYECTO]    Script Date: 07/04/2018 18:29:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_BUSCA_PROYECTO]
@nombreProyecto varchar(50) =null,
@estado varchar(50) = null,
@codigo int =null
AS BEGIN
If(@nombreProyecto is not null)
 BEGIN
SELECT * FROM dbo.proyecto p WHERE nombreProyecto like '%'+ @nombreProyecto+ '%';
END
if(@estado is not null)
 BEGIN
SELECT * FROM dbo.proyecto p WHERE estado=@estado;
END
if(@codigo is not null)
 BEGIN
SELECT * FROM dbo.proyecto p WHERE codProyecto=@codigo;
END
END


USE [inspeccion]
GO
/****** Object:  StoredProcedure [dbo].[SP_OBTENER_PROYECTO]    Script Date: 07/04/2018 18:29:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[SP_OBTENER_PROYECTO]
AS BEGIN
SELECT TOP 1000 [codProyecto]
      ,[nombreProyecto]
      ,[fechaInicio]
      ,[fechaFin]
      ,[estado]
      ,[fechaCreacion]
      ,[usuarioCreacion]
      ,[jefeProyecto]
  FROM [inspeccion].[dbo].[proyecto]
  END;

USE [inspeccion]
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERT_PROGRAMADOR]    Script Date: 05/07/2018 07:42:48 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_INSERT_PROGRAMADOR]
(
@id int,
@id_proyecto int
)
AS
BEGIN
Set NOCOUNT on;

Insert Into dbo.RecursoSolicitud(idProgramador, idProyecto) Values (@id, @id_proyecto)

Declare @new_identity int;

SELECT @new_identity = SCOPE_IDENTITY()

return @new_identity;
END

USE [inspeccion]
GO
/****** Object:  StoredProcedure [dbo].[SP_OBTENER_PROYECTO]    Script Date: 05/07/2018 08:21:20 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_OBTENER_PROGRAMADOR]
@idproyecto int
AS BEGIN
SELECT * FROM dbo.RecursoSolicitud r join dbo.empleado e ON r.idProgramador=e.idEmpleado WHERE r.idProyecto=@idproyecto
  END;

/******tablas*****/

USE [inspeccion]
GO

/****** Object:  Table [dbo].[proyecto]    Script Date: 07/04/2018 18:30:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[proyecto](
	[codProyecto] [int] IDENTITY(1,1) NOT NULL,
	[nombreProyecto] [varchar](50) NULL,
	[fechaInicio] [date] NULL,
	[fechaFin] [date] NULL,
	[estado] [varchar](50) NULL,
	[fechaCreacion] [date] NULL,
	[usuarioCreacion] [varchar](50) NULL,
	[jefeProyecto] [varchar](50) NULL,
 CONSTRAINT [PK_proyecto] PRIMARY KEY CLUSTERED 
(
	[codProyecto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [inspeccion]
GO

/****** Object:  Table [dbo].[RecursoSolicitud]    Script Date: 05/07/2018 07:44:44 a.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RecursoSolicitud](
	[idProgramador] [int] NULL,
	[idProyecto] [int] NULL
) ON [PRIMARY]

GO

USE [inspeccion]
GO

/****** Object:  Table [dbo].[solicitud]    Script Date: 05/07/2018 07:45:14 a.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[solicitud](
	[idSolicitud] [int] NOT NULL,
	[idProyecto] [int] NULL,
	[idCoordinador] [int] NULL,
	[idInspector] [int] NULL,
	[Observacion] [text] NULL,
	[fechaAprobacion] [date] NULL,
	[estadoSolicitud] [varchar](50) NULL,
 CONSTRAINT [PK_solicitud] PRIMARY KEY CLUSTERED 
(
	[idSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

