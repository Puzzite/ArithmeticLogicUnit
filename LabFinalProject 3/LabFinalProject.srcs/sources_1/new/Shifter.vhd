----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2024 01:04:25 PM
-- Design Name: 
-- Module Name: Shifter - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

 entity Shifter is 
 port( 
    ALU_Sel: in STD_LOGIC_VECTOR(3 downto 0);
	Nbr_of_Bit:   in std_logic_vector(63 downto 0); 
    Data_In:     in std_logic_vector(63 downto 0); 
    Data_Out:  out std_logic_vector(63 downto 0)
		 );
 	 end Shifter;


architecture Behavioral of Shifter is

begin
-- Shift_Left(Data_In, # of bits/shift amount);
-- Shift_Right(Data_In, # of bits/shift amount);
-- # of bits = integer, so expected data type is integer

-- Shift Mode = 1: Arithmetic. Shift Mode = 0: Logical
-- Shift Direction = 0: Left. Shift Direction = 1: Right.
process(ALU_SEL, nbr_of_bit) begin
    -- if shifting logical left
    if ALU_Sel = "1101" then
        Data_Out <= std_logic_vector(Shift_Left(unsigned(Data_In), to_integer(unsigned(nbr_of_bit))));
    -- if shifting logical right
    elsif ALU_Sel = "1010" then
        Data_Out <= std_logic_vector(Shift_Right(unsigned(Data_In), to_integer(unsigned(nbr_of_bit))));
    -- if shifting arithmetic left
    elsif ALU_Sel = "1001" then
        Data_Out <= std_logic_vector(Shift_Left(signed(Data_In), to_integer(unsigned(nbr_of_bit))));
    -- if shifting arithmetic right
    elsif ALU_Sel = "1000" then
        Data_Out <= std_logic_vector(Shift_Right(signed(Data_In), to_integer(unsigned(nbr_of_bit))));
end if;

end process;


end Behavioral;
