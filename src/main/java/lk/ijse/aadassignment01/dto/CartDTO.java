package lk.ijse.aadassignment01.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CartDTO {
    private int cart_id;
    private int user_id;
    private int product_id;    // Ensure product_id is int
    private int quantity;
    private double product_price;  // Add product_price if needed
    private String product_name;   // Add product_name if needed
    private String added_at;    // Optional, only if needed
}
