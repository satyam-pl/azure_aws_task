package com.task.demo.repo;


import org.springframework.data.jpa.repository.JpaRepository;

import com.task.demo.Entity.Feedback;

public interface Repo extends JpaRepository<Feedback, Long> {
    // Custom queries or methods if needed
}
