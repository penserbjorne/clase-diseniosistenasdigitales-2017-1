library ieee;
use ieee.std_logic_1164.all;

entity seno is
  port (
    clk: in std_logic;
    sel: in std_logic_vector(2 downto 0);
    data: out std_logic_vector(11 downto 0)
  );
end entity;

architecture arch of seno is
    signal baddr: std_logic_vector(10 downto 0);
	 signal data1, data2, data3, data4, data5: std_logic_vector(11 downto 0);
	signal clock: std_logic;
begin
	U0: entity work.relojlento port map(
        clkl => clk,
        led => clock
    );
    U1: entity work.count12 port map(
        clk => clock,
        conta => baddr
    );
    U2: entity work.rom port map(
        clk => clock,
        addr => baddr,
        data => data1
    );
    U3: entity work.rom_triangle port map(
        clk => clock,
        addr => baddr,
        data => data2
    );
    U4: entity work.rom_sierra port map(
        clk => clock,
        addr => baddr,
        data => data3
    );
    U5: entity work.romcuadrada port map(
        clk => clock,
        addr => baddr,
        data => data4
    );
    U6: entity work.romvicflo port map(
        clk => clock,
        addr => baddr,
        data => data5
    );
    data <= data2 when sel = "001" else
            data3 when sel = "010" else
            data4 when sel = "011" else
            data5 when sel = "100" else
            data1;
end architecture;
