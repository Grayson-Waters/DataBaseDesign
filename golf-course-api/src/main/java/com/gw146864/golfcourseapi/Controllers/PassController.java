package com.gw146864.golfcourseapi.Controllers;


import com.gw146864.golfcourseapi.entity.Pass;
import com.gw146864.golfcourseapi.services.PassRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.*;
import java.util.List;


@RestController()
@RequestMapping("/Pass")
public class PassController {

    private final PassRepository passRepository;

    public PassController(@Autowired JdbcTemplate databaseConnection){
        this.passRepository = new PassRepository(databaseConnection);
    }

    @GetMapping("")
    public List<Pass> getAllPasses() {
        return passRepository.get();
    }




}
