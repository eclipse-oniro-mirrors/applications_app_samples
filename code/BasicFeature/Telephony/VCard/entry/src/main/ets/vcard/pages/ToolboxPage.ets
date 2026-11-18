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
  CapabilityCheck,
  ChipTone,
  ContactSummary,
  createVersionChoices,
  Formatter,
  InfoRow,
  PermissionState,
  SectionCard,
  StatusChip,
  VCardCard,
  VCardConstants,
  VersionChoice
} from 'library';
import { ToolboxViewModel } from '../viewmodel/ToolboxViewModel';

const PREVIEW_CARD_COUNT: number = 3;
const AUTO_JUMP_DELAY: number = 300;
const PICKER_LIST_HEIGHT: number = 220;

@ComponentV2
struct ToolboxOptionChip {
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
export struct ToolboxPage {
  @Event onOpenContacts: () => void = () => {
  };
  @Local vm: ToolboxViewModel = new ToolboxViewModel();
  @Local versions: VersionChoice[] = createVersionChoices();

  aboutToAppear(): void {
    const context: common.Context = this.getUIContext().getHostContext() as common.Context;
    this.vm.init(context);
  }

  build() {
    Scroll() {
      Column({ space: 16 }) {
        this.header()
        this.permissionCard()
        this.importCard()
        this.exportCard()
      }
      .id('id_toolbox_content')
      .width('100%')
      .padding({ left: 16, right: 16, top: 12, bottom: 24 })
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Start)
    }
    .id('id_toolbox_root')
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
      Text($r('app.string.vc_toolbox_title'))
        .id('id_toolbox_page_title')
        .fontSize('22fp')
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.text_primary'))
        .width('100%')
      Text($r('app.string.vc_toolbox_subtitle'))
        .id('id_toolbox_page_subtitle')
        .fontSize('12fp')
        .fontColor($r('app.color.text_secondary'))
        .lineHeight('18fp')
        .width('100%')
    }
    .id('id_toolbox_header')
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  permissionCard(): void {
    SectionCard({
      idPrefix: 'id_toolbox_permission_card',
      title: $r('app.string.vc_toolbox_permission_title')
    }) {
      Column({ space: 10 }) {
        Row({ space: 8 }) {
          StatusChip({
            idValue: 'id_toolbox_permission_state',
            text: this.vm.permissionGranted ? $r('app.string.vc_status_granted') :
            $r('app.string.vc_status_denied'),
            tone: this.vm.permissionGranted ? ChipTone.SUCCESS : ChipTone.DANGER
          })
          Text(this.vm.permissionGranted ? $r('app.string.vc_toolbox_permission_granted') :
          $r('app.string.vc_toolbox_permission_denied'))
            .id('id_toolbox_permission_hint')
            .fontSize('12fp')
            .fontColor($r('app.color.text_secondary'))
            .layoutWeight(1)
        }
        .id('id_toolbox_permission_summary')
        .width('100%')
        .alignItems(VerticalAlign.Center)

        Repeat<CapabilityCheck>(this.vm.capabilities)
          .each((repeatItem: RepeatItem<CapabilityCheck>) => {
            Column({ space: 4 }) {
              Row({ space: 8 }) {
                Text(repeatItem.item.name)
                  .id('id_toolbox_cap_name_' + repeatItem.index)
                  .fontSize('14fp')
                  .fontColor($r('app.color.text_primary'))
                  .layoutWeight(1)
                  .textAlign(TextAlign.Start)
                StatusChip({
                  idValue: 'id_toolbox_cap_state_' + repeatItem.item.key,
                  text: repeatItem.item.supported ? $r('app.string.vc_status_supported') :
                  $r('app.string.vc_status_unsupported'),
                  tone: repeatItem.item.supported ? ChipTone.SUCCESS : ChipTone.WARNING
                })
              }
              .id('id_toolbox_cap_row_' + repeatItem.index)
              .width('100%')
              .alignItems(VerticalAlign.Center)

              InfoRow({
                idPrefix: 'id_toolbox_cap_' + repeatItem.item.key,
                label: repeatItem.item.name,
                value: repeatItem.item.detail,
                wrap: true
              })
            }
            .id('id_toolbox_cap_item_' + repeatItem.index)
            .width('100%')
            .alignItems(HorizontalAlign.Start)
          })
          .key((item: CapabilityCheck) => item.key)

        Repeat<PermissionState>(this.vm.permissionStates)
          .each((repeatItem: RepeatItem<PermissionState>) => {
            InfoRow({
              idPrefix: 'id_toolbox_permission_' + repeatItem.index,
              label: repeatItem.item.name,
              value: repeatItem.item.granted ? $r('app.string.vc_status_granted') :
              $r('app.string.vc_status_denied'),
              valueColor: repeatItem.item.granted ? $r('app.color.success') : $r('app.color.danger')
            })
          })
          .key((item: PermissionState) => item.name)

        Text($r('app.string.vc_toolbox_permission_acl'))
          .id('id_toolbox_permission_acl')
          .fontSize('12fp')
          .fontColor($r('app.color.text_tertiary'))
          .lineHeight('18fp')
          .width('100%')

        Button($r('app.string.vc_action_request_permission'))
          .id('id_toolbox_permission')
          .width('100%')
          .height(40)
          .fontSize('14fp')
          .fontColor($r('app.color.card_bg'))
          .backgroundColor($r('app.color.brand_primary'))
          .borderRadius(20)
          .enabled(!this.vm.busy)
          .onClick(() => {
            this.onRequestPermission();
          })
      }
      .id('id_toolbox_permission_body')
      .width('100%')
      .alignItems(HorizontalAlign.Start)
    }
  }

  @Builder
  importCard(): void {
    SectionCard({
      idPrefix: 'id_toolbox_import_section',
      title: $r('app.string.vc_import_title'),
      subtitle: $r('app.string.vc_import_desc')
    }) {
      Column({ space: 12 }) {
        Row({ space: 12 }) {
          Button($r('app.string.vc_import_pick'))
            .id('id_toolbox_pick')
            .layoutWeight(1)
            .height(40)
            .fontSize('14fp')
            .fontColor($r('app.color.brand_primary'))
            .backgroundColor($r('app.color.brand_light'))
            .borderRadius(20)
            .enabled(!this.vm.busy)
            .onClick(() => {
              this.onPick();
            })
          Button($r('app.string.vc_import_sample'))
            .id('id_toolbox_sample')
            .layoutWeight(1)
            .height(40)
            .fontSize('14fp')
            .fontColor($r('app.color.brand_primary'))
            .backgroundColor($r('app.color.brand_light'))
            .borderRadius(20)
            .enabled(!this.vm.busy)
            .onClick(() => {
              this.onSample();
            })
        }
        .id('id_toolbox_import_actions')
        .width('100%')

        Column({ space: 6 }) {
          if (!this.vm.hasPreview) {
            Text($r('app.string.vc_import_preview_empty'))
              .id('id_toolbox_preview_empty')
              .fontSize('13fp')
              .fontColor($r('app.color.text_secondary'))
              .width('100%')
          } else {
            InfoRow({
              idPrefix: 'id_toolbox_preview_name',
              label: $r('app.string.vc_import_file_name'),
              value: this.vm.preview.fileName
            })
            InfoRow({
              idPrefix: 'id_toolbox_preview_size',
              label: $r('app.string.vc_import_file_size'),
              value: Formatter.bytes(this.vm.preview.sizeBytes)
            })
            InfoRow({
              idPrefix: 'id_toolbox_preview_version',
              label: $r('app.string.vc_import_version'),
              value: this.vm.preview.versionText
            })
            InfoRow({
              idPrefix: 'id_toolbox_preview_cards',
              label: $r('app.string.vc_import_cards'),
              value: this.vm.preview.cardCount.toString()
            })
            InfoRow({
              idPrefix: 'id_toolbox_preview_phones',
              label: $r('app.string.vc_import_phones'),
              value: this.vm.preview.phoneCount.toString()
            })
            InfoRow({
              idPrefix: 'id_toolbox_preview_emails',
              label: $r('app.string.vc_import_emails'),
              value: this.vm.preview.emailCount.toString()
            })
            InfoRow({
              idPrefix: 'id_toolbox_preview_orgs',
              label: $r('app.string.vc_import_orgs'),
              value: this.vm.preview.organizationCount.toString()
            })
            InfoRow({
              idPrefix: 'id_toolbox_preview_addresses',
              label: $r('app.string.vc_import_addresses'),
              value: this.vm.preview.addressCount.toString()
            })

            Divider()
              .id('id_toolbox_preview_divider')
              .strokeWidth('1vp')
              .color($r('app.color.divider'))
              .margin({ top: 4, bottom: 4 })

            Repeat<VCardCard>(this.vm.preview.cards.slice(0, PREVIEW_CARD_COUNT))
              .each((repeatItem: RepeatItem<VCardCard>) => {
                Row({ space: 8 }) {
                  Text(repeatItem.item.fullName)
                    .id('id_toolbox_preview_card_name_' + repeatItem.index)
                    .fontSize('14fp')
                    .fontColor($r('app.color.text_primary'))
                    .layoutWeight(1)
                    .maxLines(1)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .textAlign(TextAlign.Start)
                  Text(this.firstPhone(repeatItem.item))
                    .id('id_toolbox_preview_card_phone_' + repeatItem.index)
                    .fontSize('13fp')
                    .fontColor($r('app.color.text_secondary'))
                    .maxLines(1)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                }
                .id('id_toolbox_preview_card_' + repeatItem.index)
                .width('100%')
              })
              .key((item: VCardCard, index: number) => index.toString())

            if (this.vm.preview.cardCount > this.vm.preview.cards.length) {
              Text($r('app.string.vc_import_preview_more', this.vm.preview.cards.length))
                .id('id_toolbox_preview_more')
                .fontSize('12fp')
                .fontColor($r('app.color.text_tertiary'))
                .width('100%')
            }
          }
        }
        .id('id_toolbox_preview')
        .width('100%')
        .padding(12)
        .backgroundColor($r('app.color.fill_subtle'))
        .borderRadius(10)
        .alignItems(HorizontalAlign.Start)

        Button($r('app.string.vc_import_start'))
          .id('id_toolbox_import')
          .width('100%')
          .height(40)
          .fontSize('14fp')
          .fontColor($r('app.color.card_bg'))
          .backgroundColor($r('app.color.brand_primary'))
          .borderRadius(20)
          .enabled(!this.vm.busy)
          .onClick(() => {
            this.onImport();
          })

        if (this.vm.hasImportResult) {
          Column({ space: 4 }) {
            Text(this.vm.importResult.success ?
              $r('app.string.vc_import_success', this.vm.importResult.cardCount) :
              $r('app.string.vc_import_failed', this.vm.importResult.code))
              .id('id_toolbox_import_message')
              .fontSize('14fp')
              .fontWeight(FontWeight.Medium)
              .fontColor(this.vm.importResult.success ? $r('app.color.success') : $r('app.color.danger'))
              .width('100%')
            if (!this.vm.importResult.success) {
              Text(this.vm.importExplain.reason)
                .id('id_toolbox_import_reason')
                .fontSize('12fp')
                .fontColor($r('app.color.text_secondary'))
                .lineHeight('18fp')
                .width('100%')
              Text(this.vm.importExplain.suggestion)
                .id('id_toolbox_import_suggestion')
                .fontSize('12fp')
                .fontColor($r('app.color.text_tertiary'))
                .lineHeight('18fp')
                .width('100%')
            }
          }
          .id('id_toolbox_import_result')
          .width('100%')
          .padding(10)
          .backgroundColor($r('app.color.fill_subtle'))
          .borderRadius(8)
          .alignItems(HorizontalAlign.Start)
        }
      }
      .id('id_toolbox_import_body')
      .width('100%')
      .alignItems(HorizontalAlign.Start)
    }
  }

  @Builder
  exportCard(): void {
    SectionCard({
      idPrefix: 'id_toolbox_export_section',
      title: $r('app.string.vc_export_title'),
      subtitle: $r('app.string.vc_export_desc')
    }) {
      Column({ space: 12 }) {
        Text($r('app.string.vc_export_scope'))
          .id('id_toolbox_scope_label')
          .fontSize('13fp')
          .fontColor($r('app.color.text_secondary'))
          .width('100%')

        Row({ space: 12 }) {
          ToolboxOptionChip({
            idValue: 'id_toolbox_scope_all',
            label: $r('app.string.vc_export_scope_all'),
            selected: this.vm.scopeAll,
            onSelect: () => {
              this.vm.setScope(true);
            }
          })
          ToolboxOptionChip({
            idValue: 'id_toolbox_scope_selected',
            label: $r('app.string.vc_export_scope_selected'),
            selected: !this.vm.scopeAll,
            onSelect: () => {
              this.vm.setScope(false);
            }
          })
        }
        .id('id_toolbox_scope_row')
        .width('100%')

        if (!this.vm.scopeAll) {
          Row({ space: 8 }) {
            Text(this.vm.selectedIds.length > 0 ?
              $r('app.string.vc_export_selected_count', this.vm.selectedIds.length) :
              $r('app.string.vc_export_selected_empty'))
              .id('id_toolbox_selected_count')
              .fontSize('13fp')
              .fontColor($r('app.color.text_secondary'))
              .layoutWeight(1)
            Button($r('app.string.vc_export_pick_contacts'))
              .id('id_toolbox_picker_open')
              .height(32)
              .fontSize('12fp')
              .fontColor($r('app.color.brand_primary'))
              .backgroundColor($r('app.color.brand_light'))
              .borderRadius(16)
              .padding({ left: 12, right: 12 })
              .onClick(() => {
                this.vm.openPicker();
              })
          }
          .id('id_toolbox_selected_row')
          .width('100%')
          .alignItems(VerticalAlign.Center)
        }

        if (this.vm.showPicker) {
          Column({ space: 8 }) {
            Text($r('app.string.vc_picker_title'))
              .id('id_toolbox_picker_title')
              .fontSize('14fp')
              .fontWeight(FontWeight.Medium)
              .fontColor($r('app.color.text_primary'))
              .width('100%')
            if (this.vm.contacts.length === 0) {
              Text($r('app.string.vc_picker_empty'))
                .id('id_toolbox_picker_empty')
                .fontSize('13fp')
                .fontColor($r('app.color.text_secondary'))
                .width('100%')
            } else {
              List({ space: 2 }) {
                Repeat<ContactSummary>(this.vm.contacts)
                  .each((repeatItem: RepeatItem<ContactSummary>) => {
                    ListItem() {
                      Row({ space: 8 }) {
                        Checkbox()
                          .id('id_toolbox_picker_item_' + repeatItem.item.id)
                          .select(this.isSelected(repeatItem.item.id))
                          .selectedColor($r('app.color.brand_primary'))
                          .onChange((isOn: boolean) => {
                            if (isOn !== this.isSelected(repeatItem.item.id)) {
                              this.vm.toggleContact(repeatItem.item.id);
                            }
                          })
                        Column({ space: 2 }) {
                          Text(repeatItem.item.fullName)
                            .fontSize('14fp')
                            .fontColor($r('app.color.text_primary'))
                            .maxLines(1)
                            .textOverflow({ overflow: TextOverflow.Ellipsis })
                            .width('100%')
                          Text(this.firstContactPhone(repeatItem.item))
                            .fontSize('12fp')
                            .fontColor($r('app.color.text_secondary'))
                            .maxLines(1)
                            .textOverflow({ overflow: TextOverflow.Ellipsis })
                            .width('100%')
                        }
                        .layoutWeight(1)
                        .alignItems(HorizontalAlign.Start)
                      }
                      .width('100%')
                      .padding({ top: 6, bottom: 6 })
                      .alignItems(VerticalAlign.Center)
                    }
                  })
                  .key((item: ContactSummary) => item.key)
              }
              .id('id_toolbox_picker_list')
              .width('100%')
              .height(PICKER_LIST_HEIGHT)
              .scrollBar(BarState.Auto)
              .divider({ strokeWidth: 1, color: $r('app.color.divider') })
            }
            Button($r('app.string.vc_picker_confirm'))
              .id('id_toolbox_picker_confirm')
              .width('100%')
              .height(38)
              .fontSize('14fp')
              .fontColor($r('app.color.card_bg'))
              .backgroundColor($r('app.color.brand_primary'))
              .borderRadius(19)
              .onClick(() => {
                this.vm.confirmPicker();
              })
          }
          .id('id_toolbox_picker')
          .width('100%')
          .padding(12)
          .backgroundColor($r('app.color.fill_subtle'))
          .borderRadius(10)
          .alignItems(HorizontalAlign.Start)
        }

        Text($r('app.string.vc_export_version'))
          .id('id_toolbox_version_label')
          .fontSize('13fp')
          .fontColor($r('app.color.text_secondary'))
          .width('100%')
        Row({ space: 8 }) {
          Repeat<VersionChoice>(this.versions)
            .each((repeatItem: RepeatItem<VersionChoice>) => {
              ToolboxOptionChip({
                idValue: this.versionId(repeatItem.item.value),
                label: repeatItem.item.label,
                selected: this.vm.version === repeatItem.item.value,
                onSelect: () => {
                  this.vm.setVersion(repeatItem.item.value);
                }
              })
            })
            .key((item: VersionChoice) => item.label)
        }
        .id('id_toolbox_version_row')
        .width('100%')
        Text(this.versionDescription())
          .id('id_toolbox_version_desc')
          .fontSize('12fp')
          .fontColor($r('app.color.text_tertiary'))
          .lineHeight('18fp')
          .width('100%')

        Text($r('app.string.vc_export_charset'))
          .id('id_toolbox_charset_label')
          .fontSize('13fp')
          .fontColor($r('app.color.text_secondary'))
          .width('100%')
        Row({ space: 8 }) {
          ToolboxOptionChip({
            idValue: 'id_toolbox_charset_utf8',
            label: VCardConstants.CHARSET_UTF8,
            selected: this.vm.charset === VCardConstants.CHARSET_UTF8,
            onSelect: () => {
              this.vm.setCharset(VCardConstants.CHARSET_UTF8);
            }
          })
          ToolboxOptionChip({
            idValue: 'id_toolbox_charset_gbk',
            label: VCardConstants.CHARSET_GBK,
            selected: this.vm.charset === VCardConstants.CHARSET_GBK,
            onSelect: () => {
              this.vm.setCharset(VCardConstants.CHARSET_GBK);
            }
          })
        }
        .id('id_toolbox_charset_row')
        .width('100%')

        Row({ space: 12 }) {
          Button($r('app.string.vc_export_start'))
            .id('id_toolbox_export')
            .layoutWeight(1)
            .height(40)
            .fontSize('14fp')
            .fontColor($r('app.color.card_bg'))
            .backgroundColor($r('app.color.brand_primary'))
            .borderRadius(20)
            .enabled(!this.vm.busy)
            .onClick(() => {
              this.onExport();
            })
          if (this.vm.hasExportResult && this.vm.exportResult.success) {
            Button($r('app.string.vc_export_save_as'))
              .id('id_toolbox_save_as')
              .layoutWeight(1)
              .height(40)
              .fontSize('14fp')
              .fontColor($r('app.color.brand_primary'))
              .backgroundColor($r('app.color.brand_light'))
              .borderRadius(20)
              .onClick(() => {
                this.onSaveAs();
              })
          }
        }
        .id('id_toolbox_export_actions')
        .width('100%')

        if (this.vm.hasExportResult) {
          Column({ space: 6 }) {
            Text(this.vm.exportResult.success ?
              $r('app.string.vc_export_success', this.vm.exportResult.cardCount) :
              $r('app.string.vc_export_failed', this.vm.exportResult.code))
              .id('id_toolbox_export_message')
              .fontSize('14fp')
              .fontWeight(FontWeight.Medium)
              .fontColor(this.vm.exportResult.success ? $r('app.color.success') : $r('app.color.danger'))
              .width('100%')
            if (this.vm.exportResult.success) {
              InfoRow({
                idPrefix: 'id_toolbox_export_path',
                label: $r('app.string.vc_export_path'),
                value: this.vm.exportResult.filePath,
                wrap: true
              })
              InfoRow({
                idPrefix: 'id_toolbox_export_bytes',
                label: $r('app.string.vc_export_bytes'),
                value: Formatter.bytes(this.vm.exportResult.bytes)
              })
              InfoRow({
                idPrefix: 'id_toolbox_export_cards',
                label: $r('app.string.vc_export_cards'),
                value: this.vm.exportResult.cardCount.toString()
              })
            } else {
              Text(this.vm.exportExplain.reason)
                .id('id_toolbox_export_reason')
                .fontSize('12fp')
                .fontColor($r('app.color.text_secondary'))
                .lineHeight('18fp')
                .width('100%')
              Text(this.vm.exportExplain.suggestion)
                .id('id_toolbox_export_suggestion')
                .fontSize('12fp')
                .fontColor($r('app.color.text_tertiary'))
                .lineHeight('18fp')
                .width('100%')
            }
          }
          .id('id_toolbox_export_result')
          .width('100%')
          .padding(10)
          .backgroundColor($r('app.color.fill_subtle'))
          .borderRadius(8)
          .alignItems(HorizontalAlign.Start)
        }
      }
      .id('id_toolbox_export_body')
      .width('100%')
      .alignItems(HorizontalAlign.Start)
    }
  }

  private firstPhone(card: VCardCard): ResourceStr {
    if (card.phones.length > 0) {
      return card.phones[0];
    }
    return $r('app.string.vc_none');
  }

  private firstContactPhone(contact: ContactSummary): ResourceStr {
    if (contact.phones.length > 0) {
      return contact.phones[0];
    }
    return $r('app.string.vc_none');
  }

  private isSelected(id: number): boolean {
    return this.vm.selectedIds.indexOf(id) >= 0;
  }

  private versionId(value: number): string {
    if (value === 1) {
      return 'id_toolbox_version_30';
    }
    if (value === 2) {
      return 'id_toolbox_version_40';
    }
    return 'id_toolbox_version_21';
  }

  private versionDescription(): ResourceStr {
    for (const choice of this.versions) {
      if (choice.value === this.vm.version) {
        return choice.description;
      }
    }
    return '';
  }

  private toast(message: ResourceStr): void {
    this.getUIContext().getPromptAction().showToast({ message: message, duration: 2000 });
  }

  private async onRequestPermission(): Promise<void> {
    const granted: boolean = await this.vm.requestPermission();
    this.toast(granted ? $r('app.string.vc_permission_request_ok') :
    $r('app.string.vc_permission_request_partial'));
  }

  private async onPick(): Promise<void> {
    const loaded: boolean = await this.vm.pickFile();
    if (loaded) {
      this.toast($r('app.string.vc_import_file_ready'));
    } else if (this.vm.pickFailed) {
      this.toast($r('app.string.vc_import_pick_failed'));
    }
  }

  private async onSample(): Promise<void> {
    const loaded: boolean = await this.vm.loadSample();
    if (!loaded && this.vm.pickFailed) {
      this.toast($r('app.string.vc_import_pick_failed'));
    }
  }

  private async onImport(): Promise<void> {
    if (!this.vm.canImport) {
      this.toast($r('app.string.vc_import_need_file'));
      return;
    }
    const success: boolean = await this.vm.importFile();
    if (success) {
      this.toast($r('app.string.vc_import_success', this.vm.importResult.cardCount));
      if (this.vm.settings.autoJumpToContacts) {
        setTimeout(() => {
          this.onOpenContacts();
        }, AUTO_JUMP_DELAY);
      }
    }
  }

  private async onExport(): Promise<void> {
    if (!this.vm.scopeAll && this.vm.selectedIds.length === 0) {
      this.toast($r('app.string.vc_export_need_selection'));
      return;
    }
    if (!this.vm.permissionGranted) {
      const granted: boolean = await this.vm.requestPermission();
      if (!granted) {
        this.toast($r('app.string.vc_toolbox_permission_denied'));
        return;
      }
    }
    await this.vm.exportCards();
  }

  private async onSaveAs(): Promise<void> {
    const saved: boolean = await this.vm.saveExportAs();
    this.toast(saved ? $r('app.string.vc_export_saved') : $r('app.string.vc_export_save_canceled'));
  }
}
