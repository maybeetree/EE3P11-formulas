#set page(columns: 2)

= EE3P11 Formulas

#let note(body, notetext) = {
	$attach(limits(body), t: #text(red)[#notetext])$
}

== Impedance Matching in low-frequency circuits

#image("img/source-load.svg", width: 3cm)

=== Maximum power transfer / perfectly matched:

$Z_S = Z_L^*$

$O_"Load" = P_"Source"$

=== Mismatch: 

$Z_S != Z_L$

$note(Gamma, "Reflection\ncoefficient") = (Z_L - Z_S) / (Z_L + Z_S)$

$P_"Load" = (1 - |Gamma|^2) P_"Source"$


== Impedence matching in RF circuits

#image("img/tl.svg", width: 7cm)

#table(
	columns: 2, stroke: none,
	table.cell(colspan: 2, [Symbols]),
	$gamma$, [Wave number],
	$alpha$, [Attenuation constant],
	$j beta$, [Propagations constant],
	$k_0$, [Free space wave number],
	$w$, [???],
	$mu_0$, [Permitivity of free space],
	$epsilon_0$, [Permeability of free space],
	$mu_r$, [Relative permitivity],
	$epsilon_r$, [Relative permeability],
	$lambda_0$, [Wavelength in free space],
	$lambda_g$, [Guided wavelength (in transmission line)],
	$lambda_g$, [Wavelength in waveguide],
	$u_p$, [Phase velocity],
	$f_c$, [Cutoff Frequency],
	$a$, [Largest dimension of waveguide],
	$Z_0$, [Characteristic impedance of TL],
	$Gamma$, [Reflection coefficient],
	$Gamma(d)$, [Reflection coefficient in TL],
	$d$, [Distance from load to current point in TL],
	$S$, [VSWR],
)

#table(
	columns: (2fr, 1fr), stroke: none,
	table.cell(colspan: 2, [Formulae: Common]),
	$gamma = alpha + j beta$, [],
	$Gamma(d) = (Z(d) - Z_0) / (Z(d) + Z_0) = Gamma_L e^(-2 gamma d)$, [],
	$Z(d) = Z_0 (Z_L + Z_0 tanh(gamma d)) / (Z_0 + Z_L tanh(gamma d))$,
	[Telegrapher's equation],
	$Z_"lossless"(d) = Z_0 (Z_L + j Z_0 tan(beta d)) / (Z_0 + j Z_L tan(beta d))$,
	[When $alpha = 0$],

)

#table(
	columns: 2, stroke: none,
	table.cell(colspan: 2, [Formulae: Transmission lines]),
	$lambda_g = lambda_0 (mu_r epsilon_r)^(-1/2)$, [Dielectric material],
	$u_p = w / beta$, [],
)

#table(
	columns: 2, stroke: none,
	table.cell(colspan: 2, [Formulae: Waveguides]),
	$beta = k_0 sqrt(1 - (f_c / f) ^ 2)$, [Cutoff relation],
	$k_0 = (2 pi) / lambda_0$, [],
	$lambda_w = lambda_0 (1 - (lambda_0 / (2a)) ^ 2)^(-1/2)$, []
)

== Standing Waves

#table(
	columns: 2, stroke: none,
	table.cell(colspan: 2, [Voltage Standing Wave Ratio]),
	$"VSWR" = V_"max" / V_"min" = (1 + |Gamma|) / (1 - |Gamma|)$, [],
	$Z_L = 0$, [Shorted load],
	$Z_L = oo$, [Open load],
	$Z_L = j X$, [Pure reactive load],
	$Gamma_L = 0 => S = 1$, [Matched load],
	$Gamma_L = 1 => S = oo$, [],
)
