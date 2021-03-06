/***************************************************************************
 *   Copyright (C) 2011 by Francesco Nwokeka <francesco.nwokeka@gmail.com> *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA            *
 ***************************************************************************/

import QtQuick 1.1
import org.kde.telepathy 0.1 as KTp
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.plasma.extras 0.1 as PlasmaExtras
import org.kde.plasma.core 0.1 as PlasmaCore


Item {
    id: contactListContainer
    anchors.fill: parent
    
    KTp.ContactList {
        id: contactList
    }
    
    PlasmaExtras.ScrollArea {
        anchors.fill: parent

        flickableItem: ListView {
            id: contactsList

            clip: true
            model: contactList.model
            boundsBehavior: Flickable.StopAtBounds

            delegate: ListContactDelegate {}
            focus: true
        }
    }
    
    Component.onCompleted: {
        contactList.model.presenceTypeFilterFlags = KTp.AccountsFilterModel.HideAllOffline
        contactList.model.sortRoleString = "presenceType"
    }
}
