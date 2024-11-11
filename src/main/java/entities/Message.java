package entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Message {
    private int id;
    private String name;
    private String phone;
    private String service;
    private String request;
    private Date date;
    private int uid;
}
