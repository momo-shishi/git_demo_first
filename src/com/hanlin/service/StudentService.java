package com.hanlin.service;

import java.util.List;

import com.hanlin.pojo.Dorm;
import com.hanlin.pojo.Record;
import com.hanlin.pojo.Student;

public interface StudentService {

	List<Student> getStudentList(String sname);

	Student getStudent(int sid);

	List<Dorm> getDormList(String sex);

	int upStudent(Student s);

	int upRecord(int sid,String format);

	int addRecord(Record record);

	void upDormSumpeople(int did);

	void upDormSumPeo(int did);

	List<Record> getRecordList(int sid);

}
