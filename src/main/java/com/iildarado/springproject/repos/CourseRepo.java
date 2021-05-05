package com.iildarado.springproject.repos;

import com.iildarado.springproject.domain.Course;
import org.springframework.data.repository.CrudRepository;

public interface CourseRepo extends CrudRepository<Course, Long> {
}
