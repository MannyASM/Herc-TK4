//HERC01AS  JOB (BAL),                                                  00000106
//      'TEST ASM CODE',                                                00000200
//      CLASS=A,                                                        00000300
//      MSGCLASS=H,                                                     00000400
//      TIME=(1440),                                                    00000500
//      MSGLEVEL=(1,1),                                                 00000600
//      NOTIFY=HERC01                                                   00000700
//*                                                                     00000800
//*----------------------------------------------------------------     00000906
//* ASSEMBLE                                                            00001002
//*  DATASETS                                                           00001106
//*     SYSIN      ASSEMBLER SOURCE PROGRAM                             00001206
//*                                                                     00001306
//*     SYSLIB     MACROS AND COPY MEMBERS                              00001406
//*                ONE OR MORE CONCATENATED PARTITIONED DATA SETS       00001506
//*                80-BYTE FIXED-LENGTH RECORDS                         00001606
//*                                                                     00001706
//*     ASMAOPT    ASSEMBLER OPTIONS                                    00001806
//*                                                                     00001906
//*     SYSLIN     IF ONE OF THE OBJECT(OMF), OBJECT(XOBJ) OR           00002006
//*     SYSGO      OBJECT(GOFF) OPTIONS ARE ACTIVE                      00002106
//*                SYSLIN OR SYSGO MUST BE DEFINED AS 80-BYTES FIXED    00002206
//*                LENGTH RECS IN SEQ DS OR PDS MEMBER                  00002306
//*                                                                     00002406
//*     SYSPUNCH   OBJECT(DECK) OPTION                                  00002506
//*                DEFINE SAME AS SYSLIN/SYSGO                          00002606
//*                                                                     00002706
//*     SYSPRINT   LIST OPTION, ASSY LISTING IS WRITTEN TO SYSPRINT     00002806
//*                DEFINE 121 TO 133 BYTE FIXED-LENGTH RECORDS OR       00002906
//*                125 TO 137 BYTE VARIABLE-LENGTH RECORDS WITH         00003006
//*                EITHER ASA OR MACHINE CONTROL CHARACTERS             00003106
//*                LRECL=133 FOR FIXED-LENGTH                           00003206
//*                LRECL=137 FOR VARIABLE-LENGTH IF LIST(133)           00003306
//*                CAN BE ALLOCATED TO SYSOUT, PDS MEMBER OF SEQ DS     00003406
//*                                                                     00003506
//*      SYSTERM   TERM OPTION, ASSEMBLY MESSAGES ARE WRITTEN HERE      00003606
//*                SHOULD ALWAYS BE DEFINED                             00003706
//*                                                                     00003806
//*      SYSDATA   ADATA OPTION                                         00003906
//*                RECORDS WRITTENT TO SYSDATA                          00004006
//*                DEFINE AS VARIABLE LENGTH, SEQ DS                    00004106
//*                AT LEAST 8188 BYTES                                  00004206
//*                                                                     00004306
//*      SYSUT1    WORK FILES                                           00004406
//*      SYSUT2                                                         00004506
//*      SYSUT3                                                         00004606
//*                                                                     00004706
//*      SOURCE: HTTP://WWW.TACHYONSOFT.COM/TXAG.HTM                    00004806
//*                                                                     00004906
//*----------------------------------------------------------------     00005006
//ASM     EXEC PGM=IFOX00,                                              00005104
//         PARM='OBJECT,LIST,NODECK',REGION=4096K                       00005204
//SYSLIB   DD  DISP=SHR,DSN=SYS1.MACLIB,DCB=BLKSIZE=27920               00005302
//         DD  DISP=SHR,DSN=SYS1.AMODGEN                                00005402
//SYSIN    DD  DISP=SHR,DSN=HERC01.TEST.ASM(HELLOW)                     00005503
//SYSTERM  DD  SYSOUT=*                                                 00005602
//SYSPUNCH DD  DUMMY                                                    00005706
//SYSUT1   DD  DSN=&&SYSUT1,UNIT=SYSDA,SPACE=(1700,(600,100)),          00005802
//             SEP=(SYSLIB)                                             00005902
//SYSUT2   DD  DSN=&&SYSUT2,UNIT=SYSDA,SPACE=(1700,(300,50)),           00006002
//             SEP=(SYSLIB,SYSUT1)                                      00006102
//SYSUT3   DD  DSN=&&SYSUT3,UNIT=SYSDA,SPACE=(1700,(300,50))            00006202
//SYSGO    DD  DSN=&&OBJSET,UNIT=SYSDA,SPACE=(80,(200,50)),             00006306
//             DISP=(NEW,PASS)                                          00006406
//SYSPRINT DD  DSN=HERC01.TEST.LIST,                                    00006506
//             DISP=(NEW,CATLG,DELETE),                                 00006606
//             SPACE=(80,(200,50)),                                     00006706
//             UNIT=SYSDA,                                              00006806
//             DCB=(RECFM=FBM,LRECL=133,BLKSIZE=1463)                   00006907
//*                                                                     00007006
//*------------------------------------------------                     00007102
//* LINK                                                                00007202
//*------------------------------------------------                     00007302
//LKED     EXEC PGM=IEWL,PARM=(LIST,MAP,XREF,LET,NCAL,RENT),            00007404
//             COND=(4,LT,ASM)                                          00007502
//SYSLIN   DD  DSN=&&OBJSET,DISP=(OLD,DELETE)                           00007602
//         DD  DDNAME=SYSIN                                             00007702
//SYSLMOD  DD  DISP=SHR,DSN=HERC01.TEST.LOADLIB(HELLOW)                 00007802
//SYSUT1   DD  DSN=&&SYSUT1,UNIT=(SYSDA,SEP=(SYSLIN,SYSLMOD)),          00007902
//             SPACE=(1024,(50,20))                                     00008002
//SYSPRINT DD  SYSOUT=*                                                 00008102
//*                                                                     00008203
//*------------------------------------------------                     00008303
//* EXECUTE                                                             00008403
//*------------------------------------------------                     00008503
//GO       EXEC PGM=*.LKED.SYSLMOD,COND=((8,LT,ASM),(4,LT,LKED))        00008603
//                                                                      00008703
