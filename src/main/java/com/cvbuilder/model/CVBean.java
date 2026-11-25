/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package com.cvbuilder.model;
import java.util.ArrayList;
import java.util.List;
public class CVBean 
{
    // Personal Info
    private String fullName;
    private String professionalTitle;
    private String email;
    private String phoneNumber;
    private String linkedinGithub;
    private String profileSummary;
    private String address;

    // Education
    private List<Education> education = new ArrayList<>();

    // Experience
    private List<Experience> experiences = new ArrayList<>();
    
    // Skills
    private String technicalSkills;
    private String softSkills;

    // Default Constructor
    public CVBean() {}

    // Getters and Setters fullname
    public String getFullName()
    {
        return fullName;
    }
    
    public void setFullName(String fullName)
    {
        this.fullName = fullName;
    }

    // Getters and Setters professionalTitle
    public String getProfessionalTitle()
    {
        return professionalTitle;
    }
    
    public void setProfessionalTitle(String professionalTitle)
    {
        this.professionalTitle = professionalTitle;
    }
    
    // Getters and Setters email
    public String getEmail()
    {
        return email;
    }
    
    public void setEmail(String email)
    {
        this.email = email;
    }
    
    // Getters and Setters phoneNumber
    public String getPhoneNumber()
    {
        return phoneNumber;
    }
    
    public void setPhoneNumber(String phoneNumber)
    {
        this.phoneNumber = phoneNumber;
    }
    
    // Getters and Setters linkedinGithub
    public String getLinkedinGithub()
    {
        return linkedinGithub;
    }
    
    public void setLinkedinGithub(String linkedinGithub)
    {
        this.linkedinGithub = linkedinGithub;
    }
    
    // Getters and Setters profileSummary
    public String getProfileSummary()
    {
        return profileSummary;
    }
    
    public void setProfileSummary(String profileSummary)
    {
        this.profileSummary = profileSummary;
    }
    
    // Getters and Setters address
    public String getAddress()
    {
        return address;
    }
    
    public void setAddress(String address)
    {
        this.address = address;
    }

    // Getter, setter and adder education
    public List<Education> getEducation()
    {
        return education;
    }
    
    public void setEducation(List<Education> education) 
    {
        this.education = education;
    }

    public void addEducation(Education education)
    {
        if(this.education == null)
        {
            this.education = new ArrayList<>();
        }
        this.education.add(education);
    }
    
    // Getter, setter and adder experiences
    public List<Experience> getExperiences() 
    {
        return experiences;
    }
    
    public void setExperiences(List<Experience> experiences)
    {
        this.experiences = experiences;
    }
    
    public void addExperience(Experience experience)
    {
        if(this.experiences == null)
        {
            this.experiences = new ArrayList<>();
        }
        this.experiences.add(experience);
    }
    
    // Getters and Setters technicalSkills
    public String getTechnicalSkills()
    {
        return technicalSkills;
    }
    
    public void setTechnicalSkills(String technicalSkills)
    {
        this.technicalSkills = technicalSkills;
    }
    
    // Getters and Setters softSkills
    public String getSoftSkills()
    {
        return softSkills;
    }

    public void setSoftSkills(String softSkills)
    {
        this.softSkills = softSkills;
    }
    
        // Validation Method (Mandatory: Name, Email, Degree, Skills)
    public boolean validate() 
    {
        if (fullName == null || fullName.trim().isEmpty()) 
        {
            return false;
        }
        
        if (email == null || email.trim().isEmpty()) 
        {
            return false;
        }
        
        if (technicalSkills == null || technicalSkills.trim().isEmpty()) 
        {
            return false;
        }
        
        if (education == null || education.isEmpty()) 
        {
            return false;
        }
        boolean hasDegree = false;
        for(Education edu : education)
        {
            if(edu != null && edu.getHighestDegree() != null 
                    && !edu.getHighestDegree().trim().isEmpty())
            {
                hasDegree = true;
                break;
            }
        }
        return hasDegree;
    }

}