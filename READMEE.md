# **Automated Retail Bank Deployment**

**Clone this repo to your GitHub account.**

GitHub is the source code management tool of choice. Cloning the repository makes the code available locally to be worked on. Managing codebase with SCM tools like GitHub ensures that as collaboration happens, all changes are tracked, and versions managed appropriately. This step also facilitates integration with automation tools in our CI/CD pipeline, e.g., Jenkins.

- git clone https://github.com/uzobola/Retail-Bank-Deployment-Workload-2.git

**Creating AWS Access Keys:**

Creating AWS Access Keys is an important step in deploying and managing applications on AWS because access keys ensure that only authorized users and systems have access to resources or have the appropriate permissions to perform specific operations in the environment. Also, in the case of this deployment, access keys would be required to run automated deployments in the pipeline.

**NOTE:**

Access keys are required to interact with AWS services. They help to reduce security risks by preventing unauthorized access to resources and authenticating access by verifying identity and permissions. Sharing or exposing access keys can lead to unauthorized access to resources, potential data loss, exposure of sensitive information, and compliance violations. Therefore, it is important to ensure access keys are accessed and managed securely.

### **Create an EC2 for your Jenkins Server**

AWS EC2 instances provide the resources needed for the Jenkins server. One advantage of cloud infrastructure, such as AWS's EC2, is that it allows for a cost-effective, scalable, and secure environment for running services such as the Jenkins server. Secondly, they are flexible and enable resources to be allocated based on application requirements.

Jenkins is a DevOps tool that automates the continuous building, testing, and deployment of applications in the CI/CD pipeline. Installing Jenkins ensures that any code changes are continuously integrated, tested, and deployed. By automating both essential and redundant tasks, Jenkins helps to minimize human errors, improve code quality, and enable faster development and deployment of the application.

***Steps to install Jenkins on the EC2***

```
$sudo apt update && sudo apt install fontconfig openjdk-17-jre software-properties-common && sudo add-apt-repository ppa:deadsnakes/ppa && sudo apt install python3.7 python3.7-venv
$sudo wget -O /usr/share/keyrings/jenkins-keyring.asc <https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key>
$echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" <https://pkg.jenkins.io/debian-stable> binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
$sudo apt-get update
$sudo apt-get install jenkins
$sudo systemctl start jenkins
$sudo systemctl status jenkins

```

### **Create a MultiBranch Pipeline and connect it to GitHub Repo**

**Steps to Create a Multi Branch Pipelines**

Log into Jenkins

1. Enter initial admin password
    
    b. Install suggested plugins
    
    c. Create first admin user
    
    d. Click on "New Item" in the menu on the left of the page.
    
    e. Enter a name for your pipeline
    

***Create the Multibranch pipeline***

a. Select "Multibranch Pipeline"

b. Under "Branch Sources", click "Add source" and select "GitHub"

c. Click "+ Add" and select "Jenkins"

d. Make sure "Kind" reads "Username and password"

e. Under "Username", enter your GitHub username

f. Under "Password", enter your GitHub personal access token

*Connect GitHub repository to Jenkins*

a. Enter the repository HTTPS URL and click "Validate"

b. Make sure that the "Build Configuration" section says "Mode: by Jenkinsfile" and "Script Path: Jenkinsfile"

c. Click "Save" and a build should start automatically

### **"OPTIMIZATION"**

Automated deployments improve consistency and reduces the time and effort required to push updates to production. It reduces manual intervention which reduces the likelihood of human errors.

- **Improved Code Quality:** Automated deployments ensure that only quality code is deployed which leads to better application quality.
- **Performance Monitoring:** Automating deployments can help track the health and performance of deployments so that issues are identified and resolved in time.

### **Potential Issues with Automation Deployments**

- **Security Risks:** If sensitive information e.g AWS Access keys are not properly managed, they can be exposed.
    
    **Resolution**: Use secure methods for handling sensitive information. Regularly audit and review security controls.
    
- **Integration Issues or Deployment Failures:** Issues with codebase, network problems, or configuration issues can make deployments fail.
    
    **Resolution:** Set up comprehensive monitoring and logging to detect and diagnose issues quickly.
    
    (Use tools like Prometheus and Grafana for real-time monitoring and analysis.)
    

# **Automated Retail Bank Deployment**

**Clone this repo to your GitHub account.** 

GitHub is the source code management tool of choice. Cloning the repository makes the code available locally to be worked on. Managing codebase with SCM tools like GitHub ensures that as collaboration happens, all changes are tracked, and versions managed appropriately. This step also facilitates integration with automation tools in our CI/CD pipeline, e.g., Jenkins. 

- git clone https://github.com/uzobola/Retail-Bank-Deployment-Workload-2.git

**Creating AWS Access Keys:**

Creating AWS Access Keys is an important step in deploying and managing applications on AWS because access keys ensure that only authorized users and systems have access to resources or have the appropriate permissions to perform specific operations in the environment. Also, in the case of this deployment, access keys would be required to run automated deployments in the pipeline.

**NOTE:**

Access keys are required to interact with AWS services. They help to reduce security risks by preventing unauthorized access to resources and authenticating access by verifying identity and permissions. Sharing or exposing access keys can lead to unauthorized access to resources, potential data loss, exposure of sensitive information, and compliance violations. Therefore, it is important to ensure access keys are accessed and managed securely.

### **Create an EC2 for your Jenkins Server**

AWS EC2 instances provide the resources needed for the Jenkins server. One advantage of cloud infrastructure, such as AWS's EC2, is that it allows for a cost-effective, scalable, and secure environment for running services such as the Jenkins server. Secondly, they are flexible and enable resources to be allocated based on application requirements.

Jenkins is a DevOps tool that automates the continuous building, testing, and deployment of applications in the CI/CD pipeline. Installing Jenkins ensures that any code changes are continuously integrated, tested, and deployed. By automating both essential and redundant tasks, Jenkins helps to minimize human errors, improve code quality, and enable faster development and deployment of the application.

***Steps to install Jenkins on  the EC2***

$sudo apt update && sudo apt install fontconfig openjdk-17-jre software-properties-common && sudo add-apt-repository ppa:deadsnakes/ppa && sudo apt install python3.7 python3.7-venv
$sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
$echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
$sudo apt-get update
$sudo apt-get install jenkins
$sudo systemctl start jenkins
$sudo systemctl status jenkins

### **Create a MultiBranch Pipeline and connect it to GitHub Repo**

**Steps to Create a Multi Branch Pipelines**

Log into Jenkins

1. Enter initial admin password

b.  Install suggested plugins

c. Create first admin user

d. Click on  “New Item” in the menu on the left of the page.

e. Enter a name for your pipeline

***Create the Multibranch pipeline***

a. Select "Multibranch Pipeline"

b. Under "Branch Sources", click "Add source" and select "GitHub"

c. Click "+ Add" and select "Jenkins"

d. Make sure "Kind" reads "Username and password"

e. Under "Username", enter your GitHub username

f. Under "Password" ,enter your GitHub personal access token

*Connect GitHub repository to Jenkins*

a. Enter the repository HTTPS URL and click "Validate"

b. Make sure that the "Build Configuration" section says "Mode: by Jenkinsfile" and "Script Path: Jenkinsfile"

c. Click "Save" and a build should start automatically

### **"OPTIMIZATION"**

Automated deployments improve consistency and reduces the time and effort required to push updates to production. It reduces manual intervention which reduces the likelihood  of reduces human errors.

- **Improved Code Quality:** Automated deployments ensure that only quality code is deployed which leads better application quality.
- **Performance Monitoring :** Automating deployments can help track the health and performance of deployments so that issues are identified and resolved in time.

### **Potential Issues with Automation Deployments**

- **Security Risks:** If sensitive information e.g AWS Access keys are not properly managed, they can be exposed.
    
    **Resolution**: Use secure methods for handling sensitive information. Regularly audit and review security controls.
    
- **Integration Issues or Deployment Failures**: Issues with codebase, network problems, or configuration issues can make deployments fail.
    
    **Resolution:** Set up comprehensive monitoring and logging to detect and diagnose issues quickly.
    
    (Use tools like Prometheus and  Grafana for real-time monitoring and analysis. )
