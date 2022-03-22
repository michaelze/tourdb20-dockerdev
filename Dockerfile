FROM michaelze/tourdb20-dockerbase:latest

RUN apt-get update && \
    apt-get install -y \
        gnupg \
        git \
        zip \
        unzip \
        wget && \
    curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs

COPY composer-installer.sh /tmp/

# sleep 1 to get rid of "text file busy" error messages
RUN chmod +x /tmp/composer-installer.sh && \
    sleep 1 && \
    /tmp/composer-installer.sh && \
    rm /tmp/composer-installer.sh

RUN curl -Lso /tmp/dart-sass-1.49.7-linux-x64.tar.gz https://github.com/sass/dart-sass/releases/download/1.49.7/dart-sass-1.49.7-linux-x64.tar.gz && \
    cd /tmp && \
    tar -xf dart-sass-1.49.7-linux-x64.tar.gz && \
    mv dart-sass/sass /usr/local/bin && \
    rm -rf dart-sass dart-sass-1.49.7-linux-x64.tar.gz

RUN useradd -m -u 1000 dev
