# Harbor update manifests

The browser checks for updates at

    https://raw.githubusercontent.com/Ivantech123/Harbor/updates/updates/browser/{target}/{channel}/update.xml

Each `update.xml` points at the signed MAR attached to the GitHub release
of that version. This branch is written by the release process
(`scripts/prepare_github_release.py`), do not edit it by hand.
