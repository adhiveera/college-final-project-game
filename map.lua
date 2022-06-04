local MODULE = {}

-- End points
MODULE.DESTINATION_GREEN = { next = "over", object = {30, 240}, type = "end" }
MODULE.DESTINATION_BLUE = { next = "over", object = {110, 320}, type = "end" }
MODULE.DESTINATION_YELLOW = { next = "over", object = {110, 640}, type = "end" }
MODULE.DESTINATION_RED = { next = "over", object = {30, 560}, type = "end" }
MODULE.DESTINATION_PINK = { next = "over", object = {350, 640}, type = "end" }
MODULE.DESTINATION_ORANGE = { next = "over", object = {270, 560}, type = "end" }
MODULE.DESTINATION_PURPLE = { next = "over", object = {350, 160}, type = "end" }
MODULE.DESTINATION_WHITE = { next = "over", object = {270, 240}, type = "end"}

-- Two way junction points
MODULE.junction_tw_1 = { next = {{"o", 5}, {"o", 3}}, direction = 1, object = {190, 320}, type = "two-way" }
MODULE.junction_tw_3 = { next = {{"e", 3}, {"e", 4}}, direction = 1, object = {110, 560}, type = "two-way" }
MODULE.junction_tw_4 = { next = {{"e", 2}, {"e", 1}}, direction = 1, object = { 30, 320}, type = "two-way" }
MODULE.junction_tw_5 = { next = {{"o", 6}, {"o", 7}}, direction = 1, object = {270, 400}, type = "two-way" }
MODULE.junction_tw_6 = { next = {{"e", 7}, {"e", 8}}, direction = 1, object = {350, 240}, type = "two-way" }
MODULE.junction_tw_7 = { next = {{"e", 5}, {"e", 6}}, direction = 1, object = {350, 560}, type = "two-way" }
MODULE.junction_tw_2 = { next = {{"t", 3} ,{"o", 4}}, direction = 1, object = {110, 400}, type = "two-way" }

-- One way junction points

MODULE.JUNCTION_OW_8 = { next = {"t", 7}, object = {350, 480}, type = "one-way" }
MODULE.JUNCTION_OW_7 = { next = {"o", 8}, object = {270, 480}, type = "one-way" }
MODULE.JUNCTION_OW_6 = { next = {"t", 6}, object = {350, 400}, type = "one-way" }
MODULE.JUNCTION_OW_5 = { next = {"t", 5}, object = {270, 320}, type = "one-way" }
MODULE.JUNCTION_OW_4 = { next = {"t", 4}, object = { 30, 400}, type = "one-way" }
MODULE.JUNCTION_OW_3 = { next = {"t", 2}, object = {190, 400}, type = "one-way" }
MODULE.JUNCTION_OW_2 = { next = {"t", 1}, object = {190, 240}, type = "one-way" }
MODULE.JUNCTION_OW_1 = { next = {"o", 2}, object = {110, 240}, type = "one-way" }

MODULE.all_endpoints = { MODULE.DESTINATION_GREEN, MODULE.DESTINATION_BLUE, MODULE.DESTINATION_YELLOW, MODULE.DESTINATION_RED, MODULE.DESTINATION_PINK, MODULE.DESTINATION_ORANGE, MODULE.DESTINATION_PURPLE, MODULE.DESTINATION_WHITE }
MODULE.all_two_way_junctions = { MODULE.junction_tw_1, MODULE.junction_tw_2, MODULE.junction_tw_3, MODULE.junction_tw_4, MODULE.junction_tw_5, MODULE.junction_tw_6, MODULE.junction_tw_7 }
MODULE.all_one_way_junctions = { MODULE.JUNCTION_OW_1, MODULE.JUNCTION_OW_2, MODULE.JUNCTION_OW_1, MODULE.JUNCTION_OW_4, MODULE.JUNCTION_OW_5,MODULE.JUNCTION_OW_6, MODULE.JUNCTION_OW_7, MODULE.JUNCTION_OW_8 }

return MODULE