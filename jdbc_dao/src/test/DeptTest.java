package test;

import bean.Dept;
import dao.impl.DeptDaoImpl;
import org.junit.Test;

import java.util.List;

/**
 * @author Jiang
 * @Date 2022-08-29 16:51
 */
public class DeptTest {
    DeptDaoImpl dao = new DeptDaoImpl();
    @Test
    public void deleteByIdTest(){
        dao.deleteById(60);
    }
    @Test
    public void updateByIdTest(){
        dao.updateById(60);
    }
    @Test
    public void insertElementTest(){
        Dept dept = new Dept(60, "GOULAN", "DAFENG");
        dao.insertElement(dept);
    }
    @Test
    public void selectByIdTest(){
        Dept dept = dao.selectByID(60);
        System.out.println(dept);
    }


    @Test
    public void selectAllTest() {
        List<Dept> list = dao.selectAll();
        for(Dept dept : list){
            System.out.println(dept);
        }
    }

    @Test
    public void selectCountTest() {
        Long count = dao.selectCount();
        System.out.println(count);
    }

}
