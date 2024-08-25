package com.pig4cloud.plugin.impl.kingbase;

import com.alibaba.nacos.plugin.datasource.constants.TableConstant;
import com.alibaba.nacos.plugin.datasource.mapper.ConfigInfoTagMapper;
import com.alibaba.nacos.plugin.datasource.model.MapperContext;
import com.alibaba.nacos.plugin.datasource.model.MapperResult;
import com.pig4cloud.plugin.constants.DataSourceConstant;

import java.util.Collections;

public class ConfigInfoTagMapperByKingbase extends KingbaseAbstractMapper implements ConfigInfoTagMapper {

	@Override
	public MapperResult findAllConfigInfoTagForDumpAllFetchRows(MapperContext context) {
		String sql = " SELECT t.id,data_id,group_id,tenant_id,tag_id,app_name,content,md5,gmt_modified "
				+ " FROM (  SELECT id FROM config_info_tag  ORDER BY id LIMIT " + context.getPageSize() + " offset "
				+ context.getStartRow() + " ) " + "g, config_info_tag t  WHERE g.id = t.id  ";
		return new MapperResult(sql, Collections.emptyList());
	}

	@Override
	public String getDataSource() {
		return DataSourceConstant.KINGBASE;
	}

}
