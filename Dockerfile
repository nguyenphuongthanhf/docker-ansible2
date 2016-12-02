from ubuntu:16.04

# Add default otisplus user    
RUN useradd -u 1000 -m --shell /bin/bash otisplus && \
    echo "otisplus:P@ssw0rd!@#$%^" | chpasswd


RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-add-repository ppa:ansible/ansible && \
    DEBIAN_FRONTEND=noninteractive  apt-get update  && \
    \
    \
    echo "===> Installing Ansible..."  && \
    apt-get install -y ansible  && \
    \
    \
    echo "===> Adding hosts for convenience..."  && \
    echo 'localhost' > /etc/ansible/hosts


# default command: display Ansible version
CMD ["/bin/bash"]
