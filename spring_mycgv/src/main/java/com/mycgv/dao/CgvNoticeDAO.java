package com.mycgv.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.mycgv.vo.CgvNoticeVO;

public class CgvNoticeDAO extends DBConn{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace = "mapper.notice";
	
	/**
	 * 선택 삭제
	 */
	public int getSelectDelete(String[] dellist) {
		return sqlSession.delete(namespace+".deletelist", dellist);
	}
	
	
	/**
	 * 전체 리스트 카운트
	 */
	public int getListCount() {
		return sqlSession.selectOne(namespace+".listcount");		
	}
	
	
	
	/**
	 * Update : 조회수 업데이트
	 */
	public void getUpdateHits(String nid) {
		sqlSession.update(namespace+".updatehits", nid);		
	}
	
	
	
	/**
	 * Delete : 삭제
	 */
	public boolean getDelete(String nid) {
		boolean result = false;
		int value = sqlSession.delete(namespace+".delete", nid);
		if(value !=0) result = true;
		return result;		
	}
	
	
	/**
	 * Update : 내용 수정 - nfile,nsfile
	 */
	public boolean getUpdate(CgvNoticeVO vo) {
		boolean result = false;
		int value = sqlSession.update(namespace+".update",vo);
		if(value !=0) result = true;
		return result;		
	}
	
	
	/**
	 * Select : 상세정보 출력
	 */
	public CgvNoticeVO getContent(String nid) {
		return sqlSession.selectOne(namespace+".content",nid);		
	}
	
	
	/**
	 * Select : 전체 리스트 출력 
	*/ 
	public ArrayList<CgvNoticeVO> getList(int start, int end){
		Map<String,String> param = new HashMap<String,String>();
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));
		List<CgvNoticeVO> list = sqlSession.selectList(namespace+".list",param);
		return (ArrayList<CgvNoticeVO>)list;
	}
	
	/**
	 * Insert : 공지사항 글쓰기
	 */
	public boolean getInsert(CgvNoticeVO vo) {
		boolean result = false;
		int value = sqlSession.insert(namespace+".insert",vo);
		if(value !=0 ) result = true;
		return result;		
	}
	
	
	/**
	 * Select : 전체 리스트 출력 
	 
	public ArrayList<CgvNoticeVO> getList(){
		ArrayList<CgvNoticeVO> list = new ArrayList<CgvNoticeVO>();
		
		try {
			String sql = "select rownum rno, nid, ntitle, to_char(ndate,'yyyy.mm.dd'), nhits" + 
					" from (select * from cgvnotice order by ndate desc)";
			
			getPreparedStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				CgvNoticeVO vo = new CgvNoticeVO();
				vo.setRno(rs.getInt(1));
				vo.setNid(rs.getString(2));
				vo.setNtitle(rs.getString(3));
				vo.setNdate(rs.getString(4));
				vo.setNhits(rs.getInt(5));
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	*/
	
	
}//class





