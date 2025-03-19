from abc import ABC, abstractmethod


class Engine(ABC):
    __connection__ = None

    @abstractmethod
    def get_cursor(self):
        pass

    @abstractmethod
    def connect(self):
        pass

    @abstractmethod
    def close(self):
        pass
