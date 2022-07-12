drop table approval_level cascade constraints;
drop table cal_types cascade constraints;
drop table calendar cascade constraints;
drop table departments cascade constraints;
drop table employees cascade constraints;
drop table holiday_approval cascade constraints;
drop table holiday_info cascade constraints;
drop table holiday_requests cascade constraints;
drop table holiday_types cascade constraints;
drop table notice cascade constraints;
/* 부서 */
CREATE TABLE department (
	department_id NUMBER NOT NULL, /* 부서번호 */
	department_name VARCHAR2(50) /* 부서명 */
);

ALTER TABLE department
	ADD
		CONSTRAINT PK_department
		PRIMARY KEY (
			department_id
		);
        


/* 사원 */
CREATE TABLE employee (
	employee_id NUMBER(6,0) NOT NULL, /* 사번 */
	department_id NUMBER NOT NULL, /* 부서번호 */
	employee_password VARCHAR2(50) NOT NULL, /* 비밀번호 */
	employee_name_kr VARCHAR2(30) NOT NULL, /* 한글이름 */
	employee_name_eng VARCHAR2(50), /* 영문이름 */
	employee_hiredate DATE NOT NULL, /* 입사일 */
	employee_phonenumber VARCHAR(30) NOT NULL, /* 전화번호 */
	employee_email VARCHAR(40) NOT NULL, /* 이메일 */
	employee_address VARCHAR2(250), /* 주소 */
	employee_gender CHAR(1) NOT NULL, /* 성별 */
	employee_birthday DATE NOT NULL, /* 생년월일 */
	employee_resign NUMBER, /* 퇴사여부 */
	notice_authority NUMBER /* 관리자권한여부 */
);

ALTER TABLE employee
	ADD
		CONSTRAINT PK_employee
		PRIMARY KEY (
			employee_id
		);

ALTER TABLE employee
	ADD
		CONSTRAINT FK_department_id
		FOREIGN KEY (
			department_id
		)
		REFERENCES department (
			department_id
		);




/* 사원별휴가현황 */
CREATE TABLE holiday_info (
	employee_id NUMBER(6,0) NOT NULL, /* 사번 */
	holiday_total NUMBER, /* 휴가총일수 */
	holiday_using NUMBER /* 승인된휴가일수 */
);

ALTER TABLE holiday_info
	ADD
		CONSTRAINT PK_holiday_info
		PRIMARY KEY (
			employee_id
		);

ALTER TABLE holiday_info
	ADD
		CONSTRAINT FK_employee_id
		FOREIGN KEY (
			employee_id
		)
		REFERENCES employee (
			employee_id
		);




/* 휴가유형번호 */
CREATE TABLE holiday_type (
	holiday_type number(1,0) NOT NULL, /* 휴가유형번호 */
	holiday_type_name VARCHAR2(30) NOT NULL /* 휴가유형이름 */
);

ALTER TABLE holiday_type
	ADD
		CONSTRAINT PK_holiday_type
		PRIMARY KEY (
			holiday_type
		);



/* 휴가결재자 */
CREATE TABLE approval_level (
	employee_id NUMBER(6,0) NOT NULL /* 결재자사번 */
);

ALTER TABLE approval_level
	ADD
		CONSTRAINT PK_approval_level
		PRIMARY KEY (
			employee_id
		);

ALTER TABLE approval_level
	ADD
		CONSTRAINT FK_app_employee_id
		FOREIGN KEY (
			employee_id
		)
		REFERENCES employee (
			employee_id
		);


/* 휴가신청 */
CREATE TABLE holiday_request (
	holiday_number NUMBER NOT NULL, /* 휴가신청번호 */
	employee_id NUMBER(6,0) NOT NULL, /* 사번 */
	holiday_type number(1,0), /* 휴가유형번호 */
	holiday_desc VARCHAR2(250), /* 사유 */
	holiday_start DATE NOT NULL, /* 시작일 */
	holiday_end DATE /* 종료일 */
);

ALTER TABLE holiday_request
	ADD
		CONSTRAINT PK_holiday_request
		PRIMARY KEY (
			holiday_number
		);

ALTER TABLE holiday_request
	ADD
		CONSTRAINT FK_holiday_type
		FOREIGN KEY (
			holiday_type
		)
		REFERENCES holiday_type (
			holiday_type
		);

ALTER TABLE holiday_request
	ADD
		CONSTRAINT fk_holiday_employee_id
		FOREIGN KEY (
			employee_id
		)
		REFERENCES employee (
			employee_id
		);



/* 휴가결재 */
CREATE TABLE holiday_approval (
	holiday_number NUMBER NOT NULL, /* 휴가신청번호 */
	holiday_approval_status NUMBER(1,0) NOT NULL, /* 승인상태 */
	holiday_approval_first NUMBER(6,0), /* 1차결재자사번 */
	holiday_approval_second NUMBER(6,0), /* 2차결재자사번 */
	holiday_approval_third NUMBER(6,0) /* 3차결재자사번 */
);

ALTER TABLE holiday_approval
	ADD
		CONSTRAINT PK_holiday_approval
		PRIMARY KEY (
			holiday_number
		);

ALTER TABLE holiday_approval
	ADD
		CONSTRAINT FK_holiday_number
		FOREIGN KEY (
			holiday_number
		)
		REFERENCES holiday_request (
			holiday_number
		);

ALTER TABLE holiday_approval
	ADD
		CONSTRAINT FK_holiday_employee_first
		FOREIGN KEY (
			holiday_approval_first
		)
		REFERENCES approval_level (
			employee_id
		);

ALTER TABLE holiday_approval
	ADD
		CONSTRAINT FK_holiday_employee_second
		FOREIGN KEY (
			holiday_approval_second
		)
		REFERENCES approval_level (
			employee_id
		);

ALTER TABLE holiday_approval
	ADD
		CONSTRAINT FK_holiday_employee_third
		FOREIGN KEY (
			holiday_approval_third
		)
		REFERENCES approval_level (
			employee_id
		);




/* 공지사항 */
CREATE TABLE notice (
	notice_id NUMBER NOT NULL, /* 공지번호 */
	employee_id NUMBER(6,0) NOT NULL, /* 사번 */
	notice_cnt VARCHAR2(250) NOT NULL, /* 공지내용 */
	notice_title VARCHAR2(50) NOT NULL, /* 공지제목 */
	notice_time DATE NOT NULL /* 공지작성일시 */
);

ALTER TABLE notice
	ADD
		CONSTRAINT PK_notice
		PRIMARY KEY (
			notice_id
		);

ALTER TABLE notice
	ADD
		CONSTRAINT FK_notice_employee_id
		FOREIGN KEY (
			employee_id
		)
		REFERENCES employee (
			employee_id
		);




/* 유형 */
CREATE TABLE cal_type (
	cal_type number(1,0) NOT NULL, /* 유형번호 */
	cal_type_name VARCHAR2(30) NOT NULL /* 유형이름 */
);

ALTER TABLE cal_type
	ADD
		CONSTRAINT PK_cal_type
		PRIMARY KEY (
			cal_type
		);
        
        
        
        
/* 달력 */
CREATE TABLE calendar (
	cal_no NUMBER NOT NULL, /* 달력생성번호 */
	employee_id NUMBER(6,0) NOT NULL, /* 사번 */
	cal_type number(1,0) NOT NULL, /* 유형번호 */
	cal_revealed number(1,0) NOT NULL, /* 공개여부 */
	cal_cnt VARCHAR2(100), /* 상세정보 */
	cal_start DATE NOT NULL, /* 시작일 */
	cal_end DATE /* 종료일 */
);

ALTER TABLE calendar
	ADD
		CONSTRAINT PK_calendar
		PRIMARY KEY (
			cal_no
		);

ALTER TABLE calendar
	ADD
		CONSTRAINT FK_cal_employee_id
		FOREIGN KEY (
			employee_id
		)
		REFERENCES employee (
			employee_id
		);

ALTER TABLE calendar
	ADD
		CONSTRAINT FK_cal_type
		FOREIGN KEY (
			cal_type
		)
		REFERENCES cal_type (
			cal_type
		);