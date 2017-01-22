def par_ou_impar numero
	numero_maquina = rand(10) 
	resultado = numero.to_i + numero_maquina.to_i
	if resultado % 2 == 0
		resultado = 'p'
	else
		resultado = 'i'
	end
	[resultado, numero_maquina]
end

def setar_caractere_maquina
	case @jogador.caractere
	when "X"
		maquina_caractere = "O"
	when "O"
		maquina_caractere = "X"	
	end

	@maquina = Maquina.new(maquina_caractere)
end

def jogada_computador jogadas_disponiveis
	puts "Jogada do Adversário"
	indice = rand(jogadas_disponiveis.size) 
	jogada = jogadas_disponiveis[indice]
	jogada.to_s
end

def mapa_to_array
	@mapa = @mapa.join("\n").split("")
end

def undo_mapa_array
	@mapa = @mapa.join("").split("\n")
end

def atualizar_array_de_jogadas jogada
	@array_jogadas.delete(jogada)
end


def criar_mapa_jogo 	
    texto = File.read("jogomapa.txt")
    @mapa = texto.split("\n")
end

def altera_mapa jogada, caractere
	mapa_to_array
	@mapa.collect! { |item|
	  (item == jogada) ? caractere : item
	}
	undo_mapa_array
	mostrar_mapa_jogo

	atualizar_array_de_jogadas jogada
end

def fim_jogo?
	mapa_to_array
	array_de_indices = [1,25,49,5,9]
	resultado = false
	array_de_indices.each do |mapa|
		if @mapa[mapa] == @mapa[mapa+4] && @mapa[mapa] == @mapa[mapa+8]
			resultado = true
		elsif @mapa[mapa] == @mapa[mapa+24] && @mapa[mapa] == @mapa[mapa+48]
			resultado = true
		elsif @mapa[mapa] == @mapa[mapa+28] && @mapa[mapa] == @mapa[mapa+56]
			resultado = true
		elsif @mapa[mapa] == @mapa[mapa+20] && @mapa[mapa] == @mapa[mapa+40]
			resultado = true
		elsif @array_jogadas.empty?
			resultado = true
		end
	end
	
	undo_mapa_array	
	return resultado
end

def joga quem
 	jogada = jogada_usuario @array_jogadas if quem == @jogador
 	jogada = jogada_computador @array_jogadas if quem == @maquina
	altera_mapa jogada,quem.caractere
end