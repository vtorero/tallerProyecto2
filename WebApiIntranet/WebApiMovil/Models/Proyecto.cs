using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace WebApiMovil.Models
{
    [DataContract]
    public class Proyecto
    {
        [DataMember]
        public int codProyecto { get; set; }
        [DataMember]
        public string nombreProyecto { get; set; }
        [DataMember]
        public DateTime fechaInicio { get; set; }
        [DataMember]
        public DateTime fechaFin { get; set; }
        [DataMember]
        public string estado { get; set; }
        [DataMember]
        public DateTime fechaCreacion { get; set; }
        [DataMember]
        public string usuarioCreacion { get; set; }
        [DataMember]
        public string jefeProyecto { get; set; }
        [DataMember]
        public string Inspector { get; set; }
        [DataMember]
        public string Coordinador{ get; set; }
        [DataMember]
        public int idInspector { get; set; }
        [DataMember]
        public int idCoordinador { get; set; }
    }
}