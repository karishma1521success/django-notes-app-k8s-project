# Use official Python image as the base
FROM python:3.9

# Set the working Directory in the container
WORKDIR /app/backend

# Copy only requirements.txt to leverage Docker cache
COPY requrirements.txt /app/backend

# Install dependencies
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Install app dependencies
RUN pip install mysqlclient
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire django project to the container
COPY . /app/backend/

# Expose the Django default port
EXPOSE 8000

# Run the database migrations and start the Django server
# CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]