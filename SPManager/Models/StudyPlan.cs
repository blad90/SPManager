//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SPManager.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class StudyPlan
    {
        public int SPID { get; set; }
        [Display(Name ="Content")]
        public string ContentDesc { get; set; }
        public string Status { get; set; }
        public Nullable<int> Program { get; set; }
    
        public virtual Program Program1 { get; set; }
    }
}
