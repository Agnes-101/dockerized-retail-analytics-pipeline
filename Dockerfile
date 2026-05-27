# Use the official Python image as the base image
FROM python:3.11 

# Set the working directory in the container to /app in the container linux system
WORKDIR /app

# Copy the requirements.txt file to the current working directory /app
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project directory to the current working directory 
COPY . .

# Set default command to run the ETL script when the container starts
CMD ["python", "etl/run_pipeline.py"]