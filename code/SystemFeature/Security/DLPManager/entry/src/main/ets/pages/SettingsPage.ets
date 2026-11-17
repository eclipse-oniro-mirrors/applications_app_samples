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
import { SettingsModel, logLevelLabel, themeLabel } from '../feature/SettingsModel';
import { SettingsStore } from '../feature/PreferenceStore';

@Entry
@Component
struct SettingsPage {
  @State logLevel: string = 'info';
  @State pageSize: number = 10;
  @State theme: string = 'light';
  @State templateId: string = 'read-only';
  @State confirmBeforeDelete: boolean = true;
  @State status: string = '';
  private model: SettingsModel = new SettingsModel();

  aboutToAppear(): void {
    this.load();
  }

  private context(): common.UIAbilityContext {
    return getContext(this) as common.UIAbilityContext;
  }

  private async load(): Promise<void> {
    this.model = await SettingsStore.load(this.context());
    this.logLevel = this.model.logLevel;
    this.pageSize = this.model.pageSize;
    this.theme = this.model.theme;
    this.templateId = this.model.defaultTemplateId;
    this.confirmBeforeDelete = this.model.confirmBeforeDelete;
  }

  private async save(): Promise<void> {
    this.model.setLogLevel(this.logLevel);
    this.model.setPageSize(this.pageSize);
    this.model.setTheme(this.theme);
    this.model.setDefaultTemplate(this.templateId);
    this.model.setConfirmBeforeDelete(this.confirmBeforeDelete);
    const saved: boolean = await SettingsStore.save(this.context(), this.model);
    this.status = saved ? '设置已保存' : '设置保存失败';
  }

  private reset(): void {
    this.model.reset();
    this.logLevel = this.model.logLevel;
    this.pageSize = this.model.pageSize;
    this.theme = this.model.theme;
    this.templateId = this.model.defaultTemplateId;
    this.confirmBeforeDelete = this.model.confirmBeforeDelete;
    this.status = '已恢复默认设置，点击保存后生效';
  }


  private applyChoice(choice: string): void {
    const sep: number = choice.indexOf(':');
    if (sep <= 0) {
      return;
    }
    const field: string = choice.substring(0, sep);
    const value: string = choice.substring(sep + 1);
    if (field === 'logLevel') {
      this.logLevel = value;
    } else if (field === 'pageSize') {
      this.pageSize = Number.parseInt(value, 10);
    } else if (field === 'theme') {
      this.theme = value;
    } else if (field === 'templateId') {
      this.templateId = value;
    }
  }

  build() {
    Column() {
      Row() {
        Image($r('app.media.ic_public_back'))
          .width('24vp')
          .height('24vp')
          .margin({ right: '12vp' })
          .id('settings_back')
          .onClick(() => {
            router.back();
          })
        Text('设置')
          .fontSize('20vp')
          .fontWeight(700)
          .fontColor($r('app.color.font_color_182431'))
          .layoutWeight(1)
          .id('settings_title')
        Text('保存')
          .fontSize('14vp')
          .fontColor($r('app.color.main_blue'))
          .id('settings_save')
          .onClick(() => {
            this.save();
          })
      }
      .width('100%')
      .padding({ left: '16vp', right: '16vp', top: '12vp', bottom: '12vp' })
      .backgroundColor($r('app.color.white_bg_color'))

      Scroll() {
        Column() {
          this.SectionTitle('日志级别', 'settings_log_section')
          Row() {
            this.ChoiceChip(logLevelLabel('debug'), this.logLevel === 'debug', 'log_debug', 'logLevel:debug')
            this.ChoiceChip(logLevelLabel('info'), this.logLevel === 'info', 'log_info', 'logLevel:info')
            this.ChoiceChip(logLevelLabel('warn'), this.logLevel === 'warn', 'log_warn', 'logLevel:warn')
            this.ChoiceChip(logLevelLabel('error'), this.logLevel === 'error', 'log_error', 'logLevel:error')
          }
          .width('100%')
          .padding({ left: '16vp', right: '16vp' })

          this.SectionTitle('每页数量', 'settings_page_section')
          Row() {
            this.ChoiceChip('5', this.pageSize === 5, 'page_5', 'pageSize:5')
            this.ChoiceChip('10', this.pageSize === 10, 'page_10', 'pageSize:10')
            this.ChoiceChip('20', this.pageSize === 20, 'page_20', 'pageSize:20')
            this.ChoiceChip('50', this.pageSize === 50, 'page_50', 'pageSize:50')
          }
          .width('100%')
          .padding({ left: '16vp', right: '16vp' })

          this.SectionTitle('主题', 'settings_theme_section')
          Row() {
            this.ChoiceChip(themeLabel('light'), this.theme === 'light', 'theme_light', 'theme:light')
            this.ChoiceChip(themeLabel('dark'), this.theme === 'dark', 'theme_dark', 'theme:dark')
            this.ChoiceChip(themeLabel('auto'), this.theme === 'auto', 'theme_auto', 'theme:auto')
          }
          .width('100%')
          .padding({ left: '16vp', right: '16vp' })

          this.SectionTitle('默认权限模板', 'settings_template_section')
          Row() {
            this.ChoiceChip('只读', this.templateId === 'read-only', 'default_readonly', 'templateId:read-only')
            this.ChoiceChip('可编辑', this.templateId === 'editable', 'default_editable', 'templateId:editable')
            this.ChoiceChip('可打印', this.templateId === 'printable', 'default_printable', 'templateId:printable')
            this.ChoiceChip('完全控制', this.templateId === 'full', 'default_full', 'templateId:full')
          }
          .width('100%')
          .padding({ left: '16vp', right: '16vp' })

          Row() {
            Text('删除前二次确认')
              .fontSize('14vp')
              .fontColor($r('app.color.font_color_182431'))
              .layoutWeight(1)
            Toggle({ type: ToggleType.Switch, isOn: this.confirmBeforeDelete })
              .id('confirm_switch')
              .onChange((isOn: boolean) => {
                this.confirmBeforeDelete = isOn;
              })
          }
          .width('100%')
          .padding({ left: '16vp', right: '16vp', top: '16vp', bottom: '8vp' })

          Row() {
            Text('错误码中心')
              .fontSize('14vp')
              .fontColor($r('app.color.font_color_182431'))
              .layoutWeight(1)
            Text('查看')
              .fontSize('12vp')
              .fontColor($r('app.color.main_blue'))
          }
          .width('100%')
          .padding({ left: '16vp', right: '16vp', top: '16vp', bottom: '16vp' })
          .id('error_center_entry')
          .onClick(() => {
            router.pushUrl({ url: 'pages/ErrorCodePage' });
          })

          Row() {
            Button('恢复默认')
              .fontSize('14vp')
              .height('32vp')
              .backgroundColor($r('app.color.color_button_grey'))
              .fontColor($r('app.color.font_color_182431'))
              .margin({ right: '8vp' })
              .id('settings_reset')
              .onClick(() => {
                this.reset();
              })
            Text(this.status)
              .fontSize('12vp')
              .fontColor($r('app.color.color_999999_grey'))
              .layoutWeight(1)
              .id('settings_status')
          }
          .width('100%')
          .padding({ left: '16vp', right: '16vp', bottom: '24vp' })
        }
        .width('100%')
      }
      .align(Alignment.TopStart)
      .layoutWeight(1)
      .width('100%')
      .scrollBar(BarState.Off)
    }
    .justifyContent(FlexAlign.Start)
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.index_background'))
  }

  @Builder
  SectionTitle(title: string, itemId: string) {
    Text(title)
      .fontSize('14vp')
      .fontColor($r('app.color.color_666666_grey'))
      .width('100%')
      .padding({ left: '16vp', top: '16vp', bottom: '8vp' })
      .id(itemId)
  }

  @Builder
  ChoiceChip(label: string, selected: boolean, itemId: string, choice: string) {
    Text(label)
      .fontSize('14vp')
      .fontColor(selected ? '#FFFFFF' : $r('app.color.font_color_182431'))
      .backgroundColor(selected ? $r('app.color.main_blue') : $r('app.color.color_button_grey'))
      .padding({ left: '12vp', right: '12vp', top: '6vp', bottom: '6vp' })
      .borderRadius('14vp')
      .margin({ right: '8vp' })
      .id(itemId)
      .onClick(() => {
        this.applyChoice(choice);
      })
  }
}
