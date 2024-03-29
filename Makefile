# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fathjami <fathjami@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/01/20 02:52:11 by fathjami          #+#    #+#              #
#    Updated: 2022/01/20 03:15:06 by fathjami         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fathjami <fathjami@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/01/14 09:18:36 by fathjami          #+#    #+#              #
#    Updated: 2022/01/20 02:51:54 by fathjami         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = gcc
RM = rm -rf
FLAGS = -Wall -Wextra -Werror

NAME = push_swap
STACK = $(addprefix stack/, stack_implementation stack_operations)
UTILS = $(addprefix utils/, parsing secondary_func)
INSTRUCTIONS = $(addprefix instructions/, swap push rotate reverse_rotate)
SORTING = $(addprefix sorting/, chunks chunks_utils)
HEADER = push_swap.h
FILES = $(STACK) $(UTILS) $(INSTRUCTIONS) $(SORTING) core
SRC = $(FILES:=.c)
OBJ = $(FILES:=.o)

ifeq ($(DEBUG), 1)
OPT = -g
endif

#BACKGROUND COLORS
BRED = \x1b[41m
BGREEN = \x1b[42m
BYELLOW = \x1b[43m

#COLORS
White = \033[0;37m
YELLOW = \x1b[33m
GREEN = \e[92;5;118m
RED = \033[0;31m
END = \033[0m

BOLD = \x1b[1m
UNDER = \x1b[4m

.PHONY: all clean fclean re bonus

all: $(NAME)

$(NAME): $(OBJ) $(HEADER)
	@$(CC) $(FLAGS) $(OBJ) $(OPT) -I ./ -o $(NAME)
	@printf " [$(BOLD)$(GREEN):)$(END)] [$(BOLD)$(GREEN)SUCCESS$(END)]\n"

%.o: %.c $(HEADER)
	@$(CC) $(FLAGS) $(OPT) -I ./ -c $< -o $@

test:
	@sh testing/testing.sh $(ARG) 

bonus: 
	@make -C bonus

clean: 
	@$(RM) $(OBJ)
	@make clean -C bonus
	@printf " [$(BOLD)$(YELLOW):)$(END)] [$(BOLD)$(YELLOW)CLEAN$(END)]\n"

fclean: clean
	@$(RM) $(NAME)
	@make fclean -C bonus
	@printf " [$(BOLD)$(YELLOW):)$(END)] [$(BOLD)$(YELLOW)FCLEAN$(END)]\n"

re: fclean all
