; PureBASIC 5.60 Example

For i=5 To 1 Step -1
  TEXT$ = "Iteration number: " + Str(i) + ~"\n\nDo you wish to continue?"
  UserChoice = MessageRequester("Countdown Dialog", TEXT$, #PB_MessageRequester_YesNo | #PB_MessageRequester_Info)
  If UserChoice = #PB_MessageRequester_No
    Break
  EndIf
Next
