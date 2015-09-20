# ipython config

c = get_config()
c.TerminalIPythonApp.display_banner = False
c.TerminalInteractiveShell.separate_in = ''
c.TerminalInteractiveShell.confirm_exit = False
c.InteractiveShellApp.exec_lines = ["import numpy as np",
                                    "import la",
                                    "import bottleneck as bn"]
