# GitHub Pages Deployment Guide

This guide explains how to deploy your Flutter web application to GitHub Pages.

## Prerequisites

1. A GitHub account
2. A repository created for this project
3. The GitHub Actions workflow file is already set up in `.github/workflows/deploy.yml`

## Automatic Deployment

The deployment is configured to happen automatically when changes are pushed to the `main` branch:

1. When you push changes to the `main` branch, GitHub Actions will automatically:
   - Set up Flutter environment
   - Get project dependencies
   - Build the web application for production
   - Deploy the built application to GitHub Pages

## Manual Deployment Steps

If you need to trigger a manual deployment:

1. Ensure your code is committed and pushed to the `main` branch:
   ```bash
   git add .
   git commit -m "Prepare for GitHub Pages deployment"
   git push origin main
   ```

2. The GitHub Actions workflow will automatically run and deploy your app.

## Custom Domain (Optional)

If you want to use a custom domain:

1. Create a `CNAME` file in the `web` directory:
   ```
   yourdomain.com
   ```

2. Add this to your GitHub Pages settings in the repository.

## Troubleshooting

- If the page doesn't load correctly, check that the `--base-href` in the workflow matches your repository name
- Verify that GitHub Pages is enabled in your repository settings under "Pages"
- The deployed site will be available at: `https://<your-username>.github.io/<repository-name>/`

## Workflow Configuration

The workflow file `.github/workflows/deploy.yml` is already configured with:

- Flutter setup
- Dependencies installation
- Web build with CanvasKit renderer for better compatibility
- Deployment to GitHub Pages

The deployment uses the `peaceiris/actions-gh-pages` action to publish the built web app to the `gh-pages` branch.