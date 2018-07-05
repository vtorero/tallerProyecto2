using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace WebApiMovil.Models
{[DataContract]
    public class Actividad
    {
        [DataMember]
        public int idActividad { get; set; }

        [DataMember]
        public int idProyecto { get; set; }

        [DataMember]
        public DateTime fechaInicio { get; set; }

        [DataMember]
        public DateTime fechaFin { get; set; }

        [DataMember]
        public string descripcion { get; set; }

        [DataMember]
        public int porcentajeReal { get; set; }

        [DataMember]
        public int porcentajePlan { get; set; }

        [DataMember]
        public string estado { get; set; }
    }
}