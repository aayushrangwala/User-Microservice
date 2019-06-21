#!/bin/bash
set -exou
set -o pipefail


EXPECTED_COVERAGE=80.0
COVERAGE_PROFILE=$1

function run_goCoverage() {
  echo "Running go tool coverage from profile 'coverage.out'..."
  COVERAGE_PERCENTAGE=`go tool cover -func=${COVERAGE_PROFILE} | grep 'total:' | awk '{print $3}' | sed 's/%//'`
  echo "Sending the report to Coveralls..."
  ${GOPATH}/bin/goveralls -coverprofile=coverage.out -service=local -repotoken $COVERALLS_REPO_TOKEN
  if (( ${COVERAGE_PERCENTAGE%%.*} < ${EXPECTED_COVERAGE%%.*} || ( ${COVERAGE_PERCENTAGE%%.*} == ${EXPECTED_COVERAGE%%.*} && ${COVERAGE_PERCENTAGE##*.} < ${EXPECTED_COVERAGE##*.} ) )) ; then    
    exit 1
  fi
  echo "The Code Coverage is Passed with ${COVERAGE_PERCENTAGE} Percentage!!!"
}

echo "GOPATH is set to ${GOPATH}"

run_goCoverage