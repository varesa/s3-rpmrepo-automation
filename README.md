# s3-rpmrepo-automation

A setup for creating yum/dnf RPM repositories in S3.

Cloudformation creates two S3 buckets, one for "staging" packages and one for the repos themselves.

## Staging

The staging bucket can be pushed to from arbitrary build processes without direct write access to the repository. After pushing a set of packages the build process would trigger the Concourse job that reads the staging area, uploads them to the actual repository bucket in S3 and rebuilds the metadata.

The packages pushed to the staging bucket should not contain a directory key (so no `project/my-artifact.rpm`) and should be in the root of the bucket instead.

## Repository build

The job that builds the repositories reads the RELEASE tag on the packages (e.g. `1.el7`) and uses that to determine the distribution of the package and the correct repository to place the package in.

This is normally populated by the tag `Release: <n>%{?dist}` in the RPM SPEC file.
