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

import { ContactAvatar, ContactLoadState, ContactSummary, EmptyState } from 'library';
import { ContactViewModel } from '../viewmodel/ContactViewModel';

const AVATAR_SIZE: number = 44;
const BUTTON_HEIGHT: number = 32;

@ComponentV2
export struct ContactListPage {
  @Param vm: ContactViewModel = new ContactViewModel();
  @Event onOpenDetail: (contact: ContactSummary) => void = () => {
  };
  @Event onCreate: () => void = () => {
  };

  private displayName(contact: ContactSummary): ResourceStr {
    if (contact.fullName.length > 0) {
      return contact.fullName;
    }
    if (contact.organization.length > 0) {
      return contact.organization;
    }
    return $r('app.string.vc_unknown');
  }

  private orgLine(contact: ContactSummary): string {
    if (contact.organization.length > 0 && contact.jobTitle.length > 0) {
      return contact.organization + ' · ' + contact.jobTitle;
    }
    if (contact.organization.length > 0) {
      return contact.organization;
    }
    return contact.jobTitle;
  }

  private phoneLine(contact: ContactSummary): string {
    return contact.phones.length > 0 ? contact.phones[0] : '';
  }

  @Builder
  headerBar(): void {
    Row({ space: 8 }) {
      Column({ space: 2 }) {
        Text($r('app.string.vc_contacts_title'))
          .id('id_contacts_title')
          .fontSize('24fp')
          .fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.text_primary'))
          .maxLines(1)
        Text($r('app.string.vc_contacts_count', this.vm.filteredContacts.length))
          .id('id_contacts_count')
          .fontSize('12fp')
          .fontColor($r('app.color.text_secondary'))
          .maxLines(1)
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)

      Button($r('app.string.vc_action_refresh'))
        .id('id_contacts_refresh')
        .height(BUTTON_HEIGHT)
        .fontSize('13fp')
        .fontColor($r('app.color.brand_primary'))
        .backgroundColor($r('app.color.brand_light'))
        .borderRadius(BUTTON_HEIGHT / 2)
        .padding({ left: 12, right: 12 })
        .enabled(!this.vm.busy)
        .onClick(() => {
          this.vm.refresh();
        })

      Button($r('app.string.vc_contacts_add'))
        .id('id_contacts_add')
        .height(BUTTON_HEIGHT)
        .fontSize('13fp')
        .fontColor($r('app.color.brand_primary'))
        .backgroundColor($r('app.color.brand_light'))
        .borderRadius(BUTTON_HEIGHT / 2)
        .padding({ left: 12, right: 12 })
        .enabled(!this.vm.busy)
        .onClick(() => {
          this.onCreate();
        })
    }
    .width('100%')
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  searchBar(): void {
    TextInput({ text: this.vm.keyword, placeholder: $r('app.string.vc_contacts_search_hint') })
      .id('id_contacts_search')
      .type(InputType.Normal)
      .height(40)
      .fontSize('14fp')
      .backgroundColor($r('app.color.card_bg'))
      .borderRadius(10)
      .padding({ left: 12, right: 12 })
      .onChange((value: string) => {
        this.vm.search(value);
      })
  }

  @Builder
  loadingBlock(): void {
    Column({ space: 8 }) {
      LoadingProgress()
        .id('id_contacts_loading_progress')
        .width(32)
        .height(32)
        .color($r('app.color.brand_primary'))
      Text($r('app.string.vc_status_loading'))
        .id('id_contacts_loading_text')
        .fontSize('13fp')
        .fontColor($r('app.color.text_secondary'))
    }
    .id('id_contacts_loading')
    .width('100%')
    .padding({ top: 48 })
    .alignItems(HorizontalAlign.Center)
  }

  @Builder
  deniedBlock(): void {
    Column({ space: 12 }) {
      EmptyState({
        idPrefix: 'id_contacts_permission_empty',
        title: $r('app.string.vc_contacts_denied_title'),
        description: $r('app.string.vc_contacts_denied_desc')
      })

      Button($r('app.string.vc_action_request_permission'))
        .id('id_contacts_permission_button')
        .height(40)
        .fontSize('14fp')
        .fontColor($r('app.color.card_bg'))
        .backgroundColor($r('app.color.brand_primary'))
        .borderRadius(20)
        .padding({ left: 20, right: 20 })
        .enabled(!this.vm.busy)
        .onClick(() => {
          this.vm.requestPermission();
        })

      Column() {
        Button($r('app.string.vc_contacts_demo_load'))
          .id('id_contacts_demo_button')
          .height(40)
          .fontSize('14fp')
          .fontColor($r('app.color.brand_primary'))
          .backgroundColor($r('app.color.brand_light'))
          .borderRadius(20)
          .padding({ left: 20, right: 20 })
          .enabled(!this.vm.busy)
          .onClick(() => {
            this.vm.loadDemo();
          })
      }
      .id('id_contacts_demo')
      .width('100%')
      .alignItems(HorizontalAlign.Center)
    }
    .id('id_contacts_permission')
    .width('100%')
    .padding({ top: 16 })
    .alignItems(HorizontalAlign.Center)
  }

  @Builder
  errorBlock(): void {
    Column({ space: 12 }) {
      EmptyState({
        idPrefix: 'id_contacts_error_empty',
        title: $r('app.string.vc_contacts_error_title'),
        description: this.vm.explainError().reason
      })

      Button($r('app.string.vc_action_refresh'))
        .id('id_contacts_retry')
        .height(40)
        .fontSize('14fp')
        .fontColor($r('app.color.brand_primary'))
        .backgroundColor($r('app.color.brand_light'))
        .borderRadius(20)
        .padding({ left: 20, right: 20 })
        .onClick(() => {
          this.vm.refresh();
        })
    }
    .id('id_contacts_error')
    .width('100%')
    .alignItems(HorizontalAlign.Center)
  }

  @Builder
  demoBanner(): void {
    Row({ space: 8 }) {
      Text($r('app.string.vc_contacts_demo_banner'))
        .id('id_contacts_demo_banner')
        .fontSize('12fp')
        .fontColor($r('app.color.warning'))
        .lineHeight(18)
        .layoutWeight(1)
      Button($r('app.string.vc_contacts_demo_exit'))
        .id('id_contacts_demo_exit')
        .height(28)
        .fontSize('12fp')
        .fontColor($r('app.color.brand_primary'))
        .backgroundColor($r('app.color.brand_light'))
        .borderRadius(14)
        .padding({ left: 10, right: 10 })
        .onClick(() => {
          this.vm.exitDemo();
        })
    }
    .id('id_contacts_demo_banner_row')
    .width('100%')
    .padding(10)
    .backgroundColor($r('app.color.card_bg'))
    .borderRadius(10)
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  emptyBlock(): void {
    Column() {
      EmptyState({
        idPrefix: 'id_contacts_empty_state',
        title: $r('app.string.vc_contacts_empty_title'),
        description: $r('app.string.vc_contacts_empty_desc')
      })
    }
    .id('id_contacts_empty')
    .width('100%')
  }

  @Builder
  searchEmptyBlock(): void {
    Column() {
      Text($r('app.string.vc_contacts_search_empty'))
        .id('id_contacts_search_empty')
        .fontSize('14fp')
        .fontColor($r('app.color.text_secondary'))
    }
    .id('id_contacts_empty')
    .width('100%')
    .padding({ top: 40 })
    .alignItems(HorizontalAlign.Center)
  }

  @Builder
  contactList(): void {
    List({ space: 8 }) {
      Repeat<ContactSummary>(this.vm.filteredContacts)
        .each((item: RepeatItem<ContactSummary>) => {
          ListItem() {
            Row({ space: 12 }) {
              ContactAvatar({
                idValue: 'id_contact_avatar_' + item.index,
                name: item.item.fullName,
                avatarSize: AVATAR_SIZE
              })

              Column({ space: 3 }) {
                Text(this.displayName(item.item))
                  .id('id_contact_name_' + item.index)
                  .fontSize('16fp')
                  .fontWeight(FontWeight.Medium)
                  .fontColor($r('app.color.text_primary'))
                  .maxLines(1)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                  .width('100%')

                if (this.orgLine(item.item).length > 0) {
                  Text(this.orgLine(item.item))
                    .id('id_contact_org_' + item.index)
                    .fontSize('12fp')
                    .fontColor($r('app.color.text_secondary'))
                    .maxLines(1)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .width('100%')
                }

                if (this.phoneLine(item.item).length > 0) {
                  Text(this.phoneLine(item.item))
                    .id('id_contact_phone_' + item.index)
                    .fontSize('12fp')
                    .fontColor($r('app.color.text_tertiary'))
                    .maxLines(1)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .width('100%')
                }
              }
              .alignItems(HorizontalAlign.Start)
              .layoutWeight(1)
            }
            .id('id_contact_row_' + item.index)
            .width('100%')
            .padding(12)
            .backgroundColor($r('app.color.card_bg'))
            .borderRadius(12)
            .alignItems(VerticalAlign.Center)
          }
          .id('id_contact_item_' + item.index)
        })
        .key((item: ContactSummary, index: number): string => item.key + '_' + index)
    }
    .id('id_contacts_list')
    .width('100%')
    .layoutWeight(1)
    .scrollBar(BarState.Off)
  }

  @Builder
  readyBlock(): void {
    Column({ space: 12 }) {
      if (this.vm.demoMode) {
        this.demoBanner()
      }
      if (this.vm.contacts.length === 0) {
        this.emptyBlock()
      } else if (this.vm.filteredContacts.length === 0) {
        this.searchEmptyBlock()
      }
      this.contactList()
    }
    .id('id_contacts_ready')
    .width('100%')
    .layoutWeight(1)
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    Column({ space: 12 }) {
      this.headerBar()
      this.searchBar()

      if (this.vm.state === ContactLoadState.IDLE || this.vm.state === ContactLoadState.LOADING) {
        this.loadingBlock()
      } else if (this.vm.state === ContactLoadState.DENIED) {
        this.deniedBlock()
      } else if (this.vm.state === ContactLoadState.ERROR) {
        this.errorBlock()
      } else {
        this.readyBlock()
      }
    }
    .id('id_contacts_root')
    .width('100%')
    .height('100%')
    .padding({ left: 16, right: 16, top: 12 })
    .backgroundColor($r('app.color.page_bg'))
    .alignItems(HorizontalAlign.Start)
    .justifyContent(FlexAlign.Start)
  }
}
