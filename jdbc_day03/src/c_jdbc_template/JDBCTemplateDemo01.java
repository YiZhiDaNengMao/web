package c_jdbc_template;

import b_druid.DruidUtils;
import org.junit.Test;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import pojo.Emp;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * @author Jiang
 * @Date 2022-08-29 11:35
 */
public class JDBCTemplateDemo01 {
    JdbcTemplate template = new JdbcTemplate(DruidUtils.ds);
    @Test
    public void test01(){
        String sql = "update user set password = ? where id = ?";
        int update = template.update(sql,777,1);
        System.out.println(update);
    }

    //1.修改7369数据的sal 为 10000
    @Test
    public void test02(){
        String sql = "update emp set sal = 10000 where empno = ?";
        template.update(sql,7369);
    }

    //2.添加一条记录
    @Test
    public void test03(){
        String sql = "insert into emp(empno,ename,sal,deptno) values(?,?,?,?)";
        template.update(sql,6666,"PDaStar",6666.6,40);
    }

    //3.删除刚才添加的记录
    @Test
    public void test04(){
        String sql = "delete from emp where empno = ?";
        template.update(sql,6666);
    }

    //4.查询empno为6666的记录，将其封装为Map集合
    @Test
    public void test05(){
        String sql = "select * from emp where empno = ?";
        Map<String, Object> map = template.queryForMap(sql, 6666);
        System.out.println(map);
    }

    /*@Test// 5. 查询所有记录，将其封装为Map -> 错误写法,map只能封装一条数据!!!
   public void test07(){
       //定义sql
       String sql = "select * from emp";
       //执行sql -> 将查询结果封装成集合
       Map<String, Object> map = template.queryForMap(sql);
       System.out.println(map);
   }*/

    // 5. 查询所有记录，将其封装为List
    @Test
    public void test06(){
        String sql = "select * from emp";
        List<Map<String,Object>> list = template.queryForList(sql);
        System.out.println(list.size());
    }

    //6.查询所有记录，将其封装为Emp对象的List集合 - 自定义实现,没有优化效果
    @Test
    public void test07_1(){
        String sql = "select * from emp";
        List<Emp> list = template.query(sql, new RowMapper<Emp>() {
            @Override
            public Emp mapRow(ResultSet rs, int i) throws SQLException {
                Emp emp = new Emp();
                emp.setEmpno(rs.getInt("empno"));
                emp.setEname(rs.getString("ename"));
                emp.setJob(rs.getString("job"));
                emp.setMgr(rs.getInt("mgr"));
                emp.setHiredate(rs.getDate("hiredate"));
                emp.setSal(rs.getDouble("sal"));
                emp.setComm(rs.getDouble("comm"));
                emp.setDeptno(rs.getInt("deptno"));
                return emp;
            }
        });
        System.out.println(list);
    }

    //6.查询所有记录，将其封装为Emp对象的List集合 - 使用子类实现
    @Test
    public void test07(){
        String sql = "select * from emp";
        List<Emp> list = template.query(sql, new BeanPropertyRowMapper<Emp>(Emp.class));
        for(Emp emp : list){
            System.out.println(emp);
        }
    }

    //7. 查询总记录数 count()
    @Test
    public void test08(){
        String sql = "select count(empno) from emp";
        Long count = template.queryForObject(sql,Long.class);
        System.out.println(count);
    }


}



