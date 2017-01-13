def boas_vindas
	puts 'Bem-vindo, ao jogo da Velha!'
	puts 'Qual o seu nome?'
	nome = gets.strip
	nome
end

def escolhe_caracter nome
	puts ''
	puts 'Com qual caractere deseja jogar, ' + nome + '? (X/O)'
	caractere_escolhido = gets.strip.upcase
	if (caractere_escolhido.upcase != "X" && caractere_escolhido != "O")
		puts "O caractere teclado é inválido"
		puts "Você jogará com \"X\""
		caractere_escolhido = "X"
	end	
	caractere_escolhido
end

def quem_comeca_o_jogo 
	puts ''
	puts 'Vamos tirar par-ou-ímpar para começar'
	puts 'Qual você escolhe? (p/i)'
	escolha = gets.strip
	if escolha.downcase != 'p' && escolha.downcase != 'i'
		escolha = 'p'
		puts "\n\nA escolha nao corresponde aos caracteres permitidos"
		puts "Você fica com \"Par\"\n\n"
	end
	puts 'Entre com o numero'
	numero_usuario = gets.strip
	array_resultado = par_ou_impar numero_usuario
	resultado = array_resultado[0]
	numero_maquina = array_resultado[1]
	if resultado == escolha
		quem_comeca = @jogador.nome
	else
		quem_comeca = 'Adversário'
	end
	[quem_comeca, numero_usuario, numero_maquina]
end

def mostrar_resultado_par_ou_impar array
	quem_comeca = array[0]
	numero_usuario = array[1]
	numero_maquina = array[2]
	puts''
	puts "#{@jogador.nome}, você escolheu #{numero_usuario}"
	puts "O seu adversário escolheu #{numero_maquina}"
	puts "Então quem começa o jogo é: #{quem_comeca}"
end	

def mostrar_instrucoes 
	puts "\n#{@jogador.nome}, você joga com \"#{@jogador.caractere}\""
	puts "Bom jogo"
	puts "\n\nEscolha um dos numeros abaixo disponiveis para ser sua jogada!\n"
end

def mostrar_mapa_jogo 
	puts ''
    puts @mapa
    puts ''
end

def jogada_usuario jogadas_disponiveis
	puts "Qual a sua jogada?"
	jogada = gets.strip
	while !jogadas_disponiveis.include? jogada do
		puts "Jogada não permitida"
		puts "Entre com um número válido #{jogadas_disponiveis.join(",")}"
		jogada = gets.strip
	end
	jogada
end

def terminar_jogo jogador
	puts "\nFim de Jogo!!!"
	if fim_jogo?	
		puts "Parabéns, #{jogador.nome}!!!\nVocê é o vencedor"
	elsif @array_jogadas.empty?
		puts "Deu velha!!!"
	end

	puts "Deseja jogar de novo? (s/n)"
	resposta = gets.strip
	if resposta.downcase != "s" && resposta.downcase != "n" 
		puts "Dígito inválido!"
		puts "Terminaremos o jogo\nAté uma próxima"
		resposta = "n"
	end

	resposta
end