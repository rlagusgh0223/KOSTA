INSERT INTO holiday_request
    (holiday_number, employee_id, holiday_type, 
    holiday_start, holiday_end, holiday_desc,
    holiday_approval_first,
    holiday_approval_second,
    holiday_approval_third,
    holiday_request_status) 
VALUES(seq_holiday_no.NEXTVAL,  
    <로그인된 사번>, <선택된holiday_type>,
    <선택된holiday_start>, <선택된holiday_end>,
    <입력된holiday_desc>,<선택된 holiday_approval_first>, 
    <선택된holiday_approval_second>, 
    <선택된 holiday_approval_third>, 3);
    
SELECT *
FROM (
    SELECT rownum as rn, a.*
    FROM(   
        SELECT hr.holiday_number, hr.holiday_type, hr.holiday_desc, hr.holiday_start, hr.holiday_end,
              hr.holiday_request_status, 
              ht.holiday_type_name
        FROM holiday_request hr JOIN HOLIDAY_TYPE ht ON (hr.holiday_type=ht.holiday_type)
        where EMPLOYEE_ID = 220702
        ORDER BY holiday_number DESC
    ) a
)
WHERE rn BETWEEN <출력할행START> AND <출력할행 END>; 



SELECT hr.holiday_start, hr.holiday_end, ht.holiday_type,
    (SELECT e.employee_name_kr
        (SELECT e.employee_name_kr
            (SELECT e.employee_name_kr
            FROM holiday_request hr JOIN employee e(hr.holiday_request_third = e.employee_id)
            WHERE (hr.HOLIDAY_REQUEST_third = e.employee_id) and hr.holiday_number = <선택된휴가신청번호>)
            )
        FROM holiday_request hr JOIN employee e(hr.holiday_approval_second = e.employee_id)
        WHERE (hr.HOLIDAY_REQUEST_second = e.employee_id) and hr.holiday_number = <선택된휴가신청번호>)
        )
    FROM holiday_request hr JOIN employee e(hr.holiday_approval_first = e.employee_id)
    WHERE (hr.HOLIDAY_REQUEST_FIRST = e.employee_id) and hr.holiday_number = <선택된휴가신청번호>)
    )
    hr.holiday_request_status, hr.holiday_desc
FROM holiday_request hr JOIN holiday_type ht ON (hr.holiday_type=ht.holiday_type);