version: "3.9"
    
services:
  db:
    image: mysql:5.7
    volumes:
      - db_data:/var/lib/mysql
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: 
      MYSQL_DATABASE: wp_lhp_wordpress
      MYSQL_USER: lhp
      MYSQL_PASSWORD: 
    
  wordpress:
    depends_on:
      - db
    image: wordpress:latest
    volumes:
      - wordpress_data:/var/www/html
    ports:
      - "80"
      - "443"
    restart: always
    environment:
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_USER: lhp
      WORDPRESS_DB_PASSWORD:
      WORDPRESS_DB_NAME: wp_lhp_wordpress
  setup:
    depends_on:
      - wordpress
    image: lhp_setup
    build:
      context: .
      dockerfile: ./etc/docker/wordpress/Dockerfile
    volumes:
      - wordpress_data:/var/www/html
    command: /start
volumes:
  db_data: {}
  wordpress_data: {}
