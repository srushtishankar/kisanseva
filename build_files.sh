# build_files.sh
echo "BUILD START"

# Install dependencies
python3.9 -m pip install -r requirements.txt

# Run collectstatic and show output for debugging
echo "Running collectstatic..."
python3.9 manage.py collectstatic --noinput --clear
echo "collectstatic command completed"

# List the contents of the staticfiles_build directory to verify
echo "Checking contents of staticfiles_build directory..."
ls -l staticfiles_build

# Check if the staticfiles_build directory exists and contains files
if [ -d "staticfiles_build" ] && [ "$(ls -A staticfiles_build)" ]; then
    echo "BUILD END"
else
    echo "Error: staticfiles_build directory not found or empty!"
    exit 1
fi
