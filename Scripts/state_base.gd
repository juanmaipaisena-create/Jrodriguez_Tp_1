class_name StateBase extends Node

##referencia al nodo que vamos a controlar
@onready var controlled_node:Node = self.owner

##referencia a la maquina de estados
var state_machine:StateMachine

#region metodos comunes
##metodos que se ejecutan al entrar en estado
func start():
	pass
	
func end():
	pass
#endregion 
