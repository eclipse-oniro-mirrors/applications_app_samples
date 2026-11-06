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
import { BusinessError } from '@kit.BasicServicesKit';
import { DemoPageScaffold } from '../../components/DemoPageScaffold';
import { LogPanel } from '../../components/LogPanel';
import {
  PREFS_MAX_LENGTH,
  buildPrefsSummary,
  canSaveText,
  normalizePrefsText
} from '../../model/PrefsStore';
import { PrefsUtil } from '../../utils/PrefsUtil';
import { DEFAULT_LAYOUT_PROFILE, LayoutProfile } from '../../model/DeviceProfile';
import { AppColors, AppRadius, AppSize, AppSpacing, AppText } from '../../common/Theme';
import { Logger } from '../../utils/Logger';

@Component
export struct PreferencesDemo {
  navPathStack: NavPathStack = new NavPathStack();
  @StorageProp('layoutProfile') layout: LayoutProfile = DEFAULT_LAYOUT_PROFILE;
  @State input: string = '';
  @State savedText: string = '';
  @State readTimes: number = 0;
  @State status: string = '';
  @State failed: boolean = false;
  private disposed: boolean = false;

  private getString(resource: Resource, ...args: Array<string | number>): string {
    const context = this.getUIContext().getHostContext();
    if (context === undefined) {
      return '';
    }
    try {
      return context.resourceManager.getStringSync(resource.id, ...args);
    } catch (err) {
      return '';
    }
  }

  aboutToAppear(): void {
    this.disposed = false;
    this.input = this.getString($r('app.string.prefs_default_text'));
    this.status = this.getString($r('app.string.prefs_status_idle'));
    Logger.info('Prefs', '生命周期', '进入首选项演示页');
    this.reload(this.getString($r('app.string.prefs_reason_enter')));
  }

  aboutToDisappear(): void {
    this.disposed = true;
    Logger.info('Prefs', '生命周期', '离开首选项演示页');
  }

  private hostContext(): common.Context {
    return this.getUIContext().getHostContext() as common.Context;
  }

  private reload(reason: string): void {
    try {
      const text = PrefsUtil.readTextValue(this.hostContext());
      const count = PrefsUtil.readCountValue(this.hostContext());
      this.savedText = text;
      this.readTimes = count;
      this.failed = false;
      this.status = this.getString($r('app.string.prefs_status_read'), reason);
      Logger.info('Prefs', '读取', buildPrefsSummary(text, count));
    } catch (err) {
      const error = err as BusinessError;
      this.failed = true;
      this.status = this.getString($r('app.string.prefs_status_read_fail'), error.code);
      Logger.error('Prefs', '读取', `首选项读取失败（${error.code}）：${error.message}`);
    }
  }

  private save(): void {
    if (!canSaveText(this.input)) {
      this.status = this.getString($r('app.string.prefs_status_empty'));
      Logger.warn('Prefs', '写入', '输入为空，未写入首选项');
      return;
    }
    const text = normalizePrefsText(this.input);
    try {
      PrefsUtil.save(this.hostContext(), text, this.readTimes).then((count: number) => {
        if (this.disposed) {
          return;
        }
        this.savedText = text;
        this.readTimes = count;
        this.failed = false;
        this.status = this.getString($r('app.string.prefs_status_saved'));
        Logger.info('Prefs', '写入', `写入「${text}」，flush 完成，累计 ${count} 次`);
      }).catch((err: BusinessError) => {
        if (this.disposed) {
          return;
        }
        this.failed = true;
        this.status = this.getString($r('app.string.prefs_status_save_fail'), err.code);
        Logger.error('Prefs', '写入', `首选项写入失败（${err.code}）：${err.message}`);
      });
    } catch (err) {
      const error = err as BusinessError;
      this.failed = true;
      this.status = this.getString($r('app.string.prefs_status_instance_fail'), error.code);
      Logger.error('Prefs', '写入', `获取首选项实例失败（${error.code}）：${error.message}`);
    }
  }

  private removeText(): void {
    try {
      PrefsUtil.removeText(this.hostContext()).then(() => {
        if (this.disposed) {
          return;
        }
        this.savedText = '';
        this.failed = false;
        this.status = this.getString($r('app.string.prefs_status_deleted'));
        Logger.info('Prefs', '删除', '删除 demoText 并 flush 完成');
      }).catch((err: BusinessError) => {
        if (this.disposed) {
          return;
        }
        this.failed = true;
        this.status = this.getString($r('app.string.prefs_status_delete_fail'), err.code);
        Logger.error('Prefs', '删除', `删除文本失败（${err.code}）：${err.message}`);
      });
    } catch (err) {
      const error = err as BusinessError;
      this.failed = true;
      this.status = this.getString($r('app.string.prefs_status_instance_fail'), error.code);
      Logger.error('Prefs', '删除', `获取首选项实例失败（${error.code}）：${error.message}`);
    }
  }

  private clearAll(): void {
    try {
      PrefsUtil.clearAll(this.hostContext()).then(() => {
        if (this.disposed) {
          return;
        }
        this.savedText = '';
        this.readTimes = 0;
        this.failed = false;
        this.status = this.getString($r('app.string.prefs_status_cleared'));
        Logger.info('Prefs', '清空', 'clearSync + flush 完成');
      }).catch((err: BusinessError) => {
        if (this.disposed) {
          return;
        }
        this.failed = true;
        this.status = this.getString($r('app.string.prefs_status_clear_fail'), err.code);
        Logger.error('Prefs', '清空', `清空首选项失败（${err.code}）：${err.message}`);
      });
    } catch (err) {
      const error = err as BusinessError;
      this.failed = true;
      this.status = this.getString($r('app.string.prefs_status_instance_fail'), error.code);
      Logger.error('Prefs', '清空', `获取首选项实例失败（${error.code}）：${error.message}`);
    }
  }

  build() {
    DemoPageScaffold({
      title: $r('app.string.dest_prefs'),
      subtitle: $r('app.string.prefs_page_subtitle'),
      logSource: 'Prefs',
      navPathStack: this.navPathStack
    }) {
      Scroll() {
        Column({ space: AppSpacing.XL }) {
          Column({ space: AppSpacing.MD }) {
            Text($r('app.string.prefs_label_input'))
              .fontSize(AppText.TITLE)
              .fontColor(AppColors.TEXT_SECONDARY)
              .width('100%')

            TextInput({ text: this.input, placeholder: $r('app.string.prefs_placeholder') })
              .fontSize(AppText.BODY)
              .height(AppSize.BUTTON_MD)
              .backgroundColor(AppColors.SUBTLE_BG)
              .borderRadius(AppRadius.SMALL)
              .onChange((value: string) => {
                this.input = value;
              })

            Text(this.getString($r('app.string.prefs_hint'), PREFS_MAX_LENGTH))
              .fontSize(AppText.SMALL)
              .fontColor(AppColors.TEXT_MUTED)
              .width('100%')

            Row({ space: AppSpacing.MD }) {
              Button($r('app.string.prefs_btn_write'))
                .fontSize(AppText.BODY)
                .height(AppSize.BUTTON)
                .backgroundColor(AppColors.PRIMARY)
                .fontColor(AppColors.WHITE)
                .layoutWeight(1)
                .onClick(() => {
                  this.save();
                })
              Button($r('app.string.prefs_btn_read'))
                .fontSize(AppText.BODY)
                .height(AppSize.BUTTON)
                .backgroundColor(AppColors.PRIMARY_SOFT)
                .fontColor(AppColors.PRIMARY)
                .layoutWeight(1)
                .onClick(() => {
                  this.reload(this.getString($r('app.string.prefs_reason_manual')));
                })
            }
            .width('100%')

            Row({ space: AppSpacing.MD }) {
              Button($r('app.string.prefs_btn_delete'))
                .fontSize(AppText.BODY)
                .height(AppSize.BUTTON)
                .backgroundColor(AppColors.DANGER_SOFT)
                .fontColor(AppColors.DANGER)
                .layoutWeight(1)
                .onClick(() => {
                  this.removeText();
                })
              Button($r('app.string.prefs_btn_clear'))
                .fontSize(AppText.BODY)
                .height(AppSize.BUTTON)
                .backgroundColor(AppColors.WARNING_SOFT)
                .fontColor(AppColors.WARNING)
                .layoutWeight(1)
                .onClick(() => {
                  this.clearAll();
                })
            }
            .width('100%')
          }
          .width('100%')
          .padding(AppSpacing.CARD)
          .backgroundColor(AppColors.CARD_BG)
          .borderRadius(AppRadius.LARGE)
          .alignItems(HorizontalAlign.Start)

          Column({ space: AppSpacing.SM }) {
            Row() {
              Text($r('app.string.prefs_label_state'))
                .fontSize(AppText.TITLE)
                .fontColor(AppColors.TEXT_SECONDARY)
              Blank()
              Text(this.failed ? $r('app.string.prefs_state_failed') : $r('app.string.prefs_state_ok'))
                .fontSize(AppText.TITLE)
                .fontColor(this.failed ? AppColors.DANGER : AppColors.PRIMARY)
            }
            .width('100%')

            Text(buildPrefsSummary(this.savedText, this.readTimes))
              .fontSize(AppText.BODY)
              .fontColor(AppColors.TEXT_TERTIARY)
              .width('100%')
            Text(this.status)
              .fontSize(AppText.SMALL)
              .fontColor(AppColors.TEXT_MUTED)
              .width('100%')
          }
          .width('100%')
          .padding(AppSpacing.CARD)
          .backgroundColor(AppColors.CARD_BG)
          .borderRadius(AppRadius.LARGE)
          .alignItems(HorizontalAlign.Start)

          Column({ space: AppSpacing.SM }) {
            Text($r('app.string.label_impl_title'))
              .fontSize(AppText.TITLE)
              .fontWeight(FontWeight.Medium)
              .fontColor(AppColors.TEXT_PRIMARY)
              .width('100%')
            Text($r('app.string.prefs_impl_desc'))
              .fontSize(AppText.BODY)
              .fontColor(AppColors.TEXT_SECONDARY)
              .width('100%')
          }
          .width('100%')
          .padding(AppSpacing.CARD)
          .backgroundColor(AppColors.CARD_BG)
          .borderRadius(AppRadius.LARGE)

          LogPanel({ title: $r('app.string.log_title_prefs'), filterSource: 'Prefs' })
        }
        .width('100%')
        .constraintSize({ maxWidth: this.layout.pageMaxWidth })
        .padding(AppSpacing.PAGE)
      }
      .layoutWeight(1)
      .align(Alignment.TopStart)
      .scrollBar(BarState.Auto)
    }
  }
}
