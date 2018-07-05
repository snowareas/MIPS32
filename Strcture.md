#Module  Instruction Memory
	Input( reset, clk, PC[31:0])
	Output( Instruction[31:0])

#Signal  IF/ID
	32bit from  Instruction Memory. Output[31:0]
	------------------------------
		[31:26]	opcode
		[25:21] rs
		[20:16] rt
		[15:11] rd
		[10:6]	shamt
		[5:0]	funct
	------------------------------
		[31:26] opcode
		[25:21]	rs
		[20:16] rt/rd
		[15:0]	imm
	------------------------------
		[31:26] opcode
		[25:0]	target address
		
	# 若ID/EX为lw指令，IF/ID全0

#Module  Registers
	Input(	reset, clk, ReadAddr1[4:0], ReadAddr2[4:0], WriteAddr[4:0], WriteData[31:0],  RegWriteEn)
		ReadAddr1 = IF/ID[25:21]
		ReadAddr2 = IF/ID[20:16]
		WriteAddr = IF/ID[15:11]
		RegWriteEn from Module Control
	Output( ReadData1[31:0], ReadData2[31:0])

#Module Control
	Input( IF/ID[31:26])
	Output( RegWriteEn, ALUSrc, MemWriteEn, ALUop[3:0], MemtoReg, Branch, RegDst…)

#Signal ID/EX
	xbit	from Control						
	32bit	from Reg.ReadData1				[110:78]
	32bit	from Reg.ReadData2				[78:47]
	32bit	from IF/ID[15:0] Extend			[46:15]
	10bit	from IF/ID[25:16](rs rt)		[14:5]
	5bit	from IF/ID[15:11](rd)			[4:0]

#Module ALU
	Input( reset, clk, Src1[32:0], Src2[32:0], ALUctl[4:0], Sign)
		src1 = Mux(ReadData1, MEM写回，ALURes)
		src2 = Mux(ReadData2, MEN写回，ALURes, Imm)
	Output( Res, overflow, branch)

#Module ALUControl
	Input( reset, clk, ALUop[3:0], funct[5:0])
	Output( ALUctl[4:0], Sign)

#Signal EX/MEM
	xbit	from ID/EX.Control
	32bit	from PC+4[31:28] + ID/EX[46:15]<<2	[101:70]
	1bit	from ALU.branch						[69]
	32bit	from ALU.Res						[68:37]
	32bit	from ID/EX[46:15]					[36:5]
	5bit	from Mux(ID/EX.rt rd) RegDst控制 	[4:0]

#Module Data Memory
	Input( reset, clk, Addr[31:0], WriteData[31:0], MemWriteEn)
		Addr[31:0] 