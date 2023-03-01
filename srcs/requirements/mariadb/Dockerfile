# Use the official Debian as a parent image
FROM debian

# Set the environment variables for MariaDB installation
# Install MariaDB and its dependencies
RUN apt-get update && \
    apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

# Copy the custom configuration file
#COPY my.cnf /etc/mysql/conf.d/

# Expose the default MySQL port
EXPOSE 3306

# Start MariaDB service
CMD ["mysqld_safe"]
