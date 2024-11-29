----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/24/2024 01:02:02 PM
-- Design Name: 
-- Module Name: MUX - Behavioral
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

entity MUX is 
port( 
    S:  in std_logic_vector(3 downto 0); 
    A:  in std_logic_vector(63 downto 0); 
    B:  in std_logic_vector(63 downto 0); 
    C: in STD_LOGIC_VECTOR(63 downto 0);
    Y:  out std_logic_vector(63 downto 0) 
	 	); 
 	end MUX; 


architecture Behavioral of MUX is

begin

process(S,A,B,C) begin
    
if S(3) = '1' then
    Y <= C;
    elsif S(2) = '1' AND S(3) = '0' then
        Y <= B;
     elsif S(3) = '0' AND S(2) = '0' then
        Y <= A;
end if;

end process;

end Behavioral;
