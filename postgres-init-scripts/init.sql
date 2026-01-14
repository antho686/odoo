-- Create user 'odoo' with password 'odoo19'
CREATE USER odoo WITH PASSWORD 'odoo19';

-- Grant createdb privilege to user 'odoo'
ALTER USER odoo CREATEDB;

-- Create database 'odoo' owned by user 'odoo'
-- CREATE DATABASE odoo OWNER odoo;

-- Grant all privileges on database 'odoo' to user 'odoo'
-- GRANT ALL PRIVILEGES ON DATABASE odoo TO odoo;

-- Give SUPERUSER privileges to user 'odoo'
ALTER USER odoo WITH SUPERUSER;
