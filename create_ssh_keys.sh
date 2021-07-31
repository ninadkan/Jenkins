#!/bin/bash
# this is old version
# ssh-keygen -f remote-key

# new version, as of 31 July 2021 from https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent is as following

email_address="youremailaddress@address.com"
ssh-keygen -t ed25519 -C $email_address

# if the above does not work, then use the following

# ssh-keygen -t rsa -b 4096 -C $email_address
