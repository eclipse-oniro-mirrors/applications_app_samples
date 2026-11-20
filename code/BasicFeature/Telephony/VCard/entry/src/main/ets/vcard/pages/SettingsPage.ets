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
import {
  ChipTone,
  createVersionChoices,
  InfoRow,
  SectionCard,
  StatusChip,
  VCardConstants,
  VersionChoice
} from 'library';
import { SettingsViewModel } from '../viewmodel/SettingsViewModel';

@ComponentV2
struct SettingsOptionChip {
  @Param idValue: string = '';
  @Param label: ResourceStr = '';
  @Param selected: boolean = false;
  @Event onSelect: () => void = () => {
  };

  build() {
    Text(this.label)
      .id(this.idValue)
      .fontSize('14fp')
      .fontColor(this.selected ? $r('app.color.brand_primary') : $r('app.color.text_secondary'))
      .backgroundColor(this.selected ? $r('app.color.brand_light') : $r('app.color.fill_subtle'))
      .borderRadius(16)
      .padding({ left: 14, right: 14, top: 7, bottom: 7 })
      .onClick(() => {
        this.onSelect();
      })
  }
}

@ComponentV2
export struct SettingsPage {
  @Local vm: SettingsViewModel = new SettingsViewModel();
  @Local versions: VersionChoice[] = createVersionChoices();

  aboutToAppear(): void {
    const context: common.Context = this.getUIContext().getHostContext() as common.Context;
    this.vm.init(context);
  }

  build() {
    Scroll() {
      Column({ space: 16 }) {
        this.header()
        this.vcardCard()
        this.permissionCard()
        this.dataCard()
        this.aboutCard()
      }
      .id('id_settings_content')
      .width('100%')
      .padding({ left: 16, right: 16, top: 12, bottom: 24 })
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Start)
    }
    .id('id_settings_root')
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.page_bg'))
    .align(Alignment.TopStart)
    .scrollBar(BarState.Off)
    .edgeEffect(EdgeEffect.Spring)
  }

  @Builder
  header(): void {
    Column({ space: 4 }) {
      Text($r('app.string.vc_settings_title'))
        .id('id_settings_page_title')
        .fontSize('22fp')
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.text_primary'))
        .width('100%')
      Text($r('app.string.vc_settings_subtitle'))
        .id('id_settings_page_subtitle')
        .fontSize('12fp')
        .fontColor($r('app.color.text_secondary'))
        .lineHeight('18fp')
        .width('100%')
    }
    .id('id_settings_header')
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  vcardCard(): void {
    SectionCard({
      idPrefix: 'id_settings_vcard',
      title: $r('app.string.vc_settings_section_vcard')
    }) {
      Column({ space: 10 }) {
        Text($r('app.string.vc_settings_default_version'))
          .id('id_settings_version_label')
          .fontSize('13fp')
          .fontColor($r('app.color.text_secondary'))
          .width('100%')
        Row({ space: 8 }) {
          Repeat<VersionChoice>(this.versions)
            .each((repeatItem: RepeatItem<VersionChoice>) => {
              SettingsOptionChip({
                idValue: this.versionId(repeatItem.item.value),
                label: repeatItem.item.label,
                selected: this.vm.settings.defaultVersion === repeatItem.item.value,
                onSelect: () => {
                  this.applySave(() => this.vm.updateVersion(repeatItem.item.value));
                }
              })
            })
            .key((item: VersionChoice) => item.label)
        }
        .id('id_settings_version_row')
        .width('100%')
        Text(this.versionDescription())
          .id('id_settings_version_desc')
          .fontSize('12fp')
          .fontColor($r('app.color.text_tertiary'))
          .lineHeight('18fp')
          .width('100%')

        Text($r('app.string.vc_settings_default_charset'))
          .id('id_settings_charset_label')
          .fontSize('13fp')
          .fontColor($r('app.color.text_secondary'))
          .width('100%')
        Row({ space: 8 }) {
          SettingsOptionChip({
            idValue: 'id_settings_charset_utf8',
            label: VCardConstants.CHARSET_UTF8,
            selected: this.vm.settings.defaultCharset === VCardConstants.CHARSET_UTF8,
            onSelect: () => {
              this.applySave(() => this.vm.updateCharset(VCardConstants.CHARSET_UTF8));
            }
          })
          SettingsOptionChip({
            idValue: 'id_settings_charset_gbk',
            label: VCardConstants.CHARSET_GBK,
            selected: this.vm.settings.defaultCharset === VCardConstants.CHARSET_GBK,
            onSelect: () => {
              this.applySave(() => this.vm.updateCharset(VCardConstants.CHARSET_GBK));
            }
          })
        }
        .id('id_settings_charset_row')
        .width('100%')

        Divider()
          .id('id_settings_vcard_divider')
          .strokeWidth('1vp')
          .color($r('app.color.divider'))

        Row({ space: 8 }) {
          Column({ space: 2 }) {
            Text($r('app.string.vc_settings_auto_jump'))
              .id('id_settings_auto_jump_label')
              .fontSize('14fp')
              .fontColor($r('app.color.text_primary'))
              .width('100%')
            Text(this.vm.settings.autoJumpToContacts ? $r('app.string.vc_settings_auto_jump_on') :
            $r('app.string.vc_settings_auto_jump_off'))
              .id('id_settings_auto_jump_state')
              .fontSize('12fp')
              .fontColor($r('app.color.text_secondary'))
              .width('100%')
          }
          .layoutWeight(1)
          .alignItems(HorizontalAlign.Start)

          Toggle({ type: ToggleType.Switch, isOn: this.vm.settings.autoJumpToContacts })
            .id('id_settings_auto_jump')
            .selectedColor($r('app.color.brand_primary'))
            .onChange((isOn: boolean) => {
              if (isOn !== this.vm.settings.autoJumpToContacts) {
                this.applySave(() => this.vm.updateAutoJump(isOn));
              }
            })
        }
        .id('id_settings_auto_jump_row')
        .width('100%')
        .alignItems(VerticalAlign.Center)

        Text($r('app.string.vc_settings_history_limit'))
          .id('id_settings_history_limit_label')
          .fontSize('13fp')
          .fontColor($r('app.color.text_secondary'))
          .width('100%')
        Row({ space: 8 }) {
          Repeat<number>(VCardConstants.HISTORY_LIMIT_OPTIONS)
            .each((repeatItem: RepeatItem<number>) => {
              SettingsOptionChip({
                idValue: 'id_settings_history_' + repeatItem.item,
                label: $r('app.string.vc_settings_history_limit_value', repeatItem.item),
                selected: this.vm.settings.historyLimit === repeatItem.item,
                onSelect: () => {
                  this.applySave(() => this.vm.updateHistoryLimit(repeatItem.item));
                }
              })
            })
            .key((item: number) => item.toString())
        }
        .id('id_settings_history_limit_row')
        .width('100%')
      }
      .id('id_settings_vcard_body')
      .width('100%')
      .alignItems(HorizontalAlign.Start)
    }
  }

  @Builder
  permissionCard(): void {
    SectionCard({
      idPrefix: 'id_settings_permission_card',
      title: $r('app.string.vc_settings_section_permission')
    }) {
      Column({ space: 10 }) {
        Row({ space: 8 }) {
          Text($r('app.string.vc_settings_permission'))
            .id('id_settings_permission_label')
            .fontSize('14fp')
            .fontColor($r('app.color.text_primary'))
            .layoutWeight(1)
            .textAlign(TextAlign.Start)
          StatusChip({
            idValue: 'id_settings_permission_state',
            text: this.vm.permissionGranted ? $r('app.string.vc_status_granted') :
            $r('app.string.vc_status_denied'),
            tone: this.vm.permissionGranted ? ChipTone.SUCCESS : ChipTone.DANGER
          })
        }
        .id('id_settings_permission_row')
        .width('100%')
        .alignItems(VerticalAlign.Center)

        Text($r('app.string.vc_settings_permission_acl'))
          .id('id_settings_permission_acl')
          .fontSize('12fp')
          .fontColor($r('app.color.text_secondary'))
          .lineHeight('18fp')
          .width('100%')
        Text($r('app.string.vc_acl_hint'))
          .id('id_settings_permission_acl_hint')
          .fontSize('12fp')
          .fontColor($r('app.color.text_tertiary'))
          .lineHeight('18fp')
          .width('100%')

        Button($r('app.string.vc_action_request_permission'))
          .id('id_settings_permission')
          .width('100%')
          .height(40)
          .fontSize('14fp')
          .fontColor($r('app.color.brand_primary'))
          .backgroundColor($r('app.color.brand_light'))
          .borderRadius(20)
          .onClick(() => {
            this.onRequestPermission();
          })
      }
      .id('id_settings_permission_body')
      .width('100%')
      .alignItems(HorizontalAlign.Start)
    }
  }

  @Builder
  dataCard(): void {
    SectionCard({
      idPrefix: 'id_settings_data',
      title: $r('app.string.vc_settings_section_data')
    }) {
      Column({ space: 10 }) {
        Text($r('app.string.vc_settings_clean_desc'))
          .id('id_settings_clean_desc')
          .fontSize('12fp')
          .fontColor($r('app.color.text_secondary'))
          .lineHeight('18fp')
          .width('100%')
        Button($r('app.string.vc_settings_clean'))
          .id('id_settings_clean')
          .width('100%')
          .height(40)
          .fontSize('14fp')
          .fontColor($r('app.color.danger'))
          .backgroundColor($r('app.color.fill_subtle'))
          .borderRadius(20)
          .onClick(() => {
            this.onClean();
          })
      }
      .id('id_settings_data_body')
      .width('100%')
      .alignItems(HorizontalAlign.Start)
    }
  }

  @Builder
  aboutCard(): void {
    SectionCard({
      idPrefix: 'id_settings_about',
      title: $r('app.string.vc_settings_section_about')
    }) {
      Column({ space: 8 }) {
        Text($r('app.string.vc_settings_about_desc'))
          .id('id_settings_about_desc')
          .fontSize('12fp')
          .fontColor($r('app.color.text_secondary'))
          .lineHeight('18fp')
          .width('100%')
        InfoRow({
          idPrefix: 'id_settings_about_api',
          label: $r('app.string.vc_settings_api_level'),
          value: this.vm.apiLevel.toString()
        })
        InfoRow({
          idPrefix: 'id_settings_about_bundle',
          label: $r('app.string.vc_settings_bundle'),
          value: this.vm.bundleName.length > 0 ? this.vm.bundleName : $r('app.string.vc_unknown'),
          wrap: true
        })
        InfoRow({
          idPrefix: 'id_settings_about_syscap',
          label: $r('app.string.vc_settings_syscap'),
          value: this.vm.syscapOk ? $r('app.string.vc_check_syscap_ok') : $r('app.string.vc_check_syscap_no'),
          valueColor: this.vm.syscapOk ? $r('app.color.success') : $r('app.color.warning'),
          wrap: true
        })
      }
      .id('id_settings_about_body')
      .width('100%')
      .alignItems(HorizontalAlign.Start)
    }
  }

  private versionId(value: number): string {
    if (value === 1) {
      return 'id_settings_version_30';
    }
    if (value === 2) {
      return 'id_settings_version_40';
    }
    return 'id_settings_version_21';
  }

  private versionDescription(): ResourceStr {
    for (const choice of this.versions) {
      if (choice.value === this.vm.settings.defaultVersion) {
        return choice.description;
      }
    }
    return '';
  }

  private toast(message: ResourceStr): void {
    this.getUIContext().getPromptAction().showToast({ message: message, duration: 2000 });
  }

  private async applySave(saving: () => Promise<boolean>): Promise<void> {
    const saved: boolean = await saving();
    if (saved) {
      this.toast($r('app.string.vc_settings_saved'));
    }
  }

  private async onRequestPermission(): Promise<void> {
    const granted: boolean = await this.vm.requestPermission();
    this.toast(granted ? $r('app.string.vc_permission_request_ok') :
    $r('app.string.vc_permission_request_partial'));
  }

  private async onClean(): Promise<void> {
    const removed: number = await this.vm.clean();
    this.toast(removed > 0 ? $r('app.string.vc_settings_clean_done', removed) :
    $r('app.string.vc_settings_clean_none'));
  }
}
