
---query 1
SELECT 
    s.role,
    s.uniform_size,
    COUNT(*) AS staff_count
FROM 
    Staff s
JOIN 
    (SELECT DISTINCT role, uniform_size FROM Staff) subquery ON s.role = subquery.role AND s.uniform_size = subquery.uniform_size
GROUP BY 
    s.role, s.uniform_size
ORDER BY 
    s.role, staff_count DESC;

---query 2
	SELECT 
    TOP 1 c.room_no, 
    COUNT(*) AS occupancy_count
FROM 
    Customer c
JOIN 
    (SELECT room_no FROM Customer GROUP BY room_no) subquery ON c.room_no = subquery.room_no
GROUP BY 
    c.room_no
ORDER BY 
    occupancy_count DESC;

---query 3
SELECT
    room_type,
    COUNT(*) AS room_count
FROM
    Room r
JOIN
    Customer c ON r.room_no = c.room_no
GROUP BY
    room_type
ORDER BY
    room_count DESC;

---query 4
SELECT DISTINCT
    p.payment_method,
    COUNT(*) AS frequency
FROM
    Payment p
JOIN
    Customer c ON p.cust_id = c.Cust_id
GROUP BY
    p.payment_method
ORDER BY
    frequency DESC;


---query 5
SELECT *
FROM Customer
WHERE room_no IN (
    SELECT TOP 1 room_no
    FROM TodayPrice
    ORDER BY date_created DESC
);


---query 6
SELECT 
    F_name,
    L_name,
    DOB
FROM 
    Customer
WHERE 
    CONVERT(VARCHAR(10), DOB, 5) = CONVERT(VARCHAR(10), GETDATE(), 5);

---query 7
SELECT 
    c.F_name,
    c.L_name,
    c.DOB,
    (SELECT TOP 1 confirmation_time_stamp FROM Payment WHERE cust_id = c.Cust_id ORDER BY confirmation_time_stamp DESC) AS checkin_timestamp
FROM 
    Customer c
ORDER BY 
    checkin_timestamp DESC;



---query 8
SELECT checkin_date, COUNT(*) AS checkins_count FROM (
    SELECT CONVERT(DATE, start_date) AS checkin_date
    FROM TodayPrice
) AS CheckinDates
GROUP BY checkin_date
ORDER BY checkins_count DESC;



---query 9
SELECT month, SUM(total_revenue) AS total_monthly_revenue
FROM (
    SELECT MONTH(tp.start_date) AS month, SUM(tp.price) AS total_revenue
    FROM TodayPrice tp
    GROUP BY MONTH(tp.start_date)
) AS MonthlyRevenue
GROUP BY month
ORDER BY total_monthly_revenue DESC;



---query 10
SELECT F_name, L_name
FROM Customer
WHERE city IN (
    SELECT DISTINCT city
    FROM Staff
);


---query 11
SELECT room_no, room_type
FROM Room
WHERE room_no NOT IN (
    SELECT DISTINCT available_room
    FROM TodayPrice
);

