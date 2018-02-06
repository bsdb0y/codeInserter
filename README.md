# codeInserter
Bash shell script to insert any string into any function definition.

I made this script during reading of kernel source-code of OpenBSD 6.2.

This script is useful for manual debugging, or, to insert any string in any function definition in the OpenBSD kernel source code.

* This script is useful for OpenBSD like coding style.
* For Example:

void
main()
{
int a=10;
printf("Value of a: %d\n",a);
}

And, In kernel Source code, there are lots of function definitons in a C file. So, during manual debugging or development, if you want to insert some strings in all function definitions at a time, then, this script is useful. 
