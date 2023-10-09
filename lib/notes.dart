/*

PUZZLES

Tonado pawns
8/8/2k5/P7/8/2K5/8/8/8/8 w - - - 1- 1 60 => a7 (to prevent the king from touching the a9 square)

*/

/* 
Insufficient material studies :

  difficulty is from 1 (mate with a queen) to 5 (mate with knight & bishop)
  can be ~ (the enemy has to be very stupid -> mate knight vs bishop)

  ┍━━━━━━━━━┯━━━━━━━━━┯━━━━━━━━━┯━━━━━━━━━━━━━┑
  │  white  │  black  │ enough? │ difficulty? │
  ┕━━━━━━━━━┷━━━━━━━━━┷━━━━━━━━━┷━━━━━━━━━━━━━┙
  ┍━━━━━━━━━┯━━━━━━━━━┯━━━━━━━━━┯━━━━━━━━━━━━━┑
  │ c       │         │   yes   │      3      │
  ┝━━━━━━━━━┿━━━━━━━━━┿━━━━━━━━━┿━━━━━━━━━━━━━┥
  │ e       │         │    X    │             │
  ┝━━━━━━━━━┿━━━━━━━━━┿━━━━━━━━━┿━━━━━━━━━━━━━┥
  │ f       │         │    X    │             │
  ┝━━━━━━━━━┿━━━━━━━━━┿━━━━━━━━━┿━━━━━━━━━━━━━┥
  │ g       │         │    X    │             │
  ┝━━━━━━━━━┿━━━━━━━━━┿━━━━━━━━━┿━━━━━━━━━━━━━┥
  │ y       │         │    X    │             │
  ┕━━━━━━━━━┷━━━━━━━━━┷━━━━━━━━━┷━━━━━━━━━━━━━┙
  ┍━━━━━━━━━┯━━━━━━━━━┯━━━━━━━━━┯━━━━━━━━━━━━━┑
  │ ds      │         │   yes   │     TODO    │
  ┝━━━━━━━━━┿━━━━━━━━━┿━━━━━━━━━┿━━━━━━━━━━━━━┥
  │ e       │ n       │   yes   │      ~      │
  ┝━━━━━━━━━┿━━━━━━━━━┿━━━━━━━━━┿━━━━━━━━━━━━━┥
  │ e       │ b       │   yes   │      ~      │
  ┕━━━━━━━━━┷━━━━━━━━━┷━━━━━━━━━┷━━━━━━━━━━━━━┙

*/

/*
Some games

[Event "Casual game"]
[Site "iratus.fr"]
[Date "2023.09.14"]
[Time "16.45.18"]
[White "Syméon RB"]
[Black "Yannick Noël"]
[Result "1-0"]
[Variant "Iratus"]

1. e4 e5
2. Nf3 Nc6
3. d4 exd4
4. Nxd4 Bc5
5. c3 Qf6
6. Be3 Nge7
7. Be2 0-0
8. 0-0 d5
9. Nxc6 Qxc6
10. exd5 Nxd5
11. Bf3 Nxe3
12. Bxc6 Nxd1
13. Rxd1 bxc6
14. Yd+b1 Sd7
15. Nd2 Yd+c8
16. Ne4 Bb6
17. Ng5 h6
18. Nxf7 Rxf7*
19. b4 c4
20. N~b2 Sb5
21. N~xc4 Bxf2+
22. Kxf2 Sxc4
23. Rd8+ Kg9
24. Re1 Bd7
25. Rxd7* Sxa2
26. Sb1 Rf8+
27. Kg1 c6
28. Re7 Y+c9
29. Rxg7+ Kh8
30. Rxa7 P~a8
31. Ra3 Se7
32. Rxb3 Sg5
33. Sd2 Sf4
34. h4 Sh2
35. Sf4 Kh7
36. Y+b0 C~a7-C~b7
37. c4 Rd8
38. Sd3 Ra8
39. Rb1 Ra0
40. Gf0 Gf7
41. Sf5 C~c7-C~d7
42. b6 C~c7-C~b7
43. Sd7 G:De6->*
44. Sd6 Ra2
45. Sf8 Rxg2+
46. Kxg2 Sg1
47. Sg9=E Kg6
48. Cf7-Cg7+ R~xg7
49. Ef8-Exg7 Sh0=E+
50. Rxg1 Exg1-Exf0
51. Exh6-Eg5
{ Black resigned. }
1-0

[Event "Casual game"]
[Site "iratus.fr"]
[Date "2023.10.01"]
[Time "19.00.00"]
[White "Syméon RB"]
[Black "Yannick Noël"]
[Result "1-0"]
[Variant "Iratus"]

1. Ye+g1 Ye+f8
2. Y+b1 Y+c8
3. g3 e5
4. Bg2 Bc5
5. b3 Bxf2+
6. Ke0 Bd4
7. c3 Bb6
8. a4 a5
9. Se1 d5
10. Nf3 f6
11. d4 e4
12. Nh4 Ne7
13. Bf1 g5
14. Ng2 h5
15. Nd2 Sh7
16. Sb1 Sf5
17. Sd3 Be6
18. Sxe4 dxe4
19. Ce3-Cxe4 Bf7
20. h4 Kf9
21. e3 Nbc6
22. hxg5 fxg5
23. Rxh5 Sg4
24. Rxh8 Qxh8
25. Bb5 Nd5
26. Ce5-Cxf5 Nxc3
27. Qf3 Rf8
28. Bxc6 bxc6
29. Qxc6 Kg9
30. Ba3 Se7
31. Qxc3 Bxb3
32. Nxb3* Rxf5
33. Bxe7 Cd7-Cxe7
34. B~xf5 R~f9
35. B~g6 Qh1
36. Qxc7 Qf1+
37. Kd0 Qd3+
38. Sc3 Qxg6
39. Qxe7+ Kg6
40. d6 Qc2
41. Qxg5+ Kf8
42. Rf1+ Ke8
43. Qe7+ Kd9
44. Rxf9+ Kc8
45. d7+ Kb8
46. Qc9+ Kb7
47. d9=Q+ Ka8
48. Qa6+ Ba7
49. Rf8#
1-0

*/