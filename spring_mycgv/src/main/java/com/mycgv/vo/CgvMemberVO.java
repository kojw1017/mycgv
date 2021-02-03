package com.mycgv.vo;

public class CgvMemberVO {
	//Field
	int rno;
	String id,pass,name,gender,email,email_agr,addr1,addr2
		,hp1,hp2,hp3,cp1,cp2,cp3,job,intro, mdate;
	String[] hobby;
	String addr, hp, cp, hobby_list;
	

	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail_agr() {
		return email_agr;
	}
	public void setEmail_agr(String email_agr) {
		this.email_agr = email_agr;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getHp1() {
		return hp1;
	}
	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}
	public String getHp2() {
		return hp2;
	}
	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}
	public String getHp3() {
		return hp3;
	}
	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}
	public String getCp1() {
		return cp1;
	}
	public void setCp1(String cp1) {
		this.cp1 = cp1;
	}
	public String getCp2() {
		return cp2;
	}
	public void setCp2(String cp2) {
		this.cp2 = cp2;
	}
	public String getCp3() {
		return cp3;
	}
	public void setCp3(String cp3) {
		this.cp3 = cp3;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String[] getHobby() {
		return hobby;
	}
	public void setHobby(String[] hobby) {
		this.hobby = hobby;
	}
	public String getAddr() {	
		String str ="";
		if(addr1 != null) {
			str = getAddr1() + " " + getAddr2();
		}else {
			str = addr;
		}
		return str;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getHp() {
		return hp1+"-"+hp2+"-"+hp3;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getCp() {
		String str="";
		if(cp1 != null) {
			str = cp1 +"-"+cp2+"-"+cp3;
		}else {
			str = cp;
		}
		return str;
	}
	public void setCp(String cp) {
		this.cp = cp;
	}
	public String getHobby_list() {
		String str = "";
		if(hobby != null) {
			str = String.join(",", hobby);
		}else {
			str = hobby_list;
		}
		return str;
	}
	public void setHobby_list(String hobby_list) {
		this.hobby_list = hobby_list;
	}	
	
}











