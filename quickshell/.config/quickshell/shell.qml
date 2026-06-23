//@ pragma UseQApplication

import Quickshell
import QtQuick
import qs.Bar

ShellRoot
{
	id: root
	Loader
	{
		active: true
		sourceComponent: Bar{}
	}
}
