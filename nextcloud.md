### Prerequisites:
- A Debian 11 system (physical or virtual machine).
- Access to the terminal with sudo privileges.
- **Note:** Make sure to replace `[nextcloud_version]` with the actual version number you want to install.

### Steps:

#### 1. Update Debian and Install Dependencies:

```bash
sudo apt update
sudo apt upgrade -y
sudo apt install -y apache2 mariadb-server php php-cli php-mysql php-curl php-gd php-json php-mbstring php-intl php-imagick php-xml php-zip unzip
```

#### 2. Configure MariaDB:

```bash
sudo mysql_secure_installation
```

Create a new database and user for Nextcloud:

```sql
CREATE DATABASE nextcloud;
CREATE USER 'nextclouduser'@'localhost' IDENTIFIED BY 'your_password';
GRANT ALL PRIVILEGES ON nextcloud.* TO 'nextclouduser'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

#### 3. Download and Extract Nextcloud:

```bash
cd /var/www/html
sudo wget https://download.nextcloud.com/server/releases/nextcloud-[nextcloud_version].zip
sudo unzip nextcloud-[nextcloud_version].zip
sudo chown -R www-data:www-data nextcloud
```

#### 4. Configure Apache:

Create a new Apache configuration file for Nextcloud:

```bash
sudo nano /etc/apache2/sites-available/nextcloud.conf
```

Add the following configuration:

```apache
<VirtualHost *:80>
    DocumentRoot /var/www/html/nextcloud
    ServerName your_domain_or_IP

    <Directory /var/www/html/nextcloud>
        AllowOverride All
        Require all granted
        Options FollowSymlinks MultiViews

        <IfModule mod_dav.c>
            Dav off
        </IfModule>
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```

Enable the site and rewrite module, then restart Apache:

```bash
sudo a2ensite nextcloud.conf
sudo a2enmod rewrite
sudo systemctl restart apache2
```

#### 5. Complete Nextcloud Setup:

Visit your server's IP address or domain in a web browser to complete the Nextcloud setup. Follow the on-screen instructions to finish the setup process.

Remember to configure backups, security settings, and HTTPS for your Nextcloud instance for a complete and secure setup.