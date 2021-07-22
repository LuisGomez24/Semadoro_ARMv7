.global start

.macro Estado1
	
	mov r3,#0@Detener el paso en el semáforo este
	mov r4,#0@Detener el paso en el semáforo oeste
	
	@Rutina Tiempo de espera
	
	mov r6,#35 @total
c3:	mov r7,#255 @valor1
c2:	mov r8,#255 @valor2
c1:	sub r8,r8,#1 @valor2 - 1
	cmp r8,#0 @valor2 = 0? si es verdad, enciende Z, si no, la apaga
	bne c1 @si Z está apagada, salta a la resta de valor2
	sub r7,r7,#1  @valor1--
	cmp r7,#0 @valor1 = 0? si es verdad, enciende Z, si no, la apaga
	bne c2 @si Z está apagada, salta a la resta de valor1
	sub r6,r6,#1 @total--
	cmp r6,#0 @total = 0? si es verdad, enciende Z, si no, la apaga
	bne c3	@si Z está apagada, salta a rellenar valor1 y valor2 y comienza de nuevo	
	
	mov r1,#1@Semaforo norte en paso directo
	mov r2,#1@Semaforo sur en paso directo
.endm

.macro Estado2
	mov r1,#3@Detener el paso en el semáforo este
	mov r2,#3@Detener el paso en el semáforo oeste

	mov r6,#35 
c30:	mov r7,#255 
c29:	mov r8,#255 
c28:	sub r8,r8,#1 
	cmp r8,#0
	bne c28 
	sub r7,r7,#1 
	cmp r7,#0
	bne c29
	sub r6,r6,#1
	cmp r6,#0 
	bne c30	

	mov r1,#0@Detener el paso en el semáforo norte
	mov r2,#0@Detener el paso en el semáforo sur
			
	@Tiempo de espera
	
	mov r6,#35 
c6:	mov r7,#255 
c5:	mov r8,#255 
c4:	sub r8,r8,#1 
	cmp r8,#0 
	bne c4 
	sub r7,r7,#1 
	cmp r7,#0
	bne c5
	sub r6,r6,#1
	cmp r6,#0
	bne c6
	
	mov r1,#2@Semaforo norte en giro a izquierda
	mov r2,#2@Semaforo sur en giro a izquierda
.endm

.macro Estado3

	mov r1,#3@Detener el paso en el semáforo este
	mov r2,#3@Detener el paso en el semáforo oeste

	mov r6,#35
c33:	mov r7,#255
c32:	mov r8,#255
c31:	sub r8,r8,#1
	cmp r8,#0
	bne c31
	sub r7,r7,#1 
	cmp r7,#0	
	bne c32
	sub r6,r6,#1
	cmp r6,#0
	bne c33

	mov r1,#0@Detener el paso en el semáforo norte
	mov r2,#0@Detener el paso en el semáforo sur
	
	@Tiempo de espera
	
	mov r6,#35 
c9:	mov r7,#255 
c8:	mov r8,#255 
c7:	sub r8,r8,#1 
	cmp r8,#0
	bne c7 
	sub r7,r7,#1 
	cmp r7,#0
	bne c8
	sub r6,r6,#1
	cmp r6,#0
	bne c9	
	
	mov r3,#1@Semaforo este en paso directo
	mov r4,#1@Semaforo oeste en paso directo
.endm

.macro Estado4

	mov r3,#3@Detener el paso en el semáforo este
	mov r4,#3@Detener el paso en el semáforo oeste

		mov r6,#35 
c36:	mov r7,#255
c35:	mov r8,#255 
c34:	sub r8,r8,#1
	cmp r8,#0
	bne c34
	sub r7,r7,#1
	cmp r7,#0	
	bne c35 
	sub r6,r6,#1 
	cmp r6,#0 
	bne c36	

	mov r3,#0@Detener el paso en el semáforo este
	mov r4,#0@Detener el paso en el semáforo oeste

	mov r6,#35 
c12:	mov r7,#255 
c11:	mov r8,#255 
c10:	sub r8,r8,#1 
	cmp r8,#0 
	bne c10 
	sub r7,r7,#1 
	cmp r7,#0
	bne c11
	sub r6,r6,#1 
	cmp r6,#0
	bne c12	

	mov r3,#2@Semaforo este en giro a izquierda
	mov r4,#2@Semaforo oeste en giro a izquierda@
	
		mov r6,#100 
c27:	mov r7,#255 
c26:	mov r8,#255 
c25:	sub r8,r8,#1 
	cmp r8,#0 
	bne c25 
	sub r7,r7,#1
	cmp r7,#0
	bne c26 
	sub r6,r6,#1 
	cmp r6,#0 
	bne c27	
	
	mov r3,#3@Color amarillo en el semáforo este
	mov r4,#3@Color amarillo el paso en el semáforo oeste
.endm


start:
	
ciclo:	@Inicio del ciclo, todos los semáforos comienzan en 0
	
	@r1 = Semáforo norte
	@r2 = Semáforo sur
	@r3 = Semáforo este
	@r4 = Semáforo oeste
	
	@Para cara semáforo:
	@El valor 1 representa paso directo
	@El valor 2 representa giro a la izquierda
@El valor 3 representael color amarillo (precaución)
	@El valor 0 representa detenerse
	
	@Estado 1: norte-sur directo, oeste-este detenido
	Estado1

	@Tiempo de espera

	mov r6,#100 
c15:	mov r7,#255 
c14:	mov r8,#255
c13:	sub r8,r8,#1 
	cmp r8,#0 
	bne c13
	sub r7,r7,#1 
	cmp r7,#0
	bne c14
	sub r6,r6,#1 
	cmp r6,#0
	bne c15	

	@Estado 2:  norte-sur giro, oeste-este detenido
	Estado2

	@Tiempo de espera
	
	mov r6,#100 
c18:	mov r7,#255
c17:	mov r8,#255 
c16:	sub r8,r8,#1 
	cmp r8,#0 
	bne c16 
	sub r7,r7,#1 
	cmp r7,#0
	bne c17
	sub r6,r6,#1 
	cmp r6,#0
	bne c18
	
	@Estado 3:  norte-sur detenido, oeste-este directo
	Estado3

	@Tiempo de espera
	
	mov r6,#100 
c21:	mov r7,#255 
c20:	mov r8,#255
c19:	sub r8,r8,#1 
	cmp r8,#0
	bne c19 
	sub r7,r7,#1
	cmp r7,#0
	bne c20
	sub r6,r6,#1 
	cmp r6,#0
	bne c21	
	
	@Estado 4: norte-sur detenido, oeste-este giro
	Estado4

	@Tiempo de espera
	
	mov r6,#35 
c24:	mov r7,#255 
c23:	mov r8,#255 
c22:	sub r8,r8,#1 
	cmp r8,#0 
	bne c22 
	sub r7,r7,#1
	cmp r7,#0
	bne c23
	sub r6,r6,#1 
	cmp r6,#0
	bne c24	
	
	b ciclo	  @Repetir el proceso