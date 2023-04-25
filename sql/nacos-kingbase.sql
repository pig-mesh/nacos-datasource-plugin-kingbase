CREATE TABLE "config_info" (
	"id" bigint AUTO_INCREMENT,
	"data_id" character varying(255 char) NOT NULL,
	"group_id" character varying(255 char) NULL,
	"content" text NOT NULL,
	"md5" character varying(32 char) NULL,
	"gmt_create" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"gmt_modified" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"src_user" text NULL,
	"src_ip" character varying(50 char) NULL,
	"app_name" character varying(128 char) NULL,
	"tenant_id" character varying(128 char) NULL DEFAULT NULL::varchar,
	"c_desc" character varying(256 char) NULL,
	"c_use" character varying(64 char) NULL,
	"effect" character varying(64 char) NULL,
	"type" character varying(64 char) NULL,
	"c_schema" text NULL,
	"encrypted_data_key" text NOT NULL,
	CONSTRAINT "PRIMARY_73F26186" PRIMARY KEY (id),
	CONSTRAINT "uk_configinfo_datagrouptenant_C827FEB8" UNIQUE (data_id, group_id, tenant_id)
);


-- "pig_config"."config_info_aggr" definition

-- Drop table

-- DROP TABLE "config_info_aggr";

CREATE TABLE "config_info_aggr" (
	"id" bigint AUTO_INCREMENT,
	"data_id" character varying(255 char) NOT NULL,
	"group_id" character varying(255 char) NOT NULL,
	"datum_id" character varying(255 char) NOT NULL,
	"content" text NOT NULL,
	"gmt_modified" timestamp(0) without time zone NOT NULL,
	"app_name" character varying(128 char) NULL,
	"tenant_id" character varying(128 char) NULL DEFAULT NULL::varchar,
	CONSTRAINT "PRIMARY_F787E5C0" PRIMARY KEY (id),
	CONSTRAINT "uk_configinfoaggr_datagrouptenantdatum_D10078D8" UNIQUE (data_id, group_id, tenant_id, datum_id)
);


-- "pig_config"."config_info_beta" definition

-- Drop table

-- DROP TABLE "config_info_beta";

CREATE TABLE "config_info_beta" (
	"id" bigint AUTO_INCREMENT,
	"data_id" character varying(255 char) NOT NULL,
	"group_id" character varying(128 char) NOT NULL,
	"app_name" character varying(128 char) NULL,
	"content" text NOT NULL,
	"beta_ips" character varying(1024 char) NULL,
	"md5" character varying(32 char) NULL,
	"gmt_create" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"gmt_modified" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"src_user" text NULL,
	"src_ip" character varying(50 char) NULL,
	"tenant_id" character varying(128 char) NULL DEFAULT NULL::varchar,
	"encrypted_data_key" text NOT NULL,
	CONSTRAINT "PRIMARY_E3F5B61F" PRIMARY KEY (id),
	CONSTRAINT "uk_configinfobeta_datagrouptenant_E4D7C681" UNIQUE (data_id, group_id, tenant_id)
);


-- "pig_config"."config_info_tag" definition

-- Drop table

-- DROP TABLE "config_info_tag";

CREATE TABLE "config_info_tag" (
	"id" bigint AUTO_INCREMENT,
	"data_id" character varying(255 char) NOT NULL,
	"group_id" character varying(128 char) NOT NULL,
	"tenant_id" character varying(128 char) NULL DEFAULT NULL::varchar,
	"tag_id" character varying(128 char) NOT NULL,
	"app_name" character varying(128 char) NULL,
	"content" text NOT NULL,
	"md5" character varying(32 char) NULL,
	"gmt_create" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"gmt_modified" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"src_user" text NULL,
	"src_ip" character varying(50 char) NULL,
	CONSTRAINT "PRIMARY_26447CE1" PRIMARY KEY (id),
	CONSTRAINT "uk_configinfotag_datagrouptenanttag_5CBEB0AC" UNIQUE (data_id, group_id, tenant_id, tag_id)
);


-- "pig_config"."config_tags_relation" definition

-- Drop table

-- DROP TABLE "config_tags_relation";

CREATE TABLE "config_tags_relation" (
	"id" bigint NOT NULL,
	"tag_name" character varying(128 char) NOT NULL,
	"tag_type" character varying(64 char) NULL,
	"data_id" character varying(255 char) NOT NULL,
	"group_id" character varying(128 char) NOT NULL,
	"tenant_id" character varying(128 char) NULL DEFAULT NULL::varchar,
	"nid" bigint AUTO_INCREMENT,
	CONSTRAINT "PRIMARY_82226084" PRIMARY KEY (nid),
	CONSTRAINT "uk_configtagrelation_configidtag_25395725" UNIQUE (id, tag_name, tag_type)
);
CREATE INDEX idx_tenant_id_4FB846F8 ON config_tags_relation USING btree (tenant_id);


-- "pig_config"."group_capacity" definition

-- Drop table

-- DROP TABLE "group_capacity";

CREATE TABLE "group_capacity" (
	"id" bigint AUTO_INCREMENT,
	"group_id" character varying(128 char) NOT NULL DEFAULT NULL::varchar,
	"quota" bigint NOT NULL DEFAULT 0,
	"usage" bigint NOT NULL DEFAULT 0,
	"max_size" bigint NOT NULL DEFAULT 0,
	"max_aggr_count" bigint NOT NULL DEFAULT 0,
	"max_aggr_size" bigint NOT NULL DEFAULT 0,
	"max_history_count" bigint NOT NULL DEFAULT 0,
	"gmt_create" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"gmt_modified" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT "PRIMARY_D72B7E75" PRIMARY KEY (id),
	CONSTRAINT "uk_group_id_377325F2" UNIQUE (group_id)
);


-- "pig_config"."his_config_info" definition

-- Drop table

-- DROP TABLE "his_config_info";

CREATE TABLE "his_config_info" (
	"id" numeric NOT NULL,
	"nid" bigint AUTO_INCREMENT,
	"data_id" character varying(255 char) NOT NULL,
	"group_id" character varying(128 char) NOT NULL,
	"app_name" character varying(128 char) NULL,
	"content" text NOT NULL,
	"md5" character varying(32 char) NULL,
	"gmt_create" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"gmt_modified" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"src_user" text NULL,
	"src_ip" character varying(50 char) NULL,
	"op_type" character(10 char) NULL,
	"tenant_id" character varying(128 char) NULL DEFAULT NULL::varchar,
	"encrypted_data_key" text NOT NULL,
	CONSTRAINT "PRIMARY_93A4DC6B" PRIMARY KEY (nid)
);
CREATE INDEX idx_did_8DE97C10 ON his_config_info USING btree (data_id);
CREATE INDEX idx_gmt_create_F3B3E5A1 ON his_config_info USING btree (gmt_create);
CREATE INDEX idx_gmt_modified_42DBB1BB ON his_config_info USING btree (gmt_modified);


-- "pig_config"."permissions" definition

-- Drop table

-- DROP TABLE "permissions";

CREATE TABLE "permissions" (
	"role" character varying(50 char) NOT NULL,
	"resource" character varying(255 char) NOT NULL,
	"action" character varying(8 char) NOT NULL,
	CONSTRAINT "uk_role_permission_9C323780" UNIQUE (role, resource, action)
);


-- "pig_config"."roles" definition

-- Drop table

-- DROP TABLE "roles";

CREATE TABLE "roles" (
	"username" character varying(50 char) NOT NULL,
	"role" character varying(50 char) NOT NULL,
	CONSTRAINT "idx_user_role_314C5701" UNIQUE (username, role)
);


-- "pig_config"."tenant_capacity" definition

-- Drop table

-- DROP TABLE "tenant_capacity";

CREATE TABLE "tenant_capacity" (
	"id" bigint AUTO_INCREMENT,
	"tenant_id" character varying(128 char) NOT NULL DEFAULT NULL::varchar,
	"quota" bigint NOT NULL DEFAULT 0,
	"usage" bigint NOT NULL DEFAULT 0,
	"max_size" bigint NOT NULL DEFAULT 0,
	"max_aggr_count" bigint NOT NULL DEFAULT 0,
	"max_aggr_size" bigint NOT NULL DEFAULT 0,
	"max_history_count" bigint NOT NULL DEFAULT 0,
	"gmt_create" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"gmt_modified" timestamp(0) without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT "PRIMARY_F4CCC2AA" PRIMARY KEY (id),
	CONSTRAINT "uk_tenant_id_22935E1" UNIQUE (tenant_id)
);


-- "pig_config"."tenant_info" definition

-- Drop table

-- DROP TABLE "tenant_info";

CREATE TABLE "tenant_info" (
	"id" bigint AUTO_INCREMENT,
	"kp" character varying(128 char) NOT NULL,
	"tenant_id" character varying(128 char) NULL DEFAULT NULL::varchar,
	"tenant_name" character varying(128 char) NULL DEFAULT NULL::varchar,
	"tenant_desc" character varying(256 char) NULL,
	"create_source" character varying(32 char) NULL,
	"gmt_create" bigint NOT NULL,
	"gmt_modified" bigint NOT NULL,
	CONSTRAINT "PRIMARY_8B91ED1E" PRIMARY KEY (id),
	CONSTRAINT "uk_tenant_info_kptenantid_195888C1" UNIQUE (kp, tenant_id)
);
CREATE INDEX idx_tenant_id_ABB71DBA ON tenant_info USING btree (tenant_id);


-- "pig_config"."users" definition

-- Drop table

-- DROP TABLE "users";

CREATE TABLE "users" (
	"username" character varying(50 char) NOT NULL,
	"password" character varying(500 char) NOT NULL,
	"enabled" tinyint NOT NULL,
	CONSTRAINT "PRIMARY_1A6B23BE" PRIMARY KEY (username)
);

INSERT INTO "roles" ("username","role") VALUES
	 ('nacos','ROLE_ADMIN');

INSERT INTO "users" ("username","password","enabled") VALUES
	 ('nacos','$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu',1);
