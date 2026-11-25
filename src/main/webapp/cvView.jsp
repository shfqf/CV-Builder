<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.cvbuilder.model.CVBean" %>
<%@ page import="com.cvbuilder.model.Experience" %>
<%@ page import="com.cvbuilder.model.Experience" %>
<%@ page import="com.cvbuilder.model.Education" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CV Preview - <%= ((CVBean)request.getAttribute("cvData")).getFullName() %></title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap">
<style>
        * { 
            box-sizing: border-box; 
            margin: 0; 
            padding: 0; 
        }
        
        body { 
            font-family: 'Inter', sans-serif; 
            /* Latar belakang halaman biru lembut */
            background: linear-gradient(135deg, #dbeafe 0%, #bfdbfe 100%);
            color: #1e3a8a; 
            line-height: 1.6; 
            padding: 40px 20px; 
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }
        
        /* Bekas Utama Kertas A4 CV */
        .preview-cv {
            width: 100%;
            max-width: 850px;
            background: #ffffff;
            margin: auto;
            border-radius: 12px;
            box-shadow: 0 20px 45px rgba(30, 58, 138, 0.18);
            overflow: hidden;
            border: 1px solid #93c5fd;
        }

        .cv-container-layout {
            display: grid;
            grid-template-columns: 270px 1fr; 
            min-height: 1050px;
        }

        /* Sidebar Sebelah Kiri - Tema Royal Blue & Navy */
        .cv-sidebar {
            background: linear-gradient(180deg, #1e3a8a 0%, #1d4ed8 100%);
            color: #ffffff;
            padding: 45px 28px;
        }

        .sidebar-section {
            margin-bottom: 32px;
        }

        .sidebar-section h3 {
            font-size: 11.5px;
            text-transform: uppercase;
            letter-spacing: 1.8px;
            color: #93c5fd;
            border-bottom: 1px solid rgba(191, 219, 254, 0.3);
            padding-bottom: 8px;
            margin-bottom: 16px;
            font-weight: 700;
        }

        .contact-item {
            font-size: 13px;
            color: #eff6ff;
            margin-bottom: 12px;
            word-break: break-word;
            display: flex;
            align-items: flex-start;
            gap: 8px;
            line-height: 1.5;
        }

        .sidebar-section strong {
            color: #ffffff !important;
            font-size: 12.5px !important;
            letter-spacing: 0.3px;
            display: block;
            margin-bottom: 6px;
        }

        .sidebar-section p {
            color: #eff6ff !important;
            font-size: 12.5px !important;
            line-height: 1.6;
            background: rgba(255, 255, 255, 0.12);
            padding: 10px 12px;
            border-radius: 6px;
            border-left: 3px solid #60a5fa;
        }

        /* Kandungan Utama Sebelah Kanan */
        .cv-main-container {
            background-color: #ffffff;
            color: #1e293b;
            padding: 45px 40px;
        }

        .cv-main-header {
            margin-bottom: 30px;
            border-bottom: 2px solid #dbeafe;
            padding-bottom: 20px;
            position: relative;
        }

        .cv-main-header::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 80px;
            height: 3px;
            background-color: #2563eb;
            border-radius: 2px;
        }

        .cv-main-header h1 {
            font-size: 30px;
            font-weight: 800;
            color: #1e3a8a;
            letter-spacing: -0.6px;
            line-height: 1.2;
            margin-bottom: 6px;
            text-transform: uppercase;
        }

        .cv-main-header h3 {
            font-size: 15px;
            font-weight: 600;
            color: #2563eb;
            letter-spacing: 0.4px;
        }

        .cv-section {
            margin-bottom: 28px;
        }

        .cv-section h3 {
            font-size: 12.5px;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            color: #1e3a8a;
            border-bottom: 1.5px solid #dbeafe;
            padding-bottom: 6px;
            margin-bottom: 14px;
            font-weight: 700;
            display: flex;
            align-items: center;
        }

        .cv-section h3::before {
            content: '';
            display: inline-block;
            width: 8px;
            height: 8px;
            background-color: #3b82f6;
            border-radius: 2px;
            margin-right: 8px;
        }

        .cv-section p {
            font-size: 13.5px;
            color: #334155;
            line-height: 1.65;
            text-align: justify;
        }

        .item-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 4px;
            gap: 10px;
        }

        .item-title {
            font-weight: 700;
            font-size: 15px;
            color: #172554;
        }

        .item-date {
            font-size: 11.5px;
            font-weight: 600;
            color: #1d4ed8;
            background-color: #dbeafe;
            padding: 3px 10px;
            border-radius: 20px;
            white-space: nowrap;
        }

        .item-subtitle, .item-subtaitle {
            font-size: 13.5px;
            color: #2563eb;
            font-weight: 600;
            margin-bottom: 8px;
        }

        /* Action Bar */
        .action-bar {
            grid-column: 2;
            padding: 10px 40px 35px 40px;
            background: #ffffff;
            border-top: none;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            gap: 12px;
        }

        .btn-back, .btn-print {
            padding: 11px 22px;
            border: none;
            border-radius: 8px;
            font-size: 13.5px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            transition: all 0.2s ease;
        }

        .btn-print { 
            background-color: #1d4ed8; 
            color: #ffffff; 
            box-shadow: 0 4px 12px rgba(29, 78, 216, 0.28);
        }
        .btn-print:hover { 
            background-color: #1e40af; 
            transform: translateY(-1px);
            box-shadow: 0 6px 16px rgba(30, 64, 175, 0.38);
        }

        .btn-back { 
            background-color: #ffffff; 
            color: #1e40af; 
            border: 1px solid #93c5fd;
        }
        .btn-back:hover { 
            background-color: #dbeafe; 
            color: #172554;
        }

        @media print {
            body { 
                background: #ffffff; 
                padding: 0; 
            }
            .preview-cv { 
                box-shadow: none; 
                border: none;
                border-radius: 0;
                max-width: 100%; 
                margin: 0; 
            }
            .cv-container-layout {
                min-height: 100vh;
            }
            .cv-sidebar { 
                background: linear-gradient(180deg, #1e3a8a 0%, #1d4ed8 100%) !important; 
                -webkit-print-color-adjust: exact; 
                print-color-adjust: exact; 
            }
            .item-date {
                background-color: #dbeafe !important;
                -webkit-print-color-adjust: exact; 
                print-color-adjust: exact; 
            }
            .no-print { 
                display: none !important; 
            }
        }
    </style>
</head>
<body>

<%
    CVBean cv = (CVBean) request.getAttribute("cvData"); //GET DATA USING REQUEST
    if(cv == null)
    {
        response.sendRedirect("cvForm.jsp");//IF NULL, REDIRECT TO CVFORM TO INPUT DATA
        return;
    }
%>

<div class="preview-cv">
    <div class="cv-container-layout">
        
        <!-- LEFT SIDEBAR -->
        <div class="cv-sidebar">
            <div class="sidebar-section">
                <h3> Contact </h3>
                <div class="contact-item">
                    📍 <%= cv.getAddress() %>
                </div>
                <div class="contact-item">
                    📞 <%= cv.getPhoneNumber() %>
                </div>
                <div class="contact-item">
                    📧 <%= cv.getEmail() %>
                </div>
                <div class="contact-item">
                    🔗 <%= cv.getLinkedinGithub() %>
                </div>
            </div>
                
            <div class="sidebar-section">
                <h3> Skills </h3>
                <div style="margin-bottom: 10px;">
                    <strong style="font-size: 11.5px; color: #1e293b;">
                        Technical:
                    </strong>
                    <p style="font-size: 12px; color: #475569; margin-top: 2px;">
                        <%= cv.getTechnicalSkills() %>
                    </p>
                    <strong style="font-size: 11.5px; color: #1e293b;">
                        Soft Skills:
                    </strong>
                    <p style="font-size: 12px; color: #475569; margin-top: 2px;">
                        <%= cv.getSoftSkills() %>
                    </p>
                </div>
            </div>
        </div>
        
        <!-- RIGHT SIDE -->
        <div class="cv-main-container">
            <div class="cv-main-header">
                <h1> <%= cv.getFullName() %> </h1>
                <h3> <%= cv.getProfessionalTitle() %> </h3>
            </div>
            <div class="cv-section">
                <h3>Experience</h3>
                <%
                    List<Experience> experienceList = cv.getExperiences();
                    if (experienceList != null && !experienceList.isEmpty()) 
                    {
                        for (Experience exp : experienceList) 
                        {
                %>
                    <div class="experience-entry">
                        <div class="item-header">
                            <span class="item-title">
                                <%= exp.getJobTitle() != null ? exp.getJobTitle() : "" %>
                            </span>
                        
                            <% if (exp.getDuration() != null && !exp.getDuration().trim().isEmpty()) { %>
                                <span class="item-date">
                                    <%= exp.getDuration() %>
                                </span>
                            <%} %>
                        </div>

                        <div class="item-subtitle">
                            <%= exp.getCompanyName() != null ? exp.getCompanyName() : "" %>
                        </div>

                        <% if (exp.getAchievements() != null && !exp.getAchievements().trim().isEmpty()) { %>
                            <p>
                                <%= exp.getAchievements() %>
                            </p>
                        <% } %>
                    </div>
                <%
                        }
                    } 
                    else 
                    {
                        %>
                            <p>
                                No experience provided.
                            </p>
                        <%
                            }
                        %>
            </div>
            
<div class="cv-section">
    <h3>Educational Details</h3>
    <%
        List<Education> educationList = cv.getEducation();
        if (educationList != null && !educationList.isEmpty()) {
            for (Education edu : educationList) {
    %>
        <div class="experience-entry">
            <div class="item-header">
                <span class="item-title">
                    <%= edu.getHighestDegree() != null ? edu.getHighestDegree() : "" %>
                </span>
                <% if (edu.getYearOfGraduation() != null && !edu.getYearOfGraduation().trim().isEmpty()) { %>
                    <span class="item-date">
                        <%= edu.getYearOfGraduation() %>
                    </span>
                <% } %>
            </div>

            <div class="item-subtitle">
                <%= edu.getInstitutionName() != null ? edu.getInstitutionName() : "" %>
                <%= edu.getPrograme() != null ? edu.getPrograme() : "" %>
            </div>

            <% if (edu.getMajor() != null && !edu.getMajor().trim().isEmpty()) { %>
                <p>Major: <%= edu.getMajor() %></p>
            <% } %>
        </div>
    <%
            }
        } else {
    %>
        <p>No educational details provided.</p>
    <%
        }
    %>
</div>
        </div>
        <div class="action-bar no-print">
            <button type="button" onclick="window.print()" class="btn-print">
                Print / Save in PDF
            </button>
            <a href="cvForm.jsp" class="btn-back">
               Back 
            </a>
        </div>         
    </div>
</div>
</body>
</html>