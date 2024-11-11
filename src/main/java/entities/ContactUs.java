package entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Timestamp;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ContactUs {
    private int id;
    private String uid;
    private String name;
    private String phone;
    private String subject;
    private String message;
    private Timestamp created_at;
}
