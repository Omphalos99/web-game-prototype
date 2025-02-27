GDPC                p                                                                      ,   `   res://.godot/exported/133200997/export-16e6d665ef4e3d41c632bd1cd0d12b6e-prototype_generator.scn �      C      �a��j����m�S��    `   res://.godot/exported/133200997/export-4cc299f019c18717a81ec0191079f952-prototype_clicker.scn   �      r      ��w��r�
��C"���-    T   res://.godot/exported/133200997/export-6e7b135df2e96a357551ec5a2e9d13ab-juego.scn   �      F      : �7�10��..    `   res://.godot/exported/133200997/export-9549ba879cfc9e848702e731ecc6ffdf-prototype_upgrades.scn  @,      �      �t=앋��čP䌾~    \   res://.godot/exported/133200997/export-b1d5c8b17a51103fd0d46ba667665600-user_interface.scn  @:      B      eZHD�v�l��    `   res://.godot/exported/133200997/export-f33544398cb179a2c99fbbed144d6260-idle_games_core_view.scn L      7      7#��P+�����r    X   res://.godot/exported/133200997/export-f84953b4728d6cb345a22ec0811240fa-compo_mejora.scn"      }	      Cr5���`�]P�$��-        res://.godot/extension_list.cfg P�      5       q�Y��C�)�$    ,   res://.godot/global_script_class_cache.cfg  Ќ      �      ��C�x����p!]    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex�{            ：Qt�E�cO���       res://.godot/uid_cache.bin  p�      �      =�	Z�s���g �s�    4   res://addons/godot-git-plugin/git_plugin.gdextension        �      k��$f�0o�`r�b       res://icon.svg  ��      �      k����X3Y���f       res://icon.svg.import   ��      �       �i�=��"��t       res://project.binary��      �      Z�|�"�<�D����        res://scenes/game/IdleGame.gd   �             ;��/ѳk\��R"
       res://scenes/game/juego.gd  �            ץ����a��v�L�    $   res://scenes/game/juego.tscn.remap  ��      b       ���j<$W&��ߢ,�    4   res://scenes/prototypes/clicker/prototype_clicker.gd       u      �N����1�D��
̓    <   res://scenes/prototypes/clicker/prototype_clicker.tscn.remap �      n       )�r}�*2�u��A��    8   res://scenes/prototypes/generator/prototype_generator.gd       �      ��*o=�w8� ���    @   res://scenes/prototypes/generator/prototype_generator.tscn.remap��      p       �J<�T�XW��v\��    <   res://scenes/prototypes/upgrades/componentes/compo_mejora.gd�            ������F�G�f޲�    D   res://scenes/prototypes/upgrades/componentes/compo_mejora.tscn.remap �      i       ���c���֬Ap��n    8   res://scenes/prototypes/upgrades/prototype_upgrades.gd  �+      �       $�ax����ۜK�b�1    @   res://scenes/prototypes/upgrades/prototype_upgrades.tscn.remap  p�      o       �uY��DV�����    ,   res://scenes/user_interface/Time_Label.gd   �4      �      �����N<��[L�!y    0   res://scenes/user_interface/idle_games_label.gd  3      �      C��4;�:�'`3��$    0   res://scenes/user_interface/user_interface.gd   p6      �      if�1!��4/�a@/�a    8   res://scenes/user_interface/user_interface.tscn.remap   ��      k       ��m>]AP٠eхϘ�&    <   res://scenes/views/idle_games_core/idle_games_core_view.gd  �I      p      ��DI U�s��> �+    D   res://scenes/views/idle_games_core/idle_games_core_view.tscn.remap  P�      q       |�fGs:}Q{fVȕ?P    $   res://scripts/abstracts/upgrade.gd  @S      �      �e�1�S?R�M߀��>        res://scripts/abstracts/view.gd  W            /��k�.�=��lV��       res://scripts/data/data.gd   Y      �      �����)1H��p�$85�    (   res://scripts/data/data_ig_upgrades.gd  �Z            9!o���*�����       res://scripts/data/save.gd  �[            �z
�.�@c�W���<    ,   res://scripts/handlers/handler_idlegames.gd �]      S      ��&)�A���.@�8��_    0   res://scripts/handlers/handler_ig_upgrades.gd   @b      �      K�8��JF���q?,�K    (   res://scripts/handlers/handler_tiempo.gd e      �      ��',�c;�E$�<    0   res://scripts/handlers/handler_time_generator.gd�h      a      �R�ی�Q �_L<�    @   res://scripts/mejoras/ig_upgrades/igu_01_generador_de_tiempo.gd Pn      �      o��,��������4�    8   res://scripts/mejoras/ig_upgrades/igu_02_tiempo_boost.gds      �      h��6���KG�g��    0   res://scripts/mejoras/up_01_clicker_upgrade.gd  �w      �      ۸�_h����-0&5        [configuration]

entry_symbol = "git_plugin_init"
compatibility_minimum = "4.1.0"

[libraries]

macos.editor = "macos/libgit_plugin.macos.editor.universal.dylib"
windows.editor.x86_64 = "win64/libgit_plugin.windows.editor.x86_64.dll"
linux.editor.x86_64 = "linux/libgit_plugin.linux.editor.x86_64.so"
linux.editor.arm64 = "linux/libgit_plugin.linux.editor.arm64.so"
linux.editor.rv64 = ""
           extends Node
   class_name Game
extends Node
## Nodo principal del juego

## Referencia Singleton.
static var ref : Game

## Chequear singleton.
func _singleton_check()->void:
	if not ref:
		ref = self
		return
	queue_free()

## Referencia a la escena empacada user interface.
@export var scene_user_interface:PackedScene


## Contiene los datos para guardar y cargar.
var data:Data 

## Chequeo de singleton e iniciar datos.
func _enter_tree()->void:
	_singleton_check()
	data=Data.new()
	SaveSystem.load_data()


func _ready()->void:
	var node_user_interface: UserInterface = scene_user_interface.instantiate() as UserInterface
	add_child(node_user_interface)

## Activado cuando SaveTimer completa el loop. Guarda el juego.
func _on_save_timer_timeout()->void:
	SaveSystem.save_data()
            RSRC                    PackedScene            ��������                                                  Timer    resource_local_to_scene    resource_name 	   _bundled    script       Script    res://scenes/game/juego.gd ��������   PackedScene 0   res://scenes/user_interface/user_interface.tscn ��xZ2�-   Script )   res://scripts/handlers/handler_tiempo.gd ��������   Script ,   res://scripts/handlers/handler_idlegames.gd ��������   Script .   res://scripts/handlers/handler_ig_upgrades.gd ��������   Script 1   res://scripts/handlers/handler_time_generator.gd ��������      local://PackedScene_fpnhk x         PackedScene          	         names "         Game    script    scene_user_interface    Node 	   Handlers    Tiempo 	   IdleGame    IGUpgrades    TimeGenerator    timer    Timer 
   SaveTimer 
   wait_time 
   autostart    _on_timer_timeout    timeout    _on_save_timer_timeout    	   variants    	                                                                         �@            node_count             nodes     J   ��������       ����                                  ����                     ����                          ����                          ����                          ����         	  @              
   
   ����                
      ����                         conn_count             conns                                                             node_paths              editable_instances              version             RSRC          class_name PrototypeClicker
extends View
## Prototipo de un clicker de tiempo consumido. 




## Preparar el Label desde el inicio.
func _ready()->void:
	super()
	visible=false
	


## Crea 1 Idle Game.
func create_time()->void:
	HandlerTime.ref.trigger_clicker()


## Funciona cuando el botón consumir tiempo se presiona.
func _on_button_pressed()->void:
	create_time()


           RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script 5   res://scenes/prototypes/clicker/prototype_clicker.gd ��������   Script *   res://scenes/user_interface/Time_Label.gd ��������      local://PackedScene_y5vow m         PackedScene          	         names "         PrototypeClicker    layout_mode    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    script    Control    Label    custom_minimum_size    offset_bottom    theme_type_variation    text    horizontal_alignment    vertical_alignment    Button    anchor_left    anchor_top    offset_left    offset_top    offset_right    _on_button_pressed    pressed    	   variants                        �?                
         �B         
        �A,      HeaderLarge       Tiempo dedicado: <value>          
     �C  �B            ?     ��     �@   "   Dedicar tiempo a crear idle games       node_count             nodes     U   ��������       ����                                                          	   	   ����   
                                       	      
                                       ����   
                                                                                              conn_count             conns                                      node_paths              editable_instances              version             RSRC              class_name PrototypeGenerator
extends View
## Prototipo simple de generador de tiempo.



## Referencia al botón que empieza la generación.
@export var button: Button
## Referencia al temporizador.
@export var timer:Timer




func _ready()->void:
	super()
	visible=true



## Crear tiempo y guardarlo.
func create_time()->void:
	HandlerTime.ref.create_time(1)


## Empezar el timer e inhabilitar botón.
func begin_generating_time()->void:
	timer.start()
	button.disabled=true

## Funciona cuando botón es presionado.
func _on_button_pressed()->void:
	begin_generating_time()

## Funciona cuando se acaba el temporizador.
func _on_timer_timeout():
	create_time()

     RSRC                    PackedScene            ��������                                                  Button    Timer    resource_local_to_scene    resource_name 	   _bundled    script       Script 9   res://scenes/prototypes/generator/prototype_generator.gd ��������   Script *   res://scenes/user_interface/Time_Label.gd ��������      local://PackedScene_y0ky1 �         PackedScene          	         names "         PrototypeGenerator    layout_mode    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    script    button    timer    Control    Button    custom_minimum_size    anchor_left    anchor_top    offset_left    offset_top    offset_right    offset_bottom    text    Label    theme_type_variation    horizontal_alignment    vertical_alignment    Timer    _on_button_pressed    pressed    _on_timer_timeout    timeout    	   variants                        �?                                   
     �C  �B                  ?     ��     �@   4   Dedicar tiempo a crear idle games de manera pasiva. 
         �B   
        �A,      HeaderLarge       Tiempo dedicado: <no_value>                node_count             nodes     `   ��������
       ����	                                                @   	  @                     ����                  	      
      
      
      
                                                               ����                                                                                       ����              conn_count             conns                                                              node_paths              editable_instances              version             RSRC             class_name CompoUpgrade
extends Control

## Componente que muestra una mejroa.

## Referencia al titulo del label.
@export var label_title: Label
## Referencia a la descripción en RichTextLabel.
@export var label_description:RichTextLabel
## Referencia al botón de compra.
@export var button: Button


## Mejora para mostrar.
var upgrade: Upgrade


func _ready()->void:
	if not upgrade:
		upgrade=Up01ClickerUpgrade.new()
	
	update_label_title()
	update_label_description()
	update_button()
	
	HandlerTime.ref.time_created.connect(update_button)
	HandlerTime.ref.time_consumed.connect(update_button)
	
	upgrade.leveled_up.connect(update_label_title)
	upgrade.leveled_up.connect(update_label_description)
	upgrade.leveled_up.connect(update_button)

## Actualiza el título de la mejora.
func update_label_title()->void:
	var text: String = upgrade.title +" (%s)" %upgrade.level
	label_title.text=text


## Actualiza descripción de la mejora.
func update_label_description()->void:
	label_description.text=upgrade.description()


## Actualiza visibilidad del botón.
func update_button(_quantity:int=-1)->void:
	if upgrade.can_afford():
		button.disabled=false
		return
	
	button.disabled=true

## Activado cuando el botón de compra es presionado.
func _on_boton_compra_pressed():
	upgrade.level_up()
         RSRC                    PackedScene            ��������                                                  MarginContainer    HBoxContainer    Infos    VBoxContainer    Titulo    Descripción    BotonCompra    resource_local_to_scene    resource_name 	   _bundled    script       Script =   res://scenes/prototypes/upgrades/componentes/compo_mejora.gd ��������      local://PackedScene_jwc0y �         PackedScene    	      	         names "   &      Compo_Mejora    custom_minimum_size    layout_mode    anchors_preset    anchor_top    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    script    label_title    label_description    button    Control    Panel    MarginContainer %   theme_override_constants/margin_left $   theme_override_constants/margin_top &   theme_override_constants/margin_right '   theme_override_constants/margin_bottom    HBoxContainer $   theme_override_constants/separation    Infos    size_flags_horizontal    VBoxContainer    Titulo    theme_type_variation    text    Label    Descripción    size_flags_vertical    bbcode_enabled    fit_content    RichTextLabel    BotonCompra    Button    _on_boton_compra_pressed    pressed    	   variants       
          C                  ?     �?                                                                                                     ,      HeaderMedium       Titulo de mejora          )   Descripción de la mejora
Efecto:
Costo: 
     pC          Comprar       node_count    	         nodes     �   ��������       ����                                                    	      
  @     @     @	                     ����      
                                                   ����
      
                                                                          ����                                ����                                ����      
                                                  ����                                !      ����                                             #   "   ����                               conn_count             conns               %   $                    node_paths              editable_instances              version       
      RSRC   class_name PrototypeUpgrades
extends View

## Prototipo de ventana que muestra mejoras.


## Preparar visibilidad al inicio.
func _ready()->void:
	super()
	visible=false




  RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script 7   res://scenes/prototypes/upgrades/prototype_upgrades.gd ��������   PackedScene ?   res://scenes/prototypes/upgrades/componentes/compo_mejora.tscn !��}5!d      local://PackedScene_my8fm �         PackedScene          	         names "         PrototypeUpgrades    layout_mode    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    script    Control    MarginContainer %   theme_override_constants/margin_left $   theme_override_constants/margin_top &   theme_override_constants/margin_right '   theme_override_constants/margin_bottom    VBoxContainer $   theme_override_constants/separation    HeaderGrande    theme_type_variation    text    Label    HSeparator    MarginContainer2    Compo_Mejora    	   variants                        �?                            ,      HeaderLarge       Mejoras    @                  node_count             nodes     t   ��������       ����                                                          	   	   ����
                                       
                                         ����                                ����                                	   	   ����         
                             ����                    	      ����         
   	      	              ���   
                      conn_count              conns               node_paths              editable_instances              version             RSRC class_name LabelIdleGames
extends Label
## Muestra la cantidad actual de idle games disponibles.


## Conectar señales
func _ready()->void:
	update_text()
	HandlerIdleGame.ref.idle_game_created.connect(update_text)
	HandlerIdleGame.ref.idle_game_consumed.connect(update_text)

## Actualiza el texto para mostrar la cantidad de tiempo.
func update_text(_quantity:int=-1)->void:
	text= "Idle Games: %s" %HandlerIdleGame.ref.idle_game()
	
           class_name TimeLabel
extends Label

## Muestra la cantidad de tiempo disponible.

## Conectar señales
func _ready()->void:
	update_text()
	HandlerTime.ref.time_created.connect(update_text)
	HandlerTime.ref.time_consumed.connect(update_text)

## Actualiza el texto para mostrar la cantidad de tiempo.
func update_text(_quantity:int=-1)->void:
	text= "Tiempo dedicado: %s" %HandlerTime.ref.time()
    class_name UserInterface
extends Control
## Clase principal que controla la interfaz de usuario


## Lista de vistas.
enum Views{
	PROTOTYPE_GENERATOR,
	PROTOTYPE_CLICKER,
	PROTOTYPE_UPGRADES,
	IDLEGAMES_CORE,
}

## Emitida cuando algo pide navegación. Incluye el objetivo de vista.
signal navigation_requested (view: Views)


## Funciona cuando el enlace de prototipo de generador se clickea.
func _on_prototipo_generador_link_pressed():
	navigation_requested.emit(Views.PROTOTYPE_GENERATOR)

## Funciona cuando el enlace de prototipo de clicker se clickea.
func _on_prototipo_clicker_link_pressed():
	navigation_requested.emit(Views.PROTOTYPE_CLICKER)


## Funciona cuando el enlace de prototipo de upgrades se clickea.
func _on_prototype_upgrade_link_pressed():
	navigation_requested.emit(Views.PROTOTYPE_UPGRADES)

## Funciona cuando el enlace de Creador de Idle Games se clickea.
func _on_idle_games_core_link_pressed():
	navigation_requested.emit(Views.IDLEGAMES_CORE)
RSRC                    PackedScene            ��������                                                  ..    resource_local_to_scene    resource_name 	   _bundled    script       Script .   res://scenes/user_interface/user_interface.gd ��������   Script 0   res://scenes/user_interface/idle_games_label.gd ��������   Script *   res://scenes/user_interface/Time_Label.gd ��������   PackedScene =   res://scenes/views/idle_games_core/idle_games_core_view.tscn �����   PackedScene ;   res://scenes/prototypes/generator/prototype_generator.tscn 0=�;�z�w   PackedScene 7   res://scenes/prototypes/clicker/prototype_clicker.tscn |.k��?�{   PackedScene 9   res://scenes/prototypes/upgrades/prototype_upgrades.tscn oȖN      local://PackedScene_lu2du          PackedScene          	         names "   /      UserInterface    layout_mode    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    script    Control    HBoxContainer 
   LeftPanel    custom_minimum_size    VBoxContainer 
   Navigator    size_flags_vertical    MarginContainer %   theme_override_constants/margin_left $   theme_override_constants/margin_top &   theme_override_constants/margin_right '   theme_override_constants/margin_bottom    PrototipoGeneradorLink    text    LinkButton    PrototipoClickerLink    PrototypeUpgradeLink    IdleGamesCoreLink    HSeparator 
   Resources    IdleGamesLabel    Label 
   TimeLabel    autowrap_mode    VSeparator 	   MainView    size_flags_horizontal    IdleGamesCoreView    user_interface    PrototypeGenerator    visible    PrototypeClicker    view    PrototypeUpgrades %   _on_prototipo_generador_link_pressed    pressed #   _on_prototipo_clicker_link_pressed #   _on_prototype_upgrade_link_pressed !   _on_idle_games_core_link_pressed    	   variants                        �?                      
     pC                Prototipo de Generador       Prototipo de Clicker       Prototipo de Mejoras       Creador de Idle Games          
     PC  DB   &   Tiempo dedicado a crear idle games: 0                                                                             node_count             nodes     Y  ��������       ����                                                          	   	   ����                                                     
   ����                                ����                                                        ����                                 ����
                                                                                ����                          ����                                ����            	                    ����            
                    ����                                ����                                      ����                          ����                                 ����
                                                                                ����                          ����                                ����                                                  ����                                        ����                       !   ����         "                  ���#               $  @              ���%         &            $  @              ���'         &            (      $  @              ���)         &            (      $  @             conn_count             conns               +   *                     +   ,              	       +   -              
       +   .                    node_paths              editable_instances              version             RSRC              class_name ViewIdleGamesCore
extends View
## Vista que muestra las mejoras que se pueden comprar con Idle Games.

@export var igu_area:Control

@export var compo_upgrade_scene: PackedScene

## Iniciar visibilidad.
func _ready()->void:
	super()
	visible=false
	intitialize_upgrades()

func intitialize_upgrades()->void:
	var upgrades : Array[Upgrade] = HandlerIGUpgrades.ref.get_all_upgrades()
	if upgrades.size()==0:
		return
	
	for upgrade : Upgrade in upgrades:
		var upgrade_node : CompoUpgrade = compo_upgrade_scene.instantiate() as CompoUpgrade
		
		upgrade_node.upgrade = upgrade
		
		igu_area.add_child(upgrade_node)
RSRC                    PackedScene            ��������                                                  MarginContainer    VBoxContainer    IGUpgrades    resource_local_to_scene    resource_name 	   _bundled    script       Script ;   res://scenes/views/idle_games_core/idle_games_core_view.gd ��������   PackedScene ?   res://scenes/prototypes/upgrades/componentes/compo_mejora.tscn !��}5!d      local://PackedScene_hlknd �         PackedScene          	         names "         IdleGamesCoreView    layout_mode    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    script 	   igu_area    compo_upgrade_scene    view    Control    MarginContainer %   theme_override_constants/margin_left $   theme_override_constants/margin_top &   theme_override_constants/margin_right '   theme_override_constants/margin_bottom    VBoxContainer $   theme_override_constants/separation    Header    theme_type_variation    text    Label    HSeparator    IGUpgrades    	   variants                        �?                                                            ,      HeaderLarge       Mejoras de Idle Games             node_count             nodes     m   ��������       ����
                                                @   	      
                         ����
                                                                                ����            	                    ����            
                          ����                                      ����                          ����                   conn_count              conns               node_paths              editable_instances              version             RSRC         class_name Upgrade
extends Node
## Clase abstracta que define las mejoras.

## Emitida cuando la mejora sube de nivel.
signal leveled_up

## Nivel de la mejora
var level: int=-1
## Titulo del nombre de la mejora
var title: String="Title not defined"
## Costo base de la mejora
var base_cost: int= -1
## Costo actual de la mejora.
var cost:int=-1


## Clase virtual, debe ser sobreescrita.
## Devuelve descripción de la mejora.
func description()->String:
	return "Description not defined"

## Clase virtual, debe ser sobreescrita.
## Devuelve costo actual, basado en el nivel y costo base.
func calculate_cost()->void:
	printerr("método calculate_cost() no está definido.")

## Clase virtual, debe ser sobreescrita.
## Devuelve si jugador puede comprar o no.
func can_afford()->bool:
	return false


## Clase virtual, debe ser sobreescrita.
## Consume idle games para subir de nivel.
func level_up()->void:
	printerr("método level_up() no definido aún.")
class_name View
extends Control
## Clase abstracts que define las vistas

## Ver referencia.
@export var view:UserInterface.Views
## Referencia a la interfaz de usuario.
@export var user_interface:UserInterface


## Preparar visibilidad al inicio.
func _ready()->void:

	user_interface.navigation_requested.connect(_on_navigation_request)
	
## Estar pendiente de pedidos de navegación y reaccionar.
func _on_navigation_request(requested_view:UserInterface.Views)->void:
	if requested_view==view:
		visible=true
		return
		
	visible=false
	

  class_name Data
extends Resource
## Contiene datos para guardar y cargar

## Cantidad actual de idle games disponibles.
@export var idle_game:int=10
## Cantidad de tiempo disponible.
@export var time:int=0
## Nivel de mejora de la mejora 01 al clicker.
@export var up_01_level:int=0

## Contiene datos de IGUpgrades para guardar y cargar.
@export var ig_upgrades : DataIGUpgrades = DataIGUpgrades.new()
             class_name DataIGUpgrades
extends Resource
## Contiene datos de IGUpgrades para guardar y cargar.

## IGU 01 nivel de generación de tiempo.
@export var u_01_level : bool = false

## IGU 01 nivel de boost al tiempo.
@export var u_02_tiempo_boost_level : int=0
            class_name SaveSystem
## Save Manager

## Dirección del archivo donde queremos guardar y cargar.
const PATH : String = "user://save.tres"
## Decidir si cargamos el juego o no.
const SHOULD_LOAD:bool=false

## Guardar el objeto Game.ref.data en un archivo.
static func save_data()->void:
	ResourceSaver.save(Game.ref.data, PATH)
	
## Carga los datos y sobreescribe el objeto Game.ref.data
static func load_data()->void:
	if not SHOULD_LOAD:
		return
		
	if ResourceLoader.exists(PATH):
		Game.ref.data = load(PATH)


           class_name HandlerIdleGame
extends Node

## Maneja idle games y señales relacionadas.

## Referencia al singleton
static var ref : HandlerIdleGame


## Chequear singleton.
func _enter_tree()->void:
	if not ref:
		ref = self
		return
		
	queue_free()

## Emitido cuando se crean idle games.
signal idle_game_created(quantity : int)
## Emitido cuando se consumen idle games.
signal idle_game_consumed(quantity : int)

## Conseguir la cantidad actual de idle games.
func idle_game()->int:
	return Game.ref.data.idle_game


## Crear una cantidad específica de idle games.

func create_idle_game(quantity : int)->void:
	Game.ref.data.idle_game+=quantity
	idle_game_created.emit(quantity)

## Consumir una cantidad específica de idle games.
func consume_idle_game(quantity : int)->Error:
	if quantity>Game.ref.data.idle_game:
		return Error.FAILED
	Game.ref.data.idle_game-=quantity
	idle_game_consumed.emit(quantity)
	return Error.OK

## Activado por el clicker, crea idle game.
##func trigger_clicker()->void:
##	var quantity: int = 1
##	quantity+=Game.ref.data.up_01_level
##	
##	create_idle_game(quantity)
             class_name HandlerIGUpgrades
extends Node

## Maneja mejoras a idle games y señales relacionadas.

## Referencia al singleton
static var ref : HandlerIGUpgrades

## Chequear singleton.
func _enter_tree()->void:
	if not ref:
		ref = self
		return
		
	queue_free()


## Emitida cuando una mejora sube de nivel.
signal upgrade_leveled_up(upgrade:Upgrade)

## Referencia a IGUpgrade 01
@onready var u_01_time_generation:IGU01TimeGenerator=IGU01TimeGenerator.new()

## Referencia a IGUpgrade02.
@onready var u_02_time_boost:IGU02TiempoBoost=IGU02TiempoBoost.new()


## Devuelve todos los IGUpgrades
func get_all_upgrades()->Array[Upgrade]:
	return [
		u_01_time_generation,
		u_02_time_boost
	]
             class_name HandlerTime
extends Node

## Maneja tiempo y señales relacionadas.

## Referencia al singleton
static var ref : HandlerTime

## Chequear singleton.
func _enter_tree()->void:
	if not ref:
		ref = self
		return
	queue_free()

## Emitida cuando se crea tiempo.
signal time_created(quantity:int)
## Emitida cuando se consume tiempo.
signal time_consumed(quantity:int)

## Devuelve la cantidad de tiempo disponible.
func time()->int:
	return Game.ref.data.time

## Agregar una cantidad específica de tiempo.
func create_time(quantity:int)->void:
	Game.ref.data.time+=quantity
	time_created.emit(quantity)

## Consumir una cantidad específica de tiempo.
func consume_time(quantity:int)->Error:
	if quantity>Game.ref.data.time:
		return Error.FAILED
	Game.ref.data.time-=quantity
	time_consumed.emit(quantity)
	return Error.OK

## Activado por el clicker, crea tiempo.
func trigger_clicker()->void:
	var quantity: int = 1
	quantity+=Game.ref.data.up_01_level
	
	create_time(quantity)
 class_name HandlerTimeGenerator
extends Node
## Crea tiempo de manera pasiva

## Referencia al singleton
static var ref : HandlerTimeGenerator


## Cantidad de tiempo generada en cada loop
var time_accel:int=1


## Chequear singleton.
func _enter_tree()->void:
	if not ref:
		ref = self
		return
		
	queue_free()


## Referencia al temporizador del generador
@export var timer:Timer

## Carga los datos.
func _ready()->void:
	
	calculate_time_accel()
	
	HandlerIGUpgrades.ref.upgrade_leveled_up.connect(watch_for_upgrades_level_up)
	
	if Game.ref.data.ig_upgrades.u_01_level:
		timer.start()
		return
	
	HandlerIGUpgrades.ref.u_01_time_generation.leveled_up.connect(watch_for_igu01_level_up)



## Funciona cuando el temporizador completa un loop
func _on_timer_timeout():
	HandlerTime.ref.create_time(time_accel)

## Activado cuando la mejora sube de nivel. Recalcula la aceleración del tiempo.
func watch_for_upgrades_level_up(upgrade:Upgrade)->void:
	calculate_time_accel()


## Esperar a que IGU01 sea comprado.
func watch_for_igu01_level_up()->void:
		timer.start()
		HandlerIGUpgrades.ref.u_01_time_generation.leveled_up.disconnect(watch_for_igu01_level_up)


## Calcular la cantidad de tiempo que debe ser creada cada segundo.
func calculate_time_accel()->void:
	var new_accel:int=1
	new_accel+=Game.ref.data.ig_upgrades.u_02_tiempo_boost_level
	
	time_accel=new_accel
               class_name IGU01TimeGenerator
extends Upgrade

## Desbloquea la generación pasiva de tiempo

var max_level:int=1

func _init()->void:
	title= "Crea tu primer idle game."
	level=Game.ref.data.ig_upgrades.u_01_level
	base_cost=1
	calculate_cost()




## Devuelve descripción de la mejora.
func description()->String:
	var text: String= "Crea tu primer idle game para empezar a invertir tiempo creando otros."
	text +="\n[b]Efecto: creación pasiva de tiempo.[/b]"
	
	if level < max_level:
		text +="\n[b]Costo:[/b] %s idle game." %cost
	
	return text

## Devuelve costo actual, basado en el nivel y costo base.
func calculate_cost()->void:
		cost = base_cost


## Devuelve si jugador puede comprar o no.
func can_afford()->bool:
	if level>=max_level:
		return false
	
	if Game.ref.data.idle_game>=cost:
		return true
	else:
		return false


## Consume idle games para subir de nivel.
func level_up()->void:
	if level>=max_level:
		return
	var error : Error = HandlerIdleGame.ref.consume_idle_game(cost)
	
	if error:
		return

	level+=1
	Game.ref.data.ig_upgrades.u_01_level=true

## Incrementar el nivel en los Datos de Recursos
	leveled_up.emit()
	HandlerIGUpgrades.ref.upgrade_leveled_up.emit(self)

              class_name IGU02TiempoBoost
extends Upgrade

## Mejora IGU02: Incrementa la cantidad de tiempo generado por segundo.

var max_level : int = 5


## Inicializar valores.
func _init()->void:
	level=Game.ref.data.ig_upgrades.u_02_tiempo_boost_level
	title="Aceleración de generación de tiempo"
	base_cost=1
	cost=1


## Devuelve descripción de la mejora.
func description()->String:
	var text:String="Incrementa la cantidad de tiempo invertida en idle games."
	text+="\n[b]Efectos: +1 tiempo/seg.[/b]"
	if level < max_level:
		text+="\n[b]Costo: [/b] %s idle games" %cost
	return text


## Devuelve costo actual, basado en el nivel y costo base.
func calculate_cost()->void:
	pass



## Devuelve si jugador puede comprar o no.
func can_afford()->bool:
	if level>=max_level:
		return false
	if Game.ref.data.idle_game>=cost:
		return true
	return false

## Clase virtual, debe ser sobreescrita.
## Consume idle games para subir de nivel.
func level_up()->void:
	if level>=max_level:
		return
	var error:Error=HandlerIdleGame.ref.consume_idle_game(cost)
	if error:
		return
	level+=1
	Game.ref.data.ig_upgrades.u_02_tiempo_boost_level=level
	leveled_up.emit()
	HandlerIGUpgrades.ref.upgrade_leveled_up.emit(self)
      class_name Up01ClickerUpgrade
extends Upgrade
## Mejora 01 - Incrementa idle games creados por el clicker.


## Cargar los datos.
func _init()->void:
	level=Game.ref.data.up_01_level
	title="Mejoras del clicker"
	base_cost=5
	calculate_cost()

## Devuelve descripción que contiene efecto y costo.
func description()->String:
	var _description:String="Incrementa la cantidad de tiempo creado por el Clicker."
	_description+="\nEfectos: +1 tiempo/nivel"
	_description+="\nCosto: %s"%cost
	
	return _description


## Devuelve costo actual, basado en el nivel y costo base.
func calculate_cost()->void:
	cost = int(base_cost*pow(1.5,level))

## Devuelve si jugador puede comprar o no.
func can_afford()->bool:
	if HandlerTime.ref.time()>=cost:
		return true
	return false



## Consume tiempo para subir de nivel.
func level_up()->void:
	var error: Error=HandlerTime.ref.consume_time(cost)
	if not error:
		level+=1
		Game.ref.data.up_01_level=level
		
		calculate_cost()
		
		leveled_up.emit()


              GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�m�m۬�}�p,��5xi�d�M���)3��$�V������3���$G�$2#�Z��v{Z�lێ=W�~� �����d�vF���h���ڋ��F����1��ڶ�i�엵���bVff3/���Vff���Ҿ%���qd���m�J�}����t�"<�,���`B �m���]ILb�����Cp�F�D�=���c*��XA6���$
2#�E.@$���A.T�p )��#L��;Ev9	Б )��D)�f(qA�r�3A�,#ѐA6��npy:<ƨ�Ӱ����dK���|��m�v�N�>��n�e�(�	>����ٍ!x��y�:��9��4�C���#�Ka���9�i]9m��h�{Bb�k@�t��:s����¼@>&�r� ��w�GA����ը>�l�;��:�
�wT���]�i]zݥ~@o��>l�|�2�Ż}�:�S�;5�-�¸ߥW�vi�OA�x��Wwk�f��{�+�h�i�
4�˰^91��z�8�(��yޔ7֛�;0����^en2�2i�s�)3�E�f��Lt�YZ���f-�[u2}��^q����P��r��v��
�Dd��ݷ@��&���F2�%�XZ!�5�.s�:�!�Њ�Ǝ��(��e!m��E$IQ�=VX'�E1oܪì�v��47�Fы�K챂D�Z�#[1-�7�Js��!�W.3׹p���R�R�Ctb������y��lT ��Z�4�729f�Ј)w��T0Ĕ�ix�\�b�9�<%�#Ɩs�Z�O�mjX �qZ0W����E�Y�ڨD!�$G�v����BJ�f|pq8��5�g�o��9�l�?���Q˝+U�	>�7�K��z�t����n�H�+��FbQ9���3g-UCv���-�n�*���E��A�҂
�Dʶ� ��WA�d�j��+�5�Ȓ���"���n�U��^�����$G��WX+\^�"�h.���M�3�e.
����MX�K,�Jfѕ*N�^�o2��:ՙ�#o�e.
��p�"<W22ENd�4B�V4x0=حZ�y����\^�J��dg��_4�oW�d�ĭ:Q��7c�ڡ��
A>��E�q�e-��2�=Ϲkh���*���jh�?4�QK��y@'�����zu;<-��|�����Y٠m|�+ۡII+^���L5j+�QK]����I �y��[�����(}�*>+���$��A3�EPg�K{��_;�v�K@���U��� gO��g��F� ���gW� �#J$��U~��-��u���������N�@���2@1��Vs���Ŷ`����Dd$R�":$ x��@�t���+D�}� \F�|��h��>�B�����B#�*6��  ��:���< ���=�P!���G@0��a��N�D�'hX�׀ "5#�l"j߸��n������w@ K�@A3�c s`\���J2�@#�_ 8�����I1�&��EN � 3T�����MEp9N�@�B���?ϓb�C��� � ��+�����N-s�M�  ��k���yA 7 �%@��&��c��� �4�{� � �����"(�ԗ�� �t�!"��TJN�2�O~� fB�R3?�������`��@�f!zD��%|��Z��ʈX��Ǐ�^�b��#5� }ى`�u�S6�F�"'U�JB/!5�>ԫ�������/��;	��O�!z����@�/�'�F�D"#��h�a �׆\-������ Xf  @ �q�`��鎊��M��T�� ���0���}�x^�����.�s�l�>�.�O��J�d/F�ě|+^�3�BS����>2S����L�2ޣm�=�Έ���[��6>���TъÞ.<m�3^iжC���D5�抺�����wO"F�Qv�ږ�Po͕ʾ��"��B��כS�p�
��E1e�������*c�������v���%'ž��&=�Y�ް>1�/E������}�_��#��|������ФT7׉����u������>����0����緗?47�j�b^�7�ě�5�7�����|t�H�Ե�1#�~��>�̮�|/y�,ol�|o.��QJ rmϘO���:��n�ϯ�1�Z��ը�u9�A������Yg��a�\���x���l���(����L��a��q��%`�O6~1�9���d�O{�Vd��	��r\�՜Yd$�,�P'�~�|Z!�v{�N�`���T����3?DwD��X3l �����*����7l�h����	;�ߚ�;h���i�0�6	>��-�/�&}% %��8���=+��N�1�Ye��宠p�kb_����$P�i�5�]��:��Wb�����������ě|��[3l����`��# -���KQ�W�O��eǛ�"�7�Ƭ�љ�WZ�:|���є9�Y5�m7�����o������F^ߋ������������������Р��Ze�>�������������?H^����&=����~�?ڭ�>���Np�3��~���J�5jk�5!ˀ�"�aM��Z%�-,�QU⃳����m����:�#��������<�o�����ۇ���ˇ/�u�S9��������ٲG}��?~<�]��?>��u��9��_7=}�����~����jN���2�%>�K�C�T���"������Ģ~$�Cc�J�I�s�? wڻU���ə��KJ7����+U%��$x�6
�$0�T����E45������G���U7�3��Z��󴘶�L�������^	dW{q����d�lQ-��u.�:{�������Q��_'�X*�e�:�7��.1�#���(� �k����E�Q��=�	�:e[����u��	�*�PF%*"+B��QKc˪�:Y��ـĘ��ʴ�b�1�������\w����n���l镲��l��i#����!WĶ��L}rեm|�{�\�<mۇ�B�HQ���m�����x�a�j9.�cRD�@��fi9O�.e�@�+�4�<�������v4�[���#bD�j��W����֢4�[>.�c�1-�R�����N�v��[�O�>��v�e�66$����P
�HQ��9���r�	5FO� �<���1f����kH���e�;����ˆB�1C���j@��qdK|
����4ŧ�f�Q��+�     [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://c8h7xgt1vunck"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
                [remap]

path="res://.godot/exported/133200997/export-6e7b135df2e96a357551ec5a2e9d13ab-juego.scn"
              [remap]

path="res://.godot/exported/133200997/export-4cc299f019c18717a81ec0191079f952-prototype_clicker.scn"
  [remap]

path="res://.godot/exported/133200997/export-16e6d665ef4e3d41c632bd1cd0d12b6e-prototype_generator.scn"
[remap]

path="res://.godot/exported/133200997/export-f84953b4728d6cb345a22ec0811240fa-compo_mejora.scn"
       [remap]

path="res://.godot/exported/133200997/export-9549ba879cfc9e848702e731ecc6ffdf-prototype_upgrades.scn"
 [remap]

path="res://.godot/exported/133200997/export-b1d5c8b17a51103fd0d46ba667665600-user_interface.scn"
     [remap]

path="res://.godot/exported/133200997/export-f33544398cb179a2c99fbbed144d6260-idle_games_core_view.scn"
               list=Array[Dictionary]([{
"base": &"Control",
"class": &"CompoUpgrade",
"icon": "",
"language": &"GDScript",
"path": "res://scenes/prototypes/upgrades/componentes/compo_mejora.gd"
}, {
"base": &"Resource",
"class": &"Data",
"icon": "",
"language": &"GDScript",
"path": "res://scripts/data/data.gd"
}, {
"base": &"Resource",
"class": &"DataIGUpgrades",
"icon": "",
"language": &"GDScript",
"path": "res://scripts/data/data_ig_upgrades.gd"
}, {
"base": &"Node",
"class": &"Game",
"icon": "",
"language": &"GDScript",
"path": "res://scenes/game/juego.gd"
}, {
"base": &"Node",
"class": &"HandlerIGUpgrades",
"icon": "",
"language": &"GDScript",
"path": "res://scripts/handlers/handler_ig_upgrades.gd"
}, {
"base": &"Node",
"class": &"HandlerIdleGame",
"icon": "",
"language": &"GDScript",
"path": "res://scripts/handlers/handler_idlegames.gd"
}, {
"base": &"Node",
"class": &"HandlerTime",
"icon": "",
"language": &"GDScript",
"path": "res://scripts/handlers/handler_tiempo.gd"
}, {
"base": &"Node",
"class": &"HandlerTimeGenerator",
"icon": "",
"language": &"GDScript",
"path": "res://scripts/handlers/handler_time_generator.gd"
}, {
"base": &"Upgrade",
"class": &"IGU01TimeGenerator",
"icon": "",
"language": &"GDScript",
"path": "res://scripts/mejoras/ig_upgrades/igu_01_generador_de_tiempo.gd"
}, {
"base": &"Upgrade",
"class": &"IGU02TiempoBoost",
"icon": "",
"language": &"GDScript",
"path": "res://scripts/mejoras/ig_upgrades/igu_02_tiempo_boost.gd"
}, {
"base": &"Label",
"class": &"LabelIdleGames",
"icon": "",
"language": &"GDScript",
"path": "res://scenes/user_interface/idle_games_label.gd"
}, {
"base": &"View",
"class": &"PrototypeClicker",
"icon": "",
"language": &"GDScript",
"path": "res://scenes/prototypes/clicker/prototype_clicker.gd"
}, {
"base": &"View",
"class": &"PrototypeGenerator",
"icon": "",
"language": &"GDScript",
"path": "res://scenes/prototypes/generator/prototype_generator.gd"
}, {
"base": &"View",
"class": &"PrototypeUpgrades",
"icon": "",
"language": &"GDScript",
"path": "res://scenes/prototypes/upgrades/prototype_upgrades.gd"
}, {
"base": &"RefCounted",
"class": &"SaveSystem",
"icon": "",
"language": &"GDScript",
"path": "res://scripts/data/save.gd"
}, {
"base": &"Label",
"class": &"TimeLabel",
"icon": "",
"language": &"GDScript",
"path": "res://scenes/user_interface/Time_Label.gd"
}, {
"base": &"Upgrade",
"class": &"Up01ClickerUpgrade",
"icon": "",
"language": &"GDScript",
"path": "res://scripts/mejoras/up_01_clicker_upgrade.gd"
}, {
"base": &"Node",
"class": &"Upgrade",
"icon": "",
"language": &"GDScript",
"path": "res://scripts/abstracts/upgrade.gd"
}, {
"base": &"Control",
"class": &"UserInterface",
"icon": "",
"language": &"GDScript",
"path": "res://scenes/user_interface/user_interface.gd"
}, {
"base": &"Control",
"class": &"View",
"icon": "",
"language": &"GDScript",
"path": "res://scripts/abstracts/view.gd"
}, {
"base": &"View",
"class": &"ViewIdleGamesCore",
"icon": "",
"language": &"GDScript",
"path": "res://scenes/views/idle_games_core/idle_games_core_view.gd"
}])
        <svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 814 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H446l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z" fill="#478cbf"/><path d="M483 600c0 34 58 34 58 0v-86c0-34-58-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
              �]Ne�2�M   res://scenes/game/juego.tscn|.k��?�{6   res://scenes/prototypes/clicker/prototype_clicker.tscn0=�;�z�w:   res://scenes/prototypes/generator/prototype_generator.tscn!��}5!d>   res://scenes/prototypes/upgrades/componentes/compo_mejora.tscnoȖN8   res://scenes/prototypes/upgrades/prototype_upgrades.tscn��xZ2�-/   res://scenes/user_interface/user_interface.tscn�����<   res://scenes/views/idle_games_core/idle_games_core_view.tscn�p�֛b   res://icon.svg res://addons/godot-git-plugin/git_plugin.gdextension
           ECFG      application/config/name         Games Folder   application/run/main_scene$         res://scenes/game/juego.tscn   application/config/features(   "         4.2    GL Compatibility       application/config/icon         res://icon.svg  +   debug/gdscript/warnings/untyped_declaration         ,   debug/gdscript/warnings/inferred_declaration         .   debug/gdscript/warnings/unsafe_property_access         ,   debug/gdscript/warnings/unsafe_method_access         #   debug/gdscript/warnings/unsafe_cast         ,   debug/gdscript/warnings/unsafe_call_argument         "   display/window/size/viewport_width      @  #   display/window/size/viewport_height      �     display/window/stretch/mode         canvas_items   display/window/stretch/aspect         expand  "   editor/version_control/plugin_name      	   GitPlugin   *   editor/version_control/autoload_on_startup             file_customization/folder_colorsP               res://scenes/         blue      res://scripts/        pink#   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibility               