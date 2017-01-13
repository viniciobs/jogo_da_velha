require_relative 'classesJogadores/jogadorclass'
require_relative 'classesJogadores/maquinaclass'
require_relative 'logic'
require_relative 'ui'

nome = boas_vindas
usuario_caracter = escolhe_caracter nome
@jogador = Jogador.new(nome,usuario_caracter)

setar_caractere_maquina

loop do
	array_dados_inicio = quem_comeca_o_jogo 
	player1 = array_dados_inicio[0]

	mostrar_resultado_par_ou_impar array_dados_inicio

	mostrar_instrucoes 

	criar_mapa_jogo
	mostrar_mapa_jogo

	@array_jogadas = ["1","2","3","4","5","6","7","8","9"]

	array_players = [@jogador, @maquina]

	if player1 == @jogador.nome
		contador_auxiliar = 0
	else
		contador_auxiliar = 1
	end

	jogador_atual = ""

	while !fim_jogo? && !@array_jogadas.empty? do
		jogador_atual = array_players[contador_auxiliar % 2]
		joga array_players[contador_auxiliar % 2]
		contador_auxiliar += 1
	end

	continuar = terminar_jogo jogador_atual
	break if continuar == "n"

end

puts "Tchau, #{@jogador.nome}!"


