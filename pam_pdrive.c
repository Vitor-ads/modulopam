#include <security/pam_modules.h>
#include <security/pam_ext.h>
#include <stdlib.h>
#include <stdio.h>


PAM_EXTERN int pam_sm_setcred( pam_handle_t *pamh, int flags, int argc, const char **argv ) 
{
	return PAM_SUCCESS;
}

PAM_EXTERN int pam_sm_authenticate( pam_handle_t *pamh, int flags,int argc, const char **argv ) 
{
	
	int r;

	if(system("lsblk --output SERIAL /dev/sdb") == 0) {
	return PAM_SUCCESS;} else {return PAM_SUCCESS;}

	
}
