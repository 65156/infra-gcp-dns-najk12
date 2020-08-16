![ci](https://github.com/ofx-com/infra-gcp-core/workflows/ci/badge.svg)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=infra-gcp-core&metric=alert_status&token=ecf6fb2772d178d90ff8f9f8b952524062ce8249)](https://sonarcloud.io/dashboard?id=ofx-com_template-sns-publisher)

# Template Repository for Multi Cloud Infrastructure Deployments
Contains the CICD pipeline and associated logic for terraform multicloud deployments; to setup a pipeline please follow the instructions.

# Current Cloud Support
- [X] AWS
- [X] GCP
- [ ] AZURE

# Instructions
1. Create a repository from this template.
2. Ensure all Pre-Requisites have been met.


# Pre-Requisites
Create the following Github Secrets:

AWS_ACCESS_KEY: Access key for a privledged account in AWS (GithubActionDeployUser)<br>
AWS_SECRET_ACCESS_KEY: Secret key for a privledged account in AWS (GithubActionDeployUser)<br>
GCP_CREDENTIALS: base64 encoded json keyfile from a privleged account with appropriate IAM roles to the organization, folder or project in Google Cloud.<br>
- Organization: ofx-infra-org-repo-sa@ofx-infrastructure.iam.gserviceaccount.com 
- Folder: TBA 
- Project: TBA 

PACKAGE_TOKEN: github personal access token used to get npm packages<br>
1. go here https://github.com/settings/tokens.
2. issue a new personal access token.
3. grant read:packages.
4. authorise SSO.

TEAMS_WEBHOOK: web uri from a MS teams webhook, used for creating alerts for Github Requests.
