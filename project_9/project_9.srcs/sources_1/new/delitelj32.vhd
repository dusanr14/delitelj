----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/28/2022 12:21:05 PM
-- Design Name: 
-- Module Name: delitelj32 - Behavioral
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

entity delitelj32 is
    Port ( clk : in STD_LOGIC;
           divisor_tvalid : IN STD_LOGIC;
           divisor_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
           dividend_tvalid : IN STD_LOGIC;
           dividend_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
           dout_tvalid : OUT STD_LOGIC;
           dout_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
end delitelj32;

architecture Behavioral of delitelj32 is
    component div_gen_0
    PORT (
    aclk : IN STD_LOGIC;
    s_axis_divisor_tvalid : IN STD_LOGIC;
    s_axis_divisor_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axis_dividend_tvalid : IN STD_LOGIC;
    s_axis_dividend_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_dout_tvalid : OUT STD_LOGIC;
    m_axis_dout_tdata : OUT STD_LOGIC_VECTOR(55 DOWNTO 0)
  );
  end component;
  
signal dout_h: STD_LOGIC_VECTOR(55 DOWNTO 0);
begin
div: div_gen_0
    port map(
        aclk => clk,
        s_axis_divisor_tvalid => divisor_tvalid,
        s_axis_divisor_tdata => divisor_tdata,
        s_axis_dividend_tvalid => dividend_tvalid,
        s_axis_dividend_tdata => dividend_tdata,
        m_axis_dout_tvalid => dout_tvalid,
        m_axis_dout_tdata => dout_h
    );

output: dout_tdata <= dout_h(31 downto 0);

end Behavioral;
