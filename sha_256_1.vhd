---------------------------------------
-- Module : SHA-256 Core
----------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sha256_core is
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
end entity;

architecture behaviour of sha256_core is
	function ch ( x, y, z: std_logic_vector( 31 downto 0 ) ) return std_logic_vector is
    begin
        return std_logic_vector( ( x and y ) xor ( not( x ) and z ) );
    end function;

    function ma ( x, y, z: std_logic_vector( 31 downto 0 ) ) return std_logic_vector is
    begin
        return std_logic_vector( ( x and y ) xor ( x and z ) xor ( y and z ) );
    end function;


    function capSigma0 ( x : std_logic_vector( 31 downto 0 ) ) return std_logic_vector is
    begin
        return std_logic_vector( rotate_right( unsigned ( x ), 2 ) xor rotate_right( unsigned ( x ), 13 ) xor rotate_right( unsigned ( x ), 22 ) );
    end function;

    
    function capSigma1 ( x : std_logic_vector( 31 downto 0 ) ) return std_logic_vector is
    begin
        return std_logic_vector( rotate_right( unsigned ( x ), 6 ) xor rotate_right( unsigned ( x ), 11 ) xor rotate_right( unsigned ( x ), 25 ) );
    end function;

    
    function sigma0 ( x : std_logic_vector( 31 downto 0 ) ) return std_logic_vector is
    begin
        return std_logic_vector( rotate_right( unsigned ( x ), 7 ) xor rotate_right( unsigned ( x ), 18 ) xor shift_right( unsigned ( x ), 3 ) );
    end function;

    
    function sigma1 ( x : std_logic_vector( 31 downto 0 ) ) return std_logic_vector is
    begin
        return std_logic_vector( rotate_right( unsigned ( x ), 17 ) xor rotate_right( unsigned ( x ), 19 ) xor shift_right( unsigned ( x ), 10 ) );
    end function;
begin
  sha256_hash: process( clock, reset )
    variable T1, T2 : std_logic_vector( 31 downto 0 ); 
    begin
      if ( rising_edge ( clock ) and (reset = '1') ) then
            T1 := std_logic_vector ( unsigned ( h ) + unsigned ( capSigma1( e ) ) + unsigned ( ch( e, f, g ) ) + unsigned ( kj ) + unsigned ( wj ) );
            T2 := std_logic_vector ( unsigned( ma ( a, b, c ) ) + unsigned( capSigma0 ( a ) ) );
            p <= g;
            o <= f;
            n <= e;
            m <= std_logic_vector( unsigned( d ) + unsigned( T1 ) );
            l <= c;
            k <= b;
            j <= a;
            i <= std_logic_vector( unsigned( T1 ) + unsigned( T2 ) );
      end if;
  end process sha256_hash;

end architecture behaviour;

------------------------------------------