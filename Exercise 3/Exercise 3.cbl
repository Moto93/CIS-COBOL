Identification Division.
Program-Id. Coffee-Shop.
Environment Division.
Data Division.
Working-Storage Section.
01 Input-Field.
    05 Coffee-in 			pic 999.
    05 Shipping-in 			pic x(15).
01 Calculate-Field.
    05 Taxed-Amount-in 		pic 9(4)V99.
    05 Input-Before-Tax 	pic 9(6)V99.
    05 Input-After-Tax 		pic 9(6)V99.
	05 Ground-Ship-in		pic 9(4)V99.
	05 Air-Ship-in			pic 9(4)V99.
	05 Final-Total-in		pic 9(5)V99.
01 Output-Field.
	05 Coffe-Out			pic 99.
	05 Tax-Rate-Out			pic xx value "6%"
	05 Taxed-Amount-Out		pic $(4).99.
	05 Output-Before-Tax	pic $(6).99.
	05 Output-After-Tax		pic $(6).99.
	05 Ship-Out				pic $(4).99..
	05 Final-Total-Out		pic $(5).99.
Procedure Division.
Main-Start.
Display "Welcome to CIS Coffee Shop."
Display "How many pounds of coffee would you like?"
Display "Please, no orders over 100 pounds."
Accept Coffee-in
If Coffee-in < 100 and > 0 Then
	Perform Coffee-Calculation
Else
	Display "That is an invalid amount."
	Display "Please re-enter your order."
	Accept Coffee-in
End-If
Display "Okay, now that we have your order, we need a shipping method."
Display "You may choose Ground or Air."
Display " "
Display "Ground:	$1.50 plus $0.50 per pound"
Display "Air:		$8.00 plus $1.00 per pound"
Display "Which do you choose, Ground or Air? (G or A)"
Accept Shipping-in
If Shipping-in = "a" or "A" or "g" or "G" then
	Perform Choice-Determine
Else
	Perform until Shipping-in = "a" or "A" or "g" or "G"
End-If

Perform Final-Total
Perform Total-Display

Stop Run.

Choice-Determine.
If Shipping-in = "a" or "A" then
	Perform Air-Shipping
	Move "Air Shipping" to Shipping-in
Else
	Perform Ground-Shipping.
	Move "Ground Shipping" to Shipping-in

Coffee-Calculation.
Multiply Coffee-in by 12.00 giving Input-Before-Tax
Multiply Input-Before-Tax by 1.06 giving Input-After-Tax
Multiply Input-Before-Tax by 0.06 giving Taxed-Amount-in
Move Taxed-Amount-in to Taxed-Amount-Out
Move Input-Before-Tax to Output-Before-Tax
Move Input-After-Tax to Output-After-Tax 
.

Ground-Shipping.
Multiply Coffee-in by 1 giving Ground-Ship-in
Move Ground-Ship-in to Ship-Out.

Air-Shipping.
Multiply Coffee-in by 0.50 giving Air-Ship-in
Move Air-Ship-in to Ship-Out.

Total-Display.
Display "Pounds of Coffee Ordered:		" Coffee-in
Display "Cost of Coffee:				" Output-Before-Tax
Display "Tax:							" Taxed-Amount-Out
Display "Total:							" Input-After-Tax
Display "Shipping Choice:				" Shipping-in
Display "Shipping Cost:					" Ship-Out
Display "Final Total:					" Final-Total-Out

Final Total.
Add Input-After-Tax to Ship-Out giving Final-Total-in
Move Final-Total-in to Final-Total-Out
.

End Program.





*Specifications: Write a program that that accepts input for an order of coffee and computes and displays all costs. Coffee is sold in 1 pound bags for $12 each. If a customer orders 5 pounds, they receive a 5% discount, and a 10% discount if they order 10 pounds or more. Shipping is either Ground which is $1.50 plus $0.50 per bag, or Air which is $8.00 plus $1.00 per pound. Sales tax is 6%. Tax and discounts are only applied to the coffee.

*All output must be labeled and formatted.
*All input must be echoed.
*Your program should continue to loop until all orders have been processed.
*Your program should be neat and readable with attention to naming and indentation.
*Your program must make use of at least 2 separate procedural paragraphs and your choices must make sense in regards modularity.
*All input must be validated.