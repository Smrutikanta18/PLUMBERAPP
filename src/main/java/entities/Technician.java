package entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Technician {
    private int id;
    private String name;
    private String image;
    private int experience;
    private String faceBook;
    private String instagram;

}
