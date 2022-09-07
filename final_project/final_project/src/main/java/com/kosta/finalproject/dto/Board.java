package com.kosta.finalproject.dto;
// dto와 entity역할 다 담당
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Component
@NoArgsConstructor
@AllArgsConstructor
@Setter @Getter
@EqualsAndHashCode(of = {"boardNo"})
@ToString

// Data
@Entity
@Table(name = "board_jpa")  // 테이블 선언 밑 이름 지정
@SequenceGenerator(name="boardjpa_seq_generator", // 게시글에서 일련번호 발급할때 시퀀스 번호 사용하겠다
                   sequenceName="board_jpa_seq", // 실제 테이블에서 사용할 이름
                   initialValue=1, // 시작값
                   allocationSize=1)  // 증가값
@DynamicInsert
@DynamicUpdate
public class Board {
	@Transient // DB테이블에 컬럼으로 만들어질 변수가 아님(ORM에서 제외된다)
	private int level;
	
	@Id  // PK
	@GeneratedValue(strategy = GenerationType.SEQUENCE,  // 위의 @SequenceGenerator에서 만든 값을 활용  (strategy = GenerationType.SEQUENCE: 상수로 사용)
	                generator="boardjpa_seq_generator") // @SequenceGenerator의 name
	@Column(name="board_no")
	private Long boardNo;  // 게시글 번호
	
	@Column(name="board_parent_no")
	@ColumnDefault(value = "0")
	private Long boardParentNo;
	
	@Column(name="board_title")
	private String boardTitle;
	
	@Column(name="board_content")
	private String boardContent;
	
	@JsonFormat(pattern = "yy/MM/dd", timezone = "Asiz/Seoul")
	@Column(name="board_dt")
	@ColumnDefault(value="SYSDATE")
	private Date boardDt;
	
	@Column(name="board_id")
	private String boardId;
	
	@Column(name="board_viewcount")
	private Integer boardViewcount;
}
