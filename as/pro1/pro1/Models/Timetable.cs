﻿namespace pro1.Models
{
    public class Timetable
    {
        public int TimetableId { get; set; }
        public int ClassSubjectId { get; set; }
        public int DayOfWeek { get; set; }
        public int TimeSlot { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }

        public virtual ClassSubject? ClassSubject { get; set; }
    }
}
