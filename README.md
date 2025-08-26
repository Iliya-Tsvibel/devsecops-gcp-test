
---

```markdown
# DevSecOps GCP Test Project

This repository demonstrates a **DevSecOps-ready application** deployed on **Google Cloud Run**, fully automated with **Terraform IaC** and **GitHub Actions CI/CD**.

---

## 📂 Project Structure

```

devsecops-gcp-test/
├── app/                     # Demo Python application
│   ├── server.py
│   └── requirements.txt
├── Dockerfile               # Container definition
├── infra/                   # Terraform IaC
│   ├── main.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   ├── modules/
│   │   ├── network/         # VPC + Subnet
│   │   ├── run\_service/     # Cloud Run service
│   │   ├── app\_bucket/      # Storage bucket
│   │   └── secret\_manager/  # Secret Manager
├── .github/
│   └── workflows/
│       └── deploy.yml       # CI/CD pipeline
└── README.md

````

---

## 🚀 Components

### 1. **Infrastructure (Terraform)**
- **VPC + Subnet** (custom network `devops-vpc`, subnet `devops-subnet`).
- **Cloud Run Service** with IAM-bound Runtime Service Account.
- **Artifact Registry** for container images.
- **Storage Bucket** (`app-<project-id>`).
- **Secret Manager** (`APP_TOKEN`) injected into Cloud Run as an environment variable.

### 2. **Application**
- Minimal **Python 3 HTTP server**.
- `/healthz` endpoint for readiness probes.
- Returns `APP_TOKEN` from Secret Manager.

### 3. **CI/CD (GitHub Actions)**
- Build → Scan → Push to **Artifact Registry**.
- Deploy to **Cloud Run**.
- Upload SBOM artifact for transparency.

---

## 🛠️ Usage

### 1. **Clone**
```bash
git clone https://github.com/<your-username>/devsecops-gcp-test.git
cd devsecops-gcp-test
````

### 2. **Terraform Setup**

```bash
cd infra
terraform init
terraform plan
terraform apply -auto-approve
```

### 3. **Local Build (Optional)**

```bash
docker build -t demo-app .
docker run -p 8080:8080 -e APP_TOKEN=local-secret demo-app
```

### 4. **Deploy via GitHub Actions**

* Push to `main` branch → pipeline runs automatically.
* Final service is deployed to Cloud Run:

  ```
  https://<service-name>-<hash>.<region>.run.app
  ```

---

## 🔒 Security Highlights

* IAM least privilege (separate **deploy-sa** and **runtime-sa**).
* Secret Manager → no plaintext secrets.
* Artifact Registry with vulnerability scanning.
* Terraform remote state in GCS.

---

## 📊 What’s Implemented

✅ VPC + Subnet
✅ Cloud Run with Runtime SA
✅ GitHub Actions CI/CD pipeline
✅ Artifact Registry
✅ Secret Manager integration
✅ Storage bucket with versioning

---

## ❓ FAQ

**Q: Why Cloud Run?**
Lightweight, serverless, integrates well with GCP security.

**Q: How is secret management handled?**
Secrets are stored in GCP Secret Manager and injected into Cloud Run as env vars.

---

# 🔗 How to Share This Private Repository

Since the repository is **private**, you have several options:

### ✅ Recommended: Add Collaborators

1. Go to GitHub → **Settings → Collaborators & Teams**.
2. Click **"Add people"** → enter the interviewers’ GitHub usernames.
3. They’ll receive an **invite link by email**.

### 🔗 Option 2: Generate Invite Link

1. Go to **Settings → Collaborators**.
2. Copy the **invite link**.
3. Share it directly with the interviewers.

### 🌍 Option 3: Temporary Public Access

* In repo **Settings → Danger Zone → Change visibility → Public**.
* After interview, switch it back to **Private**.

### 📦 Option 4: Export as Archive

```bash
git archive --format=zip --output=devsecops-gcp-test.zip main
```

* Upload the `.zip` file to **Google Drive / Dropbox** and share the link.

---

## 📌 Notes

* If using option 1 or 2, make sure interviewers have a GitHub account.
* If using option 3, remember to switch back quickly after the interview.
* If using option 4, mention that **CI/CD won’t run** since GitHub Actions is disabled outside GitHub.

---

👨‍💻 Author: *Iliya*

