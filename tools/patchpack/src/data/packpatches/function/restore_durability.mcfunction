# Takes the unbreakable component off everything you are carrying, so gear made before this pack
# was installed wears out like anything else. Run it on yourself: /function packpatches:restore_durability
# Items come back at full durability rather than at some invented damage value.

tellraw @s {"text":"Restoring durability on carried items...","color":"gray"}

execute if items entity @s weapon.mainhand *[minecraft:unbreakable] run item modify entity @s weapon.mainhand packpatches:restore_durability
execute if items entity @s weapon.offhand *[minecraft:unbreakable] run item modify entity @s weapon.offhand packpatches:restore_durability
execute if items entity @s armor.head *[minecraft:unbreakable] run item modify entity @s armor.head packpatches:restore_durability
execute if items entity @s armor.chest *[minecraft:unbreakable] run item modify entity @s armor.chest packpatches:restore_durability
execute if items entity @s armor.legs *[minecraft:unbreakable] run item modify entity @s armor.legs packpatches:restore_durability
execute if items entity @s armor.feet *[minecraft:unbreakable] run item modify entity @s armor.feet packpatches:restore_durability

execute if items entity @s hotbar.0 *[minecraft:unbreakable] run item modify entity @s hotbar.0 packpatches:restore_durability
execute if items entity @s hotbar.1 *[minecraft:unbreakable] run item modify entity @s hotbar.1 packpatches:restore_durability
execute if items entity @s hotbar.2 *[minecraft:unbreakable] run item modify entity @s hotbar.2 packpatches:restore_durability
execute if items entity @s hotbar.3 *[minecraft:unbreakable] run item modify entity @s hotbar.3 packpatches:restore_durability
execute if items entity @s hotbar.4 *[minecraft:unbreakable] run item modify entity @s hotbar.4 packpatches:restore_durability
execute if items entity @s hotbar.5 *[minecraft:unbreakable] run item modify entity @s hotbar.5 packpatches:restore_durability
execute if items entity @s hotbar.6 *[minecraft:unbreakable] run item modify entity @s hotbar.6 packpatches:restore_durability
execute if items entity @s hotbar.7 *[minecraft:unbreakable] run item modify entity @s hotbar.7 packpatches:restore_durability
execute if items entity @s hotbar.8 *[minecraft:unbreakable] run item modify entity @s hotbar.8 packpatches:restore_durability

execute if items entity @s inventory.0 *[minecraft:unbreakable] run item modify entity @s inventory.0 packpatches:restore_durability
execute if items entity @s inventory.1 *[minecraft:unbreakable] run item modify entity @s inventory.1 packpatches:restore_durability
execute if items entity @s inventory.2 *[minecraft:unbreakable] run item modify entity @s inventory.2 packpatches:restore_durability
execute if items entity @s inventory.3 *[minecraft:unbreakable] run item modify entity @s inventory.3 packpatches:restore_durability
execute if items entity @s inventory.4 *[minecraft:unbreakable] run item modify entity @s inventory.4 packpatches:restore_durability
execute if items entity @s inventory.5 *[minecraft:unbreakable] run item modify entity @s inventory.5 packpatches:restore_durability
execute if items entity @s inventory.6 *[minecraft:unbreakable] run item modify entity @s inventory.6 packpatches:restore_durability
execute if items entity @s inventory.7 *[minecraft:unbreakable] run item modify entity @s inventory.7 packpatches:restore_durability
execute if items entity @s inventory.8 *[minecraft:unbreakable] run item modify entity @s inventory.8 packpatches:restore_durability
execute if items entity @s inventory.9 *[minecraft:unbreakable] run item modify entity @s inventory.9 packpatches:restore_durability
execute if items entity @s inventory.10 *[minecraft:unbreakable] run item modify entity @s inventory.10 packpatches:restore_durability
execute if items entity @s inventory.11 *[minecraft:unbreakable] run item modify entity @s inventory.11 packpatches:restore_durability
execute if items entity @s inventory.12 *[minecraft:unbreakable] run item modify entity @s inventory.12 packpatches:restore_durability
execute if items entity @s inventory.13 *[minecraft:unbreakable] run item modify entity @s inventory.13 packpatches:restore_durability
execute if items entity @s inventory.14 *[minecraft:unbreakable] run item modify entity @s inventory.14 packpatches:restore_durability
execute if items entity @s inventory.15 *[minecraft:unbreakable] run item modify entity @s inventory.15 packpatches:restore_durability
execute if items entity @s inventory.16 *[minecraft:unbreakable] run item modify entity @s inventory.16 packpatches:restore_durability
execute if items entity @s inventory.17 *[minecraft:unbreakable] run item modify entity @s inventory.17 packpatches:restore_durability
execute if items entity @s inventory.18 *[minecraft:unbreakable] run item modify entity @s inventory.18 packpatches:restore_durability
execute if items entity @s inventory.19 *[minecraft:unbreakable] run item modify entity @s inventory.19 packpatches:restore_durability
execute if items entity @s inventory.20 *[minecraft:unbreakable] run item modify entity @s inventory.20 packpatches:restore_durability
execute if items entity @s inventory.21 *[minecraft:unbreakable] run item modify entity @s inventory.21 packpatches:restore_durability
execute if items entity @s inventory.22 *[minecraft:unbreakable] run item modify entity @s inventory.22 packpatches:restore_durability
execute if items entity @s inventory.23 *[minecraft:unbreakable] run item modify entity @s inventory.23 packpatches:restore_durability
execute if items entity @s inventory.24 *[minecraft:unbreakable] run item modify entity @s inventory.24 packpatches:restore_durability
execute if items entity @s inventory.25 *[minecraft:unbreakable] run item modify entity @s inventory.25 packpatches:restore_durability
execute if items entity @s inventory.26 *[minecraft:unbreakable] run item modify entity @s inventory.26 packpatches:restore_durability

execute if items entity @s enderchest.0 *[minecraft:unbreakable] run item modify entity @s enderchest.0 packpatches:restore_durability
execute if items entity @s enderchest.1 *[minecraft:unbreakable] run item modify entity @s enderchest.1 packpatches:restore_durability
execute if items entity @s enderchest.2 *[minecraft:unbreakable] run item modify entity @s enderchest.2 packpatches:restore_durability
execute if items entity @s enderchest.3 *[minecraft:unbreakable] run item modify entity @s enderchest.3 packpatches:restore_durability
execute if items entity @s enderchest.4 *[minecraft:unbreakable] run item modify entity @s enderchest.4 packpatches:restore_durability
execute if items entity @s enderchest.5 *[minecraft:unbreakable] run item modify entity @s enderchest.5 packpatches:restore_durability
execute if items entity @s enderchest.6 *[minecraft:unbreakable] run item modify entity @s enderchest.6 packpatches:restore_durability
execute if items entity @s enderchest.7 *[minecraft:unbreakable] run item modify entity @s enderchest.7 packpatches:restore_durability
execute if items entity @s enderchest.8 *[minecraft:unbreakable] run item modify entity @s enderchest.8 packpatches:restore_durability
execute if items entity @s enderchest.9 *[minecraft:unbreakable] run item modify entity @s enderchest.9 packpatches:restore_durability
execute if items entity @s enderchest.10 *[minecraft:unbreakable] run item modify entity @s enderchest.10 packpatches:restore_durability
execute if items entity @s enderchest.11 *[minecraft:unbreakable] run item modify entity @s enderchest.11 packpatches:restore_durability
execute if items entity @s enderchest.12 *[minecraft:unbreakable] run item modify entity @s enderchest.12 packpatches:restore_durability
execute if items entity @s enderchest.13 *[minecraft:unbreakable] run item modify entity @s enderchest.13 packpatches:restore_durability
execute if items entity @s enderchest.14 *[minecraft:unbreakable] run item modify entity @s enderchest.14 packpatches:restore_durability
execute if items entity @s enderchest.15 *[minecraft:unbreakable] run item modify entity @s enderchest.15 packpatches:restore_durability
execute if items entity @s enderchest.16 *[minecraft:unbreakable] run item modify entity @s enderchest.16 packpatches:restore_durability
execute if items entity @s enderchest.17 *[minecraft:unbreakable] run item modify entity @s enderchest.17 packpatches:restore_durability
execute if items entity @s enderchest.18 *[minecraft:unbreakable] run item modify entity @s enderchest.18 packpatches:restore_durability
execute if items entity @s enderchest.19 *[minecraft:unbreakable] run item modify entity @s enderchest.19 packpatches:restore_durability
execute if items entity @s enderchest.20 *[minecraft:unbreakable] run item modify entity @s enderchest.20 packpatches:restore_durability
execute if items entity @s enderchest.21 *[minecraft:unbreakable] run item modify entity @s enderchest.21 packpatches:restore_durability
execute if items entity @s enderchest.22 *[minecraft:unbreakable] run item modify entity @s enderchest.22 packpatches:restore_durability
execute if items entity @s enderchest.23 *[minecraft:unbreakable] run item modify entity @s enderchest.23 packpatches:restore_durability
execute if items entity @s enderchest.24 *[minecraft:unbreakable] run item modify entity @s enderchest.24 packpatches:restore_durability
execute if items entity @s enderchest.25 *[minecraft:unbreakable] run item modify entity @s enderchest.25 packpatches:restore_durability
execute if items entity @s enderchest.26 *[minecraft:unbreakable] run item modify entity @s enderchest.26 packpatches:restore_durability

tellraw @s {"text":"Done. Anything still unbreakable is in a chest somewhere, not on you.","color":"gray"}
