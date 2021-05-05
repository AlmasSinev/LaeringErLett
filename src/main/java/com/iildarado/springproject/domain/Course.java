package com.iildarado.springproject.domain;


import javax.persistence.*;

@Entity
@Table(name = "course")
public class Course {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    private String name;
    private int teacher_id;
    private String description;
    private int level;
    private int specialization_id;

    private double max_pol_score;
    private double max_chl_score;
    private double max_upr_score;
    private double max_global_score;

    public Course () {

    }

    public Course(String name, int teacher_id, String description, int level, int specialization_id) {
        this.name = name;
        this.teacher_id = teacher_id;
        this.description = description;
        this.level = level;
        this.specialization_id = specialization_id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getTeacher_id() {
        return teacher_id;
    }

    public void setTeacher_id(int teacher_id) {
        this.teacher_id = teacher_id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public int getSpecialization_id() {
        return specialization_id;
    }

    public void setSpecialization_id(int specialization_id) {
        this.specialization_id = specialization_id;
    }

    public double getMax_pol_score() {
        return max_pol_score;
    }

    public void setMax_pol_score(double max_pol_score) {
        this.max_pol_score = max_pol_score;
    }

    public double getMax_chl_score() {
        return max_chl_score;
    }

    public void setMax_chl_score(double max_chl_score) {
        this.max_chl_score = max_chl_score;
    }

    public double getMax_upr_score() {
        return max_upr_score;
    }

    public void setMax_upr_score(double max_upr_score) {
        this.max_upr_score = max_upr_score;
    }

    public double getMax_global_score() {
        return max_global_score;
    }

    public void setMax_global_score(double max_global_score) {
        this.max_global_score = max_global_score;
    }
}
