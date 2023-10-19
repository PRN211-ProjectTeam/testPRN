namespace pro1.Models
{
    public class Student
    {
        public Student()
        {
            StudentEnrollments = new HashSet<StudentEnrollment>();
        }

        public int StudentId { get; set; }
        public string? StudentName { get; set; }
        public string? Username { get; set; }
        public string? Password { get; set; }

        public virtual ICollection<StudentEnrollment> StudentEnrollments { get; set; }
    }
}
