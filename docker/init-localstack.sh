#!/bin/bash
set -e

echo "Inicializando recursos AWS no LocalStack..."

# Cria a fila SQS
awslocal sqs create-queue \
    --queue-name minha-fila \
    --region us-east-1

echo "Fila SQS 'minha-fila' criada."

# Cria a tabela DynamoDB
awslocal dynamodb create-table \
    --table-name nome-da-tabela \
    --attribute-definitions AttributeName=event_id,AttributeType=S \
    --key-schema AttributeName=event_id,KeyType=HASH \
    --billing-mode PAY_PER_REQUEST \
    --region us-east-1

echo "Tabela DynamoDB 'nome-da-tabela' criada."
echo "LocalStack inicializado com sucesso."
