package dao;

import bean.Dept;
import java.util.List;

/**
 * 	1.根据id删除记录
 * 	2.根据id修改记录
 * 	3.插入新的记录
 * 	4.根据id查询记录
 * 	5.查询所有记录
 * 	6.查询总记录条数
 */
public interface DeptDao {
    void deleteById(int deptno);

    void updateById(int deptno);

    void insertElement(Dept dept);

    Dept selectByID(int deptno);

    List<Dept> selectAll();

    Long selectCount();

}
