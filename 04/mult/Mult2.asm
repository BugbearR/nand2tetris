// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
	// mult by bit.
	//
	// R2 = 0;
	// b = 1;
	// w = R1;
	// for (i = 16; --i >= 0;) {
	//     if ((R0 & b) != 0) {
	//         R2 += w;
	//     }
	//     b = b + b;
	//     w = w + w;
	// }

	@R2
	M=0
	@b
	D=0
	M=D+1

	@R1
	D=M
	@w
	M=D

	@16
	D=A
	@i
	M=D
(LOOP)
	@i
	MD=M-1
	@END
	D;JLT

	@R0
	D=M
	@b
	D=D&M
	@SKIP
	D;JEQ

	@R2
	D=M
	@w
	D=D+M
	@R2
	M=D

(SKIP)
	@b
	D=M
	@b
	M=D+M

	@w
	D=M
	@w
	M=D+M

	@LOOP
	0;JMP

(END)
	@END
	0;JMP
