function okawari {
  ROLE_ARN="arn:aws:iam::123456789012:role/AssumeAdmin"
  SOURCE_PROFILE="assume-admin"
  DATE=`date "+%Y%m%d-%H%M%S"`
  
  OUTPUT=`aws sts assume-role \
    --role-arn ${ROLE_ARN} \
    --role-session-name ${DATE}-session \
    --profile ${SOURCE_PROFILE} \
    --duration-seconds 3600
  `

  export AWS_ACCESS_KEY_ID=`echo $OUTPUT | jq -r .Credentials.AccessKeyId`
  export AWS_SECRET_ACCESS_KEY=`echo $OUTPUT | jq -r .Credentials.SecretAccessKey`
  export AWS_SESSION_TOKEN=`echo $OUTPUT | jq -r .Credentials.SessionToken`
  export AWS_DEFAULT_REGION="ap-northeast-1"
  export AWS_REGION="ap-northeast-1"
  export PATH=$PATH:`pwd`
}

okawari
