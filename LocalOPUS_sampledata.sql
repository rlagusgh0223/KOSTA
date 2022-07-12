-------------------------------------
-- 샘플데이터
--<부서 테이블> --0706 수정완료
insert into department values(1, '인사팀');
insert into department values(2, '재정팀');
insert into department values(3, '총무팀');
insert into department values(4, '기획팀');
insert into department values(5, '법무팀');

--<사원 테이블> ?0706 수정완료 부서별 4명씩 총20명
insert into employee values(220702, 1, '220702', '강민주', 'kmj', '2022-07-02', '01011111111', 'abc@email.com', '서울특별시', 'F', '2022-07-02',0, 1);
insert into employee values(220703, 2, '220703', '고영진', 'kyj', '2022-07-03', '01022222222', 'def@email.com', '경기도', 'M', '2022-07-03',0, 1);
insert into employee values(220704, 3, '220704', '김아라', 'kar', '2022-07-04', '01033333333', 'ghi@email.com', '강원도', 'F', '22-07-04',0, 1);
insert into employee values(220705, 4, '220705', '김지연', 'kjy', '2022-07-05', '01044444444', 'jkl@email.com', '제주도', 'F', '2022-07-05',0, 1);
insert into employee values(220706, 5, '220706', '김현호', 'khh', '2022-07-06', '01055555555', 'khh@email.com', '경상도', 'M', '2022-07-06',1, 1);

insert into employee values(220707, 1, '220707', '김사원', 'ksw', '2022-07-07', '01066666666', 'scelerisque.scelerisque@hotmail.edu', 'Ap #709-864 Proin Rd.', 'F', '2022-07-07',0,0);
insert into employee values(220708, 2, '220708', '나사원', 'nsw', '2022-07-08', '01077777777', 'et.netus.et@hotmail.couk', 'Ap #709-864 Proin Rd.', 'M', '2022-07-08',0,0);
insert into employee values(220709, 3, '220709', '다사원', 'dsw', '2022-07-09', '01088888888', 'metus@outlook.com', 'Ap #709-864 Proin Rd.', 'F', '2022-07-09',0,0);
insert into employee values(220710, 4, '220710', '라현호', 'rsw', '2022-07-10', '01099999999', 'ornare.sagittis@yahoo.net', '9980 Ut Avenue', 'F', '2022-07-10',0,0);
insert into employee values(220711, 5, '220711', '마사원', 'msw', '2022-07-11', '01011112222', 'faucibus.morbi@protonmail.couk', '6246 Facilisis Ave', 'M', '2022-07-11',1,0);

insert into employee values(220712, 1, '220707', '김직원', 'ksw', '2022-07-07', '01011113333', 'penatibus.et@aol.couk','Ap #170-263 Mollis. St.', 'F', '2022-07-07',0,0);
insert into employee values(220713, 2, '220708', '나직원', 'nsw', '2022-07-08', '01011114444', 'elit@icloud.ca','640 Non Ave', 'M', '2022-07-08',0,0);
insert into employee values(220714, 3, '220709', '다직원', 'dsw', '2022-07-09', '01011115555', 'rutrum.non@aol.ca','Ap #629-8083 Auctor. Road', 'M', '2022-07-09',0,0);
insert into employee values(220715, 4, '220710', '라직원', 'rsw', '2022-07-10', '01011116666', 'lorem.ut.aliquam@hotmail.edu','156-645 In Ave', 'M', '2022-07-10',0,0);
insert into employee values(220716, 5, '220711', '마사원', 'msw', '2022-07-11', 'ac.metus@aol.net','Ap #798-9219 Nec St.', '608-353 Nam Rd.', 'M', '2022-07-11',1,0);

insert into employee values(220717, 1, '220712', '바사원', 'ksw', '2022-07-12', '01066666666', 'scelerisque.scelerisque@hotmail.edu', 'Ap #709-864 Proin Rd.', 'M', '2022-07-07',0,0);
insert into employee values(220718, 2, '220713', '사사원', 'nsw', '2022-07-13', '01077777777', 'et.netus.et@hotmail.couk', 'Ap #709-864 Proin Rd.', 'F', '2022-07-08',0,0);
insert into employee values(220719, 3, '220714', '아사원', 'dsw', '2022-07-09', '01088888888', 'metus@outlook.com', 'Ap #709-864 Proin Rd.', 'F', '2022-07-14',0,0);
insert into employee values(220720, 4, '220715', '자현호', 'rsw', '2022-07-10', '01099999999', 'ornare.sagittis@yahoo.net', '9980 Ut Avenue', 'F', '2022-07-10',0,0);
insert into employee values(220721, 5, '220716', '차사원', 'msw', '2022-07-15', '01011112222', 'faucibus.morbi@protonmail.couk', '6246 Facilisis Ave', 'M', '2022-07-11',1,0);

insert into employee values(220722, 1, '220717', '카현호', 'rsw', '2022-07-10', '01099999999', 'a.scelerisque@hotmail.com', '387-6382 Aliquet Road', 'F', '2022-07-10',0,0);
insert into employee values(220723, 2, '220718', '타사원', 'msw', '2022-07-16', '01011112222', 'faucibus.morbi@protonmail.couk', '6246 Facilisis Ave', 'F', '2022-07-11',1,0);
insert into employee values(220724, 3, '220719', '파현호', 'rsw', '2022-07-10', '01099999999', 'ornare.sagittis@yahoo.net', '9980 Ut Avenue', 'F', '2022-07-17',0,0);
insert into employee values(220725, 4, '220720', '하사원', 'msw', '2022-07-20', '01011112222', 'interdum.enim@outlook.edu', '6246 Facilisis Ave', 'M', '2022-07-20',1,0);

--<유형>--0706 수정완료
insert into cal_type values(1, '휴가');
insert into cal_type values(2, '출장');
insert into cal_type values(3, '회의');
insert into cal_type values(4, '외근');
insert into cal_type values(5, '세미나');
insert into cal_type values(6, '기타');

--<달력>--0706 수정완료
-- 수정사항 : 달 수 일부 수정, 사번은 기존의 번호 재사용(중복사용을 확인하기 위해)
insert into calendar values(1, 220702, 3, 0, 'A회사와의 회의', '2022-07-12', '2022-07-14');
insert into calendar values(2, 220703, 1, 1, '이틀 연차', '2022-07-03', '2022-07-04');
insert into calendar values(3, 220704, 3, 1, '', '2022-07-04', '');
insert into calendar values(4, 220705, 4, 0, 'B지점 외근', '2022-07-04', '2022-07-10');
insert into calendar values(5, 220706, 5, 1, '학회세미나', '2022-07-23', '2022-07-24'); 
-- 제목, 날짜 변경
insert into calendar values(6, 220702, 3, 0, '강민주 사원 및 5명 신입 교육', '2022-08-12', '2022-08-14');
insert into calendar values(7, 220703, 1, 0, 'kosta팀 단체 출장', '2022-08-03', '2022-08-04');
insert into calendar values(8, 220703, 3, 1, '', '2022-07-04', '');
insert into calendar values(9, 220705, 4, 0, '', '2022-07-04', '');-- 사번은 다르나 동일하게 일정과 종료일 입력 안함
insert into calendar values(10, 220706, 5, 1, '244팀 직원 리더십 교육', '2022-08-25', '2022-08-26'); 
-- 새로운 사번
insert into calendar values(11, 220707, 3, 0, 'A회사와의 회의', '2022-07-12', '2022-07-14');
insert into calendar values(12, 220708, 1, 1, '이틀 연차', '2022-06-23', '2022-06-24');
insert into calendar values(13, 220709, 3, 0, '', '2022-08-04', '');
insert into calendar values(14, 220710, 4, 1, 'B지점 외근', '2022-07-04', '2022-07-10');
insert into calendar values(15, 220711, 5, 1, '학회세미나', '2022-07-23', '2022-07-24'); 



--<사원별휴가현황>--0706수정필요x
insert into holiday_info values(220702, 15, 1);
insert into holiday_info values(220703, 15, 2);
insert into holiday_info values(220704, 15, 3);
insert into holiday_info values(220705, 15, 4);
insert into holiday_info values(220706, 15, 5);

--<휴가유형번호>--0706수정완료 
insert into holiday_type values(1, '연차');
insert into holiday_type values(2, '월차');
insert into holiday_type values(3, '반차');
insert into holiday_type values(4, '보건');
insert into holiday_type values(5, '병가');
insert into holiday_type values(6, '출산휴가');
insert into holiday_type values(7, '육아휴가');
insert into holiday_type values(8, '경조사');
insert into holiday_type values(9, '기타');


--<휴가결재자>--0706수정했음
insert into approval_level values(220702);
insert into approval_level values(220703);
insert into approval_level values(220704);



--<휴가신청>--0706수정했음
insert into holiday_request values(1, 220702, 1, '개인사정', '2022-08-04',  '2022-08-05');
insert into holiday_request values(2, 220703, 2, '', '2022-08-05', '2022-08-07');
insert into holiday_request values(3, 220704, 3, '','2022-08-06','2022-08-08');
insert into holiday_request values(4, 220705, 4, '보건', '2022-08-08', '');
insert into holiday_request values(5, 220706, 5, '병가', '2022-08-09', '' );
insert into holiday_request values(6, 220706, 6, '출산휴가', '2022-08-10', '' );
insert into holiday_request values(7, 220707, 7, '', '2022-08-11', '' );
insert into holiday_request values(8, 220708, 8, '경조사로 인한 휴가', '2022-08-12', '' );
insert into holiday_request values(9, 220709, 9, '', '2022-08-13', '' );
insert into holiday_request values(10, 220710, 5, '병가', '2022-08-14', '' ); --유형이9까지만 존재 , 유형에 맞게 내용 수정(4번,6번,10번) 




--<휴가결재>--0705수정했음
insert into holiday_approval values(1, 0, 220703, 220704, 220702); -- 3차 결재완료
insert into holiday_approval values(2, 1, 220703, '', ''); --1차 승인대기중
insert into holiday_approval values(3, -1, 220702, 220703, ''); -- 2차반려
insert into holiday_approval values(4, 0, '', '', '');--3차 승인완료
insert into holiday_approval values(5, 2, 220704, 220702, ''); -- 2차 승인대기중
insert into holiday_approval values(6, 1, 220702, 220704, ''); -- 1차 승인, 2차 대기중
insert into holiday_approval values(7, -1, 220704, '', ''); -- 반려

insert into holiday_approval values(8, 0, 220702, '', ''); -- 1차 승인 완료
insert into holiday_approval values(9, -1, 220703, 220704, ''); -- 반려
--insert into holiday_approval values(10, 1, 220702, 220704, 220703); --유형이 9까지만존재

delete from notice;

--<공지사항>--0706추가함
insert into notice values
(1, 220702, '2022년 건강검진 대상자를 안내드립니다', '2022년 건강검진 대상자 안내',  '22/02/02 18:00:00');

insert into notice values
(2, 220703, '2022년 사내 체육대회 안내드립니다', '2022년 사내 체육대회 안내', '22/02/02 16:00:00');

insert into notice values
(3, 220704, '2022년 암검진 대상자를 안내드립니다', '2022년 암검진 대상자 안내', '22/05/10 15:00:00');

insert into notice values
(4, 220705, '2022년 5월 사내 특강 안내', '5월 사내 특강 안내드립니다', '22/02/01 15:00:00');

insert into notice values
(6, 220706, '2022년 암검진 대상자를 안내드립니다', '2022년 암검진 대상자 안내', '22/07/10 15:00:00'); -- 제목 중복

insert into notice values
(7, 220702, '2022년 체육대회 사진', '2022년 체육대회 사진 올려드립니다.', '22/07/15 16:00'); -- 작성자 중복

insert into notice values
(8, 220704, 'kosta사 244팀 프로젝트', '팀 프로젝트 올립니다',  '22/05/10 15:00:00'); -- 작성자, 날짜 중복

insert into notice values
(9, 220703, '2022년 체육대회 사진', '2022년 체육대회 사진 올려드립니다.', '22/07/15 16:00'); -- 작성자 중복

insert into notice values
(10, 220703, 'kosta사 244팀 프로젝트', '팀 프로젝트 올립니다', '22/07/10 15:00:00'); -- 작성자, 날짜 중복

insert into notice values
(11, 220704, 'kosta사 244팀 프로젝트', '팀 프로젝트 올립니다', '22/07/10 15:00:00'); -- 제목, 날짜 중복
