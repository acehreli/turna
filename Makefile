SOURCES= \
    main.d \
    library/cookie.d \
    library/fixedString.d \
    library/get.d \
    library/post.d \

COMPILER = dmd

SWITCHES = -unittest -w

test:
	${COMPILER} -of$@ ${SOURCES} ${SWITCHES}
	./$@
