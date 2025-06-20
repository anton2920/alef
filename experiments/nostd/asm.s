#define	SYS_EXIT	1
#define	SYS_WRITE	4

TEXT Exit(SB), $8
	MOVL	$SYS_EXIT, AX
	MOVL	status+0(FP), BX
	MOVL	BX, 4(SP)
	INT	$0x80
	/* Unreachable */
	MOVL	$0x0, 0x0


TEXT Write(SB), $16
	MOVL	$SYS_WRITE, AX
	LEAL	fd+0(FP), SI
	LEAL 4(SP), DI
	MOVL	$0x3, CX
	CLD
	REP; MOVSL
	INT	$0x80
	RET
