# 📘 Online Examination System
A web-based **Online Examination System** developed using C#, ASP.NET, ADO.NET, and SQL Server to automate exam creation, management, and evaluation.

The system allows administrators to create exams and manage questions, while users can take timed tests and receive instant results.
## 🚀 Features
### 🔐 User Authentication
* Secure user Login and Signup
* Role-based access (Admin/User)
### 🛠️ Admin Panel
* Create and manage exams
* Add, update, and delete questions
* Manage user records
### 📝 Online Examination
* Timer-based exams
* Automatic submission after time completion
* Randomized or structured question display
### 📊 Result Management
* Automatic result calculation
* Instant score display
* Performance record storage
### 🗄️ Database Integration
* Data stored using SQL Server
* Database connectivity via ADO.NET
## 🧰 Technologies Used
| Technology            | Purpose                   |
| --------------------- | ------------------------- |
| **C#**                | Backend logic             |
| **ASP.NET Web Forms** | Web application framework |
| **ADO.NET**           | Database connectivity     |
| **SQL Server (SSMS)** | Database management       |
| **HTML/CSS**          | User Interface            |
| **Visual Studio**     | Development environment   |
## 🏗️ System Modules
### 👤 User (Account Module)
- Register new account
- Login to system
- Forgot password
- Verify OTP
- Reset password
### 🛡️ Admin Module
- Admin Dashboard
- Manage Exams
- Manage Questions
- View Results
- Handle Student Concerns
### 🎓 Student Module
- Student Dashboard
- Attempt Exams
- View Results
- Submit Concerns
- Submit Reviews
## 🗂️ Project Structure (Example)
OnlineExamSystem/

│

├── Account/

│   ├── Account.css

│   ├── ForgotPassword.aspx

│   ├── Login.aspx

│   ├── Register.aspx

│   ├── ResetPassword.aspx

│   ├── VerifyOTP.aspx

│   └── student-giving-exam-scaled.jpg

│

├── Admin/

│   ├── admin.css

│   ├── AdminConcerns.aspx

│   ├── AdminDashboard.aspx

│   ├── AdminResults.aspx

│   ├── ManageExams.aspx


│   └── ManageQuestions.aspx

│

├── Student/

│   ├── Student.css

│   ├── StudentConcern.aspx

│   ├── StudentDashboard.aspx

│   ├── StudentExam.aspx

│   ├── StudentResult.aspx

│   └── StudentReview.aspx

│

├── App_Code/

│   └── DBHelper.cs

│

├── Site.Master

├── Site.Master.cs

├── Site.Master.designer.cs

│

├── Styles.css

├── Web.config

│

└── OnlineExamSystem.sln
## 🎯 Project Objectives
- To automate the examination process
- To reduce manual paper-based testing
- To generate instant results
- To improve accuracy in evaluation
- To securely store examination records
## 🔮 Future Enhancements
- Mobile responsive design
- Random question generation
- Email notification system
- Result analytics dashboard
- Advanced security features
## 👨‍💻 Author
***Shrikant Ingle***
| **Bachelor of Computer Applications (BCA)**
| **Aspiring Software Developer**
## 📄 License
This project is developed for educational purposes.
