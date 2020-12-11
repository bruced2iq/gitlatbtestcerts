# gitlatbtestcerts


Use this link
https://coolaj86.com/articles/create-your-own-certificate-authority-for-testing/


#For Gitlab values.yaml you need to create tls cert
Make sure you have same certificate name as hostname name
  
``kubectl create secret tls gitlab-self-signed-gitlab --cert=gitlab.gitlabtesting.com.crt --key=gitlab.gitlabtesting.com.key``

#For Gitlab runner you have to create generic password with filename
Make sure you have same from file name as certificate name

 ``kubectl create secret generic gitlabsr-runner-certs-secret-3 --from-file=gitlab.gitlabtesting.com.crt=gitlab.gitlabtesting.com.crt --from-file=registry.gitlabtesting.com.crt=registry.gitlabtesting.com.crt``
