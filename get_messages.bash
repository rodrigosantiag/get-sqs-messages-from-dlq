for i in {1..25}
do
  aws sqs receive-message --queue-url https://sqs.us-east-1.amazonaws.com/420458168333/platform-risk-recurring_policy-dlq --profile noverde-prd --region us-east-1 --output json --attribute-names All --message-attribute-names All --max-number-of-messages 10 --wait-time-seconds 10 > "$i".json
done
