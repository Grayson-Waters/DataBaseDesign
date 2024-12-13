package com.gw146864.golfcourseapi.services;

import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;
import com.gw146864.golfcourseapi.entity.Pass;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import com.gw146864.golfcourseapi.entity.TeeTime;

public class TeeTimeRepository extends BaseRepository<TeeTime>{


    public TeeTimeRepository(JdbcTemplate databaseConnection) {
        super(databaseConnection);
    }

    @Override
    public TeeTime get(String id) throws Exception {
        return null;
    }

    @Override
    public List<TeeTime> get() {
        String sql = "SELECT * FROM TeeTime;";
        return this.getDatabaseConnection().query(sql, BeanPropertyRowMapper.newInstance(TeeTime.class));
    }

    @Override
    public void create(TeeTime teeTime) {
        String sql = "INSERT INTO gw146864.TeeTime VALUES ('"
                + teeTime.getDate_time()+"', '"
                + teeTime.getEmail_address() +");";
        this.getDatabaseConnection().execute(sql);
    }

    @Override
    public void delete(String id) {

    }

    @Override
    public void update(String id, TeeTime teeTime) {

    }
}
