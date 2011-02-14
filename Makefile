SOURCES= \
    main.d \
    library/cookie.d \
    library/fixedString.d \
    library/envVar.d \

COMPILER = dmd

SWITCHES = -unittest -w

test:
	${COMPILER} -of$@ ${SOURCES} ${SWITCHES}
	./$@
