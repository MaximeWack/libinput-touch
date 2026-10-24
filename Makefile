# Copyright (C) 2026 Maxime Wack
# This program is distributed under the terms of the GNU General Public License.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or any
# later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License at <http://www.gnu.org/licenses/> for more
# details.

pkgname=libinput-touch

all:
	@echo "Run 'sudo make install|remove'"

install:
	@echo "Installing ${pkgname}"
	@install -D -m755 "${pkgname}" "$(DESTDIR)/usr/bin/${pkgname}"
	@echo
	@echo "To use ${pkgname} you need to add yourself to the input group:"
	@echo '	sudo gpasswd -a $$USER input'

	@install -D -m644 "${pkgname}.service" "$(DESTDIR)/usr/lib/systemd/user/${pkgname}.service"
	@echo
	@echo 'Enable and start the systemd user service:'
	@echo "	systemctl --user enable ${pkgname} --now"
	@echo
	@echo 'Add any environment variable required by the commands you configured to:'
	@echo "	\$$HOME/.config/environment.d/${pkgname}.conf"
	@echo 'so that they are known to the user service, then run:'
	@echo '	systemctl --user daemon-reload'

	@install -D -m644 "${pkgname}.conf" "$(DESTDIR)/etc/${pkgname}.conf"
	@echo
	@echo 'Configuration files are at:'
	@echo "	/etc/${pkgname}.conf (system-wide default)"
	@echo "	\$$HOME/.config/${pkgname}.conf (optional per user)"
	@echo
	@echo "Modifying the configuration file automatically reloads ${pkgname}"

remove:
	@echo "Removing ${pkgname}"
	@echo
	@echo 'Remove yourself from the input group:'
	@echo '		sudo gpasswd -d $$USER input'

	@rm -rf "/usr/bin/${pkgname}"
	@rm -rf "/usr/lib/systemd/user/${pkgname}.service"
	@rm -rf "/etc/${pkgname}.conf"
