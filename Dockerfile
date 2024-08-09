# Use the official Python image from the Docker Hub
FROM python:3.11-slim

# Set environment variables to prevent Python from writing .pyc files and to ensure unbuffered output
ENV PYTHONUNBUFFERED=1

# Create and set the working directory
WORKDIR /app

# Copy the requirements file and install the dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project into the container
COPY . /app/

# Expose port 8000 to the outside world
EXPOSE 8000

# Define the command to run the application
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "taskmanager.wsgi:application"]
