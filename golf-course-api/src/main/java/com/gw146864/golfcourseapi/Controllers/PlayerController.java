package com.gw146864.golfcourseapi.Controllers;


import com.gw146864.golfcourseapi.entity.Player;
import com.gw146864.golfcourseapi.services.PlayerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController()
@RequestMapping("/Player")
public class PlayerController {

    private final PlayerRepository playerRepository;

    public PlayerController(@Autowired JdbcTemplate databaseConnection){
        this.playerRepository = new PlayerRepository(databaseConnection);
    }

    @GetMapping("")
    public List<Player> getAllMembers() {
        return playerRepository.get();
    }

    @GetMapping("/id")
    public Player get(@PathVariable("id") String id) throws Exception
    {return playerRepository.get(id);}

    @PostMapping("/")
    public void create(@RequestBody() Player player){
        this.playerRepository.create(player);
    }

    @DeleteMapping("/id")
    public void deleteById(@PathVariable("id") String id){
        this.playerRepository.delete(id);
    }

}
