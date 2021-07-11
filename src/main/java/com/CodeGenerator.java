package com;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.po.TableFill;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.rules.DateType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author 小T
 * @Date 2021/6/28 12:18
 */
public class CodeGenerator {
    public static void main(String[] args) {
        //构建一个代码生成器对象
        AutoGenerator msg = new AutoGenerator();

        //全局配置
        GlobalConfig gc = new GlobalConfig();
        String property = System.getProperty("user.dir");//获取当前项目的路径
        gc.setOutputDir(property + "/src/main/java");//文件生成路径
        gc.setAuthor("小T");//设置作者
        gc.setOpen(false);
        gc.setFileOverride(false);//是否覆盖
        gc.setServiceImplName("%sServiceImpl");//去掉Service的前缀I
        gc.setServiceName("%sService");//去掉Service的前缀I
//        gc.setIdType(IdType.ID_WORKER);
        gc.setDateType(DateType.ONLY_DATE);
        gc.setSwagger2(true);//实体类属性Swagger2 注解
        msg.setGlobalConfig(gc);

        //设置数据源
        DataSourceConfig dsc = new DataSourceConfig();
        dsc.setUrl("jdbc:mysql://127.0.0.1:3306/oa?useSSL=false&amp&serverTimezone=UTC");
        dsc.setDriverName("com.mysql.cj.jdbc.Driver");
        dsc.setUsername("root");
        dsc.setPassword("1014");
        dsc.setDbType(DbType.MYSQL);
        msg.setDataSource(dsc);

        //包的配置
        PackageConfig pc = new PackageConfig();
        //pc.setModuleName("");//设置模块名
        pc.setParent("com.leimingting");
        pc.setEntity("pojo");
        pc.setMapper("mapper");
        pc.setService("service");
        pc.setController("controller");
        msg.setPackageInfo(pc);

        // 自定义配置
        InjectionConfig cfg = new InjectionConfig() {
            @Override
            public void initMap() {
                // to do nothing
            }
        };
        // 自定义输出配置
        List<FileOutConfig> focList = new ArrayList<>();
        String templatePath = "/templates/mapper.xml.vm";
        // 自定义配置会被优先输出
        focList.add(new FileOutConfig(templatePath) {
            @Override
            public String outputFile(TableInfo tableInfo) {
                return property + "/src/main/resources/mapper/" + pc.getModuleName()
                        + "/" + tableInfo.getEntityName() + "Mapper" + StringPool.DOT_XML;
            }

        });
        cfg.setFileOutConfigList(focList);
        msg.setCfg(cfg);

        TemplateConfig templateConfig = new TemplateConfig();

        templateConfig.setXml(null);
        msg.setTemplate(templateConfig);

        // 策略配置
        StrategyConfig strategy = new StrategyConfig();
        strategy.setInclude("claim_voucher","claim_voucher_item","deal_record","department","employee");//设置要映射的表名
        strategy.setNaming(NamingStrategy.underline_to_camel);
        strategy.setColumnNaming(NamingStrategy.underline_to_camel);
        strategy.setTablePrefix(new String[]{"claim_"});//去掉表前缀
        strategy.setEntityLombokModel(true);//生成lombock注解

        //逻辑删除配置
        strategy.setLogicDeleteFieldName("deleted");

        //自动填充配置
        TableFill createTime = new TableFill("create_time", FieldFill.INSERT);
        TableFill updateTime = new TableFill("update_time", FieldFill.INSERT_UPDATE);
        ArrayList<TableFill> tableFill = new ArrayList<>();
        tableFill.add(createTime);
        tableFill.add(updateTime);
        strategy.setTableFillList(tableFill);

        //乐观锁配置
//        strategy.setVersionFieldName("version");

        strategy.setRestControllerStyle(true);//支持RESTFUL风格

        //strategy.setControllerMappingHyphenStyle(true);//localhost:8080/hello_id_2

        msg.setStrategy(strategy);

        //执行代码生成器
        msg.execute();
    }
}
