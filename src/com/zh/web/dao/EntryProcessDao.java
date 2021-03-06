package com.zh.web.dao;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

import com.zh.core.base.dao.BaseDao;
import com.zh.web.model.bean.EntryProcess;

@Component("entryProcessDao")
public class EntryProcessDao extends BaseDao<EntryProcess> {

	@Override
	@PostConstruct
	public void init() {
		this.setNamespace("M_EntryProcess");
	}

}
