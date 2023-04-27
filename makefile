SRC_FILE = so_long.c g_n_l/get_next_line.c g_n_l/get_next_line_utils.c utils/parce_map.c utils/put_image.c utils/move.c

NAME = so_long
OBJ_FILE = $(SRC_FILE:.c=.o)
CFLAGS = #-Wall -Werror -Wextra
HEADER = so_long.h
cc = gcc
RM = rm -rf

PURPLE = \033[0;35m
BLUE = \033[0;34m
RED = \033[0;31m

LIBTF_PATH = ./libft
LIBFT = $(LIBTF_PATH)/libft.a

all : $(NAME)

%.o:%.c $(HEADER)
	$(cc) $(CFLAGS) -c $< -o $@

$(NAME) : $(OBJ_FILE)
	@$(MAKE) -C $(LIBTF_PATH)
	@$(cc) -lmlx -framework OpenGL -framework AppKit $(CFLAGS) $(OBJ_FILE) -o $(NAME) $(LIBFT)
	@echo "$(BLUE)tout est MAKE"

clean :
	$(RM) $(OBJ_FILE)
	@${MAKE} -C $(LIBTF_PATH) clean
	@echo "$(RED) tout est clear"

fclean : clean
	@$(RM) $(NAME)
	@${MAKE} -C $(LIBTF_PATH) fclean

re : fclean all