package com.iildarado.springproject.repos;

import com.iildarado.springproject.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepo extends JpaRepository<User, Long> {
    User findByFirstname(String username);

}
