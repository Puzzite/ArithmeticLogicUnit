----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/14/2024 01:28:40 PM
-- Design Name: 
-- Module Name: LogicalOperations - Behavioral
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

entity LogicalOperations is
               port(
                    A: in STD_LOGIC_VECTOR(63 downto 0);
                    B: in STD_LOGIC_VECTOR(63 downto 0);
                    ALU_Sel: in STD_LOGIC_VECTOR(3 downto 0);
                    Output: out STD_LOGIC_VECTOR(63 downto 0)
                    ); 
end entity; 

architecture Behavioral of LogicalOperations is

begin

process(ALU_Sel) begin 
    if ALU_Sel = "0100" then
        Output <= NOT(A);
    elsif ALU_Sel = "0101" then
        Output <= A AND B;
    elsif ALU_Sel = "0110" then
        Output <= A OR B;
    elsif ALU_Sel = "0111" then
        Output <= A XOR B;
end if;
end process;
end Behavioral;
