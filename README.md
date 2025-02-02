# Dam Jeon's Miniproject

## 💿Project Introduction

+ This is a platform that matches users for language exchange. It includes essential features such as login, registration, and a bulletin board with full CRUD functionality.

## 📆Development Period

+ 2024.08.12 ~ 2024.08.20

## ⌨Languges

![Java](https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=openjdk&logoColor=white)
![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)
![Apache Tomcat](https://img.shields.io/badge/apache%20tomcat-%23F8DC75.svg?style=for-the-badge&logo=apache-tomcat&logoColor=black)
![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white)
![Oracle](https://img.shields.io/badge/Oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white)

## 🛠Edit tool

![Eclipse](https://img.shields.io/badge/Eclipse-FE7A16.svg?style=for-the-badge&logo=Eclipse&logoColor=white)
![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)

## 📈Implementation Process

1. Idea Planning
  + I developed an interest in languages and decided to create a language exchange system.
  + The actual matching was initially implemented through bulletin board posts, which reduced reliability. To improve this, basic user information such as profile pictures, self-introductions, and preferred study times is displayed. Since member information is publicly visible, only registered users can access the main page.

2. DB design
  + User table for user registration (attachments are read from the path)
  + Table for posts
  + Table for matching users (a table that matches the applicant and the person who receives the application)
  + Table for F&Q

3. HTML/CSS Implementation
  + Before implementing the JSP, use VS Code to create the overall UI (including simple functions such as buttons, page transitions, etc.)

    
4. Function Implementation
 + Convert the implemented HTML pages into JSP files using Tomcat server in Eclipse for DB data retrieval, modification, and deletion
 + Exception handling (duplicate check, empty value handling, length restrictions, permission handling (modify, delete, write), etc.)


## 🔎Page detail

https://github.com/JeonDam18/Miniproject/blob/master/src/main/webapp/WEB-INF/document/%EC%96%B8%EC%96%B4%EA%B5%90%ED%99%98%EC%8B%9C%EC%8A%A4%ED%85%9C%EB%AC%B8%EC%84%9C%EC%A0%95%EB%A6%AC.txt
