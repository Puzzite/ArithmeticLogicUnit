----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/26/2024 01:15:08 PM
-- Design Name: 
-- Module Name: fullAdder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fullAdder is 
 	 	 	 	port( 
 	 	 	 	 	X: in STD_LOGIC; 
 	 	 	 	 	Y: in STD_LOGIC; 
 	 	 	 	 	Carry_In: in STD_LOGIC; 
 	 	 	 	 	S: out STD_LOGIC; 
 	 	 	 	 	Carry_Out: out STD_LOGIC 
 	 	 	 	); 
end fullAdder; 


architecture Dataflow of fullAdder is

begin

S <= (X XOR Y XOR Carry_In);
Carry_Out <= ((X AND Carry_In) OR (X AND Y) OR (Y AND Carry_In));

end Dataflow;
