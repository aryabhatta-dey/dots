from ranger.api.commands import Command

# ranger custom commands. https://github.com/ranger/ranger/wiki/Custom-Commands#fzf-integration
# have changed file command from the one given in the wiki to just use fzf. As fzf's default has been given as fd --hidden in zshenv, thta's what should be used

class fzf_select(Command):

    """
    :fzf_select
    Find a file using fzf.
    With a prefix argument select only directories.
    See: https://github.com/junegunn/fzf
    """

    def execute(self):

        import subprocess
        import os.path

        if self.quantifier:
            # match only directories
            command = "fzf"

        else:
            # match files and directories
            command = "fzf"

        fzf = self.fm.execute_command(
            command, universal_newlines=True, stdout=subprocess.PIPE
        )

        stdout, stderr = fzf.communicate()

        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.rstrip("\n"))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)
