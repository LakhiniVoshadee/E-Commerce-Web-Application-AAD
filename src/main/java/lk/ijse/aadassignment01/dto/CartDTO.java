package lk.ijse.aadassignment01.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CartDTO {
    private int cart_id;
    private UserDTO user;
    private ProductDTO product;
    private Integer quantity;
}
