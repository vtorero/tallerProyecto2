USE [inspeccion]
GO
/****** Object:  StoredProcedure [dbo].[SP_OBTENER_EMPLEADO]    Script Date: 02/07/2018 11:41:40 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_OBTENER_EMPLEADO]
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