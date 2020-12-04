# get_token
HPE Cloud Volumes - API management lab

# Prerequisites
Install csh and compile the bash script

`# wget https://github.com/cerebrux/shellscript-to-binary-converter/archive/master.zip`

`# unzip master.zip`

`# cd shellscript-to-binary-converter-master/`

`# make`

`# make install`

`# shc -f test_bash.sh`

=> generate test_bash.sh.x and test_bash.sh.x.c
=> copy test_bash.sh.x to the final location

# Setup
1. Edit the cvuser and cvpwd files. Update the data with your credentials. 

2. Move cvuser cvpwd files in the desired directory. `chmod 600 cvuser cvpwd`

3. Edit get_token.sh, update the credential files directory like below:

`cvpwd=sudo cat /path/to/file/cvpwd`
`cvuser=sudo cat /path/to/file/cvuser`

4. compile the updated get_token.sh with csh as described above.

5. `chmod 755 get_token.sh.x`

6. For security purpose, remove or restrict priviledges to the source bash file.
