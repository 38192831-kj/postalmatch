import logging

from flask import request

from address import Address
from persistence.base_dao import BaseDAO


def main():
    data = {}
    message = ''
    status = False

    postal_codes_dao = BaseDAO('catalogue_postal_codes', 'd_codigo')
    states_dao = BaseDAO('state_abbreviations', "'state'")
    colonies_dao = BaseDAO('colony_type_abbreviations', 'colony_type')
    streets_dao = BaseDAO('street_type_abbreviations', 'street_type')
    commonterms_dao = BaseDAO('common_terms', 'term')

    try:
        input_data = request.json

        address_1 = Address(input_data.get('direccion_1', ''))

        values = []
        values += states_dao.get()
        values += colonies_dao.get()
        values += streets_dao.get()
        values += commonterms_dao.get()

        simply_values = set()

        for x in values:
            simply_values = simply_values.union(set(x.values()))

        simply_values = sorted(simply_values, key=len, reverse=True)

        address_1.clean(simply_values)

        if address_1.postal_code:
            results = postal_codes_dao.find(address_1.postal_code)
            address_1.identify(results)

        data['direccion_1'] = address_1.to_dict()
        data['direccion_2'] = {}
        data['resultado'] = 0.0

        if input_data.get('direccion_2', ''):
            address_2 = Address(input_data.get('direccion_2', ''))
            address_2.clean(simply_values)

            if address_2.postal_code:
                results_2 = postal_codes_dao.find(address_2.postal_code)
                address_2.identify(results_2)

            data['direccion_2'] = address_2.to_dict()
            data['resultado'] = address_1.compare(address_2)

        status = True
    except Exception as error:
        logging.exception(str(error))
        message = getattr(error, 'message', str(error))

    return {
            'status': status,
            'data': data,
            'message': message
        }
