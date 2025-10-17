# GitHub Pages Configuration for School Management System

## Repository Setup

This Flutter project is configured to be deployed to GitHub Pages. Here's what you need to know:

### 1. Workflow Configuration
- The deployment workflow is located at `.github/workflows/deploy.yml`
- It automatically builds and deploys the Flutter web app when changes are pushed to the `main` branch
- Built files are deployed to the `gh-pages` branch

### 2. Base HREF Setting
- The workflow sets the base href to `/school_managment_flutter/` to match GitHub's subdirectory structure
- This ensures all assets load correctly when hosted at `https://<username>.github.io/school_managment_flutter/`

### 3. Web Renderer
- The workflow builds with `--web-renderer canvaskit` for better browser compatibility
- CanvasKit provides consistent rendering across different browsers

### 4. Required GitHub Settings
After pushing these changes to your repository:

1. Go to your repository's Settings tab
2. Click on "Pages" in the left sidebar
3. Under "Source", select "Deploy from a branch"
4. Choose "gh-pages" as the branch and "/" as the folder
5. Click Save

## Deployment Process

1. Push your changes to the `main` branch
2. GitHub Actions will automatically run the deployment workflow
3. Check the Actions tab to monitor the deployment progress
4. Once complete, your site will be available at: `https://<your-username>.github.io/school_managment_flutter/`

## Troubleshooting

- If pages don't load correctly, verify that the base href in the workflow matches your repository name
- Check that GitHub Pages is enabled in your repository settings
- Verify that there are no conflicting files in the gh-pages branch