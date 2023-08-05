/*
HFORTH MSX 加算にかかる時間測定
2023/08/05
Time measurement for HFORTH MSX addition
2023/08/05

*/

: add1 /* */

  VAR( H0 L0 D0 E0 )
  VAR( H1 L1 D1 E1 )
  VAR( H2 L2 D2 E2 )
  VAR( H3 L3 D3 E3 )

  VAR( lp1 LP1max lp2 LP2max )

  "Please wait..\n\0" STR.


  $02c >> _C  $5 CALL 
  _H >> H0
  _L >> L0
  _D >> D0
  _E >> E0


  0     >> lp2
  100    >> LP2max
  0     >> lp1
  10000 >> LP1max

  WHILE( lp2 LP2max < ){

    WHILE( lp1 LP1max < ){
      2 3 + DROP
      lp1 1 + >> lp1
    }

    0 >> lp1
    lp2 1 + >> lp2
  }


  $02c >> _C  $5 CALL 
  _H >> H1
  _L >> L1
  _D >> D1
  _E >> E1


  "Please wait..\n\0" STR.


  $02c >> _C  $5 CALL 
  _H >> H2
  _L >> L2
  _D >> D2
  _E >> E2


  0     >> lp2
  100    >> LP2max
  0     >> lp1
  10000 >> LP1max

  WHILE( lp2 LP2max < ){

    WHILE( lp1 LP1max < ){
      2 3 3 + + DROP
      lp1 1 + >> lp1
    }

    0 >> lp1
    lp2 1 + >> lp2
  }


  $02c >> _C  $5 CALL 
  _H >> H3
  _L >> L3
  _D >> D3
  _E >> E3


  H0 . L0 . D0 . E0 . CRLF
  H1 . L1 . D1 . E1 . CRLF
  H2 . L2 . D2 . E2 . CRLF
  H3 . L3 . D3 . E3 . CRLF

;


add1


/*
> hforth test18.4th
A>hforth test18.4th

** H-FORTH/CP V1.4a(C)1999 A.Hiramatsu
Please wait..
Please wait..
 16 40 14 0
 16 51 11 0
 16 51 11 0
 17 2 32 0


*/

