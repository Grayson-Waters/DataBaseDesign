package com.gw146864.golfcourseapi.Controllers;


import com.gw146864.golfcourseapi.entity.TeeTime;
import com.gw146864.golfcourseapi.services.TeeTimeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.*;
import java.util.List;


@RestController()
@RequestMapping("/TeeTime")
public class TeeTimeController {

    private final TeeTimeRepository teeTimeRepository;

    public TeeTimeController(@Autowired JdbcTemplate databaseConnection) {
        this.teeTimeRepository = new TeeTimeRepository(databaseConnection);
    }

    @GetMapping("")
    public List<TeeTime> getAllTeeTimes() {
        return teeTimeRepository.get();
    }

    @PostMapping("")
    public void create(@RequestBody() TeeTime teeTime){
        this.teeTimeRepository.create(teeTime);
    }


}
