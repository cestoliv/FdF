SRCS		=	src/utils/controls_utils.c \
				src/utils/controls.c \
				src/utils/convert_utils.c \
				src/utils/convert.c \
				src/utils/draw.c \
				src/utils/img.c \
				src/utils/instructions.c \
				src/utils/map.c \
				src/utils/matrix.c \
				src/utils/rotation_matrix.c \
				src/utils/utils.c \
				src/main.c
HEADERS		= 	src/includes/fdf.h \
				src/includes/keys.h
NAME		=	fdf
CC			=	clang -Wall -Wextra -Werror
FLAGS		=	-lm -Lmlx -lmlx -Llibft -lft -framework OpenGL -framework AppKit

%.o: %.c ${HEADERS}
			${CC} $< -c -o $@

all:		${NAME}

${NAME}:	${SRCS:.c=.o} ${HEADERS}
			make -C libft
			make -C mlx
			cp mlx/libmlx.dylib .
			${CC} ${SRCS:.c=.o} -o ${NAME} ${FLAGS}

clean:
			rm -rf ${SRCS:.c=.o}
			make clean -C libft
			make clean -C mlx
			rm -rf libmlx.dylib

fclean:		clean
			make fclean -C libft
			rm -rf ${NAME}

re:			fclean alll

.PHONY:		all clean fclean re
