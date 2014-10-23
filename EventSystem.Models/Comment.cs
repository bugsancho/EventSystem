using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EventSystem.Models
{
    public class Comment
    {
        public int Id { get; set; }

        public virtual User User { get; set; }

        public virtual Event Event { get; set; }

        public string Text { get; set; }

        public DateTime Date { get; set; }
    }
}