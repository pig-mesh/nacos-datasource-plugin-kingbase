package com.pig4cloud.plugin.impl.kingbase;

import com.alibaba.nacos.common.utils.CollectionUtils;
import com.alibaba.nacos.plugin.datasource.constants.FieldConstant;
import com.alibaba.nacos.plugin.datasource.constants.TableConstant;
import com.alibaba.nacos.plugin.datasource.mapper.HistoryConfigInfoMapper;
import com.alibaba.nacos.plugin.datasource.model.MapperContext;
import com.alibaba.nacos.plugin.datasource.model.MapperResult;
import com.pig4cloud.plugin.constants.DataSourceConstant;

public class HistoryConfigInfoMapperByKingbase extends KingbaseAbstractMapper implements HistoryConfigInfoMapper {

	@Override
	public MapperResult removeConfigHistory(MapperContext context) {
		String sql = "DELETE FROM his_config_info WHERE gmt_modified < ? LIMIT ?";
		return new MapperResult(sql, CollectionUtils.list(context.getWhereParameter(FieldConstant.START_TIME),
				context.getWhereParameter(FieldConstant.LIMIT_SIZE)));
	}

	@Override
	public MapperResult pageFindConfigHistoryFetchRows(MapperContext context) {
		String sql = "SELECT nid,data_id,group_id,tenant_id,app_name,src_ip,src_user,op_type,gmt_create,gmt_modified FROM his_config_info "
				+ "WHERE data_id = ? AND group_id = ? AND tenant_id = ? ORDER BY nid DESC  LIMIT "
				+ context.getPageSize() + " offset " + context.getStartRow();
		return new MapperResult(sql, CollectionUtils.list(context.getWhereParameter(FieldConstant.DATA_ID),
				context.getWhereParameter(FieldConstant.GROUP_ID), context.getWhereParameter(FieldConstant.TENANT_ID)));
	}

	@Override
	public String getTableName() {
		return TableConstant.HIS_CONFIG_INFO;
	}

	@Override
	public String getDataSource() {
		return DataSourceConstant.KINGBASE;
	}

}
