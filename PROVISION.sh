#!/bin/bash

GROUP=DEVTEAM
USERS="PERSON1 PERSON2 PERSON3"

groupadd -f $GROUP

for U in $USERS; do
    id $U &>/dev/null || useradd -m -s /bin/bash $U
    usermod -s /bin/bash -aG $GROUP $U
    chage -M 60 -W 7 -d 0 $U
done

echo "#$(id -u PERSON1) ALL=(ALL) ALL" > /etc/sudoers.d/ONBOARDOPS
chmod 440 /etc/sudoers.d/ONBOARDOPS

mkdir -p /shared/project
chown root:$GROUP /shared/project
chmod 3770 /shared/project

echo "umask 0007" > /etc/profile.d/onboardops-umask.sh
chmod 644 /etc/profile.d/onboardops-umask.sh

visudo -c

echo "ONBOARDOPS SETUP COMPLETED."
