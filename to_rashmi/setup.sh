#!/bin/bash

echo "Checking jre ......"
java -version

output=$((java -version) 2>&1)

if type -p java; then
  echo found java executable in PATH
  _java=java
elif [[ -n "$JAVA_HOME" ]] && [[ -x "$JAVA_HOME/bin/java" ]]; then
  echo found java executable in JAVA_HOME
  _java="$JAVA_HOME/bin/java"
else
  echo "no java"
fi

if [[ "$_java" ]]; then
  version=$("$_java" -version 2>&1 | awk -F '"' '/version/ {print $2}')
  echo version "$version"
  if [[ "$version" > "1.5" ]]; then
    echo version is more than 1.5
  else
    echo version is less than 1.5
  fi
else
  sudo apt-get update
  sudo apt-get install default-jre
  if type -p java; then
    echo found java executable in PATH
    _java=java
  elif [[ -n "$JAVA_HOME" ]] && [[ -x "$JAVA_HOME/bin/java" ]]; then
    echo found java executable in JAVA_HOME
    _java="$JAVA_HOME/bin/java"
  else
    echo "no java"
  fi
  if [[ "$_java" ]]; then
    version=$("$_java" -version 2>&1 | awk -F '"' '/version/ {print $2}')
    echo version "$version"

    echo "java installation complete....."
  fi

fi

cd kafka_2.11-2.1.0

chmod +x kafkasetup.py

python kafkasetup.py

chmod +x input2.sh

gnome-terminal  --tab -e "/bin/bash -c './input2.sh; exec /bin/bash -i'"


