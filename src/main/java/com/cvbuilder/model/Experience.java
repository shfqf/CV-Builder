/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cvbuilder.model;

/**
 *
 * @author asyashafieqaf
 */
public class Experience 
{
    private String jobTitle;
    private String companyName;
    private String duration;
    private String achievements;
    
    public Experience() {}
    
    public Experience(String jobTitle, String companyName, String duration, String achievements) 
    {
        this.jobTitle = jobTitle;
        this.companyName = companyName;
        this.duration = duration;
        this.achievements = achievements;
    }
    
    public String getJobTitle() 
    {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) 
    {
        this.jobTitle = jobTitle;
    }

    public String getCompanyName() 
    {
        return companyName;
    }

    public void setCompanyName(String companyName) 
    {
        this.companyName = companyName;
    }

    public String getDuration() 
    {
        return duration;
    }

    public void setDuration(String duration) 
    {
        this.duration = duration;
    }

    public String getAchievements() 
    {
        return achievements;
    }

    public void setAchievements(String achievements) 
    {
        this.achievements = achievements;
    }
}
