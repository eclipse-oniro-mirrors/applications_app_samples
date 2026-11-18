/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { common } from '@kit.AbilityKit';
import { ContactSummary } from 'library';
import { ContactViewModel } from './viewmodel/ContactViewModel';
import { ContactListPage } from './pages/ContactListPage';
import { ContactDetailPage } from './pages/ContactDetailPage';
import { ContactEditPage } from './pages/ContactEditPage';

const ROUTE_LIST: number = 0;
const ROUTE_DETAIL: number = 1;
const ROUTE_EDIT: number = 2;

/**
 * Contacts scenario host: owns the three-state route (list / detail / edit)
 * and the single view model instance shared by the three pages.
 */
@ComponentV2
export struct ContactsHost {
  @Param refreshToken: number = 0;
  @Local route: number = ROUTE_LIST;
  @Local vm: ContactViewModel = new ContactViewModel();

  aboutToAppear(): void {
    const context: common.Context = this.getUIContext().getHostContext() as common.Context;
    this.vm.setUIContext(this.getUIContext());
    this.vm.init(context);
  }

  @Monitor('refreshToken')
  onRefreshTokenChanged(monitor: IMonitor): void {
    this.vm.refresh();
  }

  private openDetail(contact: ContactSummary): void {
    this.vm.openDetail(contact);
    this.route = ROUTE_DETAIL;
  }

  private createContact(): void {
    if (this.vm.startCreate()) {
      this.route = ROUTE_EDIT;
    }
  }

  private editContact(): void {
    if (this.vm.startEdit()) {
      this.route = ROUTE_EDIT;
    }
  }

  private backToList(): void {
    this.route = ROUTE_LIST;
  }

  build() {
    Stack() {
      if (this.route === ROUTE_DETAIL) {
        ContactDetailPage({
          vm: this.vm,
          onBack: () => {
            this.backToList();
          },
          onEdit: () => {
            this.editContact();
          },
          onDeleted: () => {
            this.backToList();
          }
        })
      } else if (this.route === ROUTE_EDIT) {
        ContactEditPage({
          vm: this.vm,
          onCancel: () => {
            this.backToList();
          },
          onSaved: () => {
            this.backToList();
          }
        })
      } else {
        ContactListPage({
          vm: this.vm,
          onOpenDetail: (contact: ContactSummary) => {
            this.openDetail(contact);
          },
          onCreate: () => {
            this.createContact();
          }
        })
      }
    }
    .id('id_contacts_host')
    .width('100%')
    .height('100%')
  }
}
