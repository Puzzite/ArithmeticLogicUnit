----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/21/2024 01:01:42 PM
-- Design Name: 
-- Module Name: ALUTB - Behavioral
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

entity ALUTB is
--  Port ( );
end ALUTB;

architecture Behavioral of ALUTB is

component ALU is  	port( 
    Reg_A     :  in std_logic_vector(63 downto 0); 
	Reg_B     :  in std_logic_vector(63 downto 0); 
	Op_Sel    :  in std_logic_vector(3 downto 0); 
    Carry_In  :  in std_logic;   
    Carry_Out :  out std_logic; 
 	ALU_Out   :  out std_logic_vector(63 downto 0) 
); 
    end component; 

signal cra, crb, calu : STD_LOGIC_VECTOR(63 downto 0);
signal cops : STD_LOGIC_VECTOR(3 downto 0);
signal cci, cco : STD_LOGIC;

begin

uut: ALU port map(
    Reg_A => cra, Reg_B => crb, ALU_Out => calu, Op_Sel => cops, Carry_In => cci, Carry_Out => cco);
    
process begin    

-- Full Adder Test Cases
cra <= x"FFFF_FFFF_FFFF_FFFF"; crb <= x"FFFF_FFFF_FFFF_FFFF"; cops <= "0000"; cci <= '0'; wait for 10ns;
cra <= x"FFFF_FFFF_FFFF_FFFF"; crb <= x"FFFF_FFFF_FFFF_FFFF"; cops <= "0001"; cci <= '0'; wait for 10ns;
cra <= x"FFFF_FFFF_FFFF_FFFF"; crb <= x"FFFF_FFFF_FFFF_FFFF"; cops <= "0010"; cci <= '0'; wait for 10ns;
cra <= x"FFFF_FFFF_FFFF_FFFF"; crb <= x"FFFF_FFFF_FFFF_FFFF"; cops <= "0011"; cci <= '1'; wait for 10ns;
cra <= x"FFFF_FFFF_0000_FFFF"; crb <= x"FFFF_0000_FFFF_FFFF"; cops <= "0011"; cci <= '1'; wait for 10ns;
cra <= x"FFFF_FFFF_FFFF_0000"; crb <= x"FFFF_FFFF_FFFF_FFFF"; cops <= "0011"; cci <= '1'; wait for 10ns;
cra <= x"FFFF_FFFF_FFFF_FFFF"; crb <= x"FFFF_FFFF_FFFF_0000"; cops <= "0011"; cci <= '1'; wait for 10ns;

-- Logical Operator Test Cases
cra <= x"FFFF_FFFF_FFFF_FFFF"; crb <= x"FFFF_FFFF_FFFF_FFFF"; cops <= "0100"; cci <= '0'; wait for 10ns;
cra <= x"FFFF_FFFF_FFFF_FFFF"; crb <= x"FFFF_FFFF_FFFF_FFFF"; cops <= "0101"; cci <= '0'; wait for 10ns;
cra <= x"FFFF_FFFF_FFFF_FFFF"; crb <= x"FFFF_FFFF_FFFF_FFFF"; cops <= "0110"; cci <= '0'; wait for 10ns;
cra <= x"FFFF_FFFF_FFFF_FFFF"; crb <= x"FFFF_FFFF_FFFF_FFFF"; cops <= "0111"; cci <= '0'; wait for 10ns;

-- Shifter Test Cases
cra <= x"FFFF_FFFF_FFFF_FFFF"; crb <= x"FFFF_FFFF_FFFF_FFFF"; cops <= "1000"; cci <= '0'; wait for 10ns;
cra <= x"FFFF_FFFF_FFFF_FFFF"; crb <= x"FFFF_FFFF_FFFF_FFFF"; cops <= "1001"; cci <= '0'; wait for 10ns;
cra <= x"FFFF_FFFF_FFFF_FFFF"; crb <= x"FFFF_FFFF_FFFF_FFFF"; cops <= "1010"; cci <= '0'; wait for 10ns;
cra <= x"FFFF_FFFF_FFFF_FFFF"; crb <= x"FFFF_FFFF_FFFF_FFFF"; cops <= "1101"; cci <= '0'; wait for 10ns;

-- Full Adder Test Cases
cra <= x"2228_0005_0180_7092"; crb <= x"1111_1111_1111_1111"; cops <= "0000"; cci <= '0'; wait for 10ns;
cra <= x"FFFF_FFFF_FFFF_FFFF"; crb <= x"1111_1111_1111_1111"; cops <= "0001"; cci <= '0'; wait for 10ns;
cra <= x"FFFF_FFFF_FFFF_FFFF"; crb <= x"1111_1111_1111_1111"; cops <= "0010"; cci <= '0'; wait for 10ns;
cra <= x"FFFF_FFFF_FFFF_FFFF"; crb <= x"1111_1111_1111_1111"; cops <= "0011"; cci <= '0'; wait for 10ns;
cra <= x"FFFF_FFFF_FFFF_FFFF"; crb <= x"1111_1111_1111_1111"; cops <= "0011"; cci <= '1'; wait for 10ns;

-- Logical Operator Test Cases
cra <= x"FFFF_FFFF_FFFF_FFFF"; crb <= x"0000_0000_0000_0000"; cops <= "0100"; cci <= '0'; wait for 10ns;
cra <= x"FFFF_FFFF_FFFF_FFFF"; crb <= x"0000_0000_0000_0000"; cops <= "0101"; cci <= '0'; wait for 10ns;
cra <= x"FFFF_FFFF_FFFF_FFFF"; crb <= x"0000_0000_0000_0000"; cops <= "0110"; cci <= '0'; wait for 10ns;
cra <= x"FFFF_FFFF_FFFF_FFFF"; crb <= x"0000_0000_0000_0000"; cops <= "0111"; cci <= '0'; wait for 10ns;

-- Shifter Test Cases
cra <= x"FFFF_FFFF_FFFF_FFFF"; crb <= x"0000_0000_0000_0005"; cops <= "1000"; cci <= '0'; wait for 10ns;
cra <= x"FFFF_FFFF_FFFF_FFFF"; crb <= x"0000_0000_0000_0005"; cops <= "1001"; cci <= '0'; wait for 10ns;
cra <= x"FFFF_FFFF_FFFF_FFFF"; crb <= x"0000_0000_0000_0005"; cops <= "1010"; cci <= '0'; wait for 10ns;
cra <= x"FFFF_FFFF_FFFF_FFFF"; crb <= x"0000_0000_0000_0005"; cops <= "1101"; cci <= '0'; wait for 10ns;

wait;

end process;


end Behavioral;
