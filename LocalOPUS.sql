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
/* �μ� */
CREATE TABLE department (
	department_id NUMBER NOT NULL, /* �μ���ȣ */
	department_name VARCHAR2(50) /* �μ��� */
);

ALTER TABLE department
	ADD
		CONSTRAINT PK_department
		PRIMARY KEY (
			department_id
		);
        


/* ��� */
CREATE TABLE employee (
	employee_id NUMBER(6,0) NOT NULL, /* ��� */
	department_id NUMBER NOT NULL, /* �μ���ȣ */
	employee_password VARCHAR2(50) NOT NULL, /* ��й�ȣ */
	employee_name_kr VARCHAR2(30) NOT NULL, /* �ѱ��̸� */
	employee_name_eng VARCHAR2(50), /* �����̸� */
	employee_hiredate DATE NOT NULL, /* �Ի��� */
	employee_phonenumber VARCHAR(30) NOT NULL, /* ��ȭ��ȣ */
	employee_email VARCHAR(40) NOT NULL, /* �̸��� */
	employee_address VARCHAR2(250), /* �ּ� */
	employee_gender CHAR(1) NOT NULL, /* ���� */
	employee_birthday DATE NOT NULL, /* ������� */
	employee_resign NUMBER, /* ��翩�� */
	notice_authority NUMBER /* �����ڱ��ѿ��� */
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




/* ������ް���Ȳ */
CREATE TABLE holiday_info (
	employee_id NUMBER(6,0) NOT NULL, /* ��� */
	holiday_total NUMBER, /* �ް����ϼ� */
	holiday_using NUMBER /* ���ε��ް��ϼ� */
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




/* �ް�������ȣ */
CREATE TABLE holiday_type (
	holiday_type number(1,0) NOT NULL, /* �ް�������ȣ */
	holiday_type_name VARCHAR2(30) NOT NULL /* �ް������̸� */
);

ALTER TABLE holiday_type
	ADD
		CONSTRAINT PK_holiday_type
		PRIMARY KEY (
			holiday_type
		);



/* �ް������� */
CREATE TABLE approval_level (
	employee_id NUMBER(6,0) NOT NULL /* �����ڻ�� */
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


/* �ް���û */
CREATE TABLE holiday_request (
	holiday_number NUMBER NOT NULL, /* �ް���û��ȣ */
	employee_id NUMBER(6,0) NOT NULL, /* ��� */
	holiday_type number(1,0), /* �ް�������ȣ */
	holiday_desc VARCHAR2(250), /* ���� */
	holiday_start DATE NOT NULL, /* ������ */
	holiday_end DATE /* ������ */
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



/* �ް����� */
CREATE TABLE holiday_approval (
	holiday_number NUMBER NOT NULL, /* �ް���û��ȣ */
	holiday_approval_status NUMBER(1,0) NOT NULL, /* ���λ��� */
	holiday_approval_first NUMBER(6,0), /* 1�������ڻ�� */
	holiday_approval_second NUMBER(6,0), /* 2�������ڻ�� */
	holiday_approval_third NUMBER(6,0) /* 3�������ڻ�� */
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




/* �������� */
CREATE TABLE notice (
	notice_id NUMBER NOT NULL, /* ������ȣ */
	employee_id NUMBER(6,0) NOT NULL, /* ��� */
	notice_cnt VARCHAR2(250) NOT NULL, /* �������� */
	notice_title VARCHAR2(50) NOT NULL, /* �������� */
	notice_time DATE NOT NULL /* �����ۼ��Ͻ� */
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




/* ���� */
CREATE TABLE cal_type (
	cal_type number(1,0) NOT NULL, /* ������ȣ */
	cal_type_name VARCHAR2(30) NOT NULL /* �����̸� */
);

ALTER TABLE cal_type
	ADD
		CONSTRAINT PK_cal_type
		PRIMARY KEY (
			cal_type
		);
        
        
        
        
/* �޷� */
CREATE TABLE calendar (
	cal_no NUMBER NOT NULL, /* �޷»�����ȣ */
	employee_id NUMBER(6,0) NOT NULL, /* ��� */
	cal_type number(1,0) NOT NULL, /* ������ȣ */
	cal_revealed number(1,0) NOT NULL, /* �������� */
	cal_cnt VARCHAR2(100), /* ������ */
	cal_start DATE NOT NULL, /* ������ */
	cal_end DATE /* ������ */
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