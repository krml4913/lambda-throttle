# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.195.0/containers/javascript-node/.devcontainer/base.Dockerfile
# [Choice] Node.js version (use -bullseye variants on local arm64/Apple Silicon): 16, 14, 12, 16-bullseye, 14-bullseye, 12-bullseye, 16-buster, 14-buster, 12-buster
ARG VARIANT=16-bullseye
FROM mcr.microsoft.com/vscode/devcontainers/typescript-node:${VARIANT}

################################
# 共通設定
################################
ENV NODE_OPTIONS=--max-old-space-size=4096
ENV TZ=Asia/Tokyo

RUN echo "\n\
alias g=git\n\
alias y=yarn\n\
alias p=pnpm\n\
alias b=bun\n\
" >> /home/node/.bashrc

COPY .gitconfig.custom /home/node/.gitconfig.custom
RUN git config --global --add include.path "/home/node/.gitconfig.custom"
RUN echo "\n\
[include]\n\
        path = /home/node/.gitconfig.custom\n\
" >> /home/node/.gitconfig

################################
# Bun
################################
USER node
RUN curl -fsSL https://bun.sh/install | bash

################################
# PJ
################################
RUN mkdir /tmp/awscli && \
     cd /tmp/awscli && \
     curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
     unzip awscliv2.zip && \
     sudo ./aws/install

RUN npm i -g typescript aws-cdk