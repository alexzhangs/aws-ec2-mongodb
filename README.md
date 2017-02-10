# aws-ec2-mongodb

Install Mongodb on AWS EC2 instance.

## Get code

```
sudo yum install -y git
git clone https://github.com/alexzhangs/aws-ec2-mongodb.git
```

## Install Mongodb

Mongodb is not avalaible in AWS built-in yum repo, you will need
to provide a repo URL to this script.

I provide a repo URL at
`https://gist.github.com/alexzhangs/3eb4371c5d19b11b2c9feef458ac11b3/raw`.

mongodb.repo

```
[mongodb-org-3.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/amazon/2013.03/mongodb-org/3.2/x86_64/
gpgcheck=1
gpgkey=https://www.mongodb.org/static/pgp/server-3.2.asc
enabled=1
```

Please note that `gist.github.com` is unaccessable within China deal
to well known reason.

Install Mongodb from yum repo:

```
sudo sh aws-ec2-mongodb/install.sh \
    -r https://gist.github.com/alexzhangs/3eb4371c5d19b11b2c9feef458ac11b3/raw \
    -v org-3.2
```

In case there's other yum repo enabled, you may want to install Mongodb
from some repo only, e.g. `mongodb-org-3.2` here, use:

```
sudo sh aws-ec2-mongodb/install.sh \
    -r https://gist.github.com/alexzhangs/3eb4371c5d19b11b2c9feef458ac11b3/raw \
    -n mongodb-org-3.2
```

Or you can install Mongodb from a RPM file path or URL, this is
useful if experiencing slow network during downloading package from yum repo.

from local file:

```
sudo sh aws-ec2-mongodb/install.sh \
    -f ~/mongodb.rpm
```

from URL:

```
sudo sh aws-ec2-mongodb/install.sh \
    -f http://somewhere.com/mongodb.rpm
```

See script help:

```
sh aws-ec2-mongodb/install.sh -h
```
