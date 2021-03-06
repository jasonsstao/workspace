package com.lauvan.apps.communication.mobileuser.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.lauvan.config.JFWebConfig;
import com.lauvan.core.annotation.TableBind;

@TableBind(name = "t_mobileuser", pk = "id")
public class T_MobileUser extends Model<T_MobileUser> {
	private static final long	serialVersionUID	= 1L;
	public static T_MobileUser	dao					= new T_MobileUser();

	public Page<Record> getGridPage(Integer pageNum, Integer pageSize, String username, String realname) {
		pageNum = pageNum == null || pageNum < 1 ? 1 : pageNum;
		pageSize = pageSize == null || pageSize < 1 ? JFWebConfig.pageSize : pageSize;
		String sql = "select t.*";
		StringBuffer str = new StringBuffer();
		str.append(" from t_mobileuser t where 1=1");
		if(username != null && !"".equals(username)) {
			str.append(" and t.username like '%").append(username).append("%'");
		}
		if(realname != null && !"".equals(realname)) {
			str.append(" and t.realname like '%").append(realname).append("%'");
		}
		str.append(" order by t.id desc");
		return Db.paginate(pageNum, pageSize, sql, str.toString());
	}

	//获取所有终端用户
	public List<Record> getAllusers() {
		String sql = "select * from T_MobileUser order by id desc";
		return Db.find(sql);
	}
}
