# depends:
# * 20-util-env.gnupg.sh
# * 20-util-env.pass.sh
export DEV_PW="$(pass dev/default 2>/dev/null)"
