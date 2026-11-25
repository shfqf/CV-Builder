/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.cvbuilder.controller;

import com.cvbuilder.model.CVBean;
import com.cvbuilder.model.Education;
import com.cvbuilder.model.Experience;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

public class CVServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        // Generate sample
        if ("sample".equals(action)) {
            CVBean sample = new CVBean();
            // Personal info
            sample.setFullName("Nor Asyashafieqaf binti Ayub");
            sample.setProfessionalTitle("Computer Science Student & Aspiring Full-Stack Developer");
            sample.setEmail("shafieqafayub@gmail.com");
            sample.setPhoneNumber("+6019-3315924");
            sample.setLinkedinGithub("github.com/shafieqafayub");
            sample.setProfileSummary("Detail-oriented and motivated final-year Computer Science student with a strong foundation "
                    + "in enterprise software engineering, full-stack web development, and relational database design. "
                    + "Experienced in architecting scalable web applications using MVC architecture, Jakarta Servlets, PHP, and SQL. "
                    + "Passionate about writing clean, maintainable code, optimizing system performance, and solving complex technical problems "
                    + "in collaborative agile environments. Seeking a challenging software engineering role to contribute practical development "
                    + "skills and drive impactful digital solutions.");
            sample.setAddress("Seksyen 4 Bandar Baru Sungai Long, Kajang, Selangor");

            // Education
            List<Education> sampleEducation = new ArrayList<>();
            sampleEducation.add(new Education
            (
                "Bachelor",
                "Universiti Teknologi MARA (UiTM)",
                "Bachelor of Computer Science (Hons.)",
                "2028",
                "Computer Science | CGPA: 3.85 (Dean's List)"
            ));
            sampleEducation.add(new Education
            (
                "Diploma",
                "Universiti Teknologi MARA (UiTM)",
                "Diploma of Computer Science (Hons.)",
                "2025",
                "Computer Science | CGPA: 3.80 (Dean's List)"
            ));
            sample.setEducation(sampleEducation);

            // Experience 
            List<Experience> sampleExperiences = new ArrayList<>();
            sampleExperiences.add(new Experience
            (
                    "Junior Software Developer Internship",
                    "Petroliam Nasional Berhad (PETRONAS)",
                    "June 2028 - August 2028",
                    "Engineered and maintained internal inventory and asset management modules using "
                    + "PHP, JavaScript, and MySQL, improving data retrieval speeds across departmental dashboards. "
                    + "Collaborated closely with senior developers and UI/UX designers to implement responsive "
                    + "front-end interfaces, normalize database schemas, and write secure SQL queries to prevent "
                    + "injection vulnerabilities. Participated in daily stand-ups, code reviews, and user acceptance "
                    + "testing (UAT) to ensure timely delivery of production-ready features."
            ));
            sampleExperiences.add(new Experience
            (
                    "Student Web & Database Developer (Academic Project)",
                    "UiTM Student Project Initiative",
                    "September 2026 - November 2026",
                    "Developed structured web applications using Jakarta Servlets, JSP, JavaBeans, PHP, and MariaDB "
                    + "following MVC architecture, input validation, and clean modular design."
            ));
            sample.setExperiences(sampleExperiences);

           
            // Skills
            sample.setTechnicalSkills("Java (Jakarta EE, Servlets, JSP), PHP, HTML5, CSS3, JavaScript, SQL (MariaDB, MySQL), "
                    + "Git & GitHub, MVC Architecture, RESTful APIs");
            sample.setSoftSkills("Analytical Problem-Solving, Agile Teamwork, Technical Documentation, Time Management");

            request.setAttribute("cvData", sample);
            RequestDispatcher dispatcher = request.getRequestDispatcher("cvView.jsp");
            dispatcher.forward(request, response);
        } 
        else 
        {
            response.sendRedirect("cvForm.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // Extract parameters
        CVBean cvBean = new CVBean();

        // Personal info
        cvBean.setFullName(request.getParameter("fullName"));
        cvBean.setProfessionalTitle(request.getParameter("professionalTitle"));
        cvBean.setEmail(request.getParameter("email"));
        cvBean.setPhoneNumber(request.getParameter("phoneNumber"));
        cvBean.setLinkedinGithub(request.getParameter("linkedinGithub"));
        cvBean.setProfileSummary(request.getParameter("profileSummary"));
        cvBean.setAddress(request.getParameter("address"));

        // Education
        String[] highestDegree = request.getParameterValues("highestDegree");
        String[] institutionName = request.getParameterValues("institutionName");
        String[] programe = request.getParameterValues("programe");
        String[] yearOfGraduation = request.getParameterValues("yearOfGraduation");
        String[] major = request.getParameterValues("major");
        
        List<Education> eduList = new ArrayList<>();
        if(highestDegree != null)
        {
            for(int i = 0; i < highestDegree.length; i++)
            {
                String deg = highestDegree[i] != null ? highestDegree[i].trim() : "";
                String inst = (institutionName != null && i < institutionName.length && institutionName[i] != null) ? institutionName[i].trim() : "";
                String prog = (programe != null && i < programe.length && programe[i] != null) ? programe[i].trim() : "";
                String year = (yearOfGraduation != null && i < yearOfGraduation.length && yearOfGraduation[i] != null) ? yearOfGraduation[i].trim() : "";
                String maj = (major != null && i < major.length && major[i] != null) ? major[i].trim() : "";
                if(!deg.isEmpty() || !inst.isEmpty() || !prog.isEmpty() || !year.isEmpty() || !maj.isEmpty())
                {
                    eduList.add(new Education(deg, inst, prog, year, maj));
                }
            }
        }
        cvBean.setEducation(eduList);
        // Experience 
        String[] jobTitles = request.getParameterValues("jobTitle");
        String[] companyNames = request.getParameterValues("companyName");
        String[] durations = request.getParameterValues("duration");
        String[] achievementsArr = request.getParameterValues("achievements");

        List<Experience> expList = new ArrayList<>();
        if (jobTitles != null) 
        {
            for (int i = 0; i < jobTitles.length; i++) 
            {
                String title = jobTitles[i] != null ? jobTitles[i].trim() : "";
                String company = (companyNames != null && i < companyNames.length && companyNames[i] != null)
                        ? companyNames[i].trim() : "";
                String dur = (durations != null && i < durations.length && durations[i] != null)
                        ? durations[i].trim() : "";
                String ach = (achievementsArr != null && i < achievementsArr.length && achievementsArr[i] != null)
                        ? achievementsArr[i].trim() : "";

                if (!title.isEmpty() || !company.isEmpty() || !dur.isEmpty() || !ach.isEmpty()) 
                {
                    expList.add(new Experience(title, company, dur, ach));
                }
            }
        }
        cvBean.setExperiences(expList);

        // Skills
        cvBean.setTechnicalSkills(request.getParameter("technicalSkills"));
        cvBean.setSoftSkills(request.getParameter("softSkills"));

        // Validate bean data
        if (cvBean.validate()) {
            request.setAttribute("cvData", cvBean);
            RequestDispatcher dispatcher = request.getRequestDispatcher("cvView.jsp");
            dispatcher.forward(request, response);
        } 
        else 
        {
            request.setAttribute("ERROR MESSAGE!", "\nPlease fill in all mandatory fields: "
                    + "Full Name, Email, Highest Degree, and Technical Skills.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("cvError.jsp");
            dispatcher.forward(request, response);
        }
    }
}