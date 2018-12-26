library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
end testbench;

architecture behavior of testbench is
    component sha256_core is
    port(
	  a : in std_logic_vector(31 downto 0);
	  b : in std_logic_vector(31 downto 0);
	  c : in std_logic_vector(31 downto 0);
	  d : in std_logic_vector(31 downto 0);
	  e : in std_logic_vector(31 downto 0);
	  f : in std_logic_vector(31 downto 0);
	  g : in std_logic_vector(31 downto 0);
	  h : in std_logic_vector(31 downto 0);
	  
	  wj : in std_logic_vector(31 downto 0);
	  kj : in std_logic_vector(31 downto 0);
	  
	  
	  reset : in std_logic;
          clock : in std_logic;
	  i : out std_logic_vector(31 downto 0);
	  j : out std_logic_vector(31 downto 0);
	  k : out std_logic_vector(31 downto 0);
	  l : out std_logic_vector(31 downto 0);
	  m : out std_logic_vector(31 downto 0);
	  n : out std_logic_vector(31 downto 0);
	  o : out std_logic_vector(31 downto 0);
	  p : out std_logic_vector(31 downto 0)

    );
    end component;
    -- in signal
    signal a : std_logic_vector(31 downto 0) := "01010101010101010101010101010101";
    signal b : std_logic_vector(31 downto 0) := "01010101010101010101010101010101";
    signal c : std_logic_vector(31 downto 0) := "01010101010101010101010101010101";
    signal d : std_logic_vector(31 downto 0) := "01010101010101010101010101010101";
    signal e : std_logic_vector(31 downto 0) := "01010101010101010101010101010101";
    signal f : std_logic_vector(31 downto 0) := "01010101010101010101010101010101";
    signal g : std_logic_vector(31 downto 0) := "01010101010101010101010101010101";
    signal h : std_logic_vector(31 downto 0) := "01010101010101010101010101010101";
    signal wj : std_logic_vector(31 downto 0) := "01010101010101010101010101010101";
    signal kj : std_logic_vector(31 downto 0) := "01010101010101010101010101010101";
    signal reset : std_logic := '0';
    signal clock : std_logic := '0';
    signal clk : time := 20ns;

    -- out signal
    signal i : std_logic_vector(31 downto 0);
    signal j : std_logic_vector(31 downto 0);
    signal k : std_logic_vector(31 downto 0);
    signal l : std_logic_vector(31 downto 0);
    signal m : std_logic_vector(31 downto 0);
    signal n : std_logic_vector(31 downto 0);
    signal o : std_logic_vector(31 downto 0);
    signal p : std_logic_vector(31 downto 0);
    begin
    u1 :
	sha256_core port map
	(a=>a, b=>b, c=>c, d=>d, e=>e, f=>f, g=>g, h=>h, wj=>wj, kj=>kj, reset=>reset, clock=>clock,
	i=>i, j=>j, k=>k, l=>l, m=>m, n=>n, o=>o, p=>p );
	clk_gen: process
	begin
		wait for clk/2;
		clock <= '1';
		wait for clk/2;
		clock <= '0';
	end process;

	reset_gen: process
	begin
		wait for clk/2;
		reset <= '1';
		wait for clk/2;
		reset <= '0';
	end process;

	a <= "01010101010101010101010101010101";
	b <= "01010101010101010101010101010101";
	c <= "01010101010101010101010101010101";
	d <= "01010101010101010101010101010101";
	e <= "01010101010101010101010101010101";
	f <= "01010101010101010101010101010101";
	g <= "01010101010101010101010101010101";
	h <= "01010101010101010101010101010101";
	wj <= "01010101010101010101010101010101";
	kj <= "01010101010101010101010101010101";
    
end;