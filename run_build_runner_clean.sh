#!/bin/bash

# Function to clean a Flutter package
clean_flutter_package() {
  local package_dir="$1"
  cd "$package_dir"
  echo "Cleaning package in directory: $package_dir"
  fvm flutter clean > /dev/null 2>&1
  fvm flutter pub get > /dev/null 2>&1
  cd "$OLDPWD"  # Return to the previous directory
  echo "Package cleaned: $package_dir"
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

# Initialize a counter for the cleaned packages
cleaned_packages=0

# Loop through subdirectories in the packages directory and clean each package
for package_dir in "$packages_dir"/*/; do
  if [ -d "$package_dir" ]; then
    clean_flutter_package "$package_dir"
    cleaned_packages=$((cleaned_packages + 1))
    
    # Calculate and display the progress percentage
    progress=$((cleaned_packages * 100 / total_packages))
    echo "Progress: $progress%"
  fi
done

fvm flutter clean > /dev/null 2>&1
fvm flutter pub get > /dev/null 2>&1

echo "All packages cleaned."
