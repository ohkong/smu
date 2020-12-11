package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.MemberMapper;

public class MemberDao {
	private Class<MemberMapper> cls = MemberMapper.class;
	private Map<String,Object> map = new HashMap<>();
	public int insert(Member mem) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).insert(mem);
		}catch(Exception e) {
			e.printStackTrace();
		} finally{
			MyBatisConnection.close(session);
		}
		return 0;
	}
	public Member selectOne(String id) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("id",id);
			return session.getMapper(cls).select(map).get(0);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	public int update(Member m) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).update(m);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	public int updatePass(String id, String pass) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).updatePass(id,pass);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	public int delete(String id) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).delete(id); 
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	public List<Member> list() {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).select(null);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	public String idSearch(String email,String tel) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).idSearch(email,tel);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	public String pwSearch(String id, String email,String tel) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("id",id);
			map.put("email",email);
			map.put("tel",tel);
			return session.getMapper(cls).pwSearch(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
}
