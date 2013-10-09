      ******************************************************************
      *  Program: Coffee
      *  Author: Matthew Patane
      *  Status: Not-Working (Entire Shipping section gets skipped)
      *
      ******************************************************************

       Identification Division.
       Program-ID. Coffee.
       Environment Division.
       Data Division.
       Working-Storage Section.
       01  Keyed-Fields.
           05 Coffee-In        Pic 9(3).
           05 Shipping-Select  Pic X(18).
       01  Calculated-Field.
           05 Tax-Amount-In    Pic 9(6)v99.
           05 Before-Tax-In    Pic 9(6)v99.
           05 After-Tax-In     Pic 9(6)v99.
           05 Ship-In          Pic 9(6)v99.
           05 Final-Total-In   Pic 9(6)v99.
       01  Output-Fields.
           05 Tax-Amount-Out   Pic $(6).99.
           05 Before-Tax-Out   Pic $(6).99.
           05 After-Tax-Out    Pic $(6).99.
           05 Ship-Out         Pic $(6).99.
           05 Final-Total-Out  Pic $(6).99.
       Procedure Division.
       Coffee-Start.
              Display "Thank you for choosing us!"
              Display " "
              Display "Orders containing 5lbs or more save 5%!"
              Display "Orders of ten or more include a 10% discount!"
              Display " "
              Display "How many Pounds of coffee would you like? "
              Accept Coffee-In
              If Coffee-In > 0 and < 100 then
                   If Coffee-In >= 5 and < 10 Then
                       Perform One-Pound-Formula
                       Perform Five-Pound-Discount
                  else If Coffee-In >= 10 Then
                       Perform One-Pound-Formula
                       Perform Ten-Pound-Discount
               Else
                   Display "Please enter a number bewteen 1 and 100!"
                   Display "How many Pounds of coffee would you like?"
                   Accept Coffee-In
              End-If
              End-If
              End-If
                   Display " "
                   Display "We offer two types of shipping, Ground and"
                   "air. Please select one."
                   Display "Use G for Ground, and A for Air."
                   Display " "
                   Display "Ground: $1.50 Flat rate, plus $0.50 per"
                   "pound."
                   Display "Air:    $8.00 Flat rate, Plus $1.00 per"
                   "pound."
              Accept Shipping-Select
                   If Shipping-Select = 'a' or 'A' or 'g' or 'G' then
                       Perform Ship-Choice
                   Else
                       Perform until Shipping-Select = 'a' or 'A' or 'g'
                       or 'G'
                       Display "Unknown Character. Air or Ground? (A or"
                       "G): "
                       Accept Shipping-Select
                   End-If

               Perform Total-Formula
               Perform Display-Total
               Stop Run.



       One-Pound-Formula.
           Multiply 12.00 by Coffee-In giving Before-Tax-In.
       Five-Pound-Discount.
           Multiply 0.95 by Before-Tax-In
           Perform Tax-Formula.
       Ten-Pound-Discount.
           Multiply 0.90 by Before-Tax-In
           Perform Tax-Formula.
       Tax-Formula.
           Multiply Before-Tax-In by 1.06 giving  After-Tax-In
           Multiply Before-Tax-In by .06 giving Tax-Amount-In
           Move Tax-Amount-In to Tax-Amount-Out
           Move Before-Tax-In to Before-Tax-Out
           Move After-Tax-In to After-Tax-Out.
       Ship-Choice.
           If Shipping-Select = 'a' or 'A' then
               Perform Air-Shipping
           Else
               Perform Ground-Shipping.
       Ground-Shipping.
           Multiply Coffee-In by 0.50 Giving Ship-In
           Add 1.50 to Ship-In
           Move "Ground Shipping" to Shipping-Select.
           Move Ship-In to Ship-Out.
       Air-Shipping.
           Multiply Coffee-In by 1 giving Ship-In
           Add 8.00 to Ship-In
           Move "Air Shipping" to Shipping-Select
           Move Ship-In to Ship-Out.
       Total-Formula.
           Add After-Tax-In to Ship-In giving Final-Total-In
           Move Final-Total-In to Final-Total-Out.
       Display-Total.
           Display " "
           Display "Total Coffee ordered =      " Coffee-In
           Display "Subtotal:                  " Before-Tax-Out
           Display "Total Tax:                 " Tax-Amount-Out
           Display "Shipping:                 " Shipping-Select
           Display "Shipping Cost:             " Ship-Out
           Display "                         _______________________"
           Display "Total for order:           " Final-Total-Out.

          Stop "Press Enter to Exit.".
       Stop Run.







