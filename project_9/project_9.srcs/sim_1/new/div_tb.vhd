----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/28/2022 12:53:06 PM
-- Design Name: 
-- Module Name: div_tb - Behavioral
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
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/28/2022 12:31:58 PM
-- Design Name: 
-- Module Name: delitelj_tb - Behavioral
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

entity div_tb is
--  Port ( );
end div_tb;

architecture Behavioral of div_tb is
component delitelj32
     Port ( clk : in STD_LOGIC;
           divisor_tvalid : IN STD_LOGIC;
           divisor_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
           dividend_tvalid : IN STD_LOGIC;
           dividend_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
           dout_tvalid : OUT STD_LOGIC;
           dout_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
end component;
signal clk: std_logic;
signal dividend_tvalid_tb, divisor_tvalid_tb: std_logic;
signal dividend_tdata_tb, divisor_tdata_tb : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal dout_tvalid_tb: std_logic;
signal dout_tdata_tb: STD_LOGIC_VECTOR(31 DOWNTO 0);

begin
duv: delitelj32
    port map(
        clk => clk,
        divisor_tvalid => divisor_tvalid_tb,
        divisor_tdata => divisor_tdata_tb,
        dividend_tvalid => dividend_tvalid_tb,
        dividend_tdata => dividend_tdata_tb,
        dout_tvalid => dout_tvalid_tb,
        dout_tdata => dout_tdata_tb
    );
clk_gen: process
    begin
        clk <= '0', '1' after 10ns;
        wait for 20ns;
    end process;
    
     stim_gen: process
    begin
        divisor_tvalid_tb <= '1';
        dividend_tvalid_tb <= '1';
        dividend_tdata_tb <= x"ffed70a3", x"00100000" after 20ns;--,x"fff851eb" after 30ns ; --111111111110
        divisor_tdata_tb <= x"0016b851";
        -- za ovo teba dobiti rezultate  ffe5dbef i 00168904        
    wait;
    end process;   
end Behavioral;
