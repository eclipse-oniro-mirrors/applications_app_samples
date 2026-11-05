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
  @State input: string = '原子化服务首选项示例';
  @State savedText: string = '';
  @State readTimes: number = 0;
  @State status: string = '尚未加载';
  @State failed: boolean = false;
  private disposed: boolean = false;

  aboutToAppear(): void {
    this.disposed = false;
    Logger.info('Prefs', '生命周期', '进入首选项演示页');
    this.reload('进入页面');
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
      this.status = `${reason}：已从首选项读取`;
      Logger.info('Prefs', '读取', buildPrefsSummary(text, count));
    } catch (err) {
      const error = err as BusinessError;
      this.failed = true;
      this.status = `读取失败（${error.code}）`;
      Logger.error('Prefs', '读取', `首选项读取失败（${error.code}）：${error.message}`);
    }
  }

  private save(): void {
    if (!canSaveText(this.input)) {
      this.status = '内容为空，已跳过写入';
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
        this.status = '已写入并 flush 落盘';
        Logger.info('Prefs', '写入', `写入「${text}」，flush 完成，累计 ${count} 次`);
      }).catch((err: BusinessError) => {
        if (this.disposed) {
          return;
        }
        this.failed = true;
        this.status = `写入失败（${err.code}）`;
        Logger.error('Prefs', '写入', `首选项写入失败（${err.code}）：${err.message}`);
      });
    } catch (err) {
      const error = err as BusinessError;
      this.failed = true;
      this.status = `获取首选项实例失败（${error.code}）`;
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
        this.status = '已删除文本并 flush';
        Logger.info('Prefs', '删除', '删除 demoText 并 flush 完成');
      }).catch((err: BusinessError) => {
        if (this.disposed) {
          return;
        }
        this.failed = true;
        this.status = `删除失败（${err.code}）`;
        Logger.error('Prefs', '删除', `删除文本失败（${err.code}）：${err.message}`);
      });
    } catch (err) {
      const error = err as BusinessError;
      this.failed = true;
      this.status = `获取首选项实例失败（${error.code}）`;
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
        this.status = '已清空全部首选项';
        Logger.info('Prefs', '清空', 'clearSync + flush 完成');
      }).catch((err: BusinessError) => {
        if (this.disposed) {
          return;
        }
        this.failed = true;
        this.status = `清空失败（${err.code}）`;
        Logger.error('Prefs', '清空', `清空首选项失败（${err.code}）：${err.message}`);
      });
    } catch (err) {
      const error = err as BusinessError;
      this.failed = true;
      this.status = `获取首选项实例失败（${error.code}）`;
      Logger.error('Prefs', '清空', `获取首选项实例失败（${error.code}）：${error.message}`);
    }
  }

  build() {
    DemoPageScaffold({
      title: '首选项存储',
      subtitle: '使用 preferences 完成写入、读取、删除与清空，数据经 flush 落盘，重启后仍可恢复。',
      logSource: 'Prefs',
      navPathStack: this.navPathStack
    }) {
      Scroll() {
        Column({ space: AppSpacing.XL }) {
          Column({ space: AppSpacing.MD }) {
            Text('写入内容')
              .fontSize(AppText.TITLE)
              .fontColor(AppColors.TEXT_SECONDARY)
              .width('100%')

            TextInput({ text: this.input, placeholder: '输入要保存的文本' })
              .fontSize(AppText.BODY)
              .height(AppSize.BUTTON_MD)
              .backgroundColor(AppColors.SUBTLE_BG)
              .borderRadius(AppRadius.SMALL)
              .onChange((value: string) => {
                this.input = value;
              })

            Text(`最多保留 ${PREFS_MAX_LENGTH} 个字符，首尾空白会被裁剪`)
              .fontSize(AppText.SMALL)
              .fontColor(AppColors.TEXT_MUTED)
              .width('100%')

            Row({ space: AppSpacing.MD }) {
              Button('写入')
                .fontSize(AppText.BODY)
                .height(AppSize.BUTTON)
                .backgroundColor(AppColors.PRIMARY)
                .fontColor(AppColors.WHITE)
                .layoutWeight(1)
                .onClick(() => {
                  this.save();
                })
              Button('读取')
                .fontSize(AppText.BODY)
                .height(AppSize.BUTTON)
                .backgroundColor(AppColors.PRIMARY_SOFT)
                .fontColor(AppColors.PRIMARY)
                .layoutWeight(1)
                .onClick(() => {
                  this.reload('手动刷新');
                })
            }
            .width('100%')

            Row({ space: AppSpacing.MD }) {
              Button('删除文本')
                .fontSize(AppText.BODY)
                .height(AppSize.BUTTON)
                .backgroundColor(AppColors.DANGER_SOFT)
                .fontColor(AppColors.DANGER)
                .layoutWeight(1)
                .onClick(() => {
                  this.removeText();
                })
              Button('清空全部')
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
              Text('落盘状态')
                .fontSize(AppText.TITLE)
                .fontColor(AppColors.TEXT_SECONDARY)
              Blank()
              Text(this.failed ? '异常' : '正常')
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
            Text('实现说明')
              .fontSize(AppText.TITLE)
              .fontWeight(FontWeight.Medium)
              .fontColor(AppColors.TEXT_PRIMARY)
              .width('100%')
            Text('首选项实例由 preferences.getPreferencesSync 创建，写入与删除使用 sync 接口，随后 flush 保证落盘。读取次数会随每次写入累加并一起持久化，进入页面时从存储中恢复。')
              .fontSize(AppText.BODY)
              .fontColor(AppColors.TEXT_SECONDARY)
              .width('100%')
          }
          .width('100%')
          .padding(AppSpacing.CARD)
          .backgroundColor(AppColors.CARD_BG)
          .borderRadius(AppRadius.LARGE)

          LogPanel({ title: 'Prefs 事件', filterSource: 'Prefs' })
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
