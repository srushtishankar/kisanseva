# build_files.sh
#!/bin/bash

echo "BUILD START"

# Install dependencies
python3.9 -m pip install -r requirements.txt

# Run Django's collectstatic to gather static files
python3.9 manage.py collectstatic --noinput --clear

# Check if the staticfiles_build directory exists and contains files
if [ -d "staticfiles_build" ] && [ "$(ls -A staticfiles_build)" ]; then
    echo "BUILD END"
else
    echo "Error: staticfiles_build directory not found or empty!"
    exit 1
fi
