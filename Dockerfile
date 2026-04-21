# Use a lightweight, secure Python base image
FROM python:3.11-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy dependency file and install (leverages Docker layer caching)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the actual application code
COPY app.py .

# Tell Kubernetes which port this container listens on
EXPOSE 8080

# The command to run the application
CMD ["python", "app.py"]