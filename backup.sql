USE [master]
GO
/****** Object:  Database [inspeccion]    Script Date: 03/07/2018 09:59:44 a.m. ******/
CREATE DATABASE [inspeccion]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'inspeccion', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\inspeccion.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'inspeccion_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\inspeccion_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [inspeccion] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [inspeccion].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [inspeccion] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [inspeccion] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [inspeccion] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [inspeccion] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [inspeccion] SET ARITHABORT OFF 
GO
ALTER DATABASE [inspeccion] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [inspeccion] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [inspeccion] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [inspeccion] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [inspeccion] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [inspeccion] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [inspeccion] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [inspeccion] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [inspeccion] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [inspeccion] SET  DISABLE_BROKER 
GO
ALTER DATABASE [inspeccion] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [inspeccion] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [inspeccion] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [inspeccion] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [inspeccion] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [inspeccion] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [inspeccion] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [inspeccion] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [inspeccion] SET  MULTI_USER 
GO
ALTER DATABASE [inspeccion] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [inspeccion] SET DB_CHAINING OFF 
GO
ALTER DATABASE [inspeccion] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [inspeccion] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [inspeccion] SET DELAYED_DURABILITY = DISABLED 
GO
USE [inspeccion]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Obtener_Paginacion]    Script Date: 03/07/2018 09:59:44 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_Obtener_Paginacion](
   @piPageSize       INT,
   @piCurrentPage    INT,
   @piRecordCount    INT
)
RETURNS @tabPaginacion TABLE
(
iRecordCount      INT,
iPageCount        INT,
iCurrentPage      INT,
iFilaInicial      INT,
iFilaFinal        INT
)
AS
BEGIN
   DECLARE
      @iPageCount    INT,
      @iPageIndex    INT

      Set @iPageCount = Ceiling(Cast (@piRecordCount as float) / Cast (@piPageSize as float))

      IF (@piCurrentPage > @iPageCount) 
      BEGIN
         SET @piCurrentPage = @iPageCount
      END
   
      SET @iPageIndex = @piCurrentPage - 1

      INSERT INTO @tabPaginacion(iRecordCount, iPageCount, iCurrentPage, iFilaInicial, iFilaFinal)
      SELECT 
         iRecordCount = @piRecordCount,
         iPageCount   = @iPageCount,
         iCurrentPage = @piCurrentPage,
         iFilaInicial = (@piPageSize * @iPageIndex + 1),
         iFilaFinal   = @piPageSize * (@iPageIndex + 1)

   RETURN
END


GO
/****** Object:  Table [dbo].[empleado]    Script Date: 03/07/2018 09:59:44 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleado](
	[idEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[Apellidos] [nchar](10) NULL,
	[Nombres] [nchar](10) NULL,
 CONSTRAINT [PK_empleado] PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[proyecto]    Script Date: 03/07/2018 09:59:44 a.m. ******/
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
 CONSTRAINT [PK_proyecto] PRIMARY KEY CLUSTERED 
(
	[codProyecto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_empleado]    Script Date: 03/07/2018 09:59:44 a.m. ******/
CREATE NONCLUSTERED INDEX [IX_empleado] ON [dbo].[empleado]
(
	[Apellidos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SP_OBTENER_EMPLEADO]    Script Date: 03/07/2018 09:59:44 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_OBTENER_EMPLEADO]
/*- -----   Son Parametros Opciones  -----------
@vNroSNIP					VARCHAR(50) = NULL,
@vNombrePrograma			VARCHAR(200) = NULL,
@iCodPeriodo				INT = 0,
-----------------------------------------------*/
@piPageSize					INT = NULL,
@piCurrentPage				INT = NULL,
@pvSortColumn				VARCHAR(30) = NULL,
@pvSortOrder				VARCHAR(4) = NULL
AS
BEGIN
		DECLARE
		@iRecordCount  INT,
		@iPageCount    INT,
		@iCurrentPage  INT,
		@iFilaInicial  INT,
		@iFilaFinal    INT,
		@nvSQL         NVARCHAR(MAX),
		@where		   NVARCHAR(MAX),
		@nvSQL2         NVARCHAR(MAX)

		CREATE TABLE #tmpEmpleado(
		idEmpleado	INT,
		RowNumber			INT
		)

		SET @where = ''

		--IF @vNroSNIP = '' SET @vNroSNIP = NULL
		--IF @vNombrePrograma = '' SET @vNombrePrograma = NULL

		--IF @vNroSNIP IS NOT NULL
		--BEGIN
			--SET @where = @where + ' AND P.vCodSNIP = ' + STR(@vNroSNIP)
		--END

		--IF @vNombrePrograma IS NOT NULL
		--BEGIN
		--	SET @where = @where + ' AND P.vNombreProyecto LIKE ''%'+@vNombrePrograma+'%'''
		--END

		--IF @iCodPeriodo <> 0
		--BEGIN
		--	SET @where = @where + ' AND B.iCodPeriodo = ' + STR(@iCodPeriodo)
		--END


		 --> Creación de consulta dinámica.
		SET @nvSQL = 'INSERT INTO #tmpEmpleado(idEmpleado,RowNumber) ' +
				'SELECT ' +
				' idEmpleado, ' +
				' RowNumber = ROW_NUMBER() OVER (ORDER BY ' + @pvSortColumn + ' '+@pvSortOrder+' ) ' +
				' FROM [dbo].[empleado] 
				WHERE idEmpleado > 0' + @where
				
		print @nvSQL
   
		--> Ejecución de la consulta dinámica.
		EXEC sp_executesql @nvSQL
	   
		--> Obtiene el número de registros
		SELECT @iRecordCount = COUNT(idEmpleado)
		FROM #tmpEmpleado

		--> Obtiene datos de paginación
		SELECT
			@iRecordCount  = iRecordCount,
			@iPageCount    = iPageCount,
			@iCurrentPage  = iCurrentPage,
			@iFilaInicial  = iFilaInicial,
			@iFilaFinal    = iFilaFinal
		FROM dbo.fn_Obtener_Paginacion(@piPageSize,@piCurrentPage,@iRecordCount) 

		----> Obtiene resultado de consulta.
		SET NOCOUNT OFF
		SET @nvSQL2 = 'SELECT ' + STR(@iRecordCount) + '  as iRecordCount,
			' + STR(@iPageCount) + ' as iPageCount,
			' + STR(@iCurrentPage) + ' as iCurrentPage,
			E.idEmpleado,
			Apellidos,
			Nombres
			FROM [dbo].[Empleado] E 
			INNER JOIN #tmpEmpleado TE ON E.idEmpleado= TE.idEmpleado
			WHERE TE.RowNumber BETWEEN ' + STR(@iFilaInicial) + ' AND ' + STR(@iFilaFinal)
			--AVIPA PE XD jaj
		print @nvSQL2

		EXEC sp_executesql @nvSQL2
		DROP TABLE #tmpEmpleado
END
GO
/****** Object:  StoredProcedure [dbo].[SP_OBTENER_PROYECTO]    Script Date: 03/07/2018 09:59:44 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_OBTENER_PROYECTO]
AS BEGIN
SELECT TOP 1000 [codProyecto]
      ,[nombreProyecto]
      ,[fechaInicio]
      ,[fechaFin]
      ,[estado]
      ,[fechaCreacion]
      ,[usuarioCreacion]
  FROM [inspeccion].[dbo].[proyecto]
  END;
GO
USE [master]
GO
ALTER DATABASE [inspeccion] SET  READ_WRITE 
GO
