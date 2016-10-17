             PGM        PARM(&NUM_CHR &TEXT)

          /*ÀVariable declarations                                                                */
             DCL        VAR(&NUM_CHR) TYPE(*CHAR) LEN(6)
             DCL        VAR(&NUMBER) TYPE(*DEC) LEN(6)

             DCL        VAR(&PGMNAM) TYPE(*CHAR) LEN(10)
             DCL        VAR(&TEXT) TYPE(*CHAR) LEN(126)
             DCL        VAR(&PGMTXT) TYPE(*CHAR) LEN(50)

          /*ÀBuild program text                                                                   */
             CHGVAR     VAR(&PGMTXT) VALUE('RSP for class' *BCAT &TEXT)

          /*ÀBuild program name                                                                   */
 FORM_NAME:
             CHGVAR     VAR(&PGMNAM) VALUE('QOO#' *CAT &NUM_CHR)

          /*ÀAttempt creation in QTEMP                                                            */
             CRTDUPOBJ  OBJ(QOO#000000) FROMLIB(RAYLIB) +
                          OBJTYPE(*PGM) TOLIB(QTEMP) NEWOBJ(&PGMNAM)
             MONMSG     MSGID(CPF2130) EXEC(GOTO CMDLBL(NEXT_NAME))

          /*ÀNew Text                                                                             */
             CHGPGM     PGM(QTEMP/&PGMNAM) TEXT(&PGMTXT)

          /*ÀFinished                                                                             */
             RETURN

          /*ÀName already exists so form a new one                                                */
 NEXT_NAME:
             CHGVAR     VAR(&NUMBER) VALUE(&NUM_CHR)
             CHGVAR     VAR(&NUMBER) VALUE(&NUMBER + 1)
             CHGVAR     VAR(&NUM_CHR) VALUE(&NUMBER)

          /*ÀLoop to try again                                                                    */
             GOTO       CMDLBL(FORM_NAME)
             ENDPGM
