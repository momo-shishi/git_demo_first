package com.hanlin.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hanlin.pojo.Dorm;
import com.hanlin.pojo.Record;
import com.hanlin.pojo.Student;
import com.hanlin.service.StudentService;

@Controller
@RequestMapping("/student/")
public class StudentController {

	@Autowired
	private StudentService studentService;
	
	//学生详细信息列表
	@RequestMapping("toStudentList")
	public String getStudentList(Model model,@RequestParam(value="sname",required=true)String sname) {
		sname=sname==null?null:sname.trim();
		List<Student> list =studentService.getStudentList(sname);
		model.addAttribute("list", list);
		return "stu_list";
	}
	//更换宿舍1
	@RequestMapping("replacement")
	public String replacement(int sid,HttpSession session) {
		Student s=studentService.getStudent(sid);
		studentService.upDormSumPeo(s.getDid());
		List<Dorm> dlist=studentService.getDormList(s.getSex());
		session.setAttribute("s", s);
		session.setAttribute("dlist", dlist);
		return "updorm_list";
	}
	//更换宿舍2
	@RequestMapping("updorm")
	@ResponseBody
	public Object updorm(int sid,int did) {
		Student s=new Student();
		s.setSid(sid);
		s.setDid(did);
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yy-MM-dd");
		String format = sdf.format(date);
		boolean b=false;
		try {
			int i=studentService.upStudent(s);
			studentService.upDormSumpeople(did);
			int j=studentService.upRecord(sid,format);
			System.out.println(j+sid);
			System.out.println(j);
			Student st=studentService.getStudent(sid);
			Record record=new Record();
			record.setSid(sid);
			record.setDid(did);
			record.setSumpeople(st.getSumpeople());
			record.setStartdate(format);
			int x=studentService.addRecord(record);
			b=i>0?true:false;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return b;
	}
	//查看宿舍更换记录
	@RequestMapping("Replace")
	public String Replace(int sid,HttpSession session) {
		Student s=studentService.getStudent(sid);
		session.setAttribute("s", s);
		List<Record> list=studentService.getRecordList(sid);
		session.setAttribute("list", list);
		return "replace_record";
	}
}
