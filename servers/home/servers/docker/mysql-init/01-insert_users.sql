use secure_db;

INSERT INTO users (username, password, is_admin, full_name) VALUES ('oak', '$2y$10$mT4HObS63D1uwyxIpq8h1eZ/U1oD3rNZKK2bScT5.MNYbkHIGHvPW', TRUE, 'Professor Oak');
INSERT INTO users (username, password, is_admin, full_name) VALUES ('ash', '$2y$10$eccxHA0E./SgklCgIlxeROpQmqsIsNlTWWNvyeYaYAeAnCb0i0b4K', FALSE, 'Ash Ketchum');
INSERT INTO users (username, password, is_admin, full_name) VALUES ('misty', '$2y$10$X0.8./A5RKP2mo96FSH14umw335hL4JfwYIwXJH1Dd4rxUrOLN8Rq', FALSE, 'Misty Kasumi');
INSERT INTO users (username, password, is_admin, full_name) VALUES ('jessie', '$2y$10$JS9n9Spq7VjQxE1fEuD1zuYk/E7oKECy0Cd.CqGgaqkyPyxpKzoOG', FALSE, 'Jessie Rocket');