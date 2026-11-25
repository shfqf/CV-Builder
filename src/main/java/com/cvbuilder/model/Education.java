/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cvbuilder.model;

/**
 *
 * @author asyashafieqaf
 */
public class Education 
{
    private String highestDegree;
    private String institutionName;
    private String programe;
    private String yearOfGraduation;
    private String major;
    
    public Education()
    {
        
    }
    
    public Education(String highestDegree, String institutionName, String programe, String yearOfGraduation, String major)
    {
        this.highestDegree = highestDegree;
        this.institutionName = institutionName;
        this.programe = programe;
        this.yearOfGraduation = yearOfGraduation;
        this.major = major;
    }
    
    public String getHighestDegree()
    {
        return highestDegree;
    }
    
    public String getInstitutionName()
    {
        return institutionName;
    }
    
    public String getPrograme()
    {
        return programe;
    }
    
    public String getYearOfGraduation()
    {
        return yearOfGraduation;
    }
    
    public String getMajor()
    {
        return major;
    }
}
