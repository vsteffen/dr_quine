# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vsteffen <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/02/06 20:52:05 by vsteffen          #+#    #+#              #
#    Updated: 2018/09/17 16:07:12 by vsteffen         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	=	Grace

CC		=	/usr/bin/clang
RM		=	/bin/rm
MAKE	=	/usr/bin/make -C
MKDIR	=	/bin/mkdir -p
AR		=	/usr/bin/ar
RANLIB	=	/usr/bin/ranlib
NASM	=	/Users/vsteffen/.brew/bin/nasm
LD		=	/usr/bin/ld
GIT		=	/usr/bin/git

OBJ		=	$(patsubst %.s, $(OPATH)/%.o, $(SRC))

CFLAGS	=	-Wall -Wextra -Werror -g

ROOT	=	$(shell /bin/pwd)
OPATH	=	$(ROOT)/objs
ASMPATH	=	$(ROOT)

SRC	=	Grace.s

.PHONY: all clean fclean re tests

all: $(NAME)

$(NAME): $(OPATH) $(OBJ)
	@echo "Building $@"
	@$(CC) -o $@ $(CFLAGS) $(OBJ)
	@echo "\033[32m ╔════════════════╗"
	@echo " ║  All is done ! ║"
	@echo " ╚════════════════╝\033[0m"

$(OPATH)/%.o: $(ASMPATH)/%.s
	@$(NASM) -f macho64 -o $@ $<

$(OPATH):
	@echo "Creating OBJ directory and files if they don't exist or have changed"
	@$(MKDIR) $@

clean:
	@echo "Deleting OBJS."
	@$(RM) -rf $(OPATH)
	@echo "\033[32mOBJS deleted.\033[0m\n"

fclean: clean
	@echo "Deleting $(NAME)"
	@$(RM) -f $(NAME)
	@echo "\033[32m$(NAME) deleted.\033[0m\n"
	$(RM) -Rf $(ROOT)/Grace_kid.s
	@echo "\033[32mGrace kid deleted.\033[0m\n"

re: fclean all
