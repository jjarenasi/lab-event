resource "aws_sqs_queue" "default" {
  name                      = "lab-sqs"

}

data "aws_caller_identity" "current" {}

resource "aws_sqs_queue_policy" "sqs_queue_policy" {
  queue_url = aws_sqs_queue.default.id
  policy    = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "__default_policy_ID",
  "Statement": [
    {
      "Sid": "__owner_statement",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
      },
      "Action": "SQS:*",
      "Resource": "${aws_sqs_queue.default.arn}"
    }
  ]
}
POLICY
}


