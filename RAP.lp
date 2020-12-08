\ Model RAP
\ LP format - for model browsing. Use MPS format to capture full model detail.
Maximize
  53 assign[Carlos,Tester] + 27 assign[Carlos,JavaDeveloper]
   + 13 assign[Carlos,Architect] + 80 assign[Joe,Tester]
   + 47 assign[Joe,JavaDeveloper] + 67 assign[Joe,Architect]
   + 53 assign[Monika,Tester] + 73 assign[Monika,JavaDeveloper]
   + 47 assign[Monika,Architect] - 101 gap[Tester] - 101 gap[JavaDeveloper]
   - 101 gap[Architect]
Subject To
 job[Tester]: assign[Carlos,Tester] + assign[Joe,Tester]
   + assign[Monika,Tester] + gap[Tester] = 1
 job[JavaDeveloper]: assign[Carlos,JavaDeveloper]
   + assign[Joe,JavaDeveloper] + assign[Monika,JavaDeveloper]
   + gap[JavaDeveloper] = 1
 job[Architect]: assign[Carlos,Architect] + assign[Joe,Architect]
   + assign[Monika,Architect] + gap[Architect] = 1
 resource[Carlos]: assign[Carlos,Tester] + assign[Carlos,JavaDeveloper]
   + assign[Carlos,Architect] <= 1
 resource[Joe]: assign[Joe,Tester] + assign[Joe,JavaDeveloper]
   + assign[Joe,Architect] <= 1
 resource[Monika]: assign[Monika,Tester] + assign[Monika,JavaDeveloper]
   + assign[Monika,Architect] <= 1
 budget: assign[Carlos,Tester] + assign[Carlos,JavaDeveloper]
   + assign[Carlos,Architect] + 2 assign[Joe,Tester]
   + 2 assign[Joe,JavaDeveloper] + 2 assign[Joe,Architect]
   + 3 assign[Monika,Tester] + 3 assign[Monika,JavaDeveloper]
   + 3 assign[Monika,Architect] <= 5
Bounds
Binaries
 assign[Carlos,Tester] assign[Carlos,JavaDeveloper]
 assign[Carlos,Architect] assign[Joe,Tester] assign[Joe,JavaDeveloper]
 assign[Joe,Architect] assign[Monika,Tester] assign[Monika,JavaDeveloper]
 assign[Monika,Architect]
End
