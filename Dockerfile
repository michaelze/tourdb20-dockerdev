FROM michaelze/tourdb20-dockerbase:latest

RUN apt-get update && \
    apt-get install -y \
        gnupg \
        git \
        zip \
        unzip \
        wget && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs

COPY composer-installer.sh /tmp/

# sleep 1 to get rid of "text file busy" error messages
RUN chmod +x /tmp/composer-installer.sh && \
    sleep 1 && \
    /tmp/composer-installer.sh && \
    rm /tmp/composer-installer.sh
