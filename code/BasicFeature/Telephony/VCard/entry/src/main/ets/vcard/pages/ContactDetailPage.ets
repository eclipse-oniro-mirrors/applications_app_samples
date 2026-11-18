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

import { ContactAvatar, ContactSummary, InfoRow, SectionCard } from 'library';
import { ContactViewModel } from '../viewmodel/ContactViewModel';

const AVATAR_SIZE: number = 56;
const ACTION_HEIGHT: number = 44;

@ComponentV2
export struct ContactDetailPage {
  @Param vm: ContactViewModel = new ContactViewModel();
  @Event onBack: () => void = () => {
  };
  @Event onEdit: () => void = () => {
  };
  @Event onDeleted: () => void = () => {
  };

  private contact(): ContactSummary {
    return this.vm.selectedContact();
  }

  private displayName(): ResourceStr {
    const item: ContactSummary = this.contact();
    if (item.fullName.length > 0) {
      return item.fullName;
    }
    if (item.organization.length > 0) {
      return item.organization;
    }
    return $r('app.string.vc_unknown');
  }

  private subtitle(): string {
    const item: ContactSummary = this.contact();
    if (item.organization.length > 0 && item.jobTitle.length > 0) {
      return item.organization + ' · ' + item.jobTitle;
    }
    if (item.organization.length > 0) {
      return item.organization;
    }
    return item.jobTitle;
  }

  private emptyable(value: string): ResourceStr {
    return value.length > 0 ? value : $r('app.string.vc_detail_value_empty');
  }

  private firstOf(values: string[]): ResourceStr {
    if (values.length > 0 && values[0].length > 0) {
      return values[0];
    }
    return $r('app.string.vc_detail_value_empty');
  }

  private toast(message: ResourceStr): void {
    this.getUIContext().getPromptAction().showToast({ message: message, duration: 2000 });
  }

  private confirmDelete(): void {
    this.getUIContext().showAlertDialog({
      title: $r('app.string.vc_detail_delete_title'),
      message: $r('app.string.vc_detail_delete_message'),
      primaryButton: {
        value: $r('app.string.vc_action_cancel'),
        action: () => {
        }
      },
      secondaryButton: {
        value: $r('app.string.vc_action_delete'),
        fontColor: $r('app.color.danger'),
        action: () => {
          this.removeContact();
        }
      }
    });
  }

  private async removeContact(): Promise<void> {
    const ok: boolean = await this.vm.remove();
    if (ok) {
      this.toast($r('app.string.vc_detail_deleted'));
      this.onDeleted();
    } else {
      this.toast($r('app.string.vc_detail_delete_failed'));
    }
  }

  @Builder
  headerBar(): void {
    Row({ space: 8 }) {
      Button($r('app.string.vc_action_back'))
        .id('id_detail_back')
        .height(32)
        .fontSize('13fp')
        .fontColor($r('app.color.brand_primary'))
        .backgroundColor($r('app.color.brand_light'))
        .borderRadius(16)
        .padding({ left: 12, right: 12 })
        .onClick(() => {
          this.onBack();
        })

      Text($r('app.string.vc_detail_title'))
        .id('id_detail_title')
        .fontSize('20fp')
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.text_primary'))
        .maxLines(1)
        .layoutWeight(1)
    }
    .width('100%')
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  profileCard(): void {
    Row({ space: 12 }) {
      ContactAvatar({
        idValue: 'id_detail_avatar',
        name: this.contact().fullName,
        avatarSize: AVATAR_SIZE
      })

      Column({ space: 4 }) {
        Text(this.displayName())
          .id('id_detail_name')
          .fontSize('20fp')
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.text_primary'))
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .width('100%')

        if (this.subtitle().length > 0) {
          Text(this.subtitle())
            .id('id_detail_subtitle')
            .fontSize('13fp')
            .fontColor($r('app.color.text_secondary'))
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .width('100%')
        }
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
    }
    .id('id_detail_profile')
    .width('100%')
    .padding(16)
    .backgroundColor($r('app.color.card_bg'))
    .borderRadius(12)
    .alignItems(VerticalAlign.Center)
  }

  @Builder
  phoneSection(): void {
    SectionCard({
      idPrefix: 'id_detail_section_phone',
      title: $r('app.string.vc_detail_section_phone')
    }) {
      Text(this.firstOf(this.contact().phones))
        .id('id_detail_phone')
        .fontSize('15fp')
        .fontColor($r('app.color.text_primary'))
        .width('100%')
    }
  }

  @Builder
  emailSection(): void {
    SectionCard({
      idPrefix: 'id_detail_section_email',
      title: $r('app.string.vc_detail_section_email')
    }) {
      Text(this.firstOf(this.contact().emails))
        .id('id_detail_email')
        .fontSize('15fp')
        .fontColor($r('app.color.text_primary'))
        .width('100%')
    }
  }

  @Builder
  orgSection(): void {
    SectionCard({
      idPrefix: 'id_detail_section_org',
      title: $r('app.string.vc_detail_section_org')
    }) {
      Column({ space: 8 }) {
        InfoRow({
          idPrefix: 'id_detail_company_row',
          label: $r('app.string.vc_detail_label_company'),
          value: this.emptyable(this.contact().organization)
        })
        InfoRow({
          idPrefix: 'id_detail_job_row',
          label: $r('app.string.vc_detail_label_title'),
          value: this.emptyable(this.contact().jobTitle)
        })
      }
      .id('id_detail_org_rows')
      .width('100%')
    }
  }

  @Builder
  addressSection(): void {
    SectionCard({
      idPrefix: 'id_detail_section_address',
      title: $r('app.string.vc_detail_section_address')
    }) {
      InfoRow({
        idPrefix: 'id_detail_address_row',
        label: $r('app.string.vc_detail_section_address'),
        value: this.firstOf(this.contact().addresses),
        wrap: true
      })
    }
  }

  @Builder
  websiteSection(): void {
    SectionCard({
      idPrefix: 'id_detail_section_website',
      title: $r('app.string.vc_detail_section_website')
    }) {
      InfoRow({
        idPrefix: 'id_detail_website_row',
        label: $r('app.string.vc_detail_section_website'),
        value: this.firstOf(this.contact().websites),
        wrap: true
      })
    }
  }

  @Builder
  noteSection(): void {
    SectionCard({
      idPrefix: 'id_detail_section_note',
      title: $r('app.string.vc_detail_section_note')
    }) {
      InfoRow({
        idPrefix: 'id_detail_note_row',
        label: $r('app.string.vc_detail_section_note'),
        value: this.emptyable(this.contact().note),
        wrap: true
      })
    }
  }

  @Builder
  actionRow(): void {
    Row({ space: 12 }) {
      Button($r('app.string.vc_action_edit'))
        .id('id_detail_edit')
        .height(ACTION_HEIGHT)
        .fontSize('15fp')
        .fontColor($r('app.color.card_bg'))
        .backgroundColor($r('app.color.brand_primary'))
        .borderRadius(ACTION_HEIGHT / 2)
        .layoutWeight(1)
        .onClick(() => {
          this.onEdit();
        })

      Button($r('app.string.vc_action_delete'))
        .id('id_detail_delete')
        .height(ACTION_HEIGHT)
        .fontSize('15fp')
        .fontColor($r('app.color.danger'))
        .backgroundColor($r('app.color.fill_subtle'))
        .borderRadius(ACTION_HEIGHT / 2)
        .layoutWeight(1)
        .onClick(() => {
          if (this.vm.demoMode) {
            this.vm.remove();
          } else {
            this.confirmDelete();
          }
        })
    }
    .id('id_detail_actions')
    .width('100%')
  }

  @Builder
  errorBlock(): void {
    Column({ space: 4 }) {
      Text(this.vm.explainError().title)
        .id('id_detail_error_title')
        .fontSize('14fp')
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.danger'))
        .width('100%')
      Text(this.vm.explainError().reason)
        .id('id_detail_error')
        .fontSize('12fp')
        .fontColor($r('app.color.text_secondary'))
        .width('100%')
      Text(this.vm.explainError().suggestion)
        .id('id_detail_error_suggestion')
        .fontSize('12fp')
        .fontColor($r('app.color.text_tertiary'))
        .width('100%')
    }
    .id('id_detail_error_block')
    .width('100%')
    .padding(12)
    .backgroundColor($r('app.color.card_bg'))
    .borderRadius(12)
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    Column({ space: 12 }) {
      this.headerBar()

      Scroll() {
        Column({ space: 12 }) {
          this.profileCard()
          this.phoneSection()
          this.emailSection()
          this.orgSection()
          this.addressSection()
          this.websiteSection()
          this.noteSection()
          if (this.vm.errorCode !== 0) {
            this.errorBlock()
          }
          this.actionRow()
        }
        .width('100%')
        .padding({ bottom: 24 })
        .alignItems(HorizontalAlign.Start)
      }
      .id('id_detail_scroll')
      .width('100%')
      .layoutWeight(1)
      .align(Alignment.TopStart)
      .scrollBar(BarState.Off)
    }
    .id('id_detail_root')
    .width('100%')
    .height('100%')
    .padding({ left: 16, right: 16, top: 12 })
    .backgroundColor($r('app.color.page_bg'))
    .alignItems(HorizontalAlign.Start)
    .justifyContent(FlexAlign.Start)
  }
}
