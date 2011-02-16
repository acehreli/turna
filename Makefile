SOURCES= \
    main.d \
    library/cookie.d \
    library/fixedString.d \
    library/envVar.d \
    system/helper/htmlHelper.d \

COMPILER = dmd

SWITCHES = -unittest -w

test: ${SOURCES} Makefile
	${COMPILER} -of$@ ${SOURCES} ${SWITCHES}
	./$@
