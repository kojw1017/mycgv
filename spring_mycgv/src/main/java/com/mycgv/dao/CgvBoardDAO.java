package com.mycgv.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.mycgv.vo.CgvBoardVO;

public class CgvBoardDAO extends DBConn{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace="mapper.board";
	
	
	/**
	 * 전체 리스트 카운트
	 */
	public int getListCount() {
		return sqlSession.selectOne(namespace+".listcount");		
	}
	
	
	/**
	 * Delete : 삭제
	 */
	public boolean getDelete(String bid) {
		boolean result = false;
		int val = sqlSession.delete(namespace+".delete",bid);
		if(val != 0) result = true;
		return result;
	}
	
	/**
	 * Update : 내용 업데이트 - 새로운 파일을 선택한 경우
	 */
	public boolean getUpdate(CgvBoardVO vo) {		
		boolean result = false;
		int value = sqlSession.update(namespace+".update",vo);
		if(value !=0) result = true;
		return result;
	}
	
	
	/**
	 * Update : 조회수 업데이트
	 */
	public void getUpdateHits(String bid) {
		 sqlSession.update(namespace+".updatehits", bid);	
	}
	
	
	/**
	 * Select : 상세 내용
	 */
	public CgvBoardVO getContent(String bid) {
		return sqlSession.selectOne(namespace+".content",bid);
	}
	
	
	
	/**
	 * Select : 전체 리스트 - 페이징처리 포함
	 */
	public ArrayList<CgvBoardVO> getList(int start, int end){
		Map<String,String> param = new HashMap<String,String>();
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));
		
		List<CgvBoardVO> list = sqlSession.selectList(namespace+".list", param);
		return (ArrayList<CgvBoardVO>)list;
		
	}
	
	/**
	 * Insert : 글쓰기 
	 */
	public boolean getInsert(CgvBoardVO vo) {
		boolean result = false;
		int value = sqlSession.insert(namespace+".insert", vo);
		if(value !=0) result = true;
		return result;		
	}
	
	
	/**
	 * Select : 전체 리스트
	 
	public ArrayList<CgvBoardVO> getList(){
		ArrayList<CgvBoardVO> list = new ArrayList<CgvBoardVO>();
		
		try {
			String sql = "select rownum rno, bid, btitle, to_char(bdate,'yyyy.mm.dd'), bhits " + 
					" from (select * from cgvboard order by bdate desc)";
			
			getPreparedStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				CgvBoardVO vo = new CgvBoardVO();
				vo.setRno(rs.getInt(1));
				vo.setBid(rs.getString(2));
				vo.setBtitle(rs.getString(3));
				vo.setBdate(rs.getString(4));
				vo.setBhits(rs.getInt(5));
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}	
	*/

}








