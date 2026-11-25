
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CV BUILDER FORM</title>
    <!-- Import Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap">
    <link rel="stylesheet" href="style.css"> 
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap');
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: 'Inter', sans-serif; background-color: #eef2f6; color: #1e293b; line-height: 1.6; padding: 40px 20px; }
        .container { max-width: 780px; background: #ffffff; padding: 40px; margin: auto; border-radius: 12px; box-shadow: 0 10px 25px rgba(15, 23, 42, 0.08); }
        .container h2 { color: #0f172a; font-size: 26px; margin-bottom: 5px; }
        .container p { color: #64748b; margin-bottom: 25px; font-size: 14px; }
        .sample-btn-container { display: flex; justify-content: flex-end; margin-bottom: 20px; }
        fieldset { border: 1px solid #e2e8f0; padding: 20px 25px; margin-bottom: 25px; border-radius: 8px; background-color: #f8fafc; }
        legend { font-weight: 700; color: #1e40af; padding: 0 10px; font-size: 15px; text-transform: uppercase; letter-spacing: 0.5px; }
        label { display: block; margin-top: 14px; margin-bottom: 6px; font-size: 13.5px; font-weight: 600; color: #334155; }
        input[type="text"], input[type="email"], textarea { width: 100%; padding: 10px 12px; border: 1px solid #cbd5e1; border-radius: 6px; font-family: inherit; font-size: 14px; background: #ffffff; transition: border-color 0.2s, box-shadow 0.2s; }
        input:focus, textarea:focus { outline: none; border-color: #2563eb; box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.15); }
        .btn-submit, .btn-sample { padding: 11px 22px; border: none; border-radius: 6px; font-size: 14px; font-weight: 600; cursor: pointer; text-decoration: none; display: inline-block; transition: all 0.2s ease; }
        .btn-submit { background-color: #1e40af; color: #ffffff; width: 100%; font-size: 15px; padding: 13px; margin-top: 10px; }
        .btn-submit:hover { background-color: #1e3a8a; }
        .btn-sample { background-color: #0d9488; color: #ffffff; }
        .btn-sample:hover { background-color: #0f766e; }
        .experience-item, .education-item {
            background: #ffffff;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            padding: 16px 18px;
            margin-top: 14px;
        }
        .experience-header, .education-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 6px;
        }
        .experience-title, .education-title {
            font-size: 14px;
            font-weight: 700;
            color: #1e293b;
        }
        .btn-remove-exp {
            background-color: #fee2e2;
            color: #b91c1c;
            border: 1px solid #fecaca;
            padding: 5px 12px;
            border-radius: 5px;
            font-size: 12.5px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.2s;
        }
        .btn-remove-exp:hover {
            background-color: #fecaca;
        }
        .btn-add-exp {
            margin-top: 14px;
            background-color: #eff6ff;
            color: #1e40af;
            border: 1px dashed #2563eb;
            padding: 9px 16px;
            border-radius: 6px;
            font-size: 13.5px;
            font-weight: 600;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.2s;
        }
        .btn-add-exp:hover {
            background-color: #dbeafe;
        }
    </style>
</head>

<body>
    <div class ="container">
        <!-- Button untuk view sample -->
        <div class="sample-btn-container">
            <a 
                href="CVServlet?action=sample" class="btn-sample">Review Sample CV
            </a>
        </div>
        
        <h2>Create Your Professional CV</h2>
        <p>Fill in your details below to generate customized curriculum vitae.</p>
      
        
        <form action="CVServlet" method="POST" >
            <!-- Personal Info -->
            <fieldset> 
                <legend> Personal Information </legend>
                
                <label> Full Name: </label> 
                <input type="text" name="fullName" required> 
                
                <label> Professional Title: </label> 
                <input type="text" name="professionalTitle" required>
                
                <label> Email: </label>
                <input type="email" name="email" required>
                
                <label> Phone Number: </label>
                <input type="text" name="phoneNumber">
                
                <label> Linked In / GitHub Link: </label>
                <input type="text" name="linkedinGithub">

                <label>Profile Summary:</label>
                <textarea name="profileSummary" rows="3"></textarea>

                <label>Address:</label>
                <input type="text" name="address">
            </fieldset>   
            
            <!-- Education -->
            <fieldset>
                <legend>Educations</legend>
                
                <div id="education-container">
                    <div class="education-item">
                        <div class="education-header">
                            <span class="education-title">
                                Education #1
                            </span>
                            <button type="button" class="btn-remove-exp" onclick="removeEducation(this)">
                                Remove
                            </button>
                        </div>
                        
                        <label>Education Level:</label>
                        <input type="text" name="highestDegree">
                        
                        <label>Institution Name:</label>
                        <input type="text" name="institutionName">

                        <label> Programme: </label>
                        <input type="text" name="programe">

                        <label> Graduation Year: </label>
                        <input type="text" name="yearOfGraduation">
                        
                        <label>Major:</label>
                        <input type="text" name="major" >
                    </div>
                </div>
                <button type="button" class="btn-add-exp" onclick="addEducation()">
                    + Add Education
                </button>
            </fieldset>
            
            <!-- Experience -->
            <fieldset>
                <legend>Experience</legend>
                
                <div id="experience-container">
                    <div class="experience-item">
                        <div class="experience-header">
                            <span class="experience-title">
                                Experience #1
                            </span>
                            <button type="button" class="btn-remove-exp" onclick="removeExperience(this)">
                                Remove
                            </button>
                        </div>
                        
                        <label>Job Title:</label>
                        <input type="text" name="jobTitle">
                        
                        <label>Company Name:</label>
                        <input type="text" name="companyName">

                        <label>Duration:</label>
                        <input type="text" name="duration">

                        <label>Achievements / Description:</label>
                        <textarea name="achievements" rows="3"></textarea>
                    </div>
                </div>
                <button type="button" class="btn-add-exp" onclick="addExperience()">
                    + Add Experience
                </button>
            </fieldset>
            
            <!-- Skills -->
            <fieldset>
            <legend>Skills</legend>
            
            <label>Technical Skills:</label>
            <input type="text" name="technicalSkills" required>

            <label>Soft Skills:</label>
            <input type="text" name="softSkills">
            </fieldset>
            
            <button type="submit" class="btn-submit">
                Generate CV
            </button>
        </form>
    </div>
    
    <script>
        function refreshExperienceLabels()
        {
            const items = document.querySelectorAll("#experience-container.experience-item");
            items.forEach((item,index) =>
            {
                const titleEl = item.querySelector(".experience-title");
                if(titleEl)
                {
                    titleEl.textContent = "Experience #" + (index + 1);
                }
            });
        }
        
        function addExperience()
        {
            const container = document.getElementById("experience-container");
            const count = container.querySelectorAll(".experience-item").length + 1;
            
            const itemDiv = document.createElement("div");
            itemDiv.className = "experience-item";
            itemDiv.innerHTML = 
            `
                <div class="experience-header">
                    <span class="experience-title">
                        Experience #\${count}
                    </span>
                    <button type="button" class="btn-remove-exp" onclick="removeExperience(this)">
                        Remove
                    </button>
                </div>
                
                <label> Job Title: </label>
                <input type="text" name="jobTitle">
            
                <label> Company Name: </label>
                <input type="text" name="companyName">

                <label> Duration: </label>
                <input type="text" name="duration" placeholder="e.g. Mar 2025 - Aug 2025">

                <label> Achievements / Description: </label>
                <textarea name="achievements" rows="3"></textarea>
            `;
    
            container.appendChild(itemDiv);
            refreshExperienceLabels();
        }
        
        function removeExperience(button)
        {
            const container = document.getElementById("experience-container");
            const items = container.querySelectorAll(".experience-item");
            const currentItem = button.closest(".experience-item");
            
            if(items.length > 1)
            {
                currentItem.remove();
                refreshExperienceLabels();
            }
            else
            {
                currentItem.querySelectorAll("input, textarea").forEach(field => field.value = "");
            }      
        }
        
         function refreshEducationLabels()
        {
            const items = document.querySelectorAll("#education-container.education-item");
            items.forEach((item,index) =>
            {
                const titleEl = item.querySelector(".education-title");
                if(titleEl)
                {
                    titleEl.textContent = "Education #" + (index + 1);
                }
            });
        }
        
        function addEducation()
        {
            const container = document.getElementById("education-container");
            const count = container.querySelectorAll(".education-item").length + 1;
            
            const itemDiv = document.createElement("div");
            itemDiv.className = "education-item";
            itemDiv.innerHTML = 
            `
                <div class="education-header">
                    <span class="education-title">
                        Education #\${count}
                    </span>
                    <button type="button" class="btn-remove-exp" onclick="removeEducation(this)">
                        Remove
                    </button>
                </div>
                
                <label> Highest Degree: </label>
                <input type="text" name="highestDegree">
            
                <label> Institution Name: </label>
                <input type="text" name="institutionName">

                <label> Programme: </label>
                <input type="text" name="programe">

                <label>Graduation Year:</label>
                <input type="text" name="yearOfGraduation">  
            
                <label>Major:</label>
                <input type="text" name="major">
            `;
    
            container.appendChild(itemDiv);
            refreshEducationLabels();
        }
        
        function removeEducation(button)
        {
            const container = document.getElementById("education-container");
            const items = container.querySelectorAll(".education-item");
            const currentItem = button.closest(".education-item");
            
            if(items.length > 1)
            {
                currentItem.remove();
                refreshEducationLabels();
            }
            else
            {
                currentItem.querySelectorAll("input, textarea").forEach(field => field.value = "");
            }      
        }
    </script>
</body>
</html>
