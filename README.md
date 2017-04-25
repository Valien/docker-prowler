# docker-prowler
Dockerized Prowler: AWS CIS Benchmark Tool

This Docker repo is for building a running container that will automatically run the default Prowler ruleset through AWS and push out the report file for local viewing.

A few pre-requisites to get this to work properly:

* You need your AWS credentials. See this http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html to set it up. You do not have to have AWS CLI installed on your system but for this container to work you will need to have the config and credentials file ready to be read.
* Once your AWS creds are ready then run this command:

    `docker run --rm -v <path to your credentials>/.aws/:/root/.aws:ro -v <path to where you want to have reports dumped>:/reports:rw valien/docker-prowler`

    What this does is run the docker image (or pulls it if you don't have it cached), then mounts your aws credentials to the container. Runs the `prowler` script, outputs the prowler-report.html and then tears down the container upon finishing.

    You can view the full Dockerfile and the `entrypoint.sh` file in the source code if you have any questions about what is running and how it is working.

* Optional: You can use the environment variable `-e AWS_PROFILE=<your AWS profile> -e AWS_REGION=<your AWS region>` to pass along a different set of AWS credentials. If one is not provided then Prowler will use the `default` profile and `us-east-1` region.

* One thing, this script takes a while to run. The bigger your AWS instance the longer it will take to run. By default it runs against your whole AWS account but you can start the container manually to run some CLI options to run against certain groups or regions. A to-do is to add that functionality to the Docker run command.

The following repos were used in the build of this image:

* https://github.com/Alfresco/aws-cis-security-benchmark - Prowler application
* https://github.com/anigeo/docker-awscli - for docker run parameters


