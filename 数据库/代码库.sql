# 创建一张员工信息表
+`create table emp(
    id int comment '编号',
    workno varchar(10) comment '工号',
    gender char(1) comment '性别',
    age tinyint unsigned comment '年龄',
    idcard char(1) comment '身份证号',
    wotime date comment '入职时间'
) comment '登记表';