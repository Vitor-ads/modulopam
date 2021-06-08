pam_pdrive.o: pdrive.c
	gcc -fPIC -lcurl -fno-stack-protector -c pdrive.c

install: pam_pdrive.o
	gcc -fPIC -lcurl -fno-stack-protector -c pdrive.c
	ld -lcurl -x --shared -o /lib64/security/pam_pdrive.so pam_pdrive.o
	sed -i "4s/^/	auth	  required  pam_pdrive.so\n/" /etc/pam.d/system-auth
	gcc mkdir_pdrive.c -o mkdir_pdrive
	./mkdir_pdrive

uninstall:
	rm -f /lib64/security/pam_pdrive.so
	rm -rf /etc/pam.d/pam.pdrive
	sed -i '/pam_pdrive/d' /etc/pam.d/system-auth
	
	@echo "-------> Two factors auth removed successfully"


