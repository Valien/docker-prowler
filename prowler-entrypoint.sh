#!/bin/bash
set -e

cd ../aws-cis-security-benchmark
./prowler -p $AWS_PROFILE -r $AWS_REGION | ansi2html -la > /reports/prowler-report.html
