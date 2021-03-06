﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApiMovil.DataLayer;
using WebApiMovil.Models;

namespace WebApiMovil.BusinessLayer
{
    public class AsignarBL
    {
        private AsignarDA asignarDA;

        public AsignarBL()
        {
            asignarDA = new AsignarDA();
        }

        public Actividad actividadCRUD(Actividad entidad)
        {
            try
            {
                return asignarDA.ActividadCRUD(entidad);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public Solicitud SolicitudCRUD(Solicitud entidad)
        {
            try
            {
                return asignarDA.SolicitudCRUD(entidad);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public Recurso RecursoCRUD(Recurso entidad)
        {
            try
            {
                return asignarDA.RecursoCRUD(entidad);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public List<Empleado> ListadoProgramador(Proyecto entidad)
        {
            try
            {
                return asignarDA.ListarProgramador(entidad);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        

             public List<Actividad> ListadoAtividad(Proyecto entidad)
        {
            try
            {
                return asignarDA.ListadoAtividad(entidad);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public List<Empleado> ListadoEmpleados(Empleado entidad)
        {
            try
            {
                return asignarDA.ListadoEmpleados(entidad);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public List<Proyecto> ListadoProyectos()
        {
            try
            {
                return asignarDA.ListarProyectos();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public List<Solicitudes> buscarSolicitudes(Solicitudes entidad)
        {
            try
            {
                return asignarDA.BuscarSolicitudes(entidad);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public List<Actividades> buscarActividad(Actividades entidad)
        {
            try
            {
                return asignarDA.BuscarActividades(entidad);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public List<Proyecto> obtenerProyecto(Proyecto entidad)
        {
            try
            {
                return asignarDA.ObtenerProyectoName(entidad);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public List<Asignacion> ListadoEquiposAsignados(Asignacion entidad)
        {
            try
            {
                return asignarDA.ListadoEquiposAsignados(entidad);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public List<Ubigeo> ListarDepartamento()
        {
            try
            {
                return asignarDA.ListarDepartamento();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public List<Ubigeo> ListarProvincia(Ubigeo entidad)
        {
            try
            {
                return asignarDA.ListarProvincia(entidad);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public List<Ubigeo> ListarDistrito(Ubigeo entidad)
        {
            try
            {
                return asignarDA.ListarDistrito(entidad);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public Responsable BuscarResponsablePorDni(Responsable entidad) {
            try
            {
                return asignarDA.BuscarResponsablePorDni(entidad);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public List<Plan> ListarPlanes() {
            try
            {
                return asignarDA.ListarPlanes();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public Equipo ObtenerEquipoPorIMEI(Equipo entidad)
        {
            try
            {
                return asignarDA.ObtenerEquipoPorIMEI(entidad);
            }
            catch (Exception)
            {

                throw;
            }
        }

        public List<Trabajador> BuscarTrabajador(Trabajador entidad)
        {
            try
            {
                return asignarDA.BuscarTrabajador(entidad);
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        public List<Accesorio> ObtenerAccesorioPorIMEI(Equipo entidad)
        {
            try
            {
                return asignarDA.ObtenerAccesorioPorIMEI(entidad);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public Plan ObtenerPlanPorNroCelular(Plan entidad)
        {
            try
            {
                return asignarDA.ObtenerPlanPorNroCelular(entidad);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public Accesorio AccesorioCRUD(Accesorio entidad)
        {
            try
            {
                return asignarDA.AccesorioCRUD(entidad);
            }
            catch (Exception ex)
            {

                throw;
            }
        }


        public Asignacion AsignacionCRUD(Asignacion entidad)
        {
            try
            {
                return asignarDA.AsignacionCRUD(entidad);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public Asignacion ObtenerAsignacionPorId(Asignacion entidad)
        {
            try
            {
                return asignarDA.ObtenerAsignacionPorId(entidad);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public Accesorio ObtenerImgPorAccesorio(Accesorio entidad)
        {
            try
            {
                return asignarDA.ObtenerImgPorAccesorio(entidad);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<Equipo> ObtenerEquiposDisponiblePorIMEI(Equipo entidad)
        {
            try
            {
                return asignarDA.ObtenerEquiposDisponiblePorIMEI(entidad);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<Plan> ObtenerCelulareDisponiblePorNroCelular(Plan entidad)
        {
            try
            {
                return asignarDA.ObtenerCelulareDisponiblePorNroCelular(entidad);
            }
            catch (Exception)
            {
                throw;
            }
        }

    }
}