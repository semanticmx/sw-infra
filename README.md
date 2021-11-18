## LHP infrastructure for WordPress website

### Install

This container includes latest WordPress, MySQL 5.7 and updated settings to allow up to 1GB uploads.

Just deploy as needed.

### Local setup

```bash
docker compose -f local.yml build
docker compose -f local.yml up
```

### Local development

For local development you can execute the following commands:

1. From your repository root folder, clone your custom theme repository under the wp-theme folder. The folder name is important since it will be used to sync the installed theme with the development code.

```bash
git clone git@bitbucket.org:longevity-health-plan/lhp.git wp-theme
```

2. This will create a wp-theme folder including your theme's files. Which will later be mounted to the WordPress installation. The next step is to run the `up` command again with the `build` argument.

```bash
docker compose -f local.yml up --build
```

3. Your theme will be available under the WordPress admin themes section at localhost:3100/wp-admin/themes.php

### Deploy to production

Rename `production.yml.tpl` to `production.yml` and adjust settings accordingly.

```bash
docker compose -f production.yml build
docker compose -f production.yml up
```

### Troubleshooting

1. Remove image

```bash
docker compose -f local.yml stop
docker compose -f local.yml down -v
```

Remove wordpress image from local docker

2. Clean up local containers

```bash
docker compose -f local.yml stop
docker compose -f local.yml down -v
docker system prune
docker volume prune
docker network prune
docker compose -f local.yml --verbose up --build --remove-orphans
```
