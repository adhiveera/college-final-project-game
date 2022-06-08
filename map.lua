local MODULE = {}

-- End points
MODULE.DESTINATION_GREEN = { next = "over", coordinates = {125, 363}, type = "end", colour = "green"}
MODULE.DESTINATION_BLUE = { next = "over", coordinates = {292, 600}, type = "end", colour = "blue"}
MODULE.DESTINATION_YELLOW = { next = "over", coordinates = {236, 306}, type = "end", colour = "yellow"}
MODULE.DESTINATION_RED = { next = "over", coordinates = {69, 536}, type = "end", colour = "red"}
MODULE.DESTINATION_PINK = { next = "over", coordinates = {292, 247}, type = "end", colour = "pink"}
MODULE.DESTINATION_ORANGE = { next = "over", coordinates = {69, 303}, type = "end", colour = "orange"}
MODULE.DESTINATION_PURPLE = { next = "over", coordinates = {236, 536}, type = "end", colour = "purple"}
MODULE.DESTINATION_BROWN = { next = "over", coordinates = {125, 600}, type = "end", colour = "brown"}

MODULE.junction_tw_group = display.newGroup() 
-- Two way junction points
MODULE.junction_tw_1 = { next = {{"o", 5}, {"o", 3}}, direction = 1, coordinates = {179, 363}, type = "two-way", object = display.newImage(MODULE.junction_tw_group, "junction_point_right.png", 179, 363, 50, 50) }; MODULE.junction_tw_1.object.rotationDir = "rightDown"; MODULE.junction_tw_1.object.direction = 1;
MODULE.junction_tw_2 = { next = {{"o", 4}, {"t", 3}}, direction = 1, coordinates = {125, 420}, type = "two-way", object = display.newImage(MODULE.junction_tw_group, "junction_point_left.png", 125, 420, 50, 50) }; MODULE.junction_tw_2.object.rotationDir = "leftDown"; MODULE.junction_tw_2.object.direction = 1;
MODULE.junction_tw_3 = { next = {{"e", 5}, {"e", 6}}, direction = 1, coordinates = {125, 536}, type = "two-way", object = display.newImage(MODULE.junction_tw_group, "junction_point_left.png", 125, 536, 50, 50) }; MODULE.junction_tw_3.object.rotationDir = "leftDown"; MODULE.junction_tw_3.object.direction = 1;
MODULE.junction_tw_4 = { next = {{"e", 8}, {"e", 7}}, direction = 1, coordinates = { 69, 363}, type = "two-way", object = display.newImage(MODULE.junction_tw_group, "junction_point_right.png",  69, 363, 50, 50) }; MODULE.junction_tw_4.object.rotationDir = "rightUp"; MODULE.junction_tw_4.object.direction = 1; MODULE.junction_tw_4.object.rotation = -90;
MODULE.junction_tw_5 = { next = {{"o", 6}, {"o", 7}}, direction = 1, coordinates = {236, 420}, type = "two-way", object = display.newImage(MODULE.junction_tw_group, "junction_point_right.png", 236, 420, 50, 50) }; MODULE.junction_tw_5.object.rotationDir = "rightDown"; MODULE.junction_tw_5.object.direction = 1;
MODULE.junction_tw_6 = { next = {{"e", 3}, {"e", 4}}, direction = 1, coordinates = {292, 306}, type = "two-way", object = display.newImage(MODULE.junction_tw_group, "junction_point_left.png", 292, 306, 50, 50) }; MODULE.junction_tw_6.object.rotationDir = "leftUp"; MODULE.junction_tw_6.object.direction = 1;
MODULE.junction_tw_7 = { next = {{"e", 1}, {"e", 2}}, direction = 1, coordinates = {292, 536}, type = "two-way", object = display.newImage(MODULE.junction_tw_group, "junction_point_left.png", 292, 536, 50, 50) }; MODULE.junction_tw_7.object.rotationDir = "leftDown"; MODULE.junction_tw_7.object.direction = 1;

-- One way junction points
MODULE.JUNCTION_OW_8 = { next = {"t", 7}, coordinates = {292, 482}, type = "one-way" }
MODULE.JUNCTION_OW_7 = { next = {"o", 8}, coordinates = {236, 482}, type = "one-way" }
MODULE.JUNCTION_OW_6 = { next = {"t", 6}, coordinates = {292, 420}, type = "one-way" }
MODULE.JUNCTION_OW_5 = { next = {"t", 5}, coordinates = {236, 363}, type = "one-way" }
MODULE.JUNCTION_OW_4 = { next = {"t", 4}, coordinates = { 69, 420}, type = "one-way" }
MODULE.JUNCTION_OW_3 = { next = {"t", 2}, coordinates = {179, 420}, type = "one-way" }
MODULE.JUNCTION_OW_2 = { next = {"t", 1}, coordinates = {179, 303}, type = "one-way" }
MODULE.JUNCTION_OW_1 = { next = {"o", 2}, coordinates = {125, 303}, type = "one-way" }

MODULE.all_endpoints = { MODULE.DESTINATION_PURPLE, MODULE.DESTINATION_BLUE, MODULE.DESTINATION_YELLOW, MODULE.DESTINATION_PINK, MODULE.DESTINATION_RED, MODULE.DESTINATION_BROWN, MODULE.DESTINATION_GREEN, MODULE.DESTINATION_ORANGE, }
MODULE.all_two_way_junctions = { MODULE.junction_tw_1, MODULE.junction_tw_2, MODULE.junction_tw_3, MODULE.junction_tw_4, MODULE.junction_tw_5, MODULE.junction_tw_6, MODULE.junction_tw_7 }
MODULE.all_one_way_junctions = { MODULE.JUNCTION_OW_1, MODULE.JUNCTION_OW_2, MODULE.JUNCTION_OW_3, MODULE.JUNCTION_OW_4, MODULE.JUNCTION_OW_5, MODULE.JUNCTION_OW_6, MODULE.JUNCTION_OW_7, MODULE.JUNCTION_OW_8 }

return MODULE