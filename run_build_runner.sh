#!/bin/bash

# Function to execute commands for a Flutter package
run_flutter_commands() {
  cd "$1"
  echo "Entering directory: $1"
  flutter pub get
  dart run build_runner clean
  # Redirect stdout and stderr from build_runner to /dev/null to hide the output
  dart run build_runner build -d 
  cd "$OLDPWD"  # Return to the previous directory
  echo "Exiting directory: $1"
}

# Root directory of your Flutter project
project_root="."

# Directory containing all Flutter packages
packages_dir="$project_root/packages"

# Check if the packages directory exists
if [ ! -d "$packages_dir" ]; then
  echo "Packages directory not found."
  exit 1
fi

# Get the total number of package directories
total_packages=$(find "$packages_dir" -maxdepth 1 -type d | wc -l)

# Initialize a counter for the processed packages
processed_packages=0

# Loop through subdirectories in the packages directory
for package_dir in "$packages_dir"/*/; do
  if [ -d "$package_dir" ]; then
    run_flutter_commands "$package_dir"
    processed_packages=$((processed_packages + 1))
    
    # Calculate and display the progress percentage
    progress=$((processed_packages * 100 / total_packages))
    echo "Progress: $progress%"
  fi
done

cd "$project_root"

# Run build_runner in the root directory
dart run build_runner clean
dart run build_runner build -d 
# Get the dependencies
flutter pub get > /dev/null

echo "Script execution complete."
