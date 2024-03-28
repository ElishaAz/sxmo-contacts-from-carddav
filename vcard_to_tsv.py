import phonenumbers as pn

NAME_TAG = "FN"
TEL_TAG = "TEL"


def name_and_numbers_from_vcard(vcard: str):
    name = ""
    numbers = list()

    lines = vcard.splitlines()
    for line in lines:
        parts = line.split(":")
        if len(parts) < 2:
            continue

        tag = parts[0]
        rest = parts[1]

        if tag == NAME_TAG:
            name = rest
        if tag.startswith("TEL"):
            for match in pn.PhoneNumberMatcher(rest, None):
                number = pn.format_number(match.number, pn.PhoneNumberFormat.E164)
                if number not in numbers:
                    numbers.append(number)
                print(line, number + "\t" + name)
    return name, numbers


def vcard_to_tsv(vcard: str):
    name, numbers = name_and_numbers_from_vcard(vcard)
    s = "\n".join(F"{number}\t{name}" for number in numbers)
    return s
