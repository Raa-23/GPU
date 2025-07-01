
20th May 2025 - https://www.youtube.com/watch?v=8B-Pqa2_LP0   going thorugh this lecture to understand SIMD & Threading, which will form the basis of our GPU

16th May 2025 - https://www.youtube.com/watch?v=TE4cJqrIHvI&list=PLwdnzlV3ogoUT7g3BySY2QQesG3eB4dss&index=1 - This playlist by NPTEL is also really helpful


# TERMINOLOGIES
## Kernel
- A "kernel" is an template of the program that has to be implemented again and again but with different set of data each time.
- It can be thought of as an sequence of instructions without the specific data. (sequence of instructions + variable in place of data)

## Thread 
- A "thread" is a kernel with the data values. (sequence of instructions  + the actual data that needs to be computed)

## Block
- Multiple threads form a "block"
- A group of threads which run together on a core is a "block of threads"
- Threads in a block can run at different paces in case of braching 

## Warp
- Multiple blocks form a "warp".

## Instruction
- In assembly these follow in Instuction set architecture (ISA). Example: add r1, r2, r3;
- After complation these instuctions get converted to machine code 1's and 0's. Example: 1001 0001 0010 0011 
- Each instrction consists an "opcode" which tells "what has to be done with the data/address" and the "immediate data" or "address of where the data can be found"  

## Processing unit (PEs)
- These are where a single instruction can be executed
- Each PE can consist of ALU, Register file, LSU, Decoder

## Core
- Multiple PEs form an core
- Each core consists of 4 PEs for our project

# ARCHITECHTURAL COMPONENTS

## DEVICE CONTROL REGISTER
It is a latch which holds the value of the total number of threads to be computed. It sits outside the cores

## DISPATCHER
It sits above the cores. It is reponsible for :
- computing the numebr of blocks required based on the number of threads, PEs and cores
- assigning blocks of threads to cores which are currently idle
- keeping track of blocks which have been executed and which are yet to be executed
- indicating when all the blocks have been executed

## SCHEDULER
- Each core has its own scheduler where multiple threads can be executed of the same control flow.
- 

## DECODER
- Each PE has its own decoder. It function similar to the instruction register 
- It takes in the current instruction to be executed and generates the control signals to various components.
- It generates control signals like {opcode to ALU, memory read enable etc}
- In essence it oversees the completion of a single instruction from a thread on a PE.
