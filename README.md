#################### READMEs ####################

WIN32YANK
WSL: make win32yank to install
LINUX: delete win32yank.vim when on linux, then run git update-index --skip-worktree win32yank.vim to make git ignore that it has been deleted


INSTALL NEOVIM
make [all]


ON SYSTEMS WHERE id_rsa refers to another user:
Save this as ~/.ssh/config
    # Be mindful of how markdown escapes _
    # Default GitHub account
    Host github.com
        HostName github.com
        User git
        IdentityFile ~/.ssh/id_rsa
        IdentitiesOnly yes

    # Second GitHub account
        Host github-ehaugw
        HostName github.com
        User git
        IdentityFile ~/.ssh/id_rsa_ehaugw
        IdentitiesOnly yes

Run this to use your secondary identity for the nvim repo
    git remote set-url origin git@github-ehaugw:ehaugw/nvim.git
