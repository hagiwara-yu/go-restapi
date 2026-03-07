DROP TABLE IF EXISTS access_log;

CREATE TABLE access_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    project_no VARCHAR(255) NOT NULL,
    gip VARCHAR(255) NOT NULL,
    create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    last_seen_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
    UNIQUE KEY unique_account_gip (project_no, gip)
);

CREATE TABLE IF NOT EXISTS gcp_projects (
    project_no VARCHAR(12) PRIMARY KEY,
    joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- ダミーデータの挿入（create_date: 6/1, last_seen_date: 6/30）
INSERT INTO access_log (project_no, gip, create_date, last_seen_date) VALUES ('123456789012', '203.0.113.10', '2025-06-01 00:00:00', '2025-06-30 00:00:00');
INSERT INTO access_log (project_no, gip, create_date, last_seen_date) VALUES ('987654321098', '198.51.100.24', '2025-06-01 00:00:00', '2025-06-30 00:00:00');
INSERT INTO access_log (project_no, gip, create_date, last_seen_date) VALUES ('456789123456', '192.0.2.45', '2025-06-01 00:00:00', '2025-06-30 00:00:00');
INSERT INTO access_log (project_no, gip, create_date, last_seen_date) VALUES ('321654987321', '203.0.113.78', '2025-06-01 00:00:00', '2025-06-30 00:00:00');
INSERT INTO access_log (project_no, gip, create_date, last_seen_date) VALUES ('654123789654', '198.51.100.66', '2025-06-01 00:00:00', '2025-06-30 00:00:00');
INSERT INTO access_log (project_no, gip, create_date, last_seen_date) VALUES ('789456123789', '192.0.2.12', '2025-06-01 00:00:00', '2025-06-30 00:00:00');
INSERT INTO access_log (project_no, gip, create_date, last_seen_date) VALUES ('159357258159', '203.0.113.101', '2025-06-01 00:00:00', '2025-06-30 00:00:00');
INSERT INTO access_log (project_no, gip, create_date, last_seen_date) VALUES ('258456789123', '198.51.100.89', '2025-06-01 00:00:00', '2025-06-30 00:00:00');
INSERT INTO access_log (project_no, gip, create_date, last_seen_date) VALUES ('357159486357', '192.0.2.77', '2025-06-01 00:00:00', '2025-06-30 00:00:00');
INSERT INTO access_log (project_no, gip, create_date, last_seen_date) VALUES ('753951456753', '203.0.113.200', '2025-06-01 00:00:00', '2025-06-30 00:00:00');