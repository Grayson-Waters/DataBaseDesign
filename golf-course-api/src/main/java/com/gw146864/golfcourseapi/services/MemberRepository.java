package com.gw146864.golfcourseapi.services;



import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import com.gw146864.golfcourseapi.entity.Member;

import java.util.List;

public class MemberRepository extends BaseRepository<Member> {


    public MemberRepository(JdbcTemplate databaseConnection) {
        super(databaseConnection);
    }

    @Override
    public Member get(String id) throws Exception {
        String sql = "SELECT Member_id,Email_address, Phone_number, Cart_Enqueue_Date FROM gw146864.Member WHERE Member_id = '" + id + "';";
        List<Member> members = this.getDatabaseConnection().query(sql, BeanPropertyRowMapper.newInstance((Member.class)));
        if (members.size() == 1) {
            return members.get(0);
        }
        throw new Exception();
    }

    @Override
    public List<Member> get() {
        String sql = "Select Member_id, Email_address, Phone_number, Cart_Enqueue_Date FROM gw146864.Member;";
        return this.getDatabaseConnection().query(sql, BeanPropertyRowMapper.newInstance(Member.class));
    }

    @Override
    public void create(Member member) {

    }

    @Override
    public void delete(String id) {

    }

    @Override
    public void update(String id, Member member) {
        String sql = "UPDATE gw146864.Member SET  Email Address= '"
                +member.getEmailAddress()
                + "', Member_id = '" + member.getMemberId()
                + "', Phone_number = '" + member.getPhoneNumber() + "'"
                + "Cart_Enqueue_Date = '" + member.getCart_Enqueue_Date()
                + "' WHERE Member_id = " + id + ";";
        this.getDatabaseConnection().execute(sql);
    }
}
