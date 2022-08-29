package pojo;

import java.util.Objects;

/** user表对应的实体类
 * @author Jiang
 * @Date 2022-08-26 14:17
 */
public class User {
    private int id;
    private String username;
    private String password;
    private String hiredate;

    public User() {
    }

    public User(int id, String username, String password, String hiredate) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.hiredate = hiredate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return id == user.id && Objects.equals(username, user.username) && Objects.equals(password, user.password) && Objects.equals(hiredate, user.hiredate);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, username, password, hiredate);
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", hiredate=" + hiredate +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getHiredate() {
        return hiredate;
    }

    public void setHiredate(String hiredate) {
        this.hiredate = hiredate;
    }
}
