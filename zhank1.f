        COMPLEX FUNCTION ZHANK1(X,FUN,TOL,L)
C--REVISED VERSION: 12-13-76 -- SEE NOTE(2) BELOW.
C--INTEGRAL FROM 0 TO INFINITY OF 'FUN(G)*J1(G*B)*DG' DEFINED AS THE
C  COMPLEX HANKEL TRANSFORM OF ORDER 1 AND ARGUMENT X(=ALOG(B))
C  BY CONVOLUTION FILTERING WITH COMPLEX FUNCTION 'FUN'--AND
C  USING A VARIABLE CUT-OFF METHOD WITH EXTENDED FILTER TAILS....
C
C--REF: ANDERSON, W.L., 1975, NTIS REPT. PB-242-800.
C
C--PARAMETERS:
C
C     X     = REAL ARGUMENT(=ALOG(B) AT CALL) OF THE HANKEL TRANSFORM
C     FUN(G)= EXTERNAL DECLARED COMPLEX FUNCTION NAME (USER SUPPLIED)
C               OF A REAL ARGUMENT G.
C             NOTE: IF PARMS OTHER THAN G ARE REQUIRED, USE COMMON IN
C                 CALLING PROGRAM AND IN SUBPROGRAM FUN.
C                 THE COMPLEX FUNCTION FUN SHOULD BE A MONOTONE
C                 DECREASING FUNCTION AS THE ARGUMENT G BECOMES LARGE...
C               FOR REAL-ONLY FUNCTIONS, SUBPROGRAM 'RHANK1' IS ADVISED;
C               HOWEVER, TWO REAL-FUNCTIONS F1(G),F2(G) MAY BE
C               INTEGRATED IN PARALLEL BY WRITING FUN=CMPLX(F1(G),F2(G))
C       TOL=      REAL TOLERANCE EXCEPTED AT CONVOLVED TAILS--I.E.,
C                 IF FILTER*FUN<TOL*MAX, THEN REST OF TAIL IS TRUNCATED.
C                 THIS IS DONE AT BOTH ENDS OF FILTER.  TYPICALLY,
C                 TOL <= .0001 IS USUALLY OK--BUT THIS DEPENDS ON
C                 THE FUNCTION FUN AND PARAMETER X...IN GENERAL,
C               A 'SMALLER TOL' WILL USUALLY RESULT IN 'MORE ACCURACY'
C               BUT WITH 'MORE WEIGHTS' BEING USED.  TOL IS NOT DIRECTLY
C               RELATED TO TRUNCATION ERROR, BUT GENERALLY SERVES AS AN
C               APPROXIMATION INDICATOR... FOR VERY LARGE OR SMALL B,
C               ONE SHOULD USE A SMALLER TOL THAN RECOMMENDED ABOVE...
C       L=        RESULTING NO. FILTER WTS. USED IN THE VARIABLE
C                 CONVOLUTION (L DEPENDS ON TOL AND FUN).
C               MIN.L=15 AND MAX.L=236--WHICH COULD
C                 OCCUR IF TOL IS VERY SMALL AND/OR FUN NOT DECREASING
C                 VERY FAST...
C
C--THE RESULTING COMPLEX CONVOLUTION SUM IS GIVEN IN ZHANK1; THE HANKEL
C  TRANSFORM IS THEN ZHANK1/B WHICH IS TO BE COMPUTED AFTER EXIT FROM
C  THIS ROUTINE....
C
C--USAGE-- 'ZHANK1' IS CALLED AS FOLLOWS:
C     ...
C     COMPLEX Z,ZHANK1,ZF
C     EXTERNAL ZF
C     ...
C     Z=ZHANK1(ALOG(B),ZF,TOL,L)/B
C     ...
C     END...
C     COMPLEX FUNCTION ZF(G)
C     ...USER SUPPLIED CODE...
C     END...
C
C--NOTES:
C       (1).  EXP-UNDERFLOW'S MAY OCCUR IN EXECUTING THIS SUBPROGRAM;
C             THIS IS OK PROVIDED THE MACHINE SYSTEM CONDITIONALLY SETS
C             EXP-UNDERFLOW'S TO 0.0......
C       (2).  THIS SUBPROGRAM IS AN ANSI REVISION OF THE ORIGINAL
C             PUBLISHED VERSION IN NTIS REPT. PB-242-800, P.49-53;
C             IMPROVEMENTS HAVE BEEN MADE IN OVERALL EXECUTION TIME,
C             HOWEVER, THE CALLING SEQUENCE AND FILTER WEIGHTS
C             WERE NOT CHANGED.
C       (3). ABSCISSA CORRESPONDING TO WEIGHT IS GENERATED
C            TO SAVE STORAGE.
        COMPLEX FUN,C,CMAX
        DOUBLE PRECISION A,E,ER,Y1,Y
        DIMENSION T(2),TMAX(2)
        DIMENSION WT(236),W1(76),W2(76),W3(76),W4(8)
        EQUIVALENCE (WT(1),W1(1)),(WT(77),W2(1)),(WT(153),W3(1)),
     1 (WT(229),W4(1))
        EQUIVALENCE (C,T(1)),(CMAX,TMAX(1))
        DATA E/1.221402758160169834 D0/,ER/.818730753077981859 D0/
C--J1-EXTENDED FILTER WEIGHT ARRAYS:
      DATA W1/
     1-8.8863805E-10, 1.1293811E-09,-1.2050872E-09, 1.2696232E-09,
     2-1.3223909E-09, 1.3642393E-09,-1.3969439E-09, 1.4225941E-09,
     3-1.4427475E-09, 1.4580582E-09,-1.4682563E-09, 1.4732179E-09,
     4-1.4735606E-09, 1.4719870E-09,-1.4727091E-09, 1.4828225E-09,
     5-1.5102619E-09, 1.5667752E-09,-1.6634522E-09, 1.8172900E-09,
     6-2.0412753E-09, 2.3595230E-09,-2.7861077E-09, 3.3592871E-09,
     7-4.0940172E-09, 5.0571015E-09,-6.2604109E-09, 7.8269461E-09,
     8-9.7514701E-09, 1.2267639E-08,-1.5312389E-08, 1.9339924E-08,
     9-2.4126297E-08, 3.0576829E-08,-3.8060204E-08, 4.8423732E-08,
     1-6.0051116E-08, 7.6787475E-08,-9.4700993E-08, 1.2192844E-07,
     2-1.4918997E-07, 1.9392737E-07,-2.3464786E-07, 3.0911127E-07,
     3-3.6815394E-07, 4.9413800E-07,-5.7554168E-07, 7.9301529E-07,
     4-8.9502818E-07, 1.2794292E-06,-1.3811469E-06, 2.0789668E-06,
     5-2.1069398E-06, 3.4103188E-06,-3.1584463E-06, 5.6639045E-06,
     6-4.6059955E-06, 9.5561672E-06,-6.4142855E-06, 1.6440205E-05,
     7-8.2010619E-06, 2.8945217E-05,-8.6348466E-06, 5.2317398E-05,
     8-3.9915035E-06, 9.7273612E-05, 1.5220520E-05, 1.8614373E-04,
     9 7.2023760E-05, 3.6620099E-04, 2.2062958E-04, 7.3874539E-04,
     1 5.8623480E-04, 1.5226779E-03, 1.4538718E-03, 3.1930365E-03/
      DATA W2/
     1 3.4640868E-03, 6.7790882E-03, 8.0328420E-03, 1.4484339E-02,
     2 1.8201316E-02, 3.0866143E-02, 4.0106549E-02, 6.4527872E-02,
     3 8.4285526E-02, 1.2773175E-01, 1.6020907E-01, 2.1948043E-01,
     4 2.3636305E-01, 2.4895051E-01, 1.2586300E-01,-5.1060445E-02,
     5-3.4376222E-01,-2.9042175E-01, 1.1564736E-01, 4.9253231E-01,
     6-4.6748595E-01, 1.5280945E-01, 3.3348541E-02,-8.2485252E-02,
     7 7.9740630E-02,-6.6934498E-02, 5.5150465E-02,-4.5868721E-02,
     8 3.8651958E-02,-3.2935834E-02, 2.8303994E-02,-2.4475127E-02,
     9 2.1259541E-02,-1.8526278E-02, 1.6182037E-02,-1.4158101E-02,
     1 1.2402225E-02,-1.0873526E-02, 9.5392016E-03,-8.3723743E-03,
     2 7.3506490E-03,-6.4551136E-03, 5.6696335E-03,-4.9803353E-03,
     3 4.3752213E-03,-3.8438703E-03, 3.3772023E-03,-2.9672872E-03,
     4 2.6071877E-03,-2.2908274E-03, 2.0128794E-03,-1.7686706E-03,
     5 1.5540998E-03,-1.3655666E-03, 1.1999089E-03,-1.0543497E-03,
     6 9.2644973E-04,-8.1406593E-04, 7.1531559E-04,-6.2854459E-04,
     7 5.5229955E-04,-4.8530352E-04, 4.2643446E-04,-3.7470650E-04,
     8 3.2925334E-04,-2.8931382E-04, 2.5421910E-04,-2.2338147E-04,
     9 1.9628455E-04,-1.7247455E-04, 1.5155278E-04,-1.3316889E-04,
     1 1.1701502E-04,-1.0282066E-04, 9.0348135E-05,-7.9388568E-05/
      DATA W3/
     1 6.9758436E-05,-6.1296474E-05, 5.3860978E-05,-4.7327436E-05,
     2 4.1586435E-05,-3.6541840E-05, 3.2109174E-05,-2.8214208E-05,
     3 2.4791718E-05,-2.1784390E-05, 1.9141864E-05,-1.6819888E-05,
     4 1.4779578E-05,-1.2986765E-05, 1.1411426E-05,-1.0027182E-05,
     5 8.8108499E-06,-7.7420630E-06, 6.8029235E-06,-5.9777053E-06,
     6 5.2525892E-06,-4.6154325E-06, 4.0555653E-06,-3.5636118E-06,
     7 3.1313335E-06,-2.7514911E-06, 2.4177236E-06,-2.1244417E-06,
     8 1.8667342E-06,-1.6402859E-06, 1.4413051E-06,-1.2664597E-06,
     9 1.1128220E-06,-9.7781908E-07, 8.5919028E-07,-7.5494920E-07,
     1 6.6335060E-07,-5.8286113E-07, 5.1213358E-07,-4.4998431E-07,
     2 3.9537334E-07,-3.4738689E-07, 3.0522189E-07,-2.6817250E-07,
     3 2.3561831E-07,-2.0701397E-07, 1.8188012E-07,-1.5979545E-07,
     4 1.4038968E-07,-1.2333746E-07, 1.0835294E-07,-9.5185048E-08,
     5 8.3613184E-08,-7.3443411E-08, 6.4505118E-08,-5.6648167E-08,
     6 4.9740428E-08,-4.3665572E-08, 3.8321109E-08,-3.3616717E-08,
     7 2.9472836E-08,-2.5819439E-08, 2.2594957E-08,-1.9745353E-08,
     8 1.7223359E-08,-1.4987869E-08, 1.3003472E-08,-1.1240058E-08,
     9 9.6723739E-09,-8.2794392E-09, 7.0438407E-09,-5.9509676E-09,
     1 4.9882405E-09,-4.1443813E-09, 3.4088114E-09,-2.7712762E-09/
      DATA W4/
     1 2.2217311E-09,-1.7504755E-09, 1.3485207E-09,-1.0080937E-09,
     2 7.2300885E-10,-4.8860666E-10, 3.0121413E-10,-9.1649798E-11/
C--$$ENDATA
C
        A=DBLE(EXP(-X-17.0))
        ZHANK1=(0.0,0.0)
        CMAX=(0.0,0.0)
        L=13
        Y1=A*0.2415495275357529840D+08
        Y=Y1
        DO 10 I=86,98
        Y= Y*E
        C=FUN(SNGL(Y))*WT(I)
        ZHANK1=ZHANK1+C
        TMAX(1)=AMAX1(ABS(T(1)),TMAX(1))
        TMAX(2)=AMAX1(ABS(T(2)),TMAX(2))
   10   CONTINUE
        IF(TMAX(1).EQ.0.0.AND.TMAX(2).EQ.0.0) GO TO 60
        CMAX=TOL*CMAX
        DO 20 I=99,236
        Y=Y*E
        C=FUN(SNGL(Y))*WT(I)
        ZHANK1=ZHANK1+C
        L=L+1
        IF(ABS(T(1)).LE.TMAX(1).AND.ABS(T(2)).LE.TMAX(2)) GO TO 30
   20   CONTINUE
   30   Y=Y1*E
        DO 40 I=1,85
        Y=Y*ER
        C=FUN(SNGL(Y))*WT(86-I)
        ZHANK1=ZHANK1+C
        L=L+1
        IF(ABS(T(1)).LE.TMAX(1).AND.ABS(T(2)).LE.TMAX(2)) GO TO 50
   40   CONTINUE
   50   RETURN
   60   Y=A
        DO 70 I=1,85
        Y=Y*E
        C=FUN(SNGL(Y))*WT(I)
        ZHANK1=ZHANK1+C
        L=L+1
        IF(T(1).EQ.0.0.AND.T(2).EQ.0.0) GO TO 80
   70   CONTINUE
   80   Y=A*0.3850866315958012196D+21
        DO 90 I=1,138
        Y=Y*ER
        C=FUN(SNGL(Y))*WT(237-I)
        ZHANK1=ZHANK1+C
        L=L+1
        IF(T(1).EQ.0.0.AND.T(2).EQ.0.0) GO TO 50
   90   CONTINUE
        GO TO 50
        END