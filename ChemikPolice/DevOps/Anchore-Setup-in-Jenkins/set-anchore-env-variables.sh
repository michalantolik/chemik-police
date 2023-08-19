#! /bin/sh

RUN export ANCHORE_CLI_URL=http://host.docker.internal:8228/v1
RUN export ANCHORE_CLI_USER=admin
RUN export ANCHORE_CLI_PASS=foobar
RUN export ANCHORE_CLI_SSL_VERIFY=n

# IMPORTANT:
#
# - To make Anchore work, install Jenkins plugin: "Anchore Container Image Scanner Plugin"
# - ... and configure it: Manage Jenkins -> System -> Anchore
#
# - See more here: https://app.pluralsight.com/course-player?clipId=267be102-173b-4065-827f-e16f3fbb40cc
