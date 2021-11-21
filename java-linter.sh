#!/bin/bash

# chmod +x java-linter.sh

# Runs Checkstyle linter
java -jar ~/scripts/checkstyle.jar -c ~/scripts/mr-coxall_checks.xml ./*.java
  
