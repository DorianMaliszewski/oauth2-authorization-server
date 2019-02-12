-- noinspection SqlNoDataSourceInspectionForFile

SET FOREIGN_KEY_CHECKS=0;

INSERT INTO oauth_client_details
	(client_id, client_secret, scope, authorized_grant_types,
	web_server_redirect_uri, authorities, access_token_validity,
	refresh_token_validity, additional_information, autoapprove)
VALUES
	('fooClientIdPassword', '{bcrypt}$2a$10$iKqpJr8SMpTG70whcnWKl.5jhAXjjsbwCr.0fFkDBsA9lCbWgvh4i', 'foo,read,write',
	'password,authorization_code,refresh_token,client_credentials', null, null, 36000, 36000, null, true);
INSERT INTO oauth_client_details
	(client_id, client_secret, scope, authorized_grant_types,
	web_server_redirect_uri, authorities, access_token_validity,
	refresh_token_validity, additional_information, autoapprove)
VALUES
	('sampleClientId', '{bcrypt}$2a$10$iKqpJr8SMpTG70whcnWKl.5jhAXjjsbwCr.0fFkDBsA9lCbWgvh4i', 'read,write,foo,bar',
	'implicit', null, null, 36000, 36000, null, false);
INSERT INTO oauth_client_details
	(client_id, client_secret, scope, authorized_grant_types,
	web_server_redirect_uri, authorities, access_token_validity,
	refresh_token_validity, additional_information, autoapprove)
VALUES
	('barClientIdPassword', '{bcrypt}$2a$10$iKqpJr8SMpTG70whcnWKl.5jhAXjjsbwCr.0fFkDBsA9lCbWgvh4i', 'bar,read,write',
	'password,authorization_code,refresh_token', null, null, 36000, 36000, null, true);

--
-- User data
--
LOCK TABLES `permission` WRITE;
INSERT INTO permission (id, name) VALUES (1,'CAN_DELETE_USER'),(2,'CAN_CREATE_USER'),(3,'CAN_UPDATE_USER'),(4,'CAN_READ_USER');
UNLOCK TABLES;

LOCK TABLES `role` WRITE;
INSERT INTO role (id, name) VALUES (1,'ROLE_SUPER_ADMIN'),(2,'ROLE_ADMIN'), (3,'ROLE_USER');
UNLOCK TABLES;


LOCK TABLES `role_permissions` WRITE;
INSERT INTO `role_permissions` VALUES (1,1),(1,2),(1,3),(1,4);
INSERT INTO `role_permissions` VALUES (2,2),(2,3),(2,4);
INSERT INTO `role_permissions` VALUES (3,4),(3,3);
UNLOCK TABLES;

LOCK TABLES `oauth_user` WRITE;
INSERT INTO oauth_user (username, password, email, name, role_id) VALUES
('superadmin','{bcrypt}$2a$10$iKqpJr8SMpTG70whcnWKl.5jhAXjjsbwCr.0fFkDBsA9lCbWgvh4i','maliszewskid3@gmail.com','Super Administrateur', 1),
('admin','{bcrypt}$2a$10$iKqpJr8SMpTG70whcnWKl.5jhAXjjsbwCr.0fFkDBsA9lCbWgvh4i','admin@exemple.com','Administrateur',2),
('user','{bcrypt}$2a$10$FVd/WcOPdDU.k8Z4MmSyZOgfz0/r1lViAScSSK/Tr.MWyzO3OLuSW','user@exemple.com','Utilisateur',3);
UNLOCK TABLES;

SET FOREIGN_KEY_CHECKS=1;
