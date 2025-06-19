-- 建立牙醫診所
CREATE DATABASE dental_clinic;
USE dental_clinic;

-- 病患資料表 Patient
CREATE TABLE Patient (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    gender ENUM('男', '女') NOT NULL,
    birth_date DATE,
    phone VARCHAR(20),
    email VARCHAR(100)
);

-- 員工資料表 Staff
CREATE TABLE Staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    role ENUM('牙醫師', '牙助', '櫃台') NOT NULL,
    phone VARCHAR(20),
    department VARCHAR(50)
);

-- 診所時段表 Shift
CREATE TABLE Shift (
    shift_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,  -- 午診 / 晚診
    start_time TIME NOT NULL,
    end_time TIME NOT NULL
);

-- 員工出勤紀錄表 WorkSchedule
CREATE TABLE WorkSchedule (
    schedule_id INT PRIMARY KEY AUTO_INCREMENT,
    staff_id INT,
    shift_id INT,
    work_date DATE,
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id),
    FOREIGN KEY (shift_id) REFERENCES Shift(shift_id)
);

-- 掛號資料表 Appointment
CREATE TABLE Appointment (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    staff_id INT,  -- 掛號對應的牙醫師
    shift_id INT,
    appointment_time DATETIME,
    status ENUM('預約中', '完成', '取消') DEFAULT '預約中',
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id),
    FOREIGN KEY (shift_id) REFERENCES Shift(shift_id)
);

-- 病歷資料表 DentalRecord
CREATE TABLE DentalRecord (
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_id INT,
    diagnosis TEXT,
    treatment_date DATE,
    note TEXT,
    FOREIGN KEY (appointment_id) REFERENCES Appointment(appointment_id)
);

-- 檢驗資料表 XrayTest
CREATE TABLE XrayTest (
    labtest_id INT PRIMARY KEY AUTO_INCREMENT,
    record_id INT,
    test_item VARCHAR(100),
    result TEXT,
    FOREIGN KEY (record_id) REFERENCES DentalRecord(record_id)
);

-- 插入Patient 表的資料
INSERT INTO Patient (name, gender, birth_date, phone, email) VALUES ('李柏翰', '女', '1976-03-01', '0909737903', '0909737903@gmail.com');
INSERT INTO Patient (name, gender, birth_date, phone, email) VALUES ('劉淑芬', '男', '1959-10-11', '0996728300', '0996728300@gmail.com');
INSERT INTO Patient (name, gender, birth_date, phone, email) VALUES ('王美琪', '男', '1981-09-20', '0949731462', '0949731462@gmail.com');
INSERT INTO Patient (name, gender, birth_date, phone, email) VALUES ('張欣怡', '女', '1992-11-03', '0910479413', '0910479413@gmail.com');
INSERT INTO Patient (name, gender, birth_date, phone, email) VALUES ('郭慧君', '男', '1989-05-30', '0956500146', '0956500146@gmail.com');
INSERT INTO Patient (name, gender, birth_date, phone, email) VALUES ('莊郁婷', '女', '1985-11-11', '0957796538', '0957796538@gmail.com');
INSERT INTO Patient (name, gender, birth_date, phone, email) VALUES ('饒志偉', '女', '2005-05-26', '0922204111', '0922204111@gmail.com');
INSERT INTO Patient (name, gender, birth_date, phone, email) VALUES ('黃靜怡', '男', '1968-06-26', '0981257623', '0981257623@gmail.com');
INSERT INTO Patient (name, gender, birth_date, phone, email) VALUES ('何婷婷', '男', '2001-03-06', '0933495822', '0933495822@gmail.com');
INSERT INTO Patient (name, gender, birth_date, phone, email) VALUES ('鞠佳慧', '男', '2002-04-03', '0982291445', '0982291445@gmail.com');

-- 插入 Staff 員工資料
INSERT INTO Staff (name, role, phone, department) VALUES ('李欣怡', '牙醫師', '0949672979', '牙科');
INSERT INTO Staff (name, role, phone, department) VALUES ('祝雅慧', '牙醫師', '0972568035', '牙科');
INSERT INTO Staff (name, role, phone, department) VALUES ('陳淑慧', '牙醫師', '0902502366', '牙科');
INSERT INTO Staff (name, role, phone, department) VALUES ('岑郁雯', '牙醫師', '0931219589', '牙科');
INSERT INTO Staff (name, role, phone, department) VALUES ('張志偉', '牙醫師', '0929035539', '牙科');

INSERT INTO Staff (name, role, phone, department) VALUES ('王雅文', '牙助', '0944039106', '牙科');
INSERT INTO Staff (name, role, phone, department) VALUES ('何龍', '牙助', '0915441906', '牙科');
INSERT INTO Staff (name, role, phone, department) VALUES ('劉依婷', '牙助', '0990252298', '牙科');
INSERT INTO Staff (name, role, phone, department) VALUES ('陳冠廷', '牙助', '0911016498', '牙科');
INSERT INTO Staff (name, role, phone, department) VALUES ('彭怡君', '牙助', '0947609744', '牙科');

INSERT INTO Staff (name, role, phone, department) VALUES ('王宜君', '櫃台', '0971404160', '櫃台');
INSERT INTO Staff (name, role, phone, department) VALUES ('邰龍', '櫃台', '0907812152', '櫃台');
SELECT * FROM Shift;
INSERT INTO Shift (shift_id, name, start_time, end_time) VALUES
(1, '午診', '10:00:00', '15:00:00'),
(2, '晚診', '17:00:00', '22:00:00');

-- 插入 WorkSchedule 員工出勤排班
INSERT INTO WorkSchedule (staff_id, shift_id, work_date) VALUES
(1, 1, '2025-06-02'),
(2, 1, '2025-06-02'),
(6, 1, '2025-06-02'),
(7, 1, '2025-06-02'),
(8, 1, '2025-06-02'),
(9, 1, '2025-06-02'),
(10, 1, '2025-06-02'),
(1, 2, '2025-06-02'),
(2, 2, '2025-06-02'),
(3, 2, '2025-06-02'),
(6, 2, '2025-06-02'),
(7, 2, '2025-06-02'),
(8, 2, '2025-06-02'),
(9, 2, '2025-06-02'),
(11, 2, '2025-06-02'),
(12, 2, '2025-06-02'),
(1, 1, '2025-06-03'),
(2, 1, '2025-06-03'),
(6, 1, '2025-06-03'),
(7, 1, '2025-06-03'),
(8, 1, '2025-06-03'),
(9, 1, '2025-06-03'),
(10, 1, '2025-06-03'),
(1, 2, '2025-06-03'),
(2, 2, '2025-06-03'),
(3, 2, '2025-06-03'),
(6, 2, '2025-06-03'),
(7, 2, '2025-06-03'),
(8, 2, '2025-06-03'),
(9, 2, '2025-06-03'),
(11, 2, '2025-06-03'),
(12, 2, '2025-06-03'),
(1, 1, '2025-06-05'),
(2, 1, '2025-06-05'),
(6, 1, '2025-06-05'),
(7, 1, '2025-06-05'),
(8, 1, '2025-06-05'),
(9, 1, '2025-06-05'),
(10, 1, '2025-06-05'),
(1, 2, '2025-06-05'),
(2, 2, '2025-06-05'),
(3, 2, '2025-06-05'),
(6, 2, '2025-06-05'),
(7, 2, '2025-06-05'),
(8, 2, '2025-06-05'),
(9, 2, '2025-06-05'),
(11, 2, '2025-06-05'),
(12, 2, '2025-06-05'),
(1, 1, '2025-06-06'),
(2, 1, '2025-06-06'),
(6, 1, '2025-06-06'),
(7, 1, '2025-06-06'),
(8, 1, '2025-06-06'),
(9, 1, '2025-06-06'),
(10, 1, '2025-06-06'),
(1, 2, '2025-06-06'),
(2, 2, '2025-06-06'),
(3, 2, '2025-06-06'),
(6, 2, '2025-06-06'),
(7, 2, '2025-06-06'),
(8, 2, '2025-06-06'),
(9, 2, '2025-06-06'),
(11, 2, '2025-06-06'),
(12, 2, '2025-06-06'),
(1, 1, '2025-06-07'),
(2, 1, '2025-06-07'),
(6, 1, '2025-06-07'),
(7, 1, '2025-06-07'),
(8, 1, '2025-06-07'),
(9, 1, '2025-06-07'),
(10, 1, '2025-06-07'),
(1, 2, '2025-06-07'),
(2, 2, '2025-06-07'),
(3, 2, '2025-06-07'),
(6, 2, '2025-06-07'),
(7, 2, '2025-06-07'),
(8, 2, '2025-06-07'),
(9, 2, '2025-06-07'),
(11, 2, '2025-06-07'),
(12, 2, '2025-06-07'),
(1, 1, '2025-06-09'),
(2, 1, '2025-06-09'),
(6, 1, '2025-06-09'),
(7, 1, '2025-06-09'),
(8, 1, '2025-06-09'),
(9, 1, '2025-06-09'),
(10, 1, '2025-06-09'),
(1, 2, '2025-06-09'),
(2, 2, '2025-06-09'),
(3, 2, '2025-06-09'),
(6, 2, '2025-06-09'),
(7, 2, '2025-06-09'),
(8, 2, '2025-06-09'),
(9, 2, '2025-06-09'),
(11, 2, '2025-06-09'),
(12, 2, '2025-06-09'),
(1, 1, '2025-06-10'),
(2, 1, '2025-06-10'),
(6, 1, '2025-06-10'),
(7, 1, '2025-06-10'),
(8, 1, '2025-06-10'),
(9, 1, '2025-06-10'),
(10, 1, '2025-06-10'),
(1, 2, '2025-06-10'),
(2, 2, '2025-06-10'),
(3, 2, '2025-06-10'),
(6, 2, '2025-06-10'),
(7, 2, '2025-06-10'),
(8, 2, '2025-06-10'),
(9, 2, '2025-06-10'),
(11, 2, '2025-06-10'),
(12, 2, '2025-06-10'),
(1, 1, '2025-06-12'),
(2, 1, '2025-06-12'),
(6, 1, '2025-06-12'),
(7, 1, '2025-06-12'),
(8, 1, '2025-06-12'),
(9, 1, '2025-06-12'),
(10, 1, '2025-06-12'),
(1, 2, '2025-06-12'),
(2, 2, '2025-06-12'),
(3, 2, '2025-06-12'),
(6, 2, '2025-06-12'),
(7, 2, '2025-06-12'),
(8, 2, '2025-06-12'),
(9, 2, '2025-06-12'),
(11, 2, '2025-06-12'),
(12, 2, '2025-06-12'),
(1, 1, '2025-06-13'),
(2, 1, '2025-06-13'),
(6, 1, '2025-06-13'),
(7, 1, '2025-06-13'),
(8, 1, '2025-06-13'),
(9, 1, '2025-06-13'),
(10, 1, '2025-06-13'),
(1, 2, '2025-06-13'),
(2, 2, '2025-06-13'),
(3, 2, '2025-06-13'),
(6, 2, '2025-06-13'),
(7, 2, '2025-06-13'),
(8, 2, '2025-06-13'),
(9, 2, '2025-06-13'),
(11, 2, '2025-06-13'),
(12, 2, '2025-06-13'),
(1, 1, '2025-06-14'),
(2, 1, '2025-06-14'),
(6, 1, '2025-06-14'),
(7, 1, '2025-06-14'),
(8, 1, '2025-06-14'),
(9, 1, '2025-06-14'),
(10, 1, '2025-06-14'),
(1, 2, '2025-06-14'),
(2, 2, '2025-06-14'),
(3, 2, '2025-06-14'),
(6, 2, '2025-06-14'),
(7, 2, '2025-06-14'),
(8, 2, '2025-06-14'),
(9, 2, '2025-06-14'),
(11, 2, '2025-06-14'),
(12, 2, '2025-06-14');

SELECT * FROM Patient;
SELECT * FROM Staff;
SELECT * FROM Shift;
SELECT * FROM WorkSchedule;
SELECT * FROM Appointment;
SELECT * FROM DentalRecord;
SELECT * FROM XrayTest;
SELECT * FROM UserAccount;

-- 插入 Appointment 掛號紀錄（會用到 FK）
INSERT INTO Appointment (appointment_id, patient_id, staff_id, shift_id, appointment_time, status) VALUES
(1, 4, 5, 2, '2025-06-02 17:48:00', '取消'),
(2, 5, 2, 2, '2025-06-02 17:40:00', '完成'),
(3, 1, 4, 2, '2025-06-02 17:17:00', '預約中'),
(4, 10, 1, 1, '2025-06-03 10:43:00', '取消'),
(5, 10, 3, 2, '2025-06-03 17:50:00', '取消'),
(6, 3, 5, 1, '2025-06-03 10:49:00', '完成'),
(7, 7, 5, 2, '2025-06-05 17:02:00', '完成'),
(8, 4, 1, 2, '2025-06-05 17:12:00', '取消'),
(9, 6, 4, 2, '2025-06-05 17:02:00', '完成'),
(10, 6, 5, 1, '2025-06-06 10:52:00', '完成'),
(11, 8, 4, 2, '2025-06-06 17:00:00', '完成'),
(12, 3, 1, 1, '2025-06-06 10:36:00', '預約中'),
(13, 7, 3, 2, '2025-06-07 17:40:00', '取消'),
(14, 1, 2, 1, '2025-06-07 10:42:00', '完成'),
(15, 6, 4, 1, '2025-06-07 10:39:00', '完成'),
(16, 2, 4, 2, '2025-06-09 17:46:00', '完成'),
(17, 4, 3, 1, '2025-06-09 10:59:00', '完成'),
(18, 2, 2, 2, '2025-06-09 17:21:00', '取消'),
(19, 4, 2, 1, '2025-06-10 10:45:00', '完成'),
(20, 8, 3, 1, '2025-06-10 10:07:00', '完成'),
(21, 4, 5, 2, '2025-06-10 17:32:00', '預約中'),
(22, 7, 2, 2, '2025-06-12 17:51:00', '完成'),
(23, 1, 2, 1, '2025-06-12 10:24:00', '預約中'),
(24, 2, 4, 2, '2025-06-12 17:05:00', '完成'),
(25, 8, 3, 1, '2025-06-13 10:13:00', '取消'),
(26, 3, 1, 1, '2025-06-13 10:02:00', '完成'),
(27, 2, 4, 2, '2025-06-13 17:03:00', '完成'),
(28, 3, 5, 2, '2025-06-14 17:16:00', '預約中'),
(29, 2, 4, 2, '2025-06-14 17:54:00', '取消'),
(30, 1, 1, 2, '2025-06-14 17:34:00', '預約中');

-- 插入 DentalRecord 或 XrayTest
INSERT INTO DentalRecord (record_id, appointment_id, diagnosis, treatment_date, note) VALUES
(1, 1, '智齒發炎', '2025-06-02', '已開藥'),
(2, 2, '口腔潰瘍', '2025-06-02', '需回診'),
(3, 3, '牙周病', '2025-06-02', '口腔衛教'),
(4, 4, '口腔潰瘍', '2025-06-03', '已開藥'),
(5, 5, '口腔潰瘍', '2025-06-03', '口腔衛教'),
(6, 6, '蛀牙', '2025-06-03', '需回診'),
(7, 7, '牙周病', '2025-06-05', '轉診'),
(8, 8, '蛀牙', '2025-06-05', '需回診'),
(9, 9, '牙周病', '2025-06-05', '需回診'),
(10, 10, '蛀牙', '2025-06-06', '定期追蹤'),
(11, 11, '智齒發炎', '2025-06-06', '轉診'),
(12, 12, '牙周病', '2025-06-06', '已開藥'),
(13, 13, '蛀牙', '2025-06-07', '定期追蹤'),
(14, 14, '智齒發炎', '2025-06-07', '轉診'),
(15, 15, '蛀牙', '2025-06-07', '已開藥'),
(16, 16, '牙齦出血', '2025-06-09', '已開藥'),
(17, 17, '牙齦出血', '2025-06-09', '已開藥'),
(18, 18, '智齒發炎', '2025-06-09', '需回診'),
(19, 19, '牙齦出血', '2025-06-10', '定期追蹤'),
(20, 20, '智齒發炎', '2025-06-10', '口腔衛教'),
(21, 21, '牙齦出血', '2025-06-10', '定期追蹤'),
(22, 22, '智齒發炎', '2025-06-12', '定期追蹤'),
(23, 23, '口腔潰瘍', '2025-06-12', '已開藥'),
(24, 24, '智齒發炎', '2025-06-12', '定期追蹤'),
(25, 25, '牙齦出血', '2025-06-13', '已開藥'),
(26, 26, '牙齦出血', '2025-06-13', '轉診'),
(27, 27, '口腔潰瘍', '2025-06-13', '需回診'),
(28, 28, '蛀牙', '2025-06-14', '已開藥'),
(29, 29, '牙齦出血', '2025-06-14', '定期追蹤'),
(30, 30, '牙齦出血', '2025-06-14', '需回診');

INSERT INTO XrayTest (labtest_id, record_id, test_item, result) VALUES
(1, 2, '側顱 X 光', '骨質流失'),
(2, 3, '側顱 X 光', '骨質流失'),
(3, 4, '側顱 X 光', '異常陰影'),
(4, 9, '側顱 X 光', '異常陰影'),
(5, 14, '單顆牙 X 光', '骨質流失'),
(6, 15, '側顱 X 光', '發炎'),
(7, 16, '側顱 X 光', '正常'),
(8, 18, '全口 X 光', '骨質流失'),
(9, 19, '單顆牙 X 光', '發炎'),
(10, 20, '側顱 X 光', '異常陰影'),
(11, 24, '全口 X 光', '正常'),
(12, 26, '側顱 X 光', '正常'),
(13, 27, '全口 X 光', '發炎'),
(14, 29, '側顱 X 光', '發炎'),
(15, 30, '單顆牙 X 光', '正常');
-- 每位醫師看診總次數排名
SELECT S.name AS doctor_name, COUNT(*) AS total_appointments
FROM Appointment A
JOIN Staff S ON A.staff_id = S.staff_id
WHERE S.role = '牙醫師'
GROUP BY A.staff_id
ORDER BY total_appointments DESC;

--指定日期每位醫師的看診次數
SELECT S.name AS doctor_name, DATE(A.appointment_time) AS date, COUNT(*) AS visits
FROM Appointment A
JOIN Staff S ON A.staff_id = S.staff_id
WHERE S.role = '牙醫師' AND DATE(A.appointment_time) = '2025-06-05'
GROUP BY A.staff_id, DATE(A.appointment_time)
ORDER BY visits DESC;

--每位病患總共就診幾次（含已完成的）
SELECT P.name AS patient_name, COUNT(*) AS total_visits
FROM Appointment A
JOIN Patient P ON A.patient_id = P.patient_id
WHERE A.status = '完成'
GROUP BY A.patient_id
ORDER BY total_visits DESC;
 
--  建立 View：醫師每日平均看診人數
CREATE OR REPLACE VIEW DoctorAppointmentStats AS
SELECT staff_id, COUNT(*) AS total_visits, COUNT(DISTINCT DATE(appointment_time)) AS working_days
FROM Appointment
WHERE status = '完成'
GROUP BY staff_id;

-- 使用 View 查詢平均人次
SELECT S.name, D.total_visits, D.working_days, 
       ROUND(D.total_visits / D.working_days, 2) AS avg_per_day
FROM DoctorAppointmentStats D
JOIN Staff S ON D.staff_id = S.staff_id
WHERE S.role = '牙醫師';


-- 查詢近一週未完成看診病患
SELECT DISTINCT P.name AS patient_name, A.status, A.appointment_time
FROM Appointment A
JOIN Patient P ON A.patient_id = P.patient_id
WHERE A.status <> '完成'
  AND A.appointment_time BETWEEN DATE_SUB(CURDATE(), INTERVAL 7 DAY) AND CURDATE()
ORDER BY A.appointment_time DESC;

-- 建立 View：病患最近一次診斷紀錄
CREATE VIEW LatestVisitSummary AS
SELECT 
    p.patient_id,
    p.name AS patient_name,
    MAX(a.appointment_time) AS last_appointment,
    d.diagnosis
FROM 
    Patient p
JOIN 
    Appointment a ON p.patient_id = a.patient_id
LEFT JOIN 
    DentalRecord d ON a.appointment_id = d.appointment_id
GROUP BY 
    p.patient_id, p.name, d.diagnosis;



-- 自動指派值班醫師後建立掛號資料
DELIMITER $$

CREATE PROCEDURE CreateAppointmentWithDoctor (
    IN p_patient_id INT,
    IN p_date DATE,
    IN p_time TIME,
    IN p_reason VARCHAR(255)
)
BEGIN
    DECLARE selected_doctor INT;

    -- 找當天值班的第一位醫師（非牙醫師）
    SELECT s.staff_id INTO selected_doctor
    FROM WorkSchedule ws
    JOIN Staff s ON ws.staff_id = s.staff_id
    WHERE ws.work_date = p_date AND s.role = '醫師'
    ORDER BY RAND()
    LIMIT 1;

    -- 插入掛號資料（狀態預設為「預約中」或「未完成」）
    INSERT INTO Appointment (patient_id, staff_id, appointment_time, reason, status)
    VALUES (p_patient_id, selected_doctor, TIMESTAMP(p_date, p_time), p_reason, '預約中');
END$$

DELIMITER ;

SHOW PROCEDURE STATUS WHERE Db = 'dental_clinic' AND Name = 'CreateAppointmentWithDoctor';



-- 建立 Trigger：當掛號完成時，自動新增病歷資料
DELIMITER $$
CREATE TRIGGER AddDentalRecordAfterAppointmentComplete
AFTER UPDATE ON Appointment
FOR EACH ROW
BEGIN
    IF NEW.status = '完成' AND OLD.status != '完成' THEN
        INSERT INTO DentalRecord (appointment_id, diagnosis, treatment)
        VALUES (NEW.appointment_id, '請補上診斷內容', '請補上治療內容');
    END IF;
END $$

DELIMITER ;

SELECT S.name AS doctor_name, COUNT(*) AS visits
FROM Appointment A
JOIN Staff S ON A.staff_id = S.staff_id
WHERE S.role = '牙醫師'
  AND DATE(A.appointment_time) = '2025-06-10'
GROUP BY A.staff_id;

-- 病患掛號後立即建立病歷紀錄
START TRANSACTION;

-- 1. 插入掛號 Appointment（病患 ID 1，醫師 ID 3）
INSERT INTO Appointment (patient_id, staff_id, appointment_time, reason, status)
VALUES (1, 3, '2025-06-08 14:30:00', '牙齒酸痛', '完成');

-- 2.取得剛剛插入的 appointment_id
SET @last_appointment_id = LAST_INSERT_ID();

-- 3. 插入 DentalRecord 病歷（關聯到剛剛那筆 appointment）
INSERT INTO DentalRecord (appointment_id, diagnosis, treatment)
VALUES (@last_appointment_id, '蛀牙', '補牙');

-- 4. 確保沒錯誤就提交
COMMIT;

SELECT 
    P.name AS patient_name,
    A.appointment_time,
    D.diagnosis,
    D.treatment
FROM Patient P
JOIN Appointment A ON P.patient_id = A.patient_id
JOIN DentalRecord D ON A.appointment_id = D.appointment_id
WHERE A.patient_id = 1 AND A.staff_id = 3 AND A.appointment_time = '2025-06-08 14:30:00';

-- 建立帳號角色表 Role 與 UserAccount
CREATE TABLE Role (
  role_id INT AUTO_INCREMENT PRIMARY KEY,
  role_name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE UserAccount (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  staff_id INT NOT NULL,
  username VARCHAR(50) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  role_id INT NOT NULL,
  FOREIGN KEY (staff_id) REFERENCES Staff(staff_id),
  FOREIGN KEY (role_id) REFERENCES Role(role_id)
);

-- 插入角色
INSERT INTO Role (role_name) VALUES
('admin'), ('dentist'), ('assistant'), ('receptionist');

-- 假設 staff_id = 10 是櫃台人員，role_id = 4 是 receptionist
INSERT INTO UserAccount (staff_id, username, password, role_id)
VALUES (10, 'reception01', '123456', 4);

SELECT ua.username, ua.password, r.role_name, s.name AS staff_name
FROM UserAccount ua
JOIN Role r ON ua.role_id = r.role_id
JOIN Staff s ON ua.staff_id = s.staff_id;



-- 建立 View：牙助當天可見的 X 光檢查資料
CREATE OR REPLACE VIEW AssistantTodayXray AS
SELECT 
    xr.labtest_id,
    xr.test_item,
    xr.result,
    a.appointment_time,
    s.name AS doctor_name
FROM XrayTest xr
JOIN DentalRecord dr ON xr.record_id = dr.record_id
JOIN Appointment a ON dr.appointment_id = a.appointment_id
JOIN Staff s ON a.staff_id = s.staff_id
WHERE DATE(a.appointment_time) = CURDATE();


-- 建立資料庫使用者
CREATE USER 'assistant'@'localhost' IDENTIFIED BY '123456';

-- 只開放 View 權限給 assistant
-- 這樣 assistant 只能查詢 View，不能操作其他表格
GRANT SELECT ON dental_clinic.AssistantTodayXray TO 'assistant'@'localhost';

-- 確認 assistant 的權限是否正確：
SHOW GRANTS FOR 'assistant'@'localhost';






 
