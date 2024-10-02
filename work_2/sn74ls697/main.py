from itertools import product

# Генерация всех комбинаций длины 9 с элементами 0 и 1
combinations = list(product([0, 1], repeat=7))

inputs = 13
counter_triggers = 0
register_triggers = 0
outputs = -1
cck_rck = "0 1"
i = 1
for comb in combinations:
    if i == 33:
        i += 0
    rcob = "1"

    if comb[1] == 0:  # cclrb = 0
        counter_triggers = 0

    if comb[4] == 0:  # entb = 0
        if comb[6] == 0:  # u/db = 0
            if counter_triggers == 0:
                rcob = "0"
        else:
            if counter_triggers == 15:
                rcob = "0"

    if comb[5] == 0:  # r/cb = 0
        outputs = counter_triggers
    else:  # r/cb = 1
        outputs = register_triggers

    if cck_rck == "0 1":  # cck = 0
        cck_rck = "1 0"
        if comb[2] == 0:  # loadb = 0
            counter_triggers = inputs
        elif comb[6] == 0:  # u/db = 0
            if comb[3] == 0 and comb[4] == 0:  # enpb = 0, entb = 0
                if counter_triggers == 0:
                    counter_triggers = 15
                else:
                    counter_triggers -= 1
        else:  # u/db = 1
            if comb[3] == 0 and comb[4] == 0:  # enpb = 0, entb = 0
                if counter_triggers == 15:
                    counter_triggers = 0
                else:
                    counter_triggers += 1
    else:  # rck = 0
        cck_rck = "0 1"
        register_triggers = counter_triggers

    # if comb[1] == 0:  # cclrb = 0
    #     counter_triggers = 0
    #
    # if comb[4] == 0:  # entb = 0
    #     if comb[6] == 0:  # u/db = 0
    #         if counter_triggers == 0:
    #             rcob = "0"
    #     else:
    #         if counter_triggers == 15:
    #             rcob = "0"
    #
    # if comb[5] == 0:  # r/cb = 0
    #     outputs = counter_triggers
    # else:  # r/cb = 1
    #     outputs = register_triggers

    if comb[0] == 1:  # gb = 1
        outputs = -1

    binary_representation = bin(inputs)[2:]
    inputs_str = ' '.join(
        ['1' if digit == '1' else '0' for digit in binary_representation.zfill(4)])

    if outputs == -1:
        outputs_str = "Z Z Z Z"
    else:
        binary_representation = bin(outputs)[2:]
        outputs_str = ' '.join(
            ['1' if digit == '1' else '0' for digit in binary_representation.zfill(4)])

    #result = str(i) + " " + str(counter_triggers) + " " + inputs_str[::-1] + " " + f"({', '.join(map(str, comb))}) " + cck_rck + " " + outputs_str[::-1] + " " + rcob
    result = inputs_str[
             ::-1] + " " + f"({', '.join(map(str, comb))}) " + cck_rck + " " + outputs_str[
                                                                               ::-1] + " " + rcob
    print(result)
    i += 1

# 	      0  1	   2     3    4    5    6    7   8   9  10 11 12 13
# A B C D GB CCLRB LOADB ENPB ENTB R/CB U/DB RCK CCK QA QB QC QD RCOB
# 1 0 1 1
