library std;
library ieee;
use ieee.std_logic_1164.all;

entity decoder_for_Encoder is
  port(decoder_Encoder_in : in std_logic_vector(2 downto 0);
	 decoder_Encoder_out : out std_logic_vector(7 downto 0));
end entity;

architecture reg_dec of decoder_for_Encoder is

begin
	decoder_Encoder_out <= "01111111" when decoder_Encoder_in = "000" else
							"10111111" when decoder_Encoder_in = "001" else
							"11011111" when decoder_Encoder_in = "010" else 
							"11101111" when decoder_Encoder_in = "011" else
							"11110111" when decoder_Encoder_in = "100" else
							"11111011" when decoder_Encoder_in = "101" else
							"11111101" when decoder_Encoder_in = "110" else
							"11111110" when decoder_Encoder_in = "111";

end architecture reg_dec; 