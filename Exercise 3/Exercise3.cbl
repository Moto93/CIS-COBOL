       identification division.
       program-id. Exercise3 as "Exercise3".

       environment division.
       configuration section.

       data division.
       working-storage section. 
       01 Input-Field.
           05 Coffee-in 		   pic 99.
           05 Shipping-Select 	   pic x(15).
       01 Calculate-Field.
           05 Taxed-Amount-in 	   pic 9(6)V99.
           05 Input-Before-Tax 	   pic 9(6)V99.
           05 Input-After-Tax 	   pic 9(6)V99.
       	   05 Ship-in		       pic 9(6)V99.
       	   05 Final-Total-in	   pic 9(6)V99.
       01 Output-Field.
       	   05 Taxed-Amount-Out	   pic $(6).99.
       	   05 Output-Before-Tax	   pic $(6).99.
       	   05 Output-After-Tax	   pic $(6).99.
       	   05 Ship-Out			   pic $(6).99.
       	   05 Final-Total-Out	   pic $(6).99.
       Procedure Division.
       
       Main-Start.
       Display "Welcome to CIS Coffee Suppliers."
       Display "How many pounds of coffee would you like?"
       Display "Please, no orders over 100 pounds."
       Display "Pounds: " with no advancing
       Accept Coffee-in
       If Coffee-in < 100 and > 0 Then
           If Coffee-in >= 5 and < 10 Then
               Perform Coffee-Calculation
               Perform Coffee-Discount-5
               End-if
           If Coffee-in >= 10 Then
               Perform Coffee-Calculation
               Perform Coffee-Discount-10
               End-if
       Else
       	   Display "That is an invalid amount."
       	   Display "Please re-enter your order." with no advancing
       	   Accept Coffee-in
       End-if
           Display " "
           Display "Okay, now that we have your order, we need a " 
                   "shipping method."
           Display "You may choose Ground or Air."
           Display " "
           Display "Ground:	       $1.50 plus $0.50 per pound"
           Display "Air:		   $8.00 plus $1.00 per pound"
           Display " "
           Display "Which do you choose, Ground or Air? (G or A)"
           Display "Type: " with no advancing
       Accept Shipping-Select
       If Shipping-Select = "a" or "A" or "g" or "G" then
       	   Perform Choice-Determine
       Else
       	   Perform until Shipping-Select = "a" or "A" or "g" or "G"
           Display "Invalid Shipping Type. Try Again: "
           Accept Shipping-Select
       End-If
       
           Perform Final-Total
           Perform Total-Display
       
       Stop Run.
       
       Choice-Determine.
       If Shipping-Select = "a" or "A" then
       	   Perform Air-Shipping
       	   Move "Air Shipping" to Shipping-Select
       Else
       	   Perform Ground-Shipping.
       	   Move "Ground Shipping" to Shipping-Select.
        
       Coffee-Calculation.
           Multiply Coffee-in by 12.00 giving Input-Before-Tax.
       Coffee-Discount-5.
           Multiply 0.95 by Input-Before-Tax
           Perform Tax-Calculation.
       Coffee-Discount-10.
           Multiply 0.90 by Input-Before-Tax
           Perform Tax-Calculation.
       Tax-Calculation.
           Multiply Input-Before-Tax by 1.06 giving Input-After-Tax
           Multiply Input-Before-Tax by 0.06 giving Taxed-Amount-in
           Move Taxed-Amount-in to Taxed-Amount-Out
           Move Input-Before-Tax to Output-Before-Tax
           Move Input-After-Tax to Output-After-Tax.
       Ground-Shipping.
           Multiply Coffee-in by 1 giving Ship-in
           Add 1.50 to Ship-in
           Move Ship-in to Ship-Out.
       Air-Shipping.
           Multiply Coffee-in by 0.50 giving Ship-in
           Add 8.00 to Ship-in
           Move Ship-in to Ship-Out.
       Final-Total.
           Add Input-After-Tax to Ship-in giving Final-Total-in
           Move Final-Total-in to Final-Total-Out.
       Total-Display.	   
           Display " "
           Display "Pounds of Coffee Ordered:         " Coffee-in
           Display "Cost of Coffee:				    " Output-Before-Tax
           Display "Tax:				          " Taxed-Amount-Out
           Display "Total:						    " Output-After-Tax
           Display "Shipping Choice:	         " Shipping-Select
           Display "Shipping Cost:				   " Ship-Out
           Display "                         _______________________"
           Display "Final Total:				    " Final-Total-Out.
         
         Stop "Press enter to exit.".
       End Program.
