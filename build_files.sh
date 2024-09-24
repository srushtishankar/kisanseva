# build_files.sh
echo "BUILD START"
python3.9 -m pip install -r requirements.txt
python3.9 manage.py collectstatic --noinput --clear

# Ensure the directory exists
if [ ! -d "staticfiles_build" ]; then
    echo "Error: staticfiles_build directory not found!"
    exit 1
fi

echo "BUILD END"
