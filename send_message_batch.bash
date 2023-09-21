# shellcheck disable=SC2006
filenames=`ls ./result_files/*.json`

for filename in $filenames
do
  aws sqs send-message-batch --queue-url https://sqs.us-east-1.amazonaws.com/420458168333/platform-risk-score_recurrent-queue --entries file://"$filename" --profile noverde-prd --region us-east-1
done
