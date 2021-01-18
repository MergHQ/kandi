# Kandi pipeline

Pipeline that compiles LaTeX, makes a PDF, uploads it to S3 and creates a release.

## Setting up for your self

1. Create a AWS S3 bucket named `kandi-state`.
2. Create a IAM role for terraform with S3 full access policy.
3. In repository secrets, set `AWS_ACCESS_KEY_ID=<access key id from aws console>` and `AWS_SECRET_ACCESS_KEY=<access secret from console>`.
4. Set repository secret `DEST_BUCKET_NAME` which is the bucket name you want terraform to create and upload the pdf to. Make sure the name is available.
5. Set `RELEASE_URL_PREFIX` which is the url entrypoint appended before the pdf name in a release `(https://${RELEASE_URL_PREFIX}/kandi-${GITHUB_SHA}.pdf)`
6. Tag with a tag name which starts with `rev`, and the pdf will be built and deployed. Check GitHub releases page for your new release.
7. Enjoy!
