      *************************************
      *Program:    Second Exercise
      *Author:     CIS 112 Kyle Pennacchio 
      *Status:     Working 
      *************************************
       
       Identification division.
       Program-id. Exercise2 as "Exercise2".
       Environment division.
       Configuration section.
       Data division.
       File section.
       Working-storage section
       .
       01 Keyed-Field.
      *    data entered by user field 
           05 Employees-Name   pic x(20).
           05 Hours-Worked     pic 999.
           05 Hourly-Wage      pic 999V99.
           05 Try-Again        pic x value "Y"
       .
       01 Calculate-Field.
      *    field used for calculation purposes 
           05 Gross-Income     pic 99999V99.
           05 Tax-Deduction    pic 9V99 value 0.90.
           05 Tax-Rate         pic 9V99 value 0.10.
           05 Gross-Tax        pic 999V99.
           05 Net-Income       pic 99999V99
       .
       01 Clean-Field.
      *    editied field for displaying the end info 
           05 nHours-Worked    pic ZZZZZZZZ9.
           05 nHourly-Wage     pic $$$$$9.99.
           05 nGross-Income    pic $$$$$9.99.
           05 nTax-Display     pic $$$$$9.99.
           05 nNet-Income      pic $$$$$9.99
       .
       Procedure division.
       Main-Module.
      *main module that loops and then clears screen  
       Perform Until Try-Again = "N" or "n"
           Display Erase With Foreground-Color 7
      *                  |---------------------|
      *    used because Erase likes to change text to yellow
           Perform Get-Data-Module
           Perform Calculate-Module
           Perform Clean-Up-Module
           Perform Print-Module   
         End-Perform
       Stop Run
       .
       Get-Data-Module.
      *used to accept input from the user 
           Display "What is the employees name?"
               Accept Employees-Name
           Display "How many hours did they work?"
               Accept Hours-Worked
           Display "And how much do they get paid a hour?"
               Accept Hourly-Wage
       .
       Calculate-Module.
      *used to calculate the output
           Multiply Hours-Worked by Hourly-Wage giving Gross-Income     
           Multiply Gross-Income by Tax-Rate giving Gross-Tax
           Multiply Gross-Income by Tax-Deduction giving Net-Income
       .
       Clean-Up-Module.
      *used to make the output fields easy to read 
           Move Gross-Income to nGross-Income
           Move Gross-Tax to nTax-Display
           Move Net-Income to nNet-Income
           Move Hourly-Wage to nHourly-Wage
           Move Hours-Worked to nHours-Worked
       .       
       Print-Module.
      *dispays the end results and asks if more data
           Display " "
               Display "Employees Name: " Employees-Name
           Display " "
               Display "Hours Worked:   " nHours-Worked
           Display " "
               Display "Hourly Wage:    " nHourly-Wage
           Display " "
               Display "Gross Income:   " nGross-income
           Display " "
               Display "Amount Taxed:   " nTax-Display
           Display " "          
               Display "Net Income:     " nNet-Income
           Display " "
           Display " "
           Display "Would you like to calculate another employee?"
           Display "Y or N" 
           Accept Try-Again
       .
       End Program.