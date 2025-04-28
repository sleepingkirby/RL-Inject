import re

tab = " " * 4
newline = "\n"


def screens():
    with open("screens.rpy", "r") as file:
        screens = file.read()
    if "Cheats enabled!" in screens:
        return True

    mmBase = "Quit(confirm=False)"
    mmNew = (
        "%s\n\n    frame:\n        xalign .5"
        '\n        text("Cheats enabled!")\n' % mmBase
    )

    invBase = 'text "Inventory:" size 20'
    invNew = (
        '%s\n        textbutton "+ $1000" text_size 15'
        ' action SetField(Player, "Cash", Player.Cash + 1000)' % invBase
    )

    names = [
        "Player",
        "RogueX",
        "KittyX",
        "EmmaX",
        "LauraX",
        "JeanX",
        "StormX",
        "JubesX",
        "GwenX",
        "BetsyX",
        "DoreenX",
        "WandaX",
    ]

    for i in names:
        invLevel = (
            '\n        if %s.Lvl < 10:\n            textbutton "%s Max Level"'
            ' text_size 15 action [ SetField(%s, "Lvl", 10),'
            ' SetField(%s, "XP", 3330), SetField(%s, "StatPoints", 10) ]'
            % (i, (i[:-1] if i[-1] == "X" else i), i, i, i)
        )
        invNew += invLevel

    invNew += (
        '\n        if "Xavier\'s photo" not in Player.Inventory and "Xavier\'s files"'
        " not in Player.Inventory:"
        '\n            textbutton "Give Xavier Blackmail Items" text_size 15'
        ' action [ AddToSet(Player.Inventory, "Xavier\'s photo"),'
        ' AddToSet(Player.Inventory, ("Xavier\'s files")) ]'
    )

    clockBase = 'hover "images/Clockface.png" action NullAction()'
    clockNew = 'hover "images/Clockface.png" action SetVariable("Round", 100)'

    screens = (
        screens.replace(mmBase, mmNew)
        .replace(invBase, invNew)
        .replace(clockBase, clockNew)
    )

    objects = ["Partner", "UI_Focus"]

    for i in objects:
        lustBase = "value %s.Lust" % i
        lustNew = 'value FieldValue(%s, "Lust", 100)' % i

        loveBase = "value (%s.Love/10)" % i
        loveNew = 'value FieldValue(%s, "Love", 1000)' % i

        obedBase = "value (%s.Obed/10)" % i
        obedNew = 'value FieldValue(%s, "Obed", 1000)' % i

        inbtBase = "value (%s.Inbt/10)" % i
        inbtNew = 'value FieldValue(%s, "Inbt", 1000)' % i

        addictBase = "value %s.Addict" % i
        addictNew = 'value FieldValue(%s, "Addict", 100)' % i

        rateBase = "value (%s.Addictionrate*10)" % i
        rateNew = 'value FieldValue(%s, "Addictionrate", 10)' % i

        screens = (
            screens.replace(loveBase, loveNew)
            .replace(lustBase, lustNew)
            .replace(obedBase, obedNew)
            .replace(addictBase, addictNew)
            .replace(inbtBase, inbtNew)
            .replace(rateBase, rateNew)
        )

    focusBase = "value Player.Focus"
    focusNew = 'value FieldValue(Player, "Focus", 100)'

    semenBase = "value (Player.Semen*20)"
    semenNew = 'value FieldValue(Player, "Semen", 5)'

    screens = (
        screens.replace(focusBase, focusNew)
        .replace(focusBase, focusNew)
        .replace(semenBase, semenNew)
    )

    screens = re.sub(
        "        button:\n                #button to control whether cock is visible or not\n.*\n.*\n.*",
        "",
        screens,
    )

    screens = re.sub(
        "        button:\n                #button to reset semen\n.*\n.*\n.*",
        "",
        screens,
    )

    with open("screens.rpy", "w") as file:
        file.write(screens)

    return False


def options():
    with open("options.rpy", "r") as file:
        options = file.read()

    consoleBase = "config.developer = False"
    consoleNew = "%s\n    config.console = True" % consoleBase

    options = options.replace(consoleBase, consoleNew)

    with open("options.rpy", "w") as file:
        file.write(options)

    return


if screens():
    print(
        "Cheats have been detected!\nIf this is an unexpected error,"
        " please try again on a freshly unzipped version of Rogue-Like!"
    )
else:
    print(
        "\n  *****************************************"
        "\n    Enabling inventory and stat cheats...\n"
    )

    options()
    print("    Enabling developer console...\n")

    print(
        "    Success! Cheats are now enabled!"
        "\n  *****************************************"
    )
