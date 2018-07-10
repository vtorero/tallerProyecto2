using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace WebApiMovil.Models
{
    [DataContract]
    public class Empleado:Paginacion
    {
        [DataMember]
        public int idEmpleado{ get; set; }

        [DataMember]
        public string Apellidos { get; set; }

        [DataMember]
        public string Nombres { get; set; }

        [DataMember]
        public string dni { get; set; }

        [DataMember]
        public string estado { get; set; }

        [DataMember]
        public string cargo { get; set; }

        [DataMember]
        public string tipo { get; set; }

        [DataMember]
        public DateTime fechaInicio { get; set; }

        [DataMember]
        public DateTime fechaFin { get; set; }


    }
}