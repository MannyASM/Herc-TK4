//HERC01T0  JOB (BAL),                                                  00000100
//      'TEST ASM CODE',                                                00000200
//      CLASS=A,                                                        00000300
//      MSGCLASS=H,                                                     00000400
//      TIME=(1440),                                                    00000500
//      MSGLEVEL=(1,1),                                                 00000600
//      NOTIFY=HERC01                                                   00000700
//*                                                                     00000800
//*ESTASM EXEC ASMFCLG                                                  00000900
//TESTASM EXEC ASMFCL                                                   00001001
HELLO   CSECT                            CONTROL SECTION                00001100
        USING HELLO,15                                                  00001200
        STM   14,12,12(13)               SAVE REGISTERS                 00001300
        LA    12,SAVEA                   R12 POINTS TO THIS SAVEAREA    00001400
        ST    13,SAVEA+4                 SAVE ADDR OF SAVEA OF PREVPGM  00001500
        ST    12,8(,13)                  STORE CURRENT SAVEAREA         00001600
        LR    13,12                      R13 POINTS TO CUR SAVE AREA    00001700
        LR    12,15                      USE R12 AS BASE REG            00001800
        DROP  15                         DROP R15 AS BASE REG           00001900
        USING HELLO,12                   DEFINE R12 AS BASE REG         00002000
                                                                        00002100
SAYIT   WTO   'HELLO WORLD!',ROUTCDE=(1) SEND MSG TO CONSOLE            00002200
        L     13,SAVEA+4                 PREP TO EXIT                   00002300
        LM    14,12,12(13)               RESTORE REGS                   00002400
        SR    15,15                      ZERO OUT RETURN CODE           00002500
        BR    14                                                        00002600
                                                                        00002700
SAVEA   DS 18F                                                          00002800
        END                                                             00002900
//LKED.SYSLMOD DD DSN=HERC01.TEST.LOADLIB(HELLOASM),DISP=SHR            00003000
