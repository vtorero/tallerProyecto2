﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace WebApiMovil.Models
{
    
        [DataContract]
        public class Solicitudes
        {
            [DataMember]
            public int idSolicitud { get; set; }
            [DataMember]
            public int idProyecto { get; set; }
            [DataMember]
            public int idCoordinador { get; set; }
            [DataMember]
            public int idInspector { get; set; }
            [DataMember]
            public string observacion { get; set; }
            [DataMember]
            public DateTime fechaAprobacion { get; set; }
            [DataMember]
            public string estadoSolicitud { get; set; }
        [DataMember]
        public string nombreProyecto { get; set; }
        [DataMember]
        public string jefeProyecto { get; set; }
        [DataMember]
        public string coordinador { get; set; }
        [DataMember]
        public string inspector { get; set; }
    }
    }
