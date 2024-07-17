package com.pig4cloud.plugin.impl.kingbase;

import com.alibaba.nacos.common.utils.CollectionUtils;
import com.alibaba.nacos.plugin.datasource.constants.FieldConstant;
import com.alibaba.nacos.plugin.datasource.constants.TableConstant;
import com.alibaba.nacos.plugin.datasource.mapper.GroupCapacityMapper;
import com.alibaba.nacos.plugin.datasource.model.MapperContext;
import com.alibaba.nacos.plugin.datasource.model.MapperResult;
import com.pig4cloud.plugin.constants.DataSourceConstant;

public class GroupCapacityMapperByKingbase extends KingbaseAbstractMapper implements GroupCapacityMapper {

	@Override
	public MapperResult selectGroupInfoBySize(MapperContext context) {
		String sql = "SELECT id, group_id FROM group_capacity WHERE id > ? LIMIT ?";
		return new MapperResult(sql,
				CollectionUtils.list(context.getWhereParameter(FieldConstant.ID), context.getPageSize()));
	}

	@Override
	public String getDataSource() {
		return DataSourceConstant.KINGBASE;
	}

}
