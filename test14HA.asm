 
    org 0100h  
  

	call	print_mes

;TEST1 ADD

	ld	iy,ADD_START_TIME
	call	get_time

;loop count 10000
	scf				; C <- 1
	ccf				; C <- _C
	ld	de,1
	ld	hl,10000
	ld	ix,100
loop1:
	ld	a,2
	ld	b,3
	add	a,b
	
	sbc	hl,de
	jr	NZ,loop1
	
	push	ix
	pop		hl
	sbc	hl,de
	dec	ix
	ld	hl,10000
	jr	NZ,loop1

	ld	iy,ADD_END_TIME
	call	get_time

	call	print_mes


;TEST2 ADD2

	ld	iy,ADDADD_START_TIME
	call	get_time

;loop count 10000
	scf				; C <- 1
	ccf				; C <- _C
	ld	de,1
	ld	hl,10000
	ld	ix,100
loop2:
	ld	a,2
	ld	b,3
	add	a,b
	add	a,b
	
	sbc	hl,de
	jr	NZ,loop2
	
	push	ix
	pop		hl
	sbc	hl,de
	dec	ix
	ld	hl,10000
	jr	NZ,loop2

	ld	iy,ADDADD_END_TIME
	call	get_time

	call	print_mes








;PRINT ALL TIMES
	ld	iy,ADD_START_TIME
	call	put_time
	ld	iy,ADD_END_TIME
	call	put_time
	ld	iy,ADDADD_START_TIME
	call	put_time
	ld	iy,ADDADD_END_TIME
	call	put_time
	




;EXIT
    ld c,0
    jp 5
 

;
;SUBROUTINES
;


;get TIME (2Ch)
; in :IY<-address for set
get_time:
	push	bc
	push	de
	push	hl
	push	ix
	push	iy

	ld	c,02ch
	call 5
	ld	(iy + 0),h
	ld	(iy + 1),l
	ld	(iy + 2),d
	ld	(iy + 3),e

	pop		iy
	pop		ix
	pop		hl
	pop		de
	pop		bc
	ret

;put TIME
put_time:
	push	bc
	push	de
	push	hl
	push	ix
	push	iy
	ld	h,(iy + 0)
	ld	l,(iy + 1)
	ld	d,(iy + 2)
	ld	e,(iy + 3)

	ld	b,h
	call	print_times
	ld	b,l
	call	print_times
	ld	b,d
	call	print_times
	ld	b,e
	call	print_times

	call	print_cr_lf
	
	pop		iy
	pop		ix
	pop		hl
	pop		de
	pop		bc
	ret

;PRINT_TIMES
print_times:
	push	hl
	push	de
	push	bc
	xor	a
	ld	c,a
	ld	a,b
pt3:
	sub	10
	jr	z,pt1
	jr	c,pt2
	inc	c
	jr	pt3
	
pt2:
	add	a,10
	ld	b,a
pt1:
	ld	a,b
	add	a,30h
	ld	b,a
	ld	a,c
	add	a,30h
	ld	c,a
	push	bc
	ld	e,c
	ld	c,02h
	call	5
	pop		bc
	ld	e,b
	ld	c,02h
	call	5
	
	pop		bc
	pop		de
	pop		hl
	ret

;PRINT CR_LF
print_cr_lf:
	push	hl
	push	de
	push	bc
	ld	e,0dh
	ld	c,02h
	call	5
	ld	e,0ah
	ld	c,02h
	call	5
	pop		bc
	pop		de
	pop		hl
	ret

;MESSAGE
print_mes:
	push	de
	push	bc
	push	ix
	push	iy
	LD  C, 9
	LD DE, S_MESSAGE
	CALL 5
	pop		iy
	pop		ix
	pop		bc
	pop		de
	ret



;
;DATA
;
ADD_START_TIME:
	db	0,0,0,0
ADD_END_TIME:
	db	0,0,0,0
ADDADD_START_TIME:
	db	0,0,0,0
ADDADD_END_TIME:
	db	0,0,0,0


S_MESSAGE:
	DB      "Please wait..."
	DB      10, 13, '$'

end
