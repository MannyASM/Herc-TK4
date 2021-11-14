# Herc-TK4

These are various modules that explore assembly utilizing the Hercules TK4 platform.
Thank you to all who have shared and are sharing their passion for IBM mainframe development.
Special thanks to Moshix and Jay Moseley.

Best Regards.

Assembly
--------
Sources 
- Youtube Moshix Channel - Installing and running a disassembler in MVS 3.8 TK4 - M78 
- Youtube Mainframe Concepts - MVS Tk4 "Hello World" Assembler Program
- Documentation  http://www.jaymoseley.com/hercules/for_mvt/ifox_mvt.htm#OptionDifferences
             
Modules
--------
HELLOW  - hello world module by Mainframe Concepts 
    
JASMTEST [J(ob) ASM(assembly) Test]
- leverages ASMFCLG proc to assemble, link and execute an inline program (HELLOW)  
    
JASMCLG [J(ob) ASM(assembly) CLG(Compile, Link, Go)]
- this job looks for assembly program HELLOW located in HERC01.TEST.ASM
- it shows how we can assemble, link and execute HELLOW as separate steps
- this allows control of some of the output files such as listings
- HELLOW is a very simple program that outputs a message to operator console
- can be used to further study assembly instructions and parm options

JASMCLG_Job_Output [J(ob) ASM(assembly) CLG(Compile, Link, Go) - JOb Output]
- this is the job run results

HELLOW_Listing
- JASMCLG uses IFOX00 to assemble HELLOW
- one of the PARM options is LIST
- LIST generates this file via the SYSPRINT DD name
- The program listing is piped into DSN=HERC01.TEST.LIST for further observation
