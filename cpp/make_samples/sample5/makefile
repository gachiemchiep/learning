COND1=`stat app 2>/dev/null | grep Modify`
COND2=`stat ./application/app 2>/dev/null | grep Modify`

all: buildall getexec 

buildall:
	@echo "****** Invoking tstlib/makefile"
	(cd tstlib; $(MAKE))
	@echo "****** Invoking application/makefile"
	(cd application; $(MAKE))

getexec:
	@if [ "$(COND1)" != "$(COND2)" ];\
	then\
		echo "Getting new app!";\
		cp -p ./application/app . 2>/dev/null;\
		chmod 700 app;\
	else\
		echo "Nothing done!";\
	fi

cleanall:
	-rm -f app
	@echo "****** Invoking tstlib/makefile"
	@(cd tstlib; $(MAKE) cleanall) 
	@echo "****** Invoking appl/makefile"
	@(cd application; $(MAKE) cleanall) 

