
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucketjim.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = "*",
        Action = [
          "s3:GetObject"
        ],
        Resource = "${aws_s3_bucket.bucketjim.arn}/*"
      },
      {
        Sid = "PublicListBucket"
        Effect = "Allow"
        Principal = "*"
        Action = [
          "s3:ListBucket"
        ],
        Resource = "${aws_s3_bucket.bucketjim.arn}"
      }
    ]
  })
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.bucketjim.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
