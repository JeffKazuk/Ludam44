extends Area2D

var Boss
var boss

func _ready():
    Boss = preload('res://Scenes/Bosses/swordBoss/SwordBoss.tscn')
    boss = Boss.instance()

func _on_SwordBossActivator_body_entered(body):
    get_parent().add_child(boss)
    boss.position = get_parent().get_node('SwordBossCamera').position
    boss.connect('hit_player', get_parent().find_node('Player'), '_on_SwordBoss_hit_player')
    get_parent().get_node('Camera2D').target_name = 'SwordBossCamera'
    get_parent().get_node('Camera2D').zoom.x = 2
    get_parent().get_node('Camera2D').zoom.y = 2

func _on_SwordBossActivator_body_exited(body):
    get_parent().remove_child(boss)
    get_parent().get_node('Camera2D').target_name = 'Player'
    get_parent().get_node('Camera2D').zoom.x = 1
    get_parent().get_node('Camera2D').zoom.y = 1
    