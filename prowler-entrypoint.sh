#!/bin/bash
set -e

cd ../aws-cis-security-benchmark
./prowler | ansi2html -la > /reports/prowler-report.html
