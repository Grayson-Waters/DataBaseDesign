package com.gw146864.golfcourseapi.services;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import com.gw146864.golfcourseapi.entity.Player;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class PlayerRepository extends BaseRepository<Player>{

    public PlayerRepository(JdbcTemplate databaseConnection) {
        super(databaseConnection);
    }

    @Override
    public Player get(String id) throws Exception {
        String sql = "SELECT * FROM gw146864.Player WHERE Email_address = '" + id + "'";
        List<Player> members = this.getDatabaseConnection().query(sql, BeanPropertyRowMapper.newInstance((Player.class)));
        if (members.size() == 1){
            return members.get(0);
        }
        throw new Exception();
    }

    @Override
    public List<Player> get() {
        String sql = "Select * FROM gw146864.Player";
        return this.getDatabaseConnection().query(sql, BeanPropertyRowMapper.newInstance(Player.class));
    }

    @Override
    public void create(Player p) {
        String sql = "INSERT INTO gw146864.Player VALUES ('" +
                p.getEmailAddress() + "','" + p.getFname() + "','" + p.getLname() + "','" + p.getPassword() + "')";
        this.getDatabaseConnection().execute(sql);
    }

    @Override
    public void delete(String id) {
        String sql = "DELETE FROM gw146864.Player WHERE Email_address = " + id + ";";
    }

    @Override
    public void update(String id, Player p) {

    }
}
