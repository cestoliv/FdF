OBJS		=	src/utils/controls_utils.o \
				src/utils/controls.o \
				src/utils/convert_utils.o \
				src/utils/convert.o \
				src/utils/draw.o \
				src/utils/img.o \
				src/utils/instructions.o \
				src/utils/map.o \
				src/utils/matrix.o \
				src/utils/rotation_matrix.o \
				src/utils/utils.o \
				src/main.o
DFILES		=	${OBJS:.o=.d}
NAME		=	fdf
CC			=	clang -Wall -Wextra -Werror
FLAGS		=	-lm -Lmlx -lmlx -Llibft -lft -framework OpenGL -framework AppKit

%.o: %.c
			${CC} -MD -MP $< -c -o $@

all:		${NAME}

${NAME}:	${OBJS}
			make -C libft
			make -C mlx
			cp mlx/libmlx.dylib .
			${CC} ${FLAGS} $^ -o $@

clean:
			rm -rf ${OBJS} ${DFILES}
			make clean -C libft
			make clean -C mlx
			rm libmlx.dylib

fclean:		clean
			make fclean -C libft
			rm -rf ${NAME}

re:			fclean all

-include ${DFILES}

.PHONY:		all clean fclean re
