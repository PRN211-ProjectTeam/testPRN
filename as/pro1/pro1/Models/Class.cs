namespace pro1.Models
{
    public class Class
    {
        public Class()
        {
            ClassSubjects = new HashSet<ClassSubject>();
        }

        public int ClassId { get; set; }
        public string? ClassName { get; set; }

        public virtual ICollection<ClassSubject> ClassSubjects { get; set; }
    }
}
