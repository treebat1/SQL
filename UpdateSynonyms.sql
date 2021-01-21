--Change Synonym Location


DROP SYNONYM [syn].[Currency]
DROP SYNONYM [syn].[Currency_Conversion]

CREATE SYNONYM [syn].[Currency] FOR [resconfig].[Resonance_Configuration].[dbo].[currency]
CREATE SYNONYM [syn].[Currency_Conversion] FOR [resconfig].[Resonance_Configuration].[dbo].[currency_conversion]


