#!/bin/bash
__create_user() {
  # Create a user to SSH into as.
  useradd tomcat
  SSH_USERPASS=tomcat
  echo -e "$SSH_USERPASS\n$SSH_USERPASS" | (passwd --stdin tomcat)
  echo ssh tomcat password: $SSH_USERPASS
}

__add_user_to_sudoers() {
  echo "tomcat ALL=(ALL:ALL) NOPASSWD: ALL" | (EDITOR="tee -a" visudo)
}

# Call all functions
__create_user
__add_user_to_sudoers
