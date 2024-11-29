----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/14/2024 02:00:50 PM
-- Design Name: 
-- Module Name: FullAdderA - Behavioral
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

entity fullAdderA is 
 	 	 	 	port( 
 	 	 	 	 	A: in STD_LOGIC_VECTOR(63 downto 0); 
 	 	 	 	 	B: in STD_LOGIC_VECTOR(63 downto 0); 
 	 	 	 	 	ALU_Sel: in STD_LOGIC_VECTOR(3 downto 0);
 	 	 	 	 	Carry_In: in STD_LOGIC; 
 	 	 	 	 	Carry_Out: out STD_LOGIC;
 	 	 	 	 	S: out STD_LOGIC_VECTOR(63 downto 0)
 	 	 	 	); 
end fullAdderA; 


architecture Behavioral of FullAdderA is
signal total : std_logic_vector(64 downto 0);


component fullAdder is 
 	 	 	 	port( 
 	 	 	 	 	X: in STD_LOGIC; 
 	 	 	 	 	Y: in STD_LOGIC; 
 	 	 	 	 	Carry_In: in STD_LOGIC; 
 	 	 	 	 	S: out STD_LOGIC; 
 	 	 	 	 	Carry_Out: out STD_LOGIC 
 	 	 	 	); 
end component; 



signal carryin, carryout: std_logic_vector(64 downto 0);

begin


--process(ALU_Sel, A, B, Carry_In) 
--begin
--    if ALU_Sel = "0000" then
--        S <= A;
--    elsif ALU_Sel = "0001" then
--        S <= STD_LOGIC_VECTOR(unsigned(A) + 1);
--    elsif ALU_Sel = "0010" then
--        S <= STD_LOGIC_VECTOR(unsigned(A) - 1);
--    elsif ALU_Sel = "0011" then
--        total <= STD_LOGIC_VECTOR(unsigned(A) + unsigned(B) + unsigned'("0000000000000000000000000000000000000000000000000000000000000000"&Carry_In));
--        s <= total(63 downto 0);
--        carry_out <= total(64);
--end if;
--end process;


CarryIn(0)<=Carry_In;

    fullAdder00: for i in 0 to 63 generate

    fullAdderi: fullAdder port map (
       X => A(i), 
       Y => B(i), 
       Carry_In => (others => Carry_In) when i = 0 else Carryin(i - 1), 
       S => S(i), 
       Carry_Out => CarryOut(i));
    CarryIn(i + 1) <= CarryOut(i);

    end generate;



end Behavioral;
