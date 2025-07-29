#!/bin/bash

echo "========== Startup script begins =========="

# Navigate to the deployment directory
cd $HOME/site/wwwroot || {
    echo "Failed to navigate to wwwroot"
    exit 1
}

echo "Current directory: $(pwd)"

# If there's a zip file, unzip it
if [ -f app.zip ]; then
    echo "Found app.zip, extracting..."
    unzip -o app.zip -d app
else
    echo "No app.zip found, skipping unzip."
fi

# Change into the app directory
cd app || {
    echo "Failed to enter app directory"
    exit 1
}

echo "Contents of app/:"
ls -la

# Start the Java application
echo "Starting Java app..."
java -jar app.jar

echo "========== Startup script ends =========="
