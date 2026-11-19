/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import router from '@ohos.router';
import common from '@ohos.app.ability.common';
import { DlpPermission, PolicyTemplate, builtInTemplates, permissionSummary } from '../core/DlpPolicyCore';
import { CustomTemplate, TemplateModel, TemplateResult, templateDisplayName } from '../feature/TemplateModel';
import { TemplateStore } from '../feature/PreferenceStore';

@Entry
@Component
struct TemplatePage {
  @State builtIns: PolicyTemplate[] = [];
  @State customs: CustomTemplate[] = [];
  @State name: string = '';
  @State selectedMask: number = DlpPermission.READ;
  @State editingId: string = '';
  @State status: ResourceStr = '';
  private model: TemplateModel = new TemplateModel();

  aboutToAppear(): void {
    this.builtIns = builtInTemplates();
    this.load();
  }

  private context(): common.UIAbilityContext {
    return getContext(this) as common.UIAbilityContext;
  }

  private async load(): Promise<void> {
    this.model = await TemplateStore.load(this.context());
    this.refreshCustoms();
  }

  private refreshCustoms(): void {
    const source: CustomTemplate[] = this.model.customTemplates();
    const copy: CustomTemplate[] = [];
    for (let index = 0; index < source.length; index++) {
      copy.push(source[index]);
    }
    this.customs = copy;
  }

  private hasBit(permission: number): boolean {
    return (this.selectedMask & permission) === permission;
  }

  private toggleBit(permission: number): void {
    if ((this.selectedMask & permission) === permission) {
      this.selectedMask = this.selectedMask ^ permission;
    } else {
      this.selectedMask = this.selectedMask | permission;
    }
  }

  private resetForm(): void {
    this.name = '';
    this.selectedMask = DlpPermission.READ;
    this.editingId = '';
  }

  private async save(): Promise<void> {
    const nowSec: number = Math.floor(Date.now() / 1000);
    let result: TemplateResult;
    if (this.editingId.length === 0) {
      result = this.model.add(this.name, this.selectedMask, nowSec);
    } else {
      result = this.model.update(this.editingId, this.name, this.selectedMask);
    }
    this.status = result.message;
    if (!result.ok) {
      return;
    }
    await TemplateStore.save(this.context(), this.model);
    this.refreshCustoms();
    this.resetForm();
  }

  private async removeCustom(id: string): Promise<void> {
    if (!this.model.remove(id)) {
      return;
    }
    await TemplateStore.save(this.context(), this.model);
    this.refreshCustoms();
    this.status = $r('app.string.dlp_template_status_deleted');
    if (this.editingId === id) {
      this.resetForm();
    }
  }

  private editCustom(item: CustomTemplate): void {
    this.name = item.name;
    this.selectedMask = item.mask;
    this.editingId = item.id;
    this.status = $r('app.string.dlp_template_status_editing', item.name);
  }

  build() {
    Column() {
      Row() {
        Image($r('app.media.ic_public_back'))
          .width('24vp')
          .height('24vp')
          .margin({ right: '12vp' })
          .id('tmpl_back')
          .onClick(() => {
            router.back();
          })
        Text($r('app.string.dlp_page_template_title'))
          .fontSize('20vp')
          .fontWeight(700)
          .fontColor($r('app.color.font_color_182431'))
          .layoutWeight(1)
          .id('tmpl_title')
      }
      .width('100%')
      .padding({ left: '16vp', right: '16vp', top: '12vp', bottom: '12vp' })
      .backgroundColor($r('app.color.white_bg_color'))

      Scroll() {
        Column() {
          Text($r('app.string.dlp_template_section_builtin'))
            .fontSize('14vp')
            .fontColor($r('app.color.color_666666_grey'))
            .width('100%')
            .padding({ left: '16vp', top: '12vp', bottom: '6vp' })
            .id('builtin_section')
          ForEach(this.builtIns, (template: PolicyTemplate, index: number) => {
            Row() {
              Text(templateDisplayName(template))
                .fontSize('16vp')
                .fontColor($r('app.color.font_color_182431'))
                .width('96vp')
              Text(permissionSummary(template.mask))
                .fontSize('12vp')
                .fontColor($r('app.color.color_666666_grey'))
                .layoutWeight(1)
            }
            .width('100%')
            .padding({ left: '16vp', right: '16vp', top: '12vp', bottom: '12vp' })
            .backgroundColor($r('app.color.white_bg_color'))
            .margin({ bottom: '1vp' })
            .id('builtin_item_' + index.toString())
          }, (template: PolicyTemplate): string => template.id)

          Text($r('app.string.dlp_template_section_custom'))
            .fontSize('14vp')
            .fontColor($r('app.color.color_666666_grey'))
            .width('100%')
            .padding({ left: '16vp', top: '16vp', bottom: '6vp' })
            .id('custom_section')
          if (this.customs.length === 0) {
            Text($r('app.string.dlp_template_empty'))
              .fontSize('14vp')
              .fontColor($r('app.color.color_999999_grey'))
              .width('100%')
              .padding({ left: '16vp', top: '8vp', bottom: '8vp' })
              .id('tmpl_empty')
          } else {
            ForEach(this.customs, (item: CustomTemplate, index: number) => {
              Row() {
                Column() {
                  Text(item.name)
                    .fontSize('16vp')
                    .fontColor($r('app.color.font_color_182431'))
                    .id('custom_name_' + index.toString())
                  Text(permissionSummary(item.mask))
                    .fontSize('12vp')
                    .fontColor($r('app.color.color_666666_grey'))
                    .margin({ top: '4vp' })
                }
                .alignItems(HorizontalAlign.Start)
                .layoutWeight(1)
                Text($r('app.string.dlp_template_delete'))
                  .fontSize('12vp')
                  .fontColor($r('app.color.main_red'))
                  .margin({ left: '12vp' })
                  .id('custom_delete_' + index.toString())
                  .onClick(() => {
                    this.removeCustom(item.id);
                  })
              }
              .width('100%')
              .padding({ left: '16vp', right: '16vp', top: '12vp', bottom: '12vp' })
              .backgroundColor($r('app.color.white_bg_color'))
              .margin({ bottom: '1vp' })
              .id('custom_item_' + index.toString())
              .onClick(() => {
                this.editCustom(item);
              })
            }, (item: CustomTemplate): string => item.id)
          }

          Text(this.editingId.length > 0 ? $r('app.string.dlp_template_form_edit') :
            $r('app.string.dlp_template_form_create'))
            .fontSize('14vp')
            .fontColor($r('app.color.color_666666_grey'))
            .width('100%')
            .padding({ left: '16vp', top: '16vp', bottom: '6vp' })
            .id('form_section')
          TextInput({ placeholder: $r('app.string.dlp_template_name_placeholder') })
            .height('36vp')
            .fontSize('14vp')
            .backgroundColor($r('app.color.input_background'))
            .borderRadius('8vp')
            .margin({ left: '16vp', right: '16vp' })
            .id('tmpl_name_input')
            .onChange((value: string) => {
              this.name = value;
            })
          Row() {
            this.PermChip($r('app.string.dlp_perm_read'), DlpPermission.READ, 'perm_read')
            this.PermChip($r('app.string.dlp_perm_write'), DlpPermission.WRITE, 'perm_write')
            this.PermChip($r('app.string.dlp_perm_print'), DlpPermission.PRINT, 'perm_print')
            this.PermChip($r('app.string.dlp_perm_copy'), DlpPermission.COPY, 'perm_copy')
          }
          .width('100%')
          .padding({ left: '16vp', right: '16vp', top: '10vp' })
          Row() {
            Button(this.editingId.length > 0 ? $r('app.string.dlp_template_save_edit') :
              $r('app.string.dlp_template_save_create'))
              .fontSize('14vp')
              .height('32vp')
              .backgroundColor($r('app.color.main_blue'))
              .fontColor('#FFFFFF')
              .margin({ right: '8vp' })
              .id('tmpl_save')
              .onClick(() => {
                this.save();
              })
            if (this.editingId.length > 0) {
              Button($r('app.string.dlp_template_cancel_edit'))
                .fontSize('14vp')
                .height('32vp')
                .backgroundColor($r('app.color.color_button_grey'))
                .fontColor($r('app.color.font_color_182431'))
                .id('tmpl_cancel')
                .onClick(() => {
                  this.resetForm();
                  this.status = $r('app.string.dlp_template_status_cancelled');
                })
            }
          }
          .width('100%')
          .padding({ left: '16vp', right: '16vp', top: '12vp', bottom: '12vp' })
          if (this.status !== '') {
            Text(this.status)
              .fontSize('12vp')
              .fontColor($r('app.color.color_999999_grey'))
              .width('100%')
              .padding({ left: '16vp', bottom: '16vp' })
              .id('tmpl_status')
          }
        }
        .width('100%')
      }
      .align(Alignment.TopStart)
      .layoutWeight(1)
      .width('100%')
      .scrollBar(BarState.Off)
      .id('tmpl_scroll')
    }
    .justifyContent(FlexAlign.Start)
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.index_background'))
  }

  @Builder
  PermChip(label: ResourceStr, permission: number, itemId: string) {
    Text(label)
      .fontSize('14vp')
      .fontColor(this.hasBit(permission) ? '#FFFFFF' : $r('app.color.font_color_182431'))
      .backgroundColor(this.hasBit(permission) ? $r('app.color.main_blue') : $r('app.color.color_button_grey'))
      .padding({ left: '12vp', right: '12vp', top: '6vp', bottom: '6vp' })
      .borderRadius('14vp')
      .margin({ right: '8vp' })
      .id(itemId)
      .onClick(() => {
        this.toggleBit(permission);
      })
  }
}
