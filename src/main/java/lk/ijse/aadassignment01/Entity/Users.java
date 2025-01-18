package lk.ijse.aadassignment01.Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class Users {
    private int userId;
    private String username;
    private String password;
    private String email;
    private String active;
}
