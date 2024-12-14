# **Active Directory Home Lab Setup**

## **Overview**
This project documents the setup of an **Active Directory (AD) environment** on VirtualBox using **Windows Server 2022** as the Domain Controller and **Windows 10** as a client. The goal is to simulate a real-world IT environment to gain hands-on experience with system administration, networking, and AD configuration.

## **Features**
- Setup of a Windows Server 2022 as the AD Domain Controller.
- Configuration of a Windows 10 client to join the AD domain.
- Implementation of networking, RAS/NAT, DHCP, and DNS configurations.
- Automated user creation using PowerShell scripts.
- Hands-on exploration of Active Directory features like domain user management and group policies.

## **Purpose**
This project demonstrates practical skills in:
- IT infrastructure design and implementation.
- Windows Server and Active Directory configuration.
- Networking concepts and troubleshooting.

It serves as both a self-learning exercise and a portfolio project for recruiters and employers.

## **Requirements**
### **Hardware**
- Host machine with:
  - Quad-core CPU.
  - 8 GB RAM (4 GB for the host, 4 GB for VMs).
  - 50 GB free storage.

### **Software**
- [Oracle VirtualBox](https://www.virtualbox.org/): Virtualization platform.
- [Windows Server 2022 ISO](https://www.microsoft.com/en-us/evalcenter): Evaluation version.
- [Windows 10 ISO](https://www.microsoft.com/en-us/software-download/windows10): Installation media.

## **Setup Guide**
### **1. Virtual Machine Setup**
- Install VirtualBox and create two VMs:
  - **Domain Controller (DC)**: Windows Server 2022.
  - **Client Machine**: Windows 10.

### **2. Windows Server Configuration**
- Install Windows Server with the **Desktop Experience**.
- Configure networking with dual NICs:
  - Public-facing network for internet access.
  - Internal network for private communication.
- Install **Guest Additions** for performance optimization.
- Rename the server to `DC1`.

### **3. Active Directory Domain Services (AD-DS)**
- Install and configure AD-DS on `DC1`.
- Set up a new forest and domain.
- Create and configure a domain admin account.

### **4. Networking Services**
- **RAS/NAT**: Configure Remote Access Server for internal clients to access the internet.
- **DHCP**: Set up DHCP scope for automatic IP assignments in the internal network.

### **5. Automated User Creation**
- Use PowerShell scripts to:
  - Generate users with specified naming conventions.
  - Create organizational units dynamically.

### **6. Windows 10 Client Configuration**
- Join the client machine to the AD domain.
- Test connectivity and user authentication.

## **Testing and Validation**
- Verify the AD domain functionality by logging in with created user accounts.
- Ensure network connectivity between the client and domain controller.

## **Future Enhancements**
- Explore Group Policies for centralized management.
- Implement additional services like file sharing or printer management.
- Add redundancy with a second domain controller.

## **References**
- [Josh Madakor’s AD Setup Video](https://www.youtube.com/watch?v=MHsI8hJmggI)
- [Windows Server 2022 Evaluation Center](https://www.microsoft.com/en-us/evalcenter)
- [VirtualBox Official Site](https://www.virtualbox.org/)
