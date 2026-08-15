# ONBOARDOPS - RHEL Foundations

## Problem Statement

Build a standardized user and access provisioning setup for a
project team so that every new joiner receives an identical,
correctly permissioned environment.

## Environment

RHEL 10 Virtual Machine using VMware.

## Users

PERSON1
PERSON2
PERSON3

All users belong to the DEVTEAM supplementary group.

## Password Policy

Maximum password age: 60 days.
Warning period: 7 days.
Users are required to change their password at first login.

## Sudo

PERSON1 has full sudo access.

PERSON2 and PERSON3 do not have full sudo access.

Sudo configuration:

/etc/sudoers.d/ONBOARDOPS

## Shared Directory

/shared/project

Owner: root
Group: DEVTEAM

The directory uses SGID and sticky bit permissions.

## Default Permissions

umask 0007 is configured through:

/etc/profile.d/onboardops-umask.sh

This provides group collaboration while preventing access by others.

## Provisioning Script

PROVISION.sh automates the required user, group, password,
sudo, shared-directory and umask configuration.

## Verification

Verification results are stored in:

verification.txt

Commands used during the project are recorded in:

commands.txt