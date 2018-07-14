using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace WebApiMovil.Models
{
    [DataContract]
    public class Actividades
    {
        [DataMember]
        public int idActividad { get; set; }
        [DataMember]
        public string Descripcion { get; set; }
    }
}