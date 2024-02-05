# EC2Triad
## Description:
It is an infrastructure-as-code (IaC) project designed to simplify the deployment of a robust and scalable web application stack on AWS EC2 instances using Terraform. This project streamlines the installation and configuration of MongoDB, Node.js, and Nginx, providing a solid foundation for your web applications.

Features:
Modular Infrastructure: Utilize Terraform to define a modular and scalable infrastructure, making it easy to adapt to changing requirements.

MongoDB: Automatic setup and configuration of MongoDB, a powerful NoSQL database, to store and manage your application's data.

Node.js: Seamless deployment of Node.js, a JavaScript runtime, allowing you to build and run scalable network applications.

Nginx: Efficient installation and configuration of Nginx as a reverse proxy, providing enhanced performance and security for your web application.

## Getting Started:
Clone the repository.
git clone https://github.com/reenubeniwal20/EC2Triad.git
cd EC2Triad
Customize your deployment in the terraform.tfvars file, specifying your AWS credentials, instance details, and any other configuration parameters.
Run Terraform to deploy the infrastructure.
Project consists of .tf files in which main.tf contains all the blocks that are necessary for launching EC2 instance using Terraform.
variable.tf file contain variable that will be called in main.tf
main.sh is bash script file which consists commands that install the node , mongo and nginx.

##  Terraform Commands
Terraform init
Terraform validate
Terraform plan
Teraform apply

## Contribution:
Contributions and feedback are welcome! If you encounter issues or have ideas for improvements, please open an issue or submit a pull request.

## License:
This project is licensed under the MIT License.

Deploy your web application stack effortlessly with EC2Triad and focus more on building amazing features for your users!
