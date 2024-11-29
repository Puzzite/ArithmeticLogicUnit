----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/14/2024 12:57:39 PM
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is  	port( 
    Reg_A     :  in std_logic_vector(63 downto 0); 
	Reg_B     :  in std_logic_vector(63 downto 0); 
	Op_Sel    :  in std_logic_vector(3 downto 0); 
    Carry_In  :  in std_logic;   
    Carry_Out :  out std_logic; 
 	ALU_Out   :  out std_logic_vector(63 downto 0) 
); 
    end ALU; 


architecture Structural of ALU is

 component Shifter is 
 port( 
    ALU_Sel: in STD_LOGIC_VECTOR(3 downto 0);
	Nbr_of_Bit:   in std_logic_vector(63 downto 0); 
    Data_In:     in std_logic_vector(63 downto 0); 
    Data_Out:  out std_logic_vector(63 downto 0)
		 );
 	 end component;

component fullAdderA is 
 	 	 	 	port( 
 	 	 	 	 	A: in STD_LOGIC_VECTOR(63 downto 0); 
 	 	 	 	 	B: in STD_LOGIC_VECTOR(63 downto 0); 
 	 	 	 	 	ALU_Sel: in STD_LOGIC_VECTOR(3 downto 0);
 	 	 	 	 	Carry_In: in STD_LOGIC; 
 	 	 	 	 	Carry_Out: out STD_LOGIC;
 	 	 	 	 	S: out STD_LOGIC_VECTOR(63 downto 0)
 	 	 	 	); 
end component;
component LogicalOperations is
               port(
                    A: in STD_LOGIC_VECTOR(63 downto 0);
                    B: in STD_LOGIC_VECTOR(63 downto 0);
                    ALU_Sel: in STD_LOGIC_VECTOR(3 downto 0);
                    Output: out STD_LOGIC_VECTOR(63 downto 0)
                    ); 
end component; 
component MUX is 
port( 
    S:  in std_logic_vector(3 downto 0); 
    A:  in std_logic_vector(63 downto 0); 
    B:  in std_logic_vector(63 downto 0); 
    C: in STD_LOGIC_VECTOR(63 downto 0);
    Y:  out std_logic_vector(63 downto 0) 
	 	); 
 	end component; 

signal ca, cb, cc : STD_LOGIC_VECTOR(63 downto 0);

begin

LogicalOperations0: LogicalOperations port map(Reg_A, REG_B, Op_Sel, cb);
Shifter0: Shifter port map(Op_Sel, Reg_B, Reg_A, cc);
fullAdderA0: fullAdderA port map(Reg_A, Reg_B, Op_Sel, Carry_In, Carry_Out, ca);
--MUX0: MUX port map(Op_Sel, ca, cb, cc, ALU_Out); 

p_mux : process(Reg_A, Reg_B, Op_Sel)
begin
  case Op_Sel is
    
    when "0000" => 
        ALU_Out <= ca ;
    when "0001" => 
        ALU_Out <= ca ;
    when "0010" => 
        ALU_Out <= ca ;
    when "0011" => 
        ALU_Out <= ca ;
    when "0100" => 
        ALU_Out <= cb ;
    when "0101" => 
        ALU_Out <= cb ;
    when "0110" => 
        ALU_Out <= cb ;
    when "0111" => 
        ALU_Out <= cb ;        
    when "1000" => 
        ALU_Out <= cc ;        
    when "1001" => 
        ALU_Out <= cc ;        
    when "1010" => 
        ALU_Out <= cc ;        
    when "1101" => 
        ALU_Out <= cc ;
    when others => 
        ALU_Out <= x"1111_1111_1111_1111" ;
  end case;
end process p_mux;


end Structural;
