package com.gw146864.golfcourseapi.Controllers;

import com.gw146864.golfcourseapi.entity.Member;
import com.gw146864.golfcourseapi.services.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController()
@RequestMapping("/Member")
public class MemberController {

    private final MemberRepository memberRepository;

    public MemberController(@Autowired JdbcTemplate databaseConnection){
        this.memberRepository = new MemberRepository(databaseConnection);
    }

    @GetMapping("")
    public List<Member> getAllMembers() {
        return memberRepository.get();
    }

    @GetMapping("/id")
    public Member get(@PathVariable("id") String id) throws Exception
     {return memberRepository.get(id);}

    @PutMapping("/id")
    public void update(@PathVariable("id") int id, @RequestBody() Member member){}

}
