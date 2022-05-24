local MODULE = {}

-- One way junction points
MODULE.JUNCTION_OW_2 = { next = MODULE.junction_tw_1, object = display.newRect(190, 240, 20, 20), type = "one-way" }
MODULE.JUNCTION_OW_3 = { next = MODULE.junction_tw_2, object = display.newRect(190, 400, 20, 20), type = "one-way" }
MODULE.JUNCTION_OW_4 = { next = MODULE.junction_tw_4, object = display.newRect( 30, 400, 20, 20), type = "one-way" }
MODULE.JUNCTION_OW_5 = { next = MODULE.junction_tw_5, object = display.newRect(270, 320, 20, 20), type = "one-way" }
MODULE.JUNCTION_OW_6 = { next = MODULE.junction_tw_6, object = display.newRect(350, 400, 20, 20), type = "one-way" }
MODULE.JUNCTION_OW_7 = { next = MODULE.JUNCTION_OW_8, object = display.newRect(270, 480, 20, 20), type = "one-way" }
MODULE.JUNCTION_OW_8 = { next = MODULE.junction_tw_7, object = display.newRect(350, 480, 20, 20), type = "one-way" }
MODULE.JUNCTION_OW_1 = { next = MODULE.JUNCTION_OW_2, object = display.newRect(110, 240, 20, 20), type = "one-way" }

-- End points
MODULE.DESTINATION_GREEN = { next = "over", object = display.newRect(30, 240, 20, 20), type = "end" }
MODULE.DESTINATION_BLUE = { next = "over", object = display.newRect(110, 320, 20, 20), type = "end" }
MODULE.DESTINATION_YELLOW = { next = "over", object = display.newRect(110, 640, 20, 20), type = "end" }
MODULE.DESTINATION_RED = { next = "over", object = display.newRect(30, 560, 20, 20), type = "end" }
MODULE.DESTINATION_PINK = { next = "over", object = display.newRect(350, 640, 20, 20), type = "end" }
MODULE.DESTINATION_ORANGE = { next = "over", object = display.newRect(270, 560, 20, 20), type = "end" }
MODULE.DESTINATION_PURPLE = { next = "over", object = display.newRect(350, 160, 20, 20), type = "end" }
MODULE.DESTINATION_WHITE = { next = "over", object = display.newRect(270, 240, 20, 20), type = "end"}

-- Two way junction points
MODULE.junction_tw_1 = { next = {MODULE.JUNCTION_OW_5, MODULE.JUNCTION_OW_3}, direction = 1, object = display.newRect(190, 320, 20, 20), type = "two-way" }
MODULE.junction_tw_2 = { next = {MODULE.junction_tw_3 ,MODULE.JUNCTION_OW_4}, direction = 1, object = display.newRect(110, 400, 20, 20), type = "two-way" }
MODULE.junction_tw_3 = { next = {MODULE.DESTINATION_YELLOW, MODULE.DESTINATION_RED}, direction = 1, object = display.newRect(110, 560, 20, 20), type = "two-way" }
MODULE.junction_tw_4 = { next = {MODULE.DESTINATION_BLUE, MODULE.DESTINATION_GREEN}, direction = 1, object = display.newRect( 30, 320, 20, 20), type = "two-way" }
MODULE.junction_tw_5 = { next = {MODULE.JUNCTION_OW_6, MODULE.JUNCTION_OW_7}, direction = 1, object = display.newRect(270, 400, 20, 20), type = "two-way" }
MODULE.junction_tw_6 = { next = {MODULE.DESTINATION_PURPLE, MODULE.DESTINATION_WHITE}, direction = 1, object = display.newRect(350, 240, 20, 20), type = "two-way" }
MODULE.junction_tw_7 = { next = {MODULE.DESTINATION_PINK, MODULE.DESTINATION_ORANGE}, direction = 1, object = display.newRect(350, 560, 20, 20), type = "two-way" }

MODULE.all_two_way_junctions = { MODULE.JUNCTION_OW_1, MODULE.JUNCTION_OW_2, MODULE.JUNCTION_OW_1, MODULE.JUNCTION_OW_4, MODULE.JUNCTION_OW_5,MODULE.JUNCTION_OW_6, MODULE.JUNCTION_OW_7, MODULE.JUNCTION_OW_8 }

return MODULE