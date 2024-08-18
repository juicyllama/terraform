resource "aws_s3_bucket" "codepipeline_bucket" {
  count         = var.create_ci_cd ? 1 : 0
  bucket        = var.codepipeline_bucket
  force_destroy = true
}

resource "aws_s3_bucket_acl" "codepipeline_bucket_acl" {
  count                 = var.create_ci_cd ? 1 : 0
  expected_bucket_owner = var.codepipeline_expected_bucket_owner
  bucket                = aws_s3_bucket.codepipeline_bucket[count.index].id
  acl                   = "private"
  depends_on = [
    aws_s3_bucket_ownership_controls.codepipeline_bucket_acl_ownership
  ]
}

resource "aws_s3_bucket_ownership_controls" "codepipeline_bucket_acl_ownership" {
  count  = var.create_ci_cd ? 1 : 0
  bucket = aws_s3_bucket.codepipeline_bucket[count.index].id
  rule {
    object_ownership = "ObjectWriter"
  }
}
