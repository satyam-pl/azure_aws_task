package com.task.demo.Controller;


import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.task.demo.Entity.Feedback;
import com.task.demo.repo.Repo;

@RestController
public class FeedbackComtroller {

    @Autowired
    private Repo repository;

    @PostMapping("/submit-feedback")
    public String submitFeedback(
            @RequestParam String name,
            @RequestParam String email,
            @RequestParam String course,
            @RequestParam String feedback
    ) {
        Feedback userFeedback = new Feedback();
        userFeedback.setName(name);
        userFeedback.setEmail(email);
        userFeedback.setCourse(course);
        userFeedback.setFeedback(feedback);
        repository.save(userFeedback); // Save feedback into the database

        return "Your Feedback is submitted successfully"; // Redirect to a thank you page or another confirmation page
    }
}
