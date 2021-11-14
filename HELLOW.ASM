HELLO   CSECT                            CONTROL SECTION                00000100
        USING HELLO,15                                                  00000200
        STM   14,12,12(13)               SAVE REGISTERS                 00000300
        LA    12,SAVEA                   R12 POINTS TO THIS SAVEAREA    00000400
        ST    13,SAVEA+4                 SAVE ADDR OF SAVEA OF PREVPGM  00000500
        ST    12,8(,13)                  STORE CURRENT SAVEAREA         00000600
        LR    13,12                      R13 POINTS TO CUR SAVE AREA    00000700
        LR    12,15                      USE R12 AS BASE REG            00000800
        DROP  15                         DROP R15 AS BASE REG           00000900
        USING HELLO,12                   DEFINE R12 AS BASE REG         00001000
                                                                        00001100
SAYIT   WTO   'HELLO WORLD!',ROUTCDE=(1) SEND MSG TO CONSOLE            00001200
        L     13,SAVEA+4                 PREP TO EXIT                   00001300
        LM    14,12,12(13)               RESTORE REGS                   00001400
        SR    15,15                      ZERO OUT RETURN CODE           00001500
        BR    14                                                        00001600
                                                                        00001700
SAVEA   DS 18F                                                          00001800
        END                                                             00001900
