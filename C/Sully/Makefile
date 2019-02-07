# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vsteffen <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/02/06 20:52:05 by vsteffen          #+#    #+#              #
#    Updated: 2019/01/30 17:17:59 by vsteffen         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = Sully

CC 		=	/usr/bin/clang
RM 		=	/bin/rm
MAKE 	=	/usr/bin/make -C
MKDIR 	=	/bin/mkdir -p
AR 		=	/usr/bin/ar
RANLIB 	=	/usr/bin/ranlib
GIT		=	/usr/bin/git

OBJ = $(patsubst %.c, $(OPATH)/%.o, $(SRC))

CFLAGS = -Wall -Wextra -Werror -g

ROOT  	=	$(shell /bin/pwd)
OPATH 	=	$(ROOT)/objs
CPATH 	=	$(ROOT)

SRC =	Sully.c

.PHONY: all clean fclean re

all: $(NAME)

$(NAME): $(OPATH) $(OBJ)
	@echo "\n\033[33m\033[4m\033[1m → Colleen \"Make\"\033[0m"
	@echo "Building $@"
	@$(CC) -o $@ $(CFLAGS) $(OBJ)
	@echo "\033[32m ╔════════════════╗"
	@echo " ║  All is done ! ║"
	@echo " ╚════════════════╝\033[0m"

$(OPATH)/%.o: $(CPATH)/%.c
	@$(CC) $(CFLAGS) -c $< -o $@

$(OPATH):
	@echo "\n\033[33m\033[4m\033[1m → Colleen \"Building objs\"\033[0m"
	@echo "Creating OBJ directory"
	@$(MKDIR) $@
	@echo "Creating OBJ files if they do not exist or have changed"

clean:
	@echo "\n\033[33m\033[4m\033[1m → Colleen \"Clean\"\033[0m"
	@echo "Deleting OBJS."
	$(RM) -Rf $(OPATH)
	@echo "\033[32mOBJS deleted.\033[0m\n"

fclean: clean
	@echo "\n\033[33m\033[4m\033[1m → Colleen \"Fclean\"\033[0m"
	@echo "Deleting $(NAME)."
	$(RM) -f $(NAME)
	@echo "\033[32m$(NAME) deleted.\033[0m\n"
	@find . -type f -name 'Sully_*' -exec rm "{}" +
	@echo "\033[32mSully childs deleted.\033[0m\n"

re: fclean all
