package com.hanlin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hanlin.mapper.DormMapper;
import com.hanlin.mapper.RecordMapper;
import com.hanlin.mapper.StudentMapper;
import com.hanlin.pojo.Dorm;
import com.hanlin.pojo.Record;
import com.hanlin.pojo.Student;
import com.hanlin.service.StudentService;
@Service
@Transactional
public class StudentServiceImpl implements StudentService{

	@Autowired
	private StudentMapper studentMapper;
	@Autowired
	private DormMapper dormMapper;
	@Autowired
	private RecordMapper recordMapper;

	@Override
	public List<Student> getStudentList(String sname) {
		return studentMapper.getStudentList(sname);
	}

	@Override
	public Student getStudent(int sid) {
		return studentMapper.getStudent(sid);
	}
	@Override
	public List<Dorm> getDormList(String sex) {
		return dormMapper.getDormList(sex);
	}

	@Override
	public int upStudent(Student s) {
		return studentMapper.updateByPrimaryKeySelective(s);
	}

	@Override
	public int upRecord(int sid, String format) {
		return recordMapper.updateRecord(sid,format);
	}

	@Override
	public int addRecord(Record record) {
		return recordMapper.insert(record);
	}

	@Override
	public void upDormSumpeople(int did) {
		dormMapper.upDormSumpeople(did);
		
	}

	@Override
	public void upDormSumPeo(int did) {
		dormMapper.upDormSumPeo(did);
		
	}

	@Override
	public List<Record> getRecordList(int sid) {
		
		return recordMapper.getRecordList(sid);
	}

	
}
