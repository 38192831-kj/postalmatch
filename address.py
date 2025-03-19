import re
from distance import nlevenshtein
from slugify import slugify


class Address:
    """Clase utilizada para contener una dirección postal."""

    __POSTAL_CODE_PATTERN__ = '((?<!\\d)\\d{5}(?!\\d))'
    """Expresion utilizada para buscar el código postal en la dirección.

       (?<!\\d): Que el caracter anterior no sea un dígito

       \\d{5}: Que sean cinco dígitos seguidos.

       (?!\\d)): Que el caracter siguiente no sea un dígito.
    """

    original = ''
    """Texto original de la dirección postal."""
    cleaned = ''
    """Texto limpio de la dirección postal"""
    street_number = ''
    """Calle y número de la dirección postal."""
    colony_type = ''
    """Tipo de asentamiento de la dirección postal."""
    colony = ''
    """Colonia de la dirección postal."""
    postal_code = ''
    """Código Postal de la dirección postal."""
    municipality = ''
    """Municipio de la dirección postal."""
    state = ''
    """Estado de la dirección postal."""

    def __init__(self, address: str = ''):
        self.original = address
        self.__find_postal_code()

    def __find_postal_code(self):
        """Busca el código postal de la dirección."""
        results = re.findall(self.__POSTAL_CODE_PATTERN__, self.original)

        if len(results) > 0:
            self.postal_code = results[0]

    def clean(self, values: list[str]):
        self.cleaned = slugify(self.original.lower())

        for item in values:
            self.cleaned = re.sub(
                '((?<!\\w)' + slugify(item.lower()) + '(?!\\w))',
                '',
                self.cleaned
            )

        self.cleaned = slugify(self.cleaned.lower())

    def identify(self, colonies: list[dict[str, str]]):
        addr = self.cleaned.replace(self.postal_code, '')

        for col in colonies:
            colony_name = slugify(col.get("d_asenta").lower())
            if colony_name in addr:
                addr = addr.replace(colony_name, '')
                self.colony_type = col.get("d_tipo_asenta")
                self.colony = col.get("d_asenta")
                self.municipality = col.get("D_mnpio")
                self.state = col.get("d_estado")

                municipality = slugify(col.get("D_mnpio").lower())
                addr = addr.replace(municipality, '')
                self.cleaned = slugify(self.cleaned.replace(municipality, ''))

        self.street_number = slugify(addr, separator=' ').title()

    def compare(self, address2) -> float:
        if not isinstance(address2, Address):
            return 0.0

        if self.postal_code != '' and address2.postal_code != '':
            if self.postal_code != address2.postal_code:
                return 0.0

        # if self.colony != '' and address2.colony != '':
        #     if self.colony != address2.colony:
        #         return 0.0

        a1 = self.cleaned
        a2 = address2.cleaned

        result_1 = 1 - nlevenshtein(a1, a2)
        result_2 = 1 - nlevenshtein(a1.split('-'), a2.split('-'))

        return (result_1 + result_2) / 2

    def to_dict(self) -> dict:
        return {
            'original': self.original,
            # 'clean': self.cleaned,
            'street_number': self.street_number,
            'colony_type': self.colony_type,
            'colony': self.colony,
            'postal_code': self.postal_code,
            'municipality': self.municipality,
            'state': self.state,
        }
