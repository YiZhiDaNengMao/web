package dao.impl;

import bean.Dept;
import dao.DeptDao;
import utils.DruidUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

/**
 * @author Jiang
 * @Date 2022-08-29 16:16
 */
public class DeptDaoImpl implements DeptDao {

    private JdbcTemplate template = new JdbcTemplate(DruidUtils.ds);

    @Override
    public void deleteById(int deptno) {
        String sql = "delete from dept where deptno = ?";
        template.update(sql,deptno);
    }

    @Override
    public void updateById(int deptno) {
        String sql = "update dept set loc = 'JINGCHENG' where deptno = ?";
        template.update(sql,deptno);
    }

    @Override
    public void insertElement(Dept dept) {
        String sql = "insert into dept values(?,?,?)";
        template.update(sql,dept.getDeptno(),dept.getDname(),dept.getLoc());
    }

    @Override
    public Dept selectByID(int deptno) {
        String sql = "select * from dept where deptno = ?";
        List<Dept> list = template.query(sql, new BeanPropertyRowMapper<>(Dept.class), deptno);
        if(list.size() == 0){
            return null;
        }
        return list.get(0);
    }

    @Override
    public List<Dept> selectAll() {
        String sql = "select * from dept";
        List<Dept> list = template.query(sql, new BeanPropertyRowMapper<>(Dept.class));
        return list;
    }

    @Override
    public Long selectCount() {
        String sql = "select count(deptno) from dept";
        Long count = template.queryForObject(sql, Long.class);
        return count;
    }
}
