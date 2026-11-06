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

/**
 * 演示页四：面板类型、扩展注册与 createPanel 的真实返回。
 *
 * 这一页有一个明确的负向实测点：createPanel 只允许输入法扩展进程调用，
 * 本页跑在 UIAbility 里，调用会抛 12800004。页面把它当成"预期结果"展示，
 * 并把系统返回的原话与错误码一起写进结果列表。
 *
 * 键盘预览区与系统面板用的是同一个 KeyboardPanel 组件，但没有编辑框连接，
 * 因此只在本地缓冲里编辑——这一点在预览标题里写明，不冒充"已上屏"。
 */

import { common, bundleManager } from '@kit.AbilityKit';
import { PanelFlag, PanelType, inputMethodEngine } from '@kit.IMEKit';
import { AppColors, AppSpacing, AppText } from '../common/Theme';
import { KEYBOARD_BUFFER_LIMIT } from '../common/AppConstants';
import { KeyEdit, KeySpec, KeyboardMode, applyKey, charCount, modeName } from '../model/KeyboardModel';
import { CallOutcome } from '../model/CallOutcome';
import { ActionButton, KeyValueRow, SectionCard, StatusChip, WidgetTone } from './CommonWidgets';
import { ResultList, ResultRow } from './ResultList';
import { LogPanel } from './LogPanel';
import { KeyboardPreviewBox } from './KeyboardPanel';
import { outcomeRow } from './OutcomeView';
import { probeCreatePanel, probePanelInfo } from '../utils/PanelProbe';
import { messageOfThrown } from '../utils/ErrorUtil';
import { Logger } from '../utils/Logger';

const LOG_SOURCE: string = 'Panel';
const MAX_ROWS: number = 8;

/** 四种面板组合：类型 × 状态，用于一次性把 createPanel 的真实返回攒齐 */
interface ProbeSpec {
  label: string;
  type: inputMethodEngine.PanelType;
  flag: inputMethodEngine.PanelFlag;
}

const PROBE_SPECS: ProbeSpec[] = [
  {
    label: '软键盘·固定',
    type: inputMethodEngine.PanelType.SOFT_KEYBOARD,
    flag: inputMethodEngine.PanelFlag.FLG_FIXED
  },
  {
    label: '状态栏·固定',
    type: inputMethodEngine.PanelType.STATUS_BAR,
    flag: inputMethodEngine.PanelFlag.FLG_FIXED
  },
  {
    label: '软键盘·悬浮',
    type: inputMethodEngine.PanelType.SOFT_KEYBOARD,
    flag: inputMethodEngine.PanelFlag.FLG_FLOATING
  },
  {
    label: '软键盘·候选',
    type: inputMethodEngine.PanelType.SOFT_KEYBOARD,
    flag: inputMethodEngine.PanelFlag.FLAG_CANDIDATE
  }
];

@Component
export struct PanelDemoPage {
  @State rows: ResultRow[] = [];
  @State extText: string = '尚未检查';
  @State extTone: WidgetTone = WidgetTone.NEUTRAL;
  @State busy: boolean = false;
  @State keyboardText: string = '';
  @State keyboardMode: KeyboardMode = KeyboardMode.LETTER;

  aboutToAppear(): void {
    Logger.info(LOG_SOURCE, '页面', '面板演示页显示');
    this.checkExtension();
  }

  private push(row: ResultRow): void {
    const next: ResultRow[] = [row];
    for (let i = 0; i < this.rows.length && i < MAX_ROWS - 1; i++) {
      next.push(this.rows[i]);
    }
    this.rows = next;
  }

  private pushOutcome(outcome: CallOutcome): void {
    Logger.info(LOG_SOURCE, outcome.api, outcome.describe());
    this.push(outcomeRow(outcome));
  }

  /**
   * 检查本应用是否真的把 inputMethod 扩展注册进去了：
   * 注册缺失时，系统不会拉起输入法，后面所有面板调用都无从谈起。
   */
  private checkExtension(): void {
    try {
      // 实测：只给 WITH_EXTENSION_ABILITY 时 hapModulesInfo 为空数组，必须叠加 WITH_HAP_MODULE
      const flags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;
      const info = bundleManager.getBundleInfoForSelfSync(flags);
      const ime: bundleManager.ExtensionAbilityInfo[] = [];
      info.hapModulesInfo.forEach((module: bundleManager.HapModuleInfo) => {
        module.extensionAbilitiesInfo.forEach((ext: bundleManager.ExtensionAbilityInfo) => {
          if (ext.extensionAbilityType === bundleManager.ExtensionAbilityType.INPUT_METHOD) {
            ime.push(ext);
          }
        });
      });
      const names = ime.map((item: bundleManager.ExtensionAbilityInfo) => item.name).join('、');
      this.extText = ime.length > 0 ?
        `${info.hapModulesInfo.length} 个模块，已注册：${names}` :
        `${info.hapModulesInfo.length} 个模块，未找到 inputMethod 扩展`;
      this.extTone = ime.length > 0 ? WidgetTone.SUCCESS : WidgetTone.DANGER;
      Logger.info(LOG_SOURCE, '扩展注册', this.extText);
    } catch (err) {
      this.extText = `读取失败：${messageOfThrown(err as Object)}`;
      this.extTone = WidgetTone.DANGER;
      Logger.error(LOG_SOURCE, '扩展注册', this.extText);
    }
  }

  private async onProbe(): Promise<void> {
    this.busy = true;
    const context = this.getUIContext().getHostContext() as common.UIAbilityContext;
    const outcome = await probeCreatePanel(context);
    this.pushOutcome(outcome);
    this.busy = false;
  }

  /** 把四种组合一次跑完，结果列表里能直接看出哪些组合被身份校验拦住 */
  private async onProbeAll(): Promise<void> {
    this.busy = true;
    const context = this.getUIContext().getHostContext() as common.UIAbilityContext;
    for (let i = 0; i < PROBE_SPECS.length; i++) {
      const spec: ProbeSpec = PROBE_SPECS[i];
      const outcome = await probePanelInfo(context, spec.type, spec.flag, spec.label);
      this.pushOutcome(outcome);
    }
    this.busy = false;
  }

  private onKey(key: KeySpec): void {
    const edit: KeyEdit = applyKey(this.keyboardText, this.keyboardMode, key, KEYBOARD_BUFFER_LIMIT);
    this.keyboardText = edit.text;
    this.keyboardMode = edit.mode;
  }

  @Builder
  enumRows() {
    Column({ space: AppSpacing.MD }) {
      KeyValueRow({ label: 'PanelType', value: `SOFT_KEYBOARD=${PanelType.SOFT_KEYBOARD}，STATUS_BAR=${PanelType.STATUS_BAR}`, mono: true })
      KeyValueRow({ label: 'PanelFlag', value: `FLAG_FIXED=${PanelFlag.FLAG_FIXED}，FLAG_FLOATING=${PanelFlag.FLAG_FLOATING}`, mono: true })
      KeyValueRow({ label: 'FLAG_CANDIDATE', value: `${PanelFlag.FLAG_CANDIDATE}（API 15 起）`, mono: true })
      Text('注意：kit 导出的枚举成员叫 FLAG_FIXED/FLAG_FLOATING，而 inputMethodEngine 命名空间内叫 ' +
        'FLG_FIXED/FLG_FLOATING，两者不可混用；创建面板时用后者。')
        .fontSize(AppText.CAPTION)
        .fontColor(AppColors.TEXT_MUTED)
        .width('100%')
    }
    .width('100%')
  }

  build() {
    Scroll() {
      Column({ space: AppSpacing.LG }) {
        Text('createPanel 的声明写明：只能在 InputMethodExtensionAbility 内调用，否则抛 12800004。' +
          '本页在 UIAbility 里直接调用，把系统真实返回原样贴出来：抛错就贴错误码，返回面板就立即销毁。')
          .fontSize(AppText.CAPTION)
          .fontColor(AppColors.TEXT_MUTED)
          .width('100%')

        SectionCard({ title: '面板枚举', subtitle: 'inputMethodEngine 中的定义' }) {
          this.enumRows()
        }

        SectionCard({ title: '本应用扩展注册', subtitle: '安装为输入法的前提' }) {
          Column({ space: AppSpacing.MD }) {
            Row({ space: AppSpacing.MD }) {
              Text('inputMethod 扩展')
                .fontSize(AppText.BODY)
                .fontColor(AppColors.TEXT_SECONDARY)
              Blank()
              StatusChip({ text: this.extTone === WidgetTone.SUCCESS ? '已注册' : '未注册', tone: this.extTone })
            }
            .width('100%')
            KeyValueRow({ label: '详情', value: this.extText })
            Text('注册只说明清单里有它；要真正成为输入法，还需要在设置里启用，并聚焦编辑框才会被拉起。')
              .fontSize(AppText.CAPTION)
              .fontColor(AppColors.TEXT_MUTED)
              .width('100%')
            ActionButton({
              label: '重新检查扩展注册',
              tone: WidgetTone.NEUTRAL,
              onAction: () => {
                this.checkExtension();
              }
            })
          }
          .width('100%')
        }

        SectionCard({ title: '调用实测', subtitle: '在 UIAbility 里调 createPanel' }) {
          Column({ space: AppSpacing.MD }) {
            Row({ space: AppSpacing.MD }) {
              ActionButton({
                label: '调用 createPanel',
                tone: WidgetTone.WARNING,
                actionEnabled: !this.busy,
                onAction: () => {
                  this.onProbe();
                }
              })
              ActionButton({
                label: '四种组合都试',
                tone: WidgetTone.NEUTRAL,
                actionEnabled: !this.busy,
                onAction: () => {
                  this.onProbeAll();
                }
              })
            }
            .width('100%')
            Text('文档写的是抛 12800004（not an input method application），但本机实测（OpenHarmony 7.1）' +
              '返回了面板而非报错，说明该版本未校验调用身份。出现"意外创建成功"时已立即销毁；' +
              '换到校验身份的版本，这里会显示 12800004 与处理建议。')
              .fontSize(AppText.CAPTION)
              .fontColor(AppColors.TEXT_MUTED)
              .width('100%')
          }
          .width('100%')
        }

        SectionCard({ title: '键盘预览', subtitle: `本地缓冲 ${charCount(this.keyboardText)}/${KEYBOARD_BUFFER_LIMIT}` }) {
          Column({ space: AppSpacing.MD }) {
            KeyValueRow({ label: '当前模式', value: modeName(this.keyboardMode) })
            KeyboardPreviewBox({
              text: this.keyboardText,
              mode: this.keyboardMode,
              caption: '壳外预览',
              onKey: (key: KeySpec) => {
                this.onKey(key);
              }
            })
            ActionButton({
              label: '清空缓冲',
              tone: WidgetTone.NEUTRAL,
              onAction: () => {
                this.keyboardText = '';
                Logger.info(LOG_SOURCE, '预览', '本地缓冲已清空');
              }
            })
            Text('预览没有编辑框连接，按键只改本地缓冲；系统面板里的同一个组件会通过 InputClient 写入真实编辑框。')
              .fontSize(AppText.CAPTION)
              .fontColor(AppColors.TEXT_MUTED)
              .width('100%')
          }
          .width('100%')
        }

        SectionCard({ title: '调用结果', subtitle: '最新在上' }) {
          ResultList({ rows: this.rows, emptyText: '点"调用 createPanel"开始' })
        }

        LogPanel({ title: '本页事件', filterSource: LOG_SOURCE })
      }
      .width('100%')
      .padding(AppSpacing.PAGE)
    }
    .width('100%')
    .height('100%')
    .align(Alignment.TopStart)
    .scrollBar(BarState.Auto)
    .backgroundColor(AppColors.PAGE_BG)
  }
}
