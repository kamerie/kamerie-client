import imp
import os
from copy import deepcopy

from kamerie.template import TemplatePlugin
from subtitle_downloader.subtitle_provider import SubtitleProvider


class SubtitleDownloader(TemplatePlugin):

    def __init__(self, plugin_name):
        super(SubtitleDownloader, self).__init__(plugin_name)

        # provider handling
        self.providers = self.__dict__.get('settings', [])

    def on_message(self, message):
        for provider in self.providers:
            module = provider.get('module', '')
            expected_class = provider.get('class', '')

            try:
                py_mod = imp.load_source(module, os.getcwd())
                if hasattr(py_mod, expected_class):
                    settings = deepcopy(provider)
                    settings.pop('module')
                    settings.pop('class')
                    class_inst = getattr(py_mod, expected_class)(**settings)

                    if isinstance(class_inst, SubtitleProvider):
                        subtitles = class_inst.get_subtitles(message)
                        self.handle_result(subtitles)
                    else:
                        self._logger.error('%s is not a vialbe subtitle provider class' % expected_class)
                else:
                    self._logger.error('module {module} does not have a class called: {cls}'.
                                       format(module=module, cls=expected_class))
            except ImportError:
                self._logger.error('no module found: %s' % module)

    def handle_result(self, subs):
        pass