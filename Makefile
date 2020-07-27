# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rpagot <rpagot@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/07/27 14:33:56 by rpagot            #+#    #+#              #
#    Updated: 2020/07/27 14:34:03 by rpagot           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


NAME = ft_ping

PATH_SRC = ./src/

PATH_INC = ./include/

PATH_INC_LIBFT = ./libft/includes/

INCLUDES = -I $(PATH_INC) -I $(PATH_INC_LIBFT)

CC = cc
CFLAGS = -Wall -Wextra -Werror $(INCLUDES) -g
LIBS = -L libft/ -lft -lm

SRC =	main.c \
	pg_connect.c \
	pg_loop.c \
	pg_helper.c \
	pg_display.c

OBJ = $(addprefix $(PATH_SRC), $(SRC:.c=.o))

.PHONY: clean fclean re

all: $(NAME)

$(NAME): $(OBJ)
	make -C libft/
	$(CC) $(OBJ) -o $(NAME) $(LIBS)

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all
