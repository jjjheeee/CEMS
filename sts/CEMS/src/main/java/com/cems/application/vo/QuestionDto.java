package com.cems.application.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class QuestionDto implements Serializable{
	int paragraph_id;
	String TOPIK1_listening_sentence;
	int sentence_id;
	int TOPIK1_type_id;
	int TOPIK1_subtype_id;
	int question_set;
	String paragraph;
	String question_image;
	String TOPIK1_question;
	String question_answer;
	String question_wrong;
	int question_counts;
	String listening_check;
}
