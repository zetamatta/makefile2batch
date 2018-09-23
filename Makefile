makefile2batch.exe : main.go
	go fmt
	go build -o $@ -ldflags "-s -w"

test:
	makefile2batch > make.cmd

readme:
	gawk "/^```make.cmd/{ print $0 ; while( getline < \"make.cmd\" ){ print } ; print \"```\" ; exit } ; 1" readme.md | nkf32 -Lu > readme.new && move readme.new readme.md

clean:
	if exist make.cmd del make.cmd
	if exist makefile2batch.exe del makefile2batch.exe
