from itertools import product
import random

combinations = list(product([0, 1], repeat=13))

combinations = [list(comb) for comb in combinations]

for comb in combinations:
    comb[0] = random.randint(0, 1)
    comb[1] = random.randint(0, 1)
    comb[2] = random.randint(0, 1)
    comb[3] = random.randint(0, 1)
    comb[4] = random.randint(0, 1)
    #comb[5] = random.randint(0, 1)
    comb[6] = random.randint(0, 1)
    comb[7] = random.randint(0, 1)
    comb[8] = random.randint(0, 1)
    comb[9] = random.randint(0, 1)
    comb[10] = random.randint(0, 1)
    #comb[11] = random.randint(0, 1)
    #comb[12] = random.randint(0, 1)

counter_triggers = 0
register_triggers = 0
outputs = -1
i = 1
for comb in combinations:
    xa = comb[0]
    xb = comb[1]
    xc = comb[2]
    xd = comb[3]
    gb = comb[4]
    cclrb = comb[5]
    loadb = comb[6]
    enpb = comb[7]
    entb = comb[8]
    r_cb = comb[9]
    u_db = comb[10]
    rckb = comb[11]
    cckb = comb[12]

    inputs = (xd << 3) | (xc << 2) | (xb << 1) | xa

    if i == 3:
        i += 0

    rcob = "1"

    if cclrb == 0:
        counter_triggers = 0

    if entb == 0:
        if u_db == 0:
            if counter_triggers == 0:
                rcob = "0"
            else:
                rcob = "1"
        else:
            if counter_triggers == 15:
                rcob = "0"
            else:
                rcob = "1"

    if r_cb == 0:
        outputs = counter_triggers
    else:
        outputs = register_triggers

    if cckb == 0:
        if loadb == 0:
            counter_triggers = inputs
        elif u_db == 0:
            if enpb == 0 and entb == 0:
                if counter_triggers == 0:
                    counter_triggers = 15
                else:
                    counter_triggers -= 1
        else:
            if enpb == 0 and entb == 0:
                if counter_triggers == 15:
                    counter_triggers = 0
                else:
                    counter_triggers += 1
    elif rckb == 0:
        register_triggers = counter_triggers

    if gb == 1:
        outputs = -1

    if outputs == -1:
        outputs_str = "Z Z Z Z"
    else:
        binary_representation = bin(outputs)[2:]
        outputs_str = ' '.join(
            ['1' if digit == '1' else '0' for digit in binary_representation.zfill(4)])

    # result = str(i) + " " + str(counter_triggers) + " " + inputs_str[::-1] + " " + f"({', '.join(map(str, comb))}) " + cck_rck + " " + outputs_str[::-1] + " " + rcob
    result = f"{' '.join(map(str, comb))} " + outputs_str[
                                                 ::-1] + " " + rcob
    print(result)
    i += 1
