#include<stdio.h>
#include<strings.h>
#include"api.h"

main()
{

    unsigned char sk[2048];
    unsigned char pk[2048];
    unsigned char m[32];
    unsigned char sig[2048];
    int sig_len;


    memset(sk,0,sizeof(sk));
    memset(pk,0,sizeof(pk));

    int r = PQCLEAN_FALCON512_CLEAN_crypto_sign_keypair(pk,sk);
    if(r==0){
        printf("Key pair gen ok.\n");
    }

    r = PQCLEAN_FALCON512_CLEAN_crypto_sign_signature(sig,&sig_len,m,32,sk);

    if(r==0){
        printf("Signature is ok, the signature length is %d.\n",sig_len);
    }

    r = PQCLEAN_FALCON512_CLEAN_crypto_sign_verify(sig,sig_len,m,32,pk);

    if(r==0){
        printf("Signature verification is ok.\n");
    }
}





