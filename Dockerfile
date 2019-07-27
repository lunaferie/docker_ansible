FROM centos:centos7

RUN yum install -y epel-release; yum clean all;
RUN yum install -y ansible telnet net-tools openssh-server; yum clean all;

# adding ansible hosts based on docker-compose hosts
RUN echo $'[all]\n\
host_centos\n\
host_ubuntu\n'\ 
> /etc/ansible/hosts

# create ssh files
RUN mkdir /root/.ssh
RUN echo $'-----BEGIN RSA PRIVATE KEY-----\n\
MIIEpAIBAAKCAQEAtigfeKeEcSN2nJJnjPb2lGY9ye/EJAZvNuwAQ9NzKw6DKR/u\n\
G8P/ULe4jPgYx2rrHiyX4wtRdhFo0SCBSqtWS9Meg7J8F8f7nEZ4y8koDZTmE3nP\n\
M1KG3pjHP99aeYc/YFXchqByb4Sb1Dsb5JcgzI9TAgJkNAVCJe4z2fNWoTJXa/XY\n\
owZNQm1F0iITIUQ5APMnncvqqL7Su6EKsnfCP0FQ0tfp6Iq1qPAhvWcLadiAzNvc\n\
dmlqnQtuolSaTRMyTzcpzHKZBVHoXSMKsagyYs+P52L5g0Q1FxOz0CYB4X/5QC7j\n\
kBOGqsMpTvQVqHa7N8ZSI/dQHcGc6WDX0MDSIwIDAQABAoIBAQCYMbvhzm09Lnk6\n\
5qQ4RlvNsAMuRvNlei7P/61U/kX6kpyJ7tC+SCt5YJeEyQHDFJUv1+hr3hgJAxDF\n\
slf0cGWg4ttbA/Tk1cVnVAY3lnGtr1vwp9S0N97R+2p29oIciiEst3CS11nlzTF5\n\
yI1Ml+zinVmokyDvyfjzwit2jfcypHks1YAD0FYni3yUcj0X6QdzY8XrBI00ImTX\n\
lPVTg58mNUbcgDBxscf2zAgOPW8UsZNWcqbaZI+TBlsEgdrDYp80M9/uk7xI90O/\n\
nBNvd/ZP28jUA3oJvQYetdOd8rUD0jsFQEEIdHBYLxPZeRgJLRLV643Y74UNYyLl\n\
fpAbZkhxAoGBAN0FLn9fKvPJxhgw2143veXRIh40j7NAu5Dw77xMPSNBLNHPK88+\n\
inuCSRg6P/UgiGylCADn272iFnzTtZ2hRENBrvVDJt1CB5AngpxKOqeR57biEH2E\n\
ElyMaVqeEQEwRBuPv/esGbaJua6QnfByrkZhjEnOWnsI4VQYUlkc90C7AoGBANL8\n\
WpvgONNb6V1O2Tv8yAKE1rYFPpckUVQLOuJCfMDcRr/jc1fBZjMWtvnBcCd+xUpi\n\
FKP372kzf8BHVwsyI5u5D2W7OU8izV0eeKK/7ETvx71rWjUiQiiGuEUHIlYoPqAF\n\
YpUPM1ZuPvpGl0EnCqcLORNCEY2xEHmfbpAVufG5AoGANYYut3vVjApeJbeXOF7p\n\
ZwFZcNUrw642fihK9l/EIoiDESBJrLupj7WCfBKHMJa7Uww4PvfnWCorpfkjL1RB\n\
ksQSWaT0gXqfGELpN24mfDQyWDCw66STScRbMy26Un5c0Avk4lbUN0dtJyAwj21G\n\
VRcEgU8uzELfRp1JO/luy0cCgYBowdvLYX1VlGE+bxP1cQFuHr7tCZWWPfYToK/P\n\
/+spZzXJuQlgHSq9Wx3mzGD/ezZCRIizETvSJDveII3bhT2g6DX48Qj3ffQxtBt5\n\
04lggR3PsynLEAOBU8LSo0QtOzY9Be94y19WHs8uPTaEpvnnDu973GYS0EO536tp\n\
5x+4IQKBgQCplz02HAwTPsCQ3jukCQKdyMMOG63MBHYr0FZNQhhN8JDBn1451P1y\n\
oqbe1l/soFva0NwvNun+B3Q2bcifSH/hzslQ5jKK/L2pgVzSKVIkro9Nup7rq8Kn\n\
cV+rDMklZ22Yvn1RxcZ5C2rmloTc9k3pbxtm8zFmg2kVPMKRsTSQvA==\n\
-----END RSA PRIVATE KEY-----'\
> /root/.ssh/id_rsa

RUN echo $'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC2KB94p4RxI3ackmeM9vaUZj3J78QkBm827ABD03MrDoMpH+4bw/9Qt7iM+BjHauseLJfjC1F2EWjRIIFKq1ZL0x6DsnwXx/ucRnjLySgNlOYTec8zUobemMc/31p5hz9gVdyGoHJvhJvUOxvklyDMj1MCAmQ0BUIl7jPZ81ahMldr9dijBk1CbUXSIhMhRDkA8yedy+qovtK7oQqyd8I/QVDS1+noirWo8CG9Zwtp2IDM29x2aWqdC26iVJpNEzJPNynMcpkFUehdIwqxqDJiz4/nYvmDRDUXE7PQJgHhf/lALuOQE4aqwylO9BWodrs3xlIj91AdwZzpYNfQwNIj root@ansible' > /root/.ssh/id_rsa.pub

EXPOSE 22
#CMD ["/usr/sbin/sshd", “-D”]
