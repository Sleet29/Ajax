import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.google.gson.Gson; 

public class DAO {

    public String getDeptData() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Dept> deptList = new ArrayList<>();

        try {
            // Connect to your database and execute SQL to retrieve DEPT data

            // Populate deptList with retrieved data
            while (rs.next()) {
                Dept dept = new Dept();
                dept.setDeptno(rs.getInt("deptno"));
                dept.setDname(rs.getString("dname"));
                dept.setLoc(rs.getString("loc"));
                deptList.add(dept);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        }

        Gson gson = new Gson();
        return gson.toJson(deptList);
    }
}
