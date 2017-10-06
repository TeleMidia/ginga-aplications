<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- Generated by NCL Eclipse -->

<ncl id="orchestra2" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
  <head>
    <regionBase>
      <region id="rg" width="100%" height="100%" top="0%" left="0%">
	<region id="rgVideoOrchestra" width="100%" height="100%" top="0%" left="0%" zIndex="2"/>

	<region id="rgBackground" width="100%" height="100%" top="0%" left="0%" zIndex="1"/>

	<region id="rgIconInteractive" width="38%" height="8%" top="4%" right="1.875%" zIndex="3"/>

	<region id="rgIconFullscreen" width="14%" height="22%" top="76%" left="0%" zIndex="3"/>
	<region id="rgIconOrchestra" width="14%" height="22%" top="76%" left="14%" zIndex="3"/>
	<region id="rgIconConductor" width="14%" height="22%" top="76%" left="28%" zIndex="3"/>
	<region id="rgIconStrings" width="14%" height="22%" top="76%" left="42%" zIndex="3"/>
	<region id="rgIconBrass" width="14%" height="22%" top="76%" left="56%" zIndex="3"/>
	<region id="rgIconWoodwind" width="14%" height="22%" top="76%" left="70%" zIndex="3"/>
	<region id="rgIconInfo" width="14%" height="22%" top="76%" left="86%" zIndex="3"/>
      </region>
    </regionBase>

    <descriptorBase>
      <descriptor id="dVideoOrchestra" region="rgVideoOrchestra" player="VideoChannelPlayerAdapter">
	<descriptorParam name="selectedObject" value="videoOrchestra"/>
	<descriptorParam name="x-intraTransition" value="false"/>
      </descriptor>

      <descriptor id="dVideoOrchestraSections"/>

      <descriptor id="dBackground" region="rgBackground"/>

      <descriptor id="dIconInteractive" region="rgIconInteractive"/>

      <descriptor id="dInfo" region="rgBackground" explicitDur="5s"/>

      <descriptor id="dIconOrchestra" region="rgIconOrchestra"
		  focusIndex="1" focusBorderWidth="0"  moveRight="2" moveLeft="6"
		  focusSrc="media/images/broadcasterfocus.png" focusSelSrc="media/images/broadcasterfocussel.png"/>

      <descriptor id="dIconConductor" region="rgIconConductor"
		  focusIndex="2" focusBorderWidth="0"  moveRight="3" moveLeft="1"
		  focusSrc="media/images/conductorfocus.png" focusSelSrc="media/images/conductorfocussel.png"/>

      <descriptor id="dIconStrings" region="rgIconStrings"
		  focusIndex="3" focusBorderWidth="0"  moveRight="4" moveLeft="2"
		  focusSrc="media/images/violinfocus.png" focusSelSrc="media/images/violinfocussel.png"/>

      <descriptor id="dIconBrass" region="rgIconBrass"
		  focusIndex="4" focusBorderWidth="0"  moveRight="5" moveLeft="3"
		  focusSrc="media/images/brassfocus.png" focusSelSrc="media/images/brassfocussel.png"/>

      <descriptor id="dIconWoodwind" region="rgIconWoodwind"
		  focusIndex="5" focusBorderWidth="0" moveRight="7" moveLeft="4"
		  focusSrc="media/images/woodwindfocus.png" focusSelSrc="media/images/woodwindfocussel.png"/>

      <descriptor id="dIconFullscreen" region="rgIconFullscreen"
		  focusIndex="6" focusBorderWidth="0" moveRight="1" moveLeft="7"
		  focusSrc="media/images/fullscreenfocus.png" focusSelSrc="media/images/fullscreenfocussel.png"/>

      <descriptor id="dIconInfo" region="rgIconInfo"
		  focusIndex="7" focusBorderWidth="0" moveRight="6" moveLeft="5"
		  focusSrc="media/images/infofocus.png" focusSelSrc="media/images/infofocussel.png"/>
    </descriptorBase>

    <connectorBase>
      <causalConnector id="onBeginStart">
	<simpleCondition role="onBegin"/>
	<simpleAction role="start" max="unbounded"/>
      </causalConnector>

      <causalConnector id="onEndStop">
	<simpleCondition role="onEnd"/>
	<simpleAction role="stop" max="unbounded"/>
      </causalConnector>

      <causalConnector id="onEndStart">
	<simpleCondition role="onEnd"/>
	<simpleAction role="start" max="unbounded"/>
      </causalConnector>
      <causalConnector id="onEndSetStart">
	<simpleCondition role="onEnd" />
	<compoundAction operator="par">
	  <simpleAction role="set" value="$value" max="unbounded"/>
	  <simpleAction role="start" max="unbounded" qualifier="seq"/>
	</compoundAction>

      </causalConnector>

      <causalConnector id="onSelectionSet">
	<connectorParam name="value"/>
	<simpleCondition role="onSelection"/>
	<simpleAction role="set" value="$value" max="unbounded"/>
      </causalConnector>


      <causalConnector id="onSelectionSetStopStart">
	<connectorParam name="key" />
	<connectorParam name="value" />
	<simpleCondition role="onSelection" key="$key"/>
	<compoundAction operator="par">
	  <simpleAction role="set" value="$value" max="unbounded"/>
	  <simpleAction role="stop"  max="unbounded"/>
	  <simpleAction role="start" max="unbounded" qualifier="seq"/>
	</compoundAction>
      </causalConnector>
    </connectorBase>
  </head>

  <body>
    <port id="pVideoOrchestra" component="contextOrchestra"/>

    <context id="contextOrchestra" descriptor="dVideoOrchestra">
      <property name="selectedObject"/>
      <property name="bounds"/>

      <media id="videoOrchestra" descriptor="dVideoOrchestraSections" src="media/video/main.mp4"/>
      <media id="videoConductor" descriptor="dVideoOrchestraSections" src="media/video/conductor.mp4"/>
      <media id="videoStrings" descriptor="dVideoOrchestraSections" src="media/video/strings.mp4"/>
      <media id="videoBrass" descriptor="dVideoOrchestraSections" src="media/video/brass.mp4"/>
      <media id="videoWoodwinds" descriptor="dVideoOrchestraSections" src="media/video/woodwinds.mp4"/>
    </context>

    <media id="background" descriptor="dBackground" src="media/images/background.png"/>

    <media id="infoObra" descriptor="dInfo" src="media/images/infoobra.png"/>
    <media id="infoCompositor" descriptor="dInfo" src="media/images/infocompositor.png"/>
    <media id="infoRegente" descriptor="dInfo" src="media/images/inforegente.png"/>
    <media id="infoOrquestra" descriptor="dInfo" src="media/images/infoorquestra.png"/>
    <media id="infoCreditos" descriptor="dInfo" src="media/images/infocreditos.png"/>

    <media id="iconInteractive" descriptor="dIconInteractive" src="media/images/interactive.png"/>

    <media id="iconFullscreen" descriptor="dIconFullscreen" src="media/images/fullscreen.png"/>
    <media id="iconOrchestra" descriptor="dIconOrchestra" src="media/images/broadcaster.png"/>
    <media id="iconConductor" descriptor="dIconConductor" src="media/images/conductor.png"/>
    <media id="iconStrings" descriptor="dIconStrings" src="media/images/violin.png"/>
    <media id="iconBrass" descriptor="dIconBrass" src="media/images/brass.png"/>
    <media id="iconWoodwinds" descriptor="dIconWoodwind" src="media/images/woodwind.png"/>
    <media id="iconInfo" descriptor="dIconInfo" src="media/images/info.png"/>

    <link xconnector="onBeginStart">
      <bind role="onBegin" component="contextOrchestra"/>
      <bind role="start" component="iconInteractive"/>
    </link>

    <link xconnector="onSelectionSetStopStart">
      <bind role="onSelection" component="iconInteractive">
	<bindParam name="key" value="INFO"/>
      </bind>

      <bind role="set" component="contextOrchestra" interface="bounds">
	<bindParam name="value" value="6.5%, 6.5%, 87.5%, 66%"/>
      </bind>

      <bind role="stop" component="iconInteractive"/>

      <bind role="start" component="background"/>

      <bind role="start" component="iconOrchestra"/>
      <bind role="start" component="iconFullscreen"/>
      <bind role="start" component="iconConductor"/>
      <bind role="start" component="iconStrings"/>
      <bind role="start" component="iconBrass"/>
      <bind role="start" component="iconWoodwinds"/>
      <bind role="start" component="iconInfo"/>
    </link>

    <link xconnector="onSelectionSet">
      <bind role="onSelection" component="iconStrings"/>

      <bind role="set" component="contextOrchestra" interface="selectedObject">
	<bindParam name="value" value="videoStrings"/>
      </bind>
    </link>

    <link xconnector="onSelectionSet">
      <bind role="onSelection" component="iconConductor"/>

      <bind role="set" component="contextOrchestra" interface="selectedObject">
	<bindParam name="value" value="videoConductor"/>
      </bind>
    </link>

    <link xconnector="onSelectionSet">
      <bind role="onSelection" component="iconOrchestra"/>

      <bind role="set" component="contextOrchestra" interface="selectedObject">
	<bindParam name="value" value="videoOrchestra"/>
      </bind>
    </link>

    <link xconnector="onSelectionSet">
      <bind role="onSelection" component="iconBrass"/>

      <bind role="set" component="contextOrchestra" interface="selectedObject">
	<bindParam name="value" value="videoBrass"/>
      </bind>
    </link>

    <link xconnector="onSelectionSet">
      <bind role="onSelection" component="iconWoodwinds"/>

      <bind role="set" component="contextOrchestra" interface="selectedObject">
	<bindParam name="value" value="videoWoodwinds"/>
      </bind>
    </link>

    <link xconnector="onSelectionSetStopStart">
      <bind role="onSelection" component="iconFullscreen"/>

      <bind role="set" component="contextOrchestra" interface="bounds">
	<bindParam name="value" value="0%, 0%, 114.32%, 151.58%"/>
      </bind>

      <bind role="stop" component="iconFullscreen"/>
      <bind role="stop" component="iconOrchestra"/>
      <bind role="stop" component="iconConductor"/>
      <bind role="stop" component="iconStrings"/>
      <bind role="stop" component="iconBrass"/>
      <bind role="stop" component="iconWoodwinds"/>
      <bind role="stop" component="iconInfo"/>

      <bind role="stop" component="background"/>

      <bind role="start" component="iconInteractive"/>
    </link>

    <link xconnector="onSelectionSetStopStart">
      <bind role="onSelection" component="iconInfo"/>

      <bind role="set" component="contextOrchestra" interface="bounds">
	<bindParam name="value" value="56%, 7.8%, 54.8%, 68%"/>
      </bind>

      <bind role="stop" component="iconFullscreen"/>
      <bind role="stop" component="iconOrchestra"/>
      <bind role="stop" component="iconConductor"/>
      <bind role="stop" component="iconStrings"/>
      <bind role="stop" component="iconBrass"/>
      <bind role="stop" component="iconWoodwinds"/>
      <bind role="stop" component="iconInfo"/>

      <bind role="stop" component="background"/>

      <bind role="start" component="infoObra"/>
    </link>

    <link xconnector="onEndStart">
      <bind role="onEnd" component="infoObra"/>
      <bind role="start" component="infoCompositor"/>
    </link>

    <link xconnector="onEndStart">
      <bind role="onEnd" component="infoCompositor"/>
      <bind role="start" component="infoRegente"/>
    </link>

    <link xconnector="onEndStart">
      <bind role="onEnd" component="infoRegente"/>
      <bind role="start" component="infoOrquestra"/>
    </link>

    <link xconnector="onEndStart">
      <bind role="onEnd" component="infoOrquestra"/>
      <bind role="start" component="infoCreditos"/>
    </link>

    <link xconnector="onEndSetStart">
      <bind role="onEnd" component="infoCreditos"/>

      <bind role="set" component="contextOrchestra" interface="bounds">
	<bindParam name="value" value="13.5%, 14.5%, 183%, 147.7%"/>
      </bind>

      <bind role="start" component="background"/>

      <bind role="start" component="iconOrchestra"/>
      <bind role="start" component="iconFullscreen"/>
      <bind role="start" component="iconConductor"/>
      <bind role="start" component="iconStrings"/>
      <bind role="start" component="iconBrass"/>
      <bind role="start" component="iconWoodwinds"/>
      <bind role="start" component="iconInfo"/>
    </link>

    <link xconnector="onEndStop">
      <bind role="onEnd" component="contextOrchestra"/>

      <bind role="stop" component="iconFullscreen"/>
      <bind role="stop" component="iconOrchestra"/>
      <bind role="stop" component="iconConductor"/>
      <bind role="stop" component="iconStrings"/>
      <bind role="stop" component="iconBrass"/>
      <bind role="stop" component="iconWoodwinds"/>
      <bind role="stop" component="iconInfo"/>

      <bind role="stop" component="background"/>

      <bind role="stop" component="iconInteractive"/>
    </link>
  </body>
</ncl>