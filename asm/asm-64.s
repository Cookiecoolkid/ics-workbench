
asm-64:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 d9 2f 00 00 	mov    0x2fd9(%rip),%rax        # 3fe8 <__gmon_start__@Base>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	call   *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	ret    

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 8a 2f 00 00    	push   0x2f8a(%rip)        # 3fb0 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	f2 ff 25 8b 2f 00 00 	bnd jmp *0x2f8b(%rip)        # 3fb8 <_GLOBAL_OFFSET_TABLE_+0x10>
    102d:	0f 1f 00             	nopl   (%rax)
    1030:	f3 0f 1e fa          	endbr64 
    1034:	68 00 00 00 00       	push   $0x0
    1039:	f2 e9 e1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    103f:	90                   	nop
    1040:	f3 0f 1e fa          	endbr64 
    1044:	68 01 00 00 00       	push   $0x1
    1049:	f2 e9 d1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    104f:	90                   	nop
    1050:	f3 0f 1e fa          	endbr64 
    1054:	68 02 00 00 00       	push   $0x2
    1059:	f2 e9 c1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    105f:	90                   	nop

Disassembly of section .plt.got:

0000000000001060 <__cxa_finalize@plt>:
    1060:	f3 0f 1e fa          	endbr64 
    1064:	f2 ff 25 8d 2f 00 00 	bnd jmp *0x2f8d(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    106b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .plt.sec:

0000000000001070 <puts@plt>:
    1070:	f3 0f 1e fa          	endbr64 
    1074:	f2 ff 25 45 2f 00 00 	bnd jmp *0x2f45(%rip)        # 3fc0 <puts@GLIBC_2.2.5>
    107b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001080 <__stack_chk_fail@plt>:
    1080:	f3 0f 1e fa          	endbr64 
    1084:	f2 ff 25 3d 2f 00 00 	bnd jmp *0x2f3d(%rip)        # 3fc8 <__stack_chk_fail@GLIBC_2.4>
    108b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001090 <__assert_fail@plt>:
    1090:	f3 0f 1e fa          	endbr64 
    1094:	f2 ff 25 35 2f 00 00 	bnd jmp *0x2f35(%rip)        # 3fd0 <__assert_fail@GLIBC_2.2.5>
    109b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

00000000000010a0 <_start>:
    10a0:	f3 0f 1e fa          	endbr64 
    10a4:	31 ed                	xor    %ebp,%ebp
    10a6:	49 89 d1             	mov    %rdx,%r9
    10a9:	5e                   	pop    %rsi
    10aa:	48 89 e2             	mov    %rsp,%rdx
    10ad:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    10b1:	50                   	push   %rax
    10b2:	54                   	push   %rsp
    10b3:	45 31 c0             	xor    %r8d,%r8d
    10b6:	31 c9                	xor    %ecx,%ecx
    10b8:	48 8d 3d ca 00 00 00 	lea    0xca(%rip),%rdi        # 1189 <main>
    10bf:	ff 15 13 2f 00 00    	call   *0x2f13(%rip)        # 3fd8 <__libc_start_main@GLIBC_2.34>
    10c5:	f4                   	hlt    
    10c6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    10cd:	00 00 00 

00000000000010d0 <deregister_tm_clones>:
    10d0:	48 8d 3d 39 2f 00 00 	lea    0x2f39(%rip),%rdi        # 4010 <__TMC_END__>
    10d7:	48 8d 05 32 2f 00 00 	lea    0x2f32(%rip),%rax        # 4010 <__TMC_END__>
    10de:	48 39 f8             	cmp    %rdi,%rax
    10e1:	74 15                	je     10f8 <deregister_tm_clones+0x28>
    10e3:	48 8b 05 f6 2e 00 00 	mov    0x2ef6(%rip),%rax        # 3fe0 <_ITM_deregisterTMCloneTable@Base>
    10ea:	48 85 c0             	test   %rax,%rax
    10ed:	74 09                	je     10f8 <deregister_tm_clones+0x28>
    10ef:	ff e0                	jmp    *%rax
    10f1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    10f8:	c3                   	ret    
    10f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001100 <register_tm_clones>:
    1100:	48 8d 3d 09 2f 00 00 	lea    0x2f09(%rip),%rdi        # 4010 <__TMC_END__>
    1107:	48 8d 35 02 2f 00 00 	lea    0x2f02(%rip),%rsi        # 4010 <__TMC_END__>
    110e:	48 29 fe             	sub    %rdi,%rsi
    1111:	48 89 f0             	mov    %rsi,%rax
    1114:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1118:	48 c1 f8 03          	sar    $0x3,%rax
    111c:	48 01 c6             	add    %rax,%rsi
    111f:	48 d1 fe             	sar    %rsi
    1122:	74 14                	je     1138 <register_tm_clones+0x38>
    1124:	48 8b 05 c5 2e 00 00 	mov    0x2ec5(%rip),%rax        # 3ff0 <_ITM_registerTMCloneTable@Base>
    112b:	48 85 c0             	test   %rax,%rax
    112e:	74 08                	je     1138 <register_tm_clones+0x38>
    1130:	ff e0                	jmp    *%rax
    1132:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1138:	c3                   	ret    
    1139:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001140 <__do_global_dtors_aux>:
    1140:	f3 0f 1e fa          	endbr64 
    1144:	80 3d c5 2e 00 00 00 	cmpb   $0x0,0x2ec5(%rip)        # 4010 <__TMC_END__>
    114b:	75 2b                	jne    1178 <__do_global_dtors_aux+0x38>
    114d:	55                   	push   %rbp
    114e:	48 83 3d a2 2e 00 00 	cmpq   $0x0,0x2ea2(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1155:	00 
    1156:	48 89 e5             	mov    %rsp,%rbp
    1159:	74 0c                	je     1167 <__do_global_dtors_aux+0x27>
    115b:	48 8b 3d a6 2e 00 00 	mov    0x2ea6(%rip),%rdi        # 4008 <__dso_handle>
    1162:	e8 f9 fe ff ff       	call   1060 <__cxa_finalize@plt>
    1167:	e8 64 ff ff ff       	call   10d0 <deregister_tm_clones>
    116c:	c6 05 9d 2e 00 00 01 	movb   $0x1,0x2e9d(%rip)        # 4010 <__TMC_END__>
    1173:	5d                   	pop    %rbp
    1174:	c3                   	ret    
    1175:	0f 1f 00             	nopl   (%rax)
    1178:	c3                   	ret    
    1179:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001180 <frame_dummy>:
    1180:	f3 0f 1e fa          	endbr64 
    1184:	e9 77 ff ff ff       	jmp    1100 <register_tm_clones>

0000000000001189 <main>:
    1189:	f3 0f 1e fa          	endbr64 
    118d:	55                   	push   %rbp
    118e:	48 89 e5             	mov    %rsp,%rbp
    1191:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
    1198:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    119f:	00 00 
    11a1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    11a5:	31 c0                	xor    %eax,%eax
    11a7:	48 8d 85 f0 fd ff ff 	lea    -0x210(%rbp),%rax
    11ae:	48 89 c7             	mov    %rax,%rdi
    11b1:	e8 a3 01 00 00       	call   1359 <asm_setjmp>
    11b6:	89 85 ec fd ff ff    	mov    %eax,-0x214(%rbp)
    11bc:	83 bd ec fd ff ff 00 	cmpl   $0x0,-0x214(%rbp)
    11c3:	0f 85 94 00 00 00    	jne    125d <main+0xd4>
    11c9:	be 2e 16 00 00       	mov    $0x162e,%esi
    11ce:	bf d2 04 00 00       	mov    $0x4d2,%edi
    11d3:	e8 e0 00 00 00       	call   12b8 <asm_add>
    11d8:	48 3d 00 1b 00 00    	cmp    $0x1b00,%rax
    11de:	74 28                	je     1208 <main+0x7f>
    11e0:	48 8d 05 82 0e 00 00 	lea    0xe82(%rip),%rax        # 2069 <__PRETTY_FUNCTION__.0>
    11e7:	48 89 c1             	mov    %rax,%rcx
    11ea:	ba 0b 00 00 00       	mov    $0xb,%edx
    11ef:	48 8d 05 12 0e 00 00 	lea    0xe12(%rip),%rax        # 2008 <_IO_stdin_used+0x8>
    11f6:	48 89 c6             	mov    %rax,%rsi
    11f9:	48 8d 05 11 0e 00 00 	lea    0xe11(%rip),%rax        # 2011 <_IO_stdin_used+0x11>
    1200:	48 89 c7             	mov    %rax,%rdi
    1203:	e8 88 fe ff ff       	call   1090 <__assert_fail@plt>
    1208:	48 b8 ef cd ab 89 67 	movabs $0x123456789abcdef,%rax
    120f:	45 23 01 
    1212:	48 89 c7             	mov    %rax,%rdi
    1215:	e8 cb 00 00 00       	call   12e5 <asm_popcnt>
    121a:	83 f8 20             	cmp    $0x20,%eax
    121d:	74 28                	je     1247 <main+0xbe>
    121f:	48 8d 05 43 0e 00 00 	lea    0xe43(%rip),%rax        # 2069 <__PRETTY_FUNCTION__.0>
    1226:	48 89 c1             	mov    %rax,%rcx
    1229:	ba 0c 00 00 00       	mov    $0xc,%edx
    122e:	48 8d 05 d3 0d 00 00 	lea    0xdd3(%rip),%rax        # 2008 <_IO_stdin_used+0x8>
    1235:	48 89 c6             	mov    %rax,%rsi
    1238:	48 8d 05 f1 0d 00 00 	lea    0xdf1(%rip),%rax        # 2030 <_IO_stdin_used+0x30>
    123f:	48 89 c7             	mov    %rax,%rdi
    1242:	e8 49 fe ff ff       	call   1090 <__assert_fail@plt>
    1247:	48 8d 85 f0 fd ff ff 	lea    -0x210(%rbp),%rax
    124e:	be 7b 00 00 00       	mov    $0x7b,%esi
    1253:	48 89 c7             	mov    %rax,%rdi
    1256:	e8 40 01 00 00       	call   139b <asm_longjmp>
    125b:	eb 40                	jmp    129d <main+0x114>
    125d:	83 bd ec fd ff ff 7b 	cmpl   $0x7b,-0x214(%rbp)
    1264:	74 28                	je     128e <main+0x105>
    1266:	48 8d 05 fc 0d 00 00 	lea    0xdfc(%rip),%rax        # 2069 <__PRETTY_FUNCTION__.0>
    126d:	48 89 c1             	mov    %rax,%rcx
    1270:	ba 11 00 00 00       	mov    $0x11,%edx
    1275:	48 8d 05 8c 0d 00 00 	lea    0xd8c(%rip),%rax        # 2008 <_IO_stdin_used+0x8>
    127c:	48 89 c6             	mov    %rax,%rsi
    127f:	48 8d 05 d2 0d 00 00 	lea    0xdd2(%rip),%rax        # 2058 <_IO_stdin_used+0x58>
    1286:	48 89 c7             	mov    %rax,%rdi
    1289:	e8 02 fe ff ff       	call   1090 <__assert_fail@plt>
    128e:	48 8d 05 cc 0d 00 00 	lea    0xdcc(%rip),%rax        # 2061 <_IO_stdin_used+0x61>
    1295:	48 89 c7             	mov    %rax,%rdi
    1298:	e8 d3 fd ff ff       	call   1070 <puts@plt>
    129d:	b8 00 00 00 00       	mov    $0x0,%eax
    12a2:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    12a6:	64 48 2b 14 25 28 00 	sub    %fs:0x28,%rdx
    12ad:	00 00 
    12af:	74 05                	je     12b6 <main+0x12d>
    12b1:	e8 ca fd ff ff       	call   1080 <__stack_chk_fail@plt>
    12b6:	c9                   	leave  
    12b7:	c3                   	ret    

00000000000012b8 <asm_add>:
    12b8:	f3 0f 1e fa          	endbr64 
    12bc:	55                   	push   %rbp
    12bd:	48 89 e5             	mov    %rsp,%rbp
    12c0:	53                   	push   %rbx
    12c1:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
    12c5:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
    12c9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    12cd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    12d1:	48 89 d3             	mov    %rdx,%rbx
    12d4:	48 01 d8             	add    %rbx,%rax
    12d7:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    12db:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    12df:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
    12e3:	c9                   	leave  
    12e4:	c3                   	ret    

00000000000012e5 <asm_popcnt>:
    12e5:	f3 0f 1e fa          	endbr64 
    12e9:	55                   	push   %rbp
    12ea:	48 89 e5             	mov    %rsp,%rbp
    12ed:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    12f1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    12f8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    12fc:	8b 45 fc             	mov    -0x4(%rbp),%eax

00000000000012ff <st>:
    12ff:	48 d1 ea             	shr    %rdx
    1302:	83 d0 00             	adc    $0x0,%eax
    1305:	48 85 d2             	test   %rdx,%rdx
    1308:	75 f5                	jne    12ff <st>
    130a:	89 45 fc             	mov    %eax,-0x4(%rbp)
    130d:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1310:	5d                   	pop    %rbp
    1311:	c3                   	ret    

0000000000001312 <asm_memcpy>:
    1312:	f3 0f 1e fa          	endbr64 
    1316:	55                   	push   %rbp
    1317:	48 89 e5             	mov    %rsp,%rbp
    131a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    131e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    1322:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    1326:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    132a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    132e:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
    1332:	48 89 c6             	mov    %rax,%rsi
    1335:	48 89 d7             	mov    %rdx,%rdi

0000000000001338 <start>:
    1338:	ac                   	lods   %ds:(%rsi),%al
    1339:	aa                   	stos   %al,%es:(%rdi)
    133a:	48 83 e9 01          	sub    $0x1,%rcx
    133e:	48 83 f9 00          	cmp    $0x0,%rcx
    1342:	74 04                	je     1348 <end>
    1344:	84 c0                	test   %al,%al
    1346:	75 f0                	jne    1338 <start>

0000000000001348 <end>:
    1348:	89 fa                	mov    %edi,%edx
    134a:	89 75 f4             	mov    %esi,-0xc(%rbp)
    134d:	89 55 f8             	mov    %edx,-0x8(%rbp)
    1350:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1353:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1357:	5d                   	pop    %rbp
    1358:	c3                   	ret    

0000000000001359 <asm_setjmp>:
    1359:	f3 0f 1e fa          	endbr64 
    135d:	55                   	push   %rbp
    135e:	48 89 e5             	mov    %rsp,%rbp
    1361:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1365:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    1369:	48 89 cf             	mov    %rcx,%rdi
    136c:	48 89 1f             	mov    %rbx,(%rdi)
    136f:	48 89 6f 08          	mov    %rbp,0x8(%rdi)
    1373:	4c 89 67 10          	mov    %r12,0x10(%rdi)
    1377:	4c 89 6f 18          	mov    %r13,0x18(%rdi)
    137b:	4c 89 77 20          	mov    %r14,0x20(%rdi)
    137f:	4c 89 7f 28          	mov    %r15,0x28(%rdi)
    1383:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    1388:	48 89 47 30          	mov    %rax,0x30(%rdi)
    138c:	48 8b 14 24          	mov    (%rsp),%rdx
    1390:	48 89 57 38          	mov    %rdx,0x38(%rdi)
    1394:	b8 00 00 00 00       	mov    $0x0,%eax
    1399:	5d                   	pop    %rbp
    139a:	c3                   	ret    

000000000000139b <asm_longjmp>:
    139b:	f3 0f 1e fa          	endbr64 
    139f:	55                   	push   %rbp
    13a0:	48 89 e5             	mov    %rsp,%rbp
    13a3:	41 57                	push   %r15
    13a5:	41 56                	push   %r14
    13a7:	41 55                	push   %r13
    13a9:	41 54                	push   %r12
    13ab:	53                   	push   %rbx
    13ac:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
    13b0:	89 75 cc             	mov    %esi,-0x34(%rbp)
    13b3:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
    13b7:	8b 7d cc             	mov    -0x34(%rbp),%edi
    13ba:	48 8b 1e             	mov    (%rsi),%rbx
    13bd:	48 8b 6e 08          	mov    0x8(%rsi),%rbp
    13c1:	4c 8b 66 10          	mov    0x10(%rsi),%r12
    13c5:	4c 8b 6e 18          	mov    0x18(%rsi),%r13
    13c9:	4c 8b 76 20          	mov    0x20(%rsi),%r14
    13cd:	4c 8b 7e 28          	mov    0x28(%rsi),%r15
    13d1:	48 8b 4e 30          	mov    0x30(%rsi),%rcx
    13d5:	48 8b 56 38          	mov    0x38(%rsi),%rdx
    13d9:	48 89 14 24          	mov    %rdx,(%rsp)
    13dd:	89 f8                	mov    %edi,%eax
    13df:	ff e1                	jmp    *%rcx
    13e1:	90                   	nop
    13e2:	5b                   	pop    %rbx
    13e3:	41 5c                	pop    %r12
    13e5:	41 5d                	pop    %r13
    13e7:	41 5e                	pop    %r14
    13e9:	41 5f                	pop    %r15
    13eb:	5d                   	pop    %rbp
    13ec:	c3                   	ret    

Disassembly of section .fini:

00000000000013f0 <_fini>:
    13f0:	f3 0f 1e fa          	endbr64 
    13f4:	48 83 ec 08          	sub    $0x8,%rsp
    13f8:	48 83 c4 08          	add    $0x8,%rsp
    13fc:	c3                   	ret    
