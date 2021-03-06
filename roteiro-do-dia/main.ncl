<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- Generated by NCL Eclipse -->
<ncl id="main" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<regionBase>
			<importBase alias="rg" documentURI="regionBase.ncl"/>
		</regionBase>
		
		<transitionBase>
			<transition id="trans1" type="fade" dur="1s" />
			<transition id='tFadeFast' type="fade" dur="0.5s"/>
		</transitionBase>
    
    <descriptorBase>
			<descriptor id="fullScreen" region="rg#fullScreen"/>
			<descriptor id="fundoMenu" region="rg#fundoMenu" transIn="trans1" transOut="trans1" >
				<descriptorParam name="transparency" value="0.8"/>
      </descriptor>
			<descriptor focusIndex="1" id="btoSim" region="rg#btoSim" transIn="trans1" transOut="trans1" moveRight="2"/>
			<descriptor focusIndex="2" id="btoNao" region="rg#btoNao" transIn="trans1" transOut="trans1" moveLeft="1"/>
			<descriptor focusIndex="3" id="bto1" region="rg#bto1" transIn="tFadeFast" transOut="tFadeFast" moveUp="4">
				<descriptorParam name="transparency" value="0.8"/>
			</descriptor>
			<descriptor focusIndex="4" id="bto2" region="rg#bto2" transIn="tFadeFast" transOut="tFadeFast" moveUp="5" moveDown="3">
				<descriptorParam name="transparency" value="0.8"/>
			</descriptor>
			<descriptor focusIndex="5" id="bto3" region="rg#bto3" transIn="tFadeFast" transOut="tFadeFast" moveDown="4">
				<descriptorParam name="transparency" value="0.8"/>
			</descriptor>
		</descriptorBase>
		
		<connectorBase>
			<importBase alias="conn" documentURI="connectorBase.ncl"/>
		</connectorBase>
	</head>
	<body id="corpo">
    <port component="ctxInicio" id="ptInicio"/>
		<!-- settings -->
		<media id="noSettings" type="application/x-ginga-settings">
      <property name="proxVdo" value="opt2"/>
    </media>
    
    <context id="ctxInicio">
			<!-- Comeca video e as imagens sim e nao -->
			<port component="vdoLivreInteragir" id="ptVdoLivreInteragir"/>
			<port component="botaoSim" id="ptBotaoSim"/>
			<port component="botaoNao" id="ptBotaoNao"/>
			<!-- settings -->
			<media id="noSettingsInicio" instance="instSame" refer="noSettings"/>
			<!-- medias -->
      <media descriptor="fullScreen" id="vdoLivreInteragir" src="media/videos/A.mp4" />
      <media descriptor="btoSim" id="botaoSim" src="media/imagens/sim.png" />
      <media descriptor="btoNao" id="botaoNao" src="media/imagens/nao.png" />
			<!-- Ao terminar o video termina os dois botoes -->
			<link xconnector="conn#onEndStop">
				<bind component="vdoLivreInteragir" role="onEnd"/>
				<bind component="botaoSim" role="stop"/>
				<bind component="botaoNao" role="stop"/>
			</link>
			<!-- Ao selecionar sim -> Para os botoes e seta a variavel q deve diz q ira iniciar o contexto interativo -->
			<link xconnector="conn#onSelectionStopSetWithDur">
				<bind component="botaoSim" role="onSelection"/>
				<bind component="botaoNao" role="stop"/>
				<bind component="noSettingsInicio" interface="proxVdo" role="set">
					<bindParam name="val" value="opt1"/>
					<bindParam name="dur" value="0"/>
				</bind>
			</link>
			<!-- Ao selecionar "nao" -> Para os botoes e seta a variavel q deve diz q ira iniciar o contexto nao interativo -->
			<link xconnector="conn#onSelectionStopSetWithDur">
				<bind component="botaoNao" role="onSelection"/>
				<bind component="botaoSim" role="stop"/>
				<bind component="noSettingsInicio" interface="proxVdo" role="set">
					<bindParam name="val" value="opt2"/>
					<bindParam name="dur" value="0"/>
				</bind>
			</link>
		</context>
 
    <link id="testNaoInteragir" xconnector="conn#onEndVarStart1">
      <bind role="onEnd" component="ctxInicio" />
      <bind role="var" component="noSettings" interface="proxVdo"/>
      <bind role="start" component="ctxInteragir"/>
    </link>
      
    <link id="testInteragir" xconnector="conn#onEndVarStart2">
      <bind role="onEnd" component="ctxInicio" />
      <bind role="var" component="noSettings" interface="proxVdo"/>
      <bind role="start" component="ctxNaoInteragir"/>
    </link>
    	
		<!-- Contexto sem interacao do usuario -->
		<context id="ctxNaoInteragir">
			<!-- 
				Neste contexto a ordem dos videos s�o:
						- B2 (Abertura sem interacao) 
						- C2 (Central do Brasil)
						- E2 (Confeitaria Colombo)
				Usuario nao pode interagir!
			-->
			<port component="vidB2" id="ptVdoB2"/>
      <media descriptor="fullScreen" id="vidB2" src="media/videos/B2.mp4" />
      <media descriptor="fullScreen" id="vidC2" src="media/videos/C2.mp4" />
      <media descriptor="fullScreen" id="vidE2" src="media/videos/E2.mp4" />
			<link xconnector="conn#onEndStart">
				<bind component="vidB2" role="onEnd"/>
				<bind component="vidC2" role="start"/>
			</link>
			<link xconnector="conn#onEndStart">
				<bind component="vidB2" role="onEnd"/>
				<bind component="vidC2" role="start"/>
			</link>
			<link xconnector="conn#onEndStart">
				<bind component="vidC2" role="onEnd"/>
				<bind component="vidE2" role="start"/>
			</link>
		</context>
		
		<!-- Contexto com interacao do usuario -->
		<context id="ctxInteragir">
      <!-- Interaction 1 -->
			<!-- comeca com o video B3 (Abertura com interacao) -->
      <port component="vdoB3" id="ptB3"/>
      
      <media descriptor="fullScreen" id="vdoB3" src="media/videos/B3.mp4" />
      <media descriptor="fullScreen" id="vdoC2" src="media/videos/C2.mp4" /> <!-- Central -->
      <media descriptor="fullScreen" id="vdoC3" src="media/videos/C3.mp4" /> <!-- Copacabana -->
      <media descriptor="fullScreen" id="vdoE1" src="media/videos/E1.mp4" /> <!-- Estudantina -->
      <media descriptor="fullScreen" id="vdoE2" src="media/videos/E2.mp4" /> <!-- Jardim Bot�nico -->

      <media descriptor="fundoMenu" id="fundoMenuB3" src="media/imagens/menufundo.png"/>
      <media descriptor="bto1" id="botaoCentral" src="media/imagens/central.png"/>
      <media descriptor="bto2" id="botaoCopa" src="media/imagens/copa.png"/>

      <media id="rNoSettingsInteragir" instance="instSame" refer="noSettings"/>
			<!-- Depois de 45s que comeca o video B3, inicia o menu para que o usuario possa escolher qual o prox destino -->
			<link xconnector="conn#onBeginStartDelay">
				<bind component="vdoB3" role="onBegin"/>
        <bind component="fundoMenuB3" role="start">
          <bindParam name="delay" value="45s" />
        </bind>
        <bind component="botaoCentral" role="start">
          <bindParam name="delay" value="45s" />
        </bind>
        <bind component="botaoCopa" role="start">
          <bindParam name="delay" value="45s" />
        </bind>
			</link>
      <!-- Ao Terminar B3, inicia ProxVideo conforme variavel proxVideo -->
      <!-- Ao selecionar botao copa -> Para os outros botoes e seta o prox destino como C3 (Copacabana) -->
			<link xconnector="conn#onSelectionStopSetWithDur">
				<bind component="botaoCopa" role="onSelection"/>
				<bind component="botaoCentral" role="stop"/>
				<bind component="rNoSettingsInteragir" interface="proxVdo" role="set">
           <bindParam name="val" value="opt1"/> <!-- C3 -->
					<bindParam name="dur" value="0"/>
				</bind>
			</link>
      <!-- Ao selecionar botao central -> Para os outros botoes e seta o prox destino como C2 (Central do Brasil) -->
			<link xconnector="conn#onSelectionStopSetWithDur">
				<bind component="botaoCentral" role="onSelection"/>
				<bind component="botaoCopa" role="stop"/>
				<bind component="rNoSettingsInteragir" interface="proxVdo" role="set">
           <bindParam name="val" value="opt2"/> <!-- C2 -->
					<bindParam name="dur" value="0"/>
				</bind>
			</link>

			<link xconnector="conn#onEndStop">
        <bind component="vdoB3" role="onEnd"/>
        <bind component="fundoMenuB3" role="stop"/>
				<bind component="botaoCentral" role="stop"/>
				<bind component="botaoCopa" role="stop"/>
			</link>

      <link id="testCopa" xconnector="conn#onEndVarStart1">
        <bind role="onEnd" component="fundoMenuB3" />
        <bind role="var" component="rNoSettingsInteragir" interface="proxVdo"/>
        <bind role="start" component="vdoC3"/>
      </link>
      
      <link id="testCentral" xconnector="conn#onEndVarStart2">
        <bind role="onEnd" component="fundoMenuB3" />
        <bind role="var" component="rNoSettingsInteragir" interface="proxVdo"/>
        <bind role="start" component="vdoC2"/>
      </link>

      <!-- Interaction 2 -->
      <media descriptor="fundoMenu" id="fundoMenuC2" src="media/imagens/menufundo.png"/>i
      <media descriptor="bto1" id="botaoEstudantinaC2" src="media/imagens/estudantina.png"/>
      <media descriptor="bto2" id="botaoJardimBotanicoC2" src="media/imagens/jardimbotanico.png"/>

      <!-- Ao iniciar C2, inicia menu C2 com delay de 43 segundos -->
			<link xconnector="conn#onBeginStartDelay">
				<bind component="vdoC2" role="onBegin"/>
        <bind component="fundoMenuC2" role="start">
          <bindParam name="delay" value="43s" />
        </bind>
        <bind component="botaoEstudantinaC2" role="start">
          <bindParam name="delay" value="43s" />
        </bind>
        <bind component="botaoJardimBotanicoC2" role="start">
          <bindParam name="delay" value="43s" />
        </bind>
      </link>

      <!-- Ao iniciar C3, inicia menu C3 com delay de 43 segundos -->
      <link xconnector="conn#onBeginStartDelay">
				<bind component="vdoC3" role="onBegin"/>
        <bind component="fundoMenuC2" role="start">
          <bindParam name="delay" value="43s" />
        </bind>
        <bind component="botaoEstudantinaC2" role="start">
          <bindParam name="delay" value="43s" />
        </bind>
        <bind component="botaoJardimBotanicoC2" role="start">
          <bindParam name="delay" value="43s" />
        </bind>
      </link>
      
      <!-- Ao Terminar C2 ou C3, inicia ProxVideo conforme variavel proxVideo -->
      <!-- Ao selecionar botao Gafieira Estudantina -> Para os outros botoes e seta o prox destino como E1 (Estudantina) -->
      <link xconnector="conn#onSelectionStopSetWithDur">
  			<bind component="botaoEstudantinaC2" role="onSelection"/>
				<bind component="botaoJardimBotanicoC2" role="stop"/>
				<bind component="rNoSettingsInteragir" interface="proxVdo" role="set">
          <bindParam name="val" value="opt1"/> <!-- E1 -->
					<bindParam name="dur" value="0"/>
				</bind>
			</link>
      <!-- Ao selecionar botao Jardim Bot�nico -> Para os outros botoes e seta o prox destino como E2 (Jardim Bot�nico) -->
      <link xconnector="conn#onSelectionStopSetWithDur">
				<bind component="botaoJardimBotanicoC2" role="onSelection"/>
				<bind component="botaoEstudantinaC2" role="stop"/>
				<bind component="rNoSettingsInteragir" interface="proxVdo" role="set">
		  		<bindParam name="val" value="opt2"/> <!-- E2 -->
					<bindParam name="dur" value="0"/>
				</bind>
			</link>
      
      <link xconnector="conn#onEndStop">
        <bind component="vdoC2" role="onEnd"/>
        <bind component="fundoMenuC2" role="stop"/>
				<bind component="botaoEstudantinaC2" role="stop"/>
				<bind component="botaoJardimBotanicoC2" role="stop"/>
			</link>
      
      <link xconnector="conn#onEndStop">
        <bind component="vdoC3" role="onEnd"/>
        <bind component="fundoMenuC2" role="stop"/>
				<bind component="botaoEstudantinaC2" role="stop"/>
				<bind component="botaoJardimBotanicoC2" role="stop"/>
			</link>

      <link id="testEstudantina" xconnector="conn#onEndVarStart1">
        <bind role="onEnd" component="fundoMenuC2" />
        <bind role="var" component="rNoSettingsInteragir" interface="proxVdo"/>
        <bind role="start" component="vdoE1"/>
      </link>
      
      <link id="testJardimBotanico" xconnector="conn#onEndVarStart2">
        <bind role="onEnd" component="fundoMenuC2" />
        <bind role="var" component="rNoSettingsInteragir" interface="proxVdo"/>
        <bind role="start" component="vdoE2"/>
      </link>
		</context>
	</body>
</ncl>
