package b_pojo;

import java.util.Date;
import java.util.Objects;

/**
 * 封装的实体类
 *
 * 封装的要求：JavaBean规范
 *      1.所有成员变量私有化，private
 *      2.提供无参构造方法
 *      3.提供get() / set()
 *      4.重写toString(),equals(),hashcode()
 *
 *      5.一个实体类对应一张表，类名 和 表名 保持一只
 *      6.实体类中的成员变量 = 数据库表中的字段
 *      7.成员变量的类型 和 字段类型必须保持一只
 *      8.成员变量的类型可以使用包装类或基本数据类型(ps:Integer / int)
 *
 */
public class Emp {
    //empno => int
    private Integer empno;
    //ename => String
    private String ename;
    //job => String
    private String job;
    //mgr => int
    private Integer mgr;
    //hiredate => Date
    private Date hiredate;
    //sal => double
    private double sal;
    //comm => double
    private double comm;
    //deptno => int
    private int deptno;

    public Emp() {
    }

    public Emp(Integer empno, String ename, String job, Integer mgr,
               Date hiredate, double sal, double comm, int deptno) {
        this.empno = empno;
        this.ename = ename;
        this.job = job;
        this.mgr = mgr;
        this.hiredate = hiredate;
        this.sal = sal;
        this.comm = comm;
        this.deptno = deptno;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Emp emp = (Emp) o;
        return Double.compare(emp.sal, sal) == 0 && Double.compare(emp.comm, comm) == 0 && deptno == emp.deptno && Objects.equals(empno, emp.empno) && Objects.equals(ename, emp.ename) && Objects.equals(job, emp.job) && Objects.equals(mgr, emp.mgr) && Objects.equals(hiredate, emp.hiredate);
    }

    @Override
    public int hashCode() {
        return Objects.hash(empno, ename, job, mgr, hiredate, sal, comm, deptno);
    }

    @Override
    public String toString() {
        return "Emp{" +
                "empno=" + empno +
                ", ename='" + ename + '\'' +
                ", job='" + job + '\'' +
                ", mgr=" + mgr +
                ", hiredate=" + hiredate +
                ", sal=" + sal +
                ", comm=" + comm +
                ", deptno=" + deptno +
                '}';
    }
}
