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

-----
USE [inspeccion]
GO

/****** Object:  StoredProcedure [dbo].[SP_OBTENER_PROGRAMADOR]    Script Date: 12/07/2018 04:33:00 p.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_OBTENER_PROGRAMADOR]
@idproyecto int
AS BEGIN
SELECT * FROM dbo.RecursoSolicitud r join dbo.empleado e ON r.idProgramador=e.idEmpleado WHERE r.idProyecto=@idproyecto
  END;
GO


-----
USE [inspeccion]
GO

/****** Object:  StoredProcedure [dbo].[SP_BUSCA_RECURSO]    Script Date: 12/07/2018 04:33:25 p.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_BUSCA_RECURSO]
@nombre varchar(50) =null,
@cargo varchar(50) = null
AS BEGIN
 BEGIN
 SELECT * FROM dbo.empleado p where   p.Apellidos   like '%'+ @nombre+ '%' and cargo=@cargo


END
END
GO

----
USE [inspeccion]
GO

/****** Object:  StoredProcedure [dbo].[SP_INSERT_ACTIVIDAD]    Script Date: 12/07/2018 04:33:43 p.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_INSERT_ACTIVIDAD]
(
@id_proyecto int,
@fechaInicio Date,
@fechaFin Date,
@descripcion text,
@preal float,
@pplan float,
@est varchar(50)
)
AS
BEGIN
Set NOCOUNT on;

Insert Into dbo.actividad(idProyecto,fechaInicio,fechaFin,Descripcion,porcentajeReal,porcentajePlan,estado) 
Values (@id_proyecto,@fechaInicio,@fechaFin,@descripcion,@preal,@pplan,@est);

Declare @new_identity int;

SELECT @new_identity = SCOPE_IDENTITY()

return @new_identity;
END
GO

---
USE [inspeccion]
GO

/****** Object:  StoredProcedure [dbo].[SP_INSERT_PROGRAMADOR]    Script Date: 12/07/2018 04:33:56 p.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_INSERT_PROGRAMADOR]
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
GO

---
USE [inspeccion]
GO

/****** Object:  StoredProcedure [dbo].[SP_OBTENER_ACTIVIDADES]    Script Date: 12/07/2018 04:39:15 p.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_OBTENER_ACTIVIDADES]
@idproyecto int
AS BEGIN
SELECT * FROM dbo.actividad a  WHERE a.idProyecto=@idproyecto
  END;
GO

---
USE [inspeccion]
GO

/****** Object:  Table [dbo].[actividad]    Script Date: 12/07/2018 04:39:36 p.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[actividad](
	[idActividad] [int] IDENTITY(1,1) NOT NULL,
	[idProyecto] [int] NULL,
	[fechaInicio] [datetime] NULL,
	[fechaFin] [datetime] NULL,
	[Descripcion] [text] NULL,
	[porcentajeReal] [int] NULL,
	[porcentajePlan] [int] NULL,
	[estado] [varchar](50) NULL,
 CONSTRAINT [PK_actividad] PRIMARY KEY CLUSTERED 
(
	[idActividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

--
USE [inspeccion]
GO

/****** Object:  StoredProcedure [dbo].[SP_BUSCA_RECURSO]    Script Date: 12/07/2018 04:41:40 p.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_BUSCA_RECURSO]
@nombre varchar(50) =null,
@cargo varchar(50) = null
AS BEGIN
 BEGIN
 SELECT * FROM dbo.empleado p where   p.Apellidos   like '%'+ @nombre+ '%' and cargo=@cargo


END
END
GO

---
USE [inspeccion]
GO

/****** Object:  StoredProcedure [dbo].[SP_INSERT_SOLICITUD]    Script Date: 12/07/2018 04:42:09 p.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_INSERT_SOLICITUD]
(
@id_proyecto int,
@id_coordinador int,
@id_inspector int,
@observacion text,
@fechaAprobacion varchar(50),
@estadoSolicitud varchar(40)
)
AS
BEGIN
Set NOCOUNT on;

Insert Into dbo.solicitud(idProyecto,idCoordinador,idInspector,Observacion,fechaAprobacion,estadoSolicitud) 
Values (@id_proyecto,@id_coordinador,@id_inspector,@observacion,@fechaAprobacion,@estadoSolicitud);

Declare @new_identity int;

SELECT @new_identity = SCOPE_IDENTITY()

return @new_identity;
END
GO

-----
USE [inspeccion]
GO

/****** Object:  StoredProcedure [dbo].[SP_OBTENER_PROGRAMADOR]    Script Date: 12/07/2018 04:42:22 p.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_OBTENER_PROGRAMADOR]
@idproyecto int
AS BEGIN
SELECT * FROM dbo.RecursoSolicitud r join dbo.empleado e ON r.idProgramador=e.idEmpleado WHERE r.idProyecto=@idproyecto
  END;
GO

----

USE [inspeccion]
GO

/****** Object:  Table [dbo].[RecursoSolicitud]    Script Date: 12/07/2018 04:44:32 p.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RecursoSolicitud](
	[idProgramador] [int] NULL,
	[idProyecto] [int] NULL
) ON [PRIMARY]

GO

----

USE [inspeccion]
GO

/****** Object:  StoredProcedure [dbo].[SP_BUSCA_RECURSO]    Script Date: 12/07/2018 04:46:01 p.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_BUSCA_RECURSO]
@nombre varchar(50) =null,
@cargo varchar(50) = null
AS BEGIN
 BEGIN
 SELECT * FROM dbo.empleado p where   p.Apellidos   like '%'+ @nombre+ '%' and cargo=@cargo


END
END
GO

----}
USE [inspeccion]
GO

/****** Object:  Table [dbo].[solicitud]    Script Date: 12/07/2018 05:10:37 p.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[solicitud](
	[idSolicitud] [int] IDENTITY(1,1) NOT NULL,
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


http://localhost:9000/api/issues/search