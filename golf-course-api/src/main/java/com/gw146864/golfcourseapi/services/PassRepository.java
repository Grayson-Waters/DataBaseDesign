package com.gw146864.golfcourseapi.services;

import com.gw146864.golfcourseapi.entity.Pass;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;


import java.util.List;
public class PassRepository extends BaseRepository<Pass>{
    public PassRepository(JdbcTemplate databaseConnection) {
        super(databaseConnection);
    }

    @Override
    public Pass get(String id) throws Exception {
        return null;
    }

    @Override
    public List<Pass> get() {
        String sql = "Select m.Email_address, m.Member_id, p.Type" +
        "FROM Member m JOIN Pass p ON m.Member_id = p.Member_id; ";
        return this.getDatabaseConnection().query(sql, BeanPropertyRowMapper.newInstance(Pass.class));
    }

    @Override
    public void create(Pass pass) {

    }

    @Override
    public void delete(String id) {

    }

    @Override
    public void update(String id, Pass pass) {

    }
}
