       program-id. Program1 as "Program1".
       
       environment division.
       configuration section.
       
       data division.
       working-storage section.
       01 Meep pic 999.
       01 meep2 pic x value "y".
       procedure division.
       display "this is a meep program!"
       perform varying meep from 1 by 1
           until meep > 20
           display meep
           display "shall we keep going? (y or n)"
           accept meep2
           if meep2 = "n" or "N" then
           stop "Press enter to exit now"
           stop run
       end-perform.    
       stop "press enter"
       stop run.
       
       
       end program Program1.
