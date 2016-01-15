
# http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/VMImportPrerequisites.html#vmimport-limitations
#

aws iam create-role --role-name vmimport --assume-role-policy-document file://trust-policy.json
aws iam put-role-policy --role-name vmimport --policy-name vmimport --policy-document file://role-policy.json
aws s3 mb s3://bmoritz-import
aws s3 cp Debian-8.2.0.ova s3://bmoritz-import/
aws ec2 import-image --cli-input-json "{  \"Description\": \"Debian 8.2.0 OVA\", \"DiskContainers\": [ { \"Description\": \"First CLI task\", \"UserBucket\": { \"S3Bucket\": \"bmoritz-import\", \"S3Key\" : \"Debian-8.2.0.ova\" } } ]}"
