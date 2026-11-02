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
import { LogUtil } from '../model/utils/LogUtil';
import { DeviceUtil, Breakpoint } from '../model/utils/DeviceUtil';
import { TagStore, CounterLogic, ChipConfigFactory } from '../model/ChipModels';
import {
  Chip, ChipOptions, ChipSize, LabelOptions, PrefixIconOptions, SuffixIconOptions, CloseOptions,
  ChipV2, ChipV2Options, ChipV2Size, ChipV2Label, ChipV2PrefixImageIcon,
  ChipV2SuffixImageIcon, ChipV2SuffixImageIconConfig,
  ChipGroupV2, ChipGroupV2Items, ChipGroupV2ItemStyle, ChipGroupV2Space,
  ChipGroupV2Padding, ChipGroupV2IconGroupSuffix, ChipGroupV2IconItemConfig, ChipGroupV2SymbolItemConfig,
  CounterV2Component, CounterV2Options, CounterV2Type, CounterV2DateData,
  TabSegmentButtonV2, CapsuleSegmentButtonV2, MultiCapsuleSegmentButtonV2, SegmentButtonV2Items,
  ColorMetrics, LengthMetrics
} from '@kit.ArkUI';

const MAX_LOG_COUNT = 120;
const GROUP_SINGLE_LABELS: string[] = ['全部', '邮件', '文档'];
const GROUP_MULTI_LABELS: string[] = ['图片', '视频', '音频'];
const GROUP_TAIL_LABELS: string[] = ['热搜', '推荐', '关注'];

@Entry
@Component
struct Index {
  @State logs: string[] = [];
  @State bp: Breakpoint = 'sm';
  @State deviceType: string = '';
  @State osName: string = '';
  @State apiVersion: number = 0;
  // Chip V1 状态
  @State v1CloseVisible: boolean = true;
  @State v1BasicActivated: boolean = false;
  @State v1IconActivated: boolean = false;
  @State v1SizeSmall: boolean = true;
  @State v1SymbolActivated: boolean = false;
  // ChipV2 状态
  @State v2CloseVisible: boolean = true;
  @State v2BgIndex: number = 0;
  @State v2NormalActivated: boolean = false;
  @State v2SmallActivated: boolean = false;
  @State v2IconActivated: boolean = false;
  @State v2SymbolActivated: boolean = false;
  // ChipGroupV2 状态
  @State groupSingle: number[] = [0];
  @State groupMulti: number[] = [0, 2];
  @State groupSuffix: number[] = [0];
  // CounterV2 状态
  @State listCounterValue: number = 5;
  @State compactCounterValue: number = 1;
  @State inlineValue: number = 10;
  // SegmentButtonV2 状态
  @State tabSel: number = 0;
  @State capsuleSel: number = 1;
  @State multiSel: number[] = [0];
  // 进阶分区状态
  @State advEnabled: boolean = true;
  @State advSuffixClicksV1: number = 0;
  @State advSuffixClicksV2: number = 0;
  @State advGroupSel: number[] = [1];
  @State advListValue: number = 4;
  @State advInlineValue: number = 20;
  @State advDateText: string = '2026-11-02';
  @State advYear: number = 2026;
  @State advMonth: number = 11;
  @State advDay: number = 2;
  @State advSymbolSel: number = 0;
  @State advDisabledSel: number = 0;
  private store: TagStore = new TagStore();
  private logSeq: number = 0;
  private demoScroller: Scroller = new Scroller();
  private listLogic: CounterLogic = new CounterLogic(5, 0, 20, 1);
  private compactLogic: CounterLogic = new CounterLogic(1, 1, 9, 1);
  private inlineLogic: CounterLogic = new CounterLogic(10, 0, 100, 5);
  private advListLogic: CounterLogic = new CounterLogic(4, 0, 12, 2);
  private advInlineLogic: CounterLogic = new CounterLogic(20, 0, 100, 5);
  // 条目/样式对象只创建一次：写日志触发页面重绘时若在 build 里重建，会让同组 Chip 重新挂载而闪烁
  private singleGroupItems: ChipGroupV2Items = new ChipGroupV2Items(
    ChipConfigFactory.buildGroupItemConfigs(GROUP_SINGLE_LABELS, $r('app.media.startIcon')));
  private multiGroupItems: ChipGroupV2Items = new ChipGroupV2Items(
    ChipConfigFactory.buildGroupItemConfigs(GROUP_MULTI_LABELS, $r('app.media.startIcon')));
  private tailGroupItems: ChipGroupV2Items = new ChipGroupV2Items(
    ChipConfigFactory.buildGroupItemConfigs(GROUP_TAIL_LABELS, $r('app.media.startIcon')));
  private groupItemStyle: ChipGroupV2ItemStyle = ChipConfigFactory.buildGroupItemStyle();
  private groupSpace: ChipGroupV2Space = ChipConfigFactory.buildGroupSpace();
  private tabSegmentItems: SegmentButtonV2Items =
    new SegmentButtonV2Items(ChipConfigFactory.buildSegmentItems(['日', '周', '月']));
  private capsuleSegmentItems: SegmentButtonV2Items =
    new SegmentButtonV2Items(ChipConfigFactory.buildHybridSegmentItems(
      $r('app.media.startIcon'), $r('sys.symbol.heart'), $r('sys.symbol.star')));
  private multiSegmentItems: SegmentButtonV2Items =
    new SegmentButtonV2Items(ChipConfigFactory.buildSegmentItems(['A', 'B', 'C']));
  // 进阶分区条目/配置
  private advGroupItems: ChipGroupV2Items = new ChipGroupV2Items(
    ChipConfigFactory.buildGroupItemConfigs(['推荐', '关注', '热榜'], $r('app.media.startIcon')));
  private advGroupPadding: ChipGroupV2Padding = ChipConfigFactory.buildGroupPadding(10, 10);
  @State advSuffixOn: boolean[] = [false, false];
  @State advSuffixFlip: boolean = false;
  private advGroupSuffixItems: Array<ChipGroupV2IconItemConfig | ChipGroupV2SymbolItemConfig> =
    ChipConfigFactory.buildGroupSuffixItems(
      $r('app.media.startIcon'), [$r('sys.symbol.heart'), $r('sys.symbol.star')],
      (): void => this.logSuffixImageTap(),
      (index: number): void => this.toggleSuffixSymbol(index));
  private symbolSegmentItems: SegmentButtonV2Items = new SegmentButtonV2Items(
    ChipConfigFactory.buildSymbolSegmentItems(
      [$r('sys.symbol.heart'), $r('sys.symbol.star'), $r('sys.symbol.checkmark_circle')]));
  private disabledSegmentItems: SegmentButtonV2Items = new SegmentButtonV2Items(
    ChipConfigFactory.buildSegmentItemsWithDisabled(['可用 A', '已禁用', '可用 B'], 1));

  aboutToAppear(): void {
    LogUtil.init((line: string) => {
      this.pushLog(line);
    });
    this.deviceType = DeviceUtil.getDeviceType();
    this.osName = DeviceUtil.getOsFullName();
    this.apiVersion = DeviceUtil.getSdkApiVersion();
    DeviceUtil.logDeviceProfile();
    // 初始标签数据：搜索历史场景
    this.store.add('鸿蒙');
    this.store.add('ArkTS');
    this.store.add('RK3568');
    LogUtil.info('Index', `页面加载完成：已创建 ${this.store.count()} 个示例标签`);
  }

  private pushLog(line: string): void {
    this.logSeq += 1;
    this.logs = [`#${this.logSeq} ${line}`, ...this.logs].slice(0, MAX_LOG_COUNT);
  }

  /** 索引数组 → 标签名串，用于状态行与日志 */
  private namesOf(indexes: number[], labels: string[]): string {
    if (indexes.length === 0) {
      return '无';
    }
    return indexes.map((i: number): string => labels[i]).join('、');
  }

  /** V2 背景色（纯取值，不在 build 中改状态） */
  private v2BgColor(): string {
    return ['#E3F2FD', '#E8F5E9', '#FFF3E0'][this.v2BgIndex];
  }

  private v2BgName(): string {
    return ['浅蓝', '浅绿', '浅橙'][this.v2BgIndex];
  }

  /** V2 自定义背景点击切换 */
  private cycleV2Bg(): void {
    this.v2BgIndex = (this.v2BgIndex + 1) % 3;
    LogUtil.info('Index', `点击「V2 背景+圆角」→ 背景变为${this.v2BgName()}（${this.v2BgColor()}，第 ${this.v2BgIndex + 1}/3 种），borderRadius 固定 6vp`);
  }

  /** 分区7 尾部 Image 图标点击：仅记日志，不参与选中 */
  private logSuffixImageTap(): void {
    LogUtil.info('Index', '点击进阶分组尾部 Image 图标 → ChipGroupV2IconGroupSuffix 的图标条目 action 被触发（不改变组内选中）');
  }

  /** 分区7 尾部 Symbol 图标点击：切换点亮态（灰↔橙），重建 suffix 条目并强制分组重渲染使图标刷新 */
  private toggleSuffixSymbol(index: number): void {
    this.advSuffixOn[index] = !this.advSuffixOn[index];
    this.advGroupSuffixItems = ChipConfigFactory.buildGroupSuffixItems(
      $r('app.media.startIcon'), [$r('sys.symbol.heart'), $r('sys.symbol.star')],
      (): void => this.logSuffixImageTap(),
      (i: number): void => this.toggleSuffixSymbol(i),
      this.advSuffixOn.slice());
    // ChipGroupV2IconGroupSuffix 的 items 为 @Param 且不会驱动 ChipGroupV2 重渲染其 suffix @BuilderParam：
    // 通过 if/else 分支翻转强制销毁重建整个分组，尾部图标以最新点亮色重建，选中项由 selectedIndexes 参数保持
    this.advSuffixFlip = !this.advSuffixFlip;
    const label: string = index === 0 ? '点赞' : '收藏';
    LogUtil.info('Index', `点击尾部「${label}」图标 → ${this.advSuffixOn[index] ? '点亮（灰→橙）' : '熄灭（橙→灰）'}，与组内选中互不影响`);
  }

  @Builder
  sectionTitle(title: string, desc: string) {
    Column({ space: 2 }) {
      Text(title).fontSize(15).fontWeight(FontWeight.Medium).width('100%')
      Text(desc).fontSize(11).fontColor('#888888').width('100%')
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  /** 分区1：Chip V1——基础/前后缀图标/尺寸/关闭/禁用 */
  @Builder
  sectionChipV1() {
    this.sectionTitle('1. Chip（V1，API 11+）', '基础用法、Image/Symbol 图标、自定义样式、尺寸、关闭（closeOptions）、禁用；激活后为深蓝底 + 白字 + ✓')
    Column({ space: 10 }) {
      Row({ space: 8 }) {
        Chip({
          label: {
            text: this.v1BasicActivated ? '基础标签 ✓' : '基础标签',
            activatedFontColor: Color.White
          } as LabelOptions,
          activated: this.v1BasicActivated,
          activatedBackgroundColor: '#1565C0',
          allowClose: false,
          onClicked: (): void => {
            this.v1BasicActivated = !this.v1BasicActivated;
            LogUtil.info('Index', this.v1BasicActivated
              ? '点击「V1 基础标签」→ 已激活：深蓝底、白字、文字后带 ✓'
              : '点击「V1 基础标签」→ 已取消激活：恢复灰底深色字，✓ 消失');
          }
        })
        Chip({
          label: {
            text: this.v1IconActivated ? '前缀图标 ✓' : '前缀图标',
            activatedFontColor: Color.White
          } as LabelOptions,
          prefixIcon: { src: $r('app.media.startIcon') } as PrefixIconOptions,
          activated: this.v1IconActivated,
          activatedBackgroundColor: '#1565C0',
          allowClose: false,
          onClicked: (): void => {
            this.v1IconActivated = !this.v1IconActivated;
            LogUtil.info('Index', this.v1IconActivated
              ? '点击「V1 前缀图标」→ 已激活：深蓝底、白字、文字后带 ✓'
              : '点击「V1 前缀图标」→ 已取消激活：恢复灰底深色字，✓ 消失');
          }
        })
      }
      Row({ space: 8 }) {
        Chip({
          label: { text: '后缀图标' } as LabelOptions,
          suffixIcon: {
            src: $r('app.media.startIcon'),
            action: (): void => {
              LogUtil.info('Index', '点击「V1 后缀图标」右侧小图标 → suffixIcon.action 被触发（图标自身可点击）');
            }
          } as SuffixIconOptions,
          allowClose: false,
          onClicked: (): void => {
            LogUtil.info('Index', '点击「V1 后缀图标」标签本体 → 无状态变化，试试点右侧的小图标');
          }
        })
        Chip({
          label: { text: this.v1SizeSmall ? '小尺寸' : '标准尺寸' } as LabelOptions,
          size: this.v1SizeSmall ? ChipSize.SMALL : ChipSize.NORMAL,
          allowClose: false,
          onClicked: (): void => {
            this.v1SizeSmall = !this.v1SizeSmall;
            LogUtil.info('Index', `点击「V1 尺寸」→ 现在是${this.v1SizeSmall ? '小尺寸（ChipSize.SMALL）' : '标准尺寸（ChipSize.NORMAL）'}，标签高度随之变化`);
          }
        })
      }
      Row({ space: 8 }) {
        Chip({
          label: {
            text: this.v1SymbolActivated ? 'Symbol ✓' : 'Symbol 图标',
            activatedFontColor: Color.White
          } as LabelOptions,
          prefixSymbol: ChipConfigFactory.buildV1SymbolOptions(
            ChipConfigFactory.buildSymbolModifier($r('sys.symbol.heart'), '#424242'),
            ChipConfigFactory.buildSymbolModifier($r('sys.symbol.heart'), '#FFFFFF')),
          activated: this.v1SymbolActivated,
          activatedBackgroundColor: '#1565C0',
          allowClose: false,
          onClicked: (): void => {
            this.v1SymbolActivated = !this.v1SymbolActivated;
            LogUtil.info('Index', this.v1SymbolActivated
              ? '点击「V1 Symbol 图标」→ 已激活：心形 Symbol 图标随文字变白（prefixSymbol.activated 生效）'
              : '点击「V1 Symbol 图标」→ 已取消激活：心形 Symbol 图标恢复深灰色（prefixSymbol.normal 生效）');
          }
        })
        Chip({
          label: { text: '自定义样式', fontColor: '#E65100' } as LabelOptions,
          backgroundColor: '#FFF3E0',
          borderRadius: 6,
          fontSize: 16,
          allowClose: false,
          onClicked: (): void => {
            LogUtil.info('Index', '点击「V1 自定义样式」→ backgroundColor=#FFF3E0、borderRadius=6vp（近方角）、fontSize=16vp、label.fontColor=#E65100 均由 ChipOptions 控制');
          }
        })
      }
      Row({ space: 8 }) {
        if (this.v1CloseVisible) {
          Chip({
            label: { text: '可关闭' } as LabelOptions,
            allowClose: true,
            closeOptions: {
              accessibilityText: '删除“可关闭”标签',
              fontSize: 20
            } as CloseOptions,
            onClose: (): void => {
              this.v1CloseVisible = false;
              LogUtil.info('Index', '点击「V1 可关闭」右侧放大的 ×（closeOptions.fontSize=20vp、accessibilityText=删除“可关闭”标签）→ 标签已从页面移除');
            }
          })
        } else {
          Text('＋ 恢复可关闭标签')
            .fontSize(12)
            .fontColor('#1565C0')
            .padding({ left: 8, right: 8, top: 4, bottom: 4 })
            .borderRadius(14)
            .backgroundColor('#E3F2FD')
            .onClick(() => {
              this.v1CloseVisible = true;
              LogUtil.info('Index', '点击「＋ 恢复可关闭标签」→ V1 可关闭标签已重新显示在页面上');
            })
        }
      }
      Row({ space: 8 }) {
        Chip({
          label: { text: '禁用标签' } as LabelOptions,
          enabled: false,
          allowClose: false
        })
        Text('enabled: false 点击无响应').fontSize(11).fontColor('#999999')
      }
      Text(`状态：基础标签${this.v1BasicActivated ? '已激活' : '未激活'} · 前缀图标${this.v1IconActivated ? '已激活' : '未激活'} · Symbol${this.v1SymbolActivated ? '已激活' : '未激活'} · 尺寸${this.v1SizeSmall ? '小' : '标准'} · 可关闭标签${this.v1CloseVisible ? '显示中' : '已关闭'}`)
        .fontSize(11)
        .fontColor('#666666')
        .width('100%')
    }
    .width('100%')
    .padding(10)
    .borderRadius(10)
    .backgroundColor('#FAFAFA')
  }

  /** 分区2：ChipV2——尺寸/前后缀图标/激活/背景/关闭/禁用（API 26 新增） */
  @Builder
  sectionChipV2() {
    this.sectionTitle('2. ChipV2（API 26 新增）', 'NORMAL/SMALL 尺寸、Image/Symbol 两种图标、激活态（深蓝底 + 白字 + ✓）、背景+圆角、自定义 closeIcon、禁用')
    Column({ space: 10 }) {
      Row({ space: 8 }) {
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: new ChipV2Label(ChipConfigFactory.buildLabelConfig(
              this.v2NormalActivated ? 'NORMAL ✓' : 'NORMAL', ColorMetrics.resourceColor('#FFFFFF'))),
            activated: this.v2NormalActivated,
            activatedBackgroundColor: ColorMetrics.resourceColor('#1565C0'),
            allowClose: false,
            onClicked: (): void => {
              this.v2NormalActivated = !this.v2NormalActivated;
              LogUtil.info('Index', this.v2NormalActivated
                ? '点击「V2 NORMAL」→ 已激活：深蓝底、白字、文字后带 ✓'
                : '点击「V2 NORMAL」→ 已取消激活：恢复浅色底深色字，✓ 消失');
            }
          })
        })
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: new ChipV2Label(ChipConfigFactory.buildLabelConfig(
              this.v2SmallActivated ? 'SMALL ✓' : 'SMALL', ColorMetrics.resourceColor('#FFFFFF'))),
            size: ChipV2Size.SMALL,
            activated: this.v2SmallActivated,
            activatedBackgroundColor: ColorMetrics.resourceColor('#1565C0'),
            allowClose: false,
            onClicked: (): void => {
              this.v2SmallActivated = !this.v2SmallActivated;
              LogUtil.info('Index', this.v2SmallActivated
                ? '点击「V2 SMALL」→ 已激活：深蓝底、白字、文字后带 ✓'
                : '点击「V2 SMALL」→ 已取消激活：恢复浅色底深色字，✓ 消失');
            }
          })
        })
      }
      Row({ space: 8 }) {
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: new ChipV2Label(ChipConfigFactory.buildLabelConfig(
              this.v2IconActivated ? '前缀图标 ✓' : '前缀图标', ColorMetrics.resourceColor('#FFFFFF'))),
            prefixIcon: new ChipV2PrefixImageIcon(ChipConfigFactory.buildPrefixIcon($r('app.media.startIcon'))),
            activated: this.v2IconActivated,
            activatedBackgroundColor: ColorMetrics.resourceColor('#1565C0'),
            allowClose: false,
            onClicked: (): void => {
              this.v2IconActivated = !this.v2IconActivated;
              LogUtil.info('Index', this.v2IconActivated
                ? '点击「V2 前缀图标」→ 已激活：深蓝底、白字、文字后带 ✓'
                : '点击「V2 前缀图标」→ 已取消激活：恢复浅色底深色字，✓ 消失');
            }
          })
        })
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: new ChipV2Label(ChipConfigFactory.buildLabelConfig('后缀图标')),
            suffixIcon: new ChipV2SuffixImageIcon({
              src: $r('app.media.startIcon'),
              action: (): void => {
                LogUtil.info('Index', '点击「V2 后缀图标」右侧小图标 → suffixIcon.action 被触发（图标自身可点击）');
              }
            } as ChipV2SuffixImageIconConfig),
            allowClose: false,
            onClicked: (): void => {
              LogUtil.info('Index', '点击「V2 后缀图标」标签本体 → 无状态变化，试试点右侧的小图标');
            }
          })
        })
      }
      Row({ space: 8 }) {
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: new ChipV2Label(ChipConfigFactory.buildLabelConfig(
              this.v2SymbolActivated ? 'Symbol ✓' : 'Symbol 图标', ColorMetrics.resourceColor('#FFFFFF'))),
            prefixIcon: ChipConfigFactory.buildPrefixSymbolIcon(
              ChipConfigFactory.buildSymbolModifier($r('sys.symbol.star'), '#424242'),
              ChipConfigFactory.buildSymbolModifier($r('sys.symbol.star'), '#FFFFFF')),
            activated: this.v2SymbolActivated,
            activatedBackgroundColor: ColorMetrics.resourceColor('#1565C0'),
            allowClose: false,
            onClicked: (): void => {
              this.v2SymbolActivated = !this.v2SymbolActivated;
              LogUtil.info('Index', this.v2SymbolActivated
                ? '点击「V2 Symbol 图标」→ 已激活：星形 Symbol 图标变白（ChipV2PrefixSymbolIcon.activated 生效）'
                : '点击「V2 Symbol 图标」→ 已取消激活：星形 Symbol 图标恢复深灰色（ChipV2PrefixSymbolIcon.normal 生效）');
            }
          })
        })
        Text('图标类型：SymbolGlyphModifier').fontSize(11).fontColor('#999999')
      }
      Row({ space: 8 }) {
        // 自定义背景色（ColorMetrics）+ 自定义圆角，点击切换三色
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: new ChipV2Label(ChipConfigFactory.buildLabelConfig('背景+圆角')),
            backgroundColor: ColorMetrics.resourceColor(this.v2BgColor()),
            borderRadius: LengthMetrics.vp(6),
            allowClose: false,
            onClicked: (): void => {
              this.cycleV2Bg();
            }
          })
        })
        if (this.v2CloseVisible) {
          ChipV2({
            chipV2Options: new ChipV2Options({
              label: new ChipV2Label(ChipConfigFactory.buildLabelConfig('可关闭')),
              allowClose: true,
              closeIcon: ChipConfigFactory.buildCloseIcon('删除此 V2 标签', 20),
              onClose: (): void => {
                this.v2CloseVisible = false;
                LogUtil.info('Index', '点击「V2 可关闭」右侧放大的 ×（自定义 closeIcon：fontSize=20vp、accessibilityText=删除此 V2 标签）→ 标签已从页面移除');
              }
            })
          })
        } else {
          Text('＋ 恢复可关闭标签')
            .fontSize(12)
            .fontColor('#1565C0')
            .padding({ left: 8, right: 8, top: 4, bottom: 4 })
            .borderRadius(14)
            .backgroundColor('#E3F2FD')
            .onClick(() => {
              this.v2CloseVisible = true;
              LogUtil.info('Index', '点击「＋ 恢复可关闭标签」→ V2 可关闭标签已重新显示在页面上');
            })
        }
      }
      Row({ space: 8 }) {
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: new ChipV2Label(ChipConfigFactory.buildLabelConfig('禁用标签')),
            enabled: false,
            allowClose: false
          })
        })
        Text('enabled: false 点击无响应').fontSize(11).fontColor('#999999')
      }
      Text(`状态：NORMAL${this.v2NormalActivated ? '已激活' : '未激活'} · SMALL${this.v2SmallActivated ? '已激活' : '未激活'} · 前缀图标${this.v2IconActivated ? '已激活' : '未激活'} · Symbol${this.v2SymbolActivated ? '已激活' : '未激活'} · 背景${this.v2BgName()} · 可关闭标签${this.v2CloseVisible ? '显示中' : '已关闭'}`)
        .fontSize(11)
        .fontColor('#666666')
        .width('100%')
    }
    .width('100%')
    .padding(10)
    .borderRadius(10)
    .backgroundColor('#FAFAFA')
  }

  /** 分区3：ChipGroupV2——单选/多选/自定义样式与间距/尾部内容 */
  @Builder
  sectionChipGroup() {
    this.sectionTitle('3. ChipGroupV2（API 26 新增）', '多个 Chip 组成一组统一管理选择：单选（只保留 1 项）/ 多选（可多项）/ 自定义样式、间距与尾部内容')
    Column({ space: 10 }) {
      Column({ space: 2 }) {
        Text('ChipGroupV2 是什么：一组可点选的 Chip，组内选中状态由 selectedIndexes 统一管理').fontSize(12).fontColor('#333333').width('100%')
        Text('单选组像 Radio：点「邮件」后「全部」自动取消；多选组像 Checkbox：点「视频」后「图片」仍保留。').fontSize(11).fontColor('#888888').width('100%')
      }
      .width('100%')
      .padding(8)
      .borderRadius(6)
      .backgroundColor('#FFFFFF')

      Text('① 单选组（默认样式，始终只有 1 项选中）').fontSize(12).fontColor('#666666').width('100%')
      ChipGroupV2({
        items: this.singleGroupItems,
        selectedIndexes: this.groupSingle,
        $selectedIndexes: (v: number[]): void => {
          const before: string = this.namesOf(this.groupSingle, GROUP_SINGLE_LABELS);
          this.groupSingle = v;
          LogUtil.info('Index', `点击单选组 → 选中「${before}」替换为「${this.namesOf(v, GROUP_SINGLE_LABELS)}」：单选组任何时刻只保留 1 项`);
        },
        multiple: false
      })
      Text(`   ↳ 当前选中：${this.namesOf(this.groupSingle, GROUP_SINGLE_LABELS)}（点其他项会替换）`).fontSize(11).fontColor('#1565C0').width('100%')

      Text('② 多选组（默认样式，可同时选中多项）').fontSize(12).fontColor('#666666').width('100%')
      ChipGroupV2({
        items: this.multiGroupItems,
        selectedIndexes: this.groupMulti,
        $selectedIndexes: (v: number[]): void => {
          const before: number[] = this.groupMulti.slice();
          this.groupMulti = v;
          const added: number[] = v.filter((i: number): boolean => before.indexOf(i) < 0);
          const removed: number[] = before.filter((i: number): boolean => v.indexOf(i) < 0);
          let action: string = '选中项未变化';
          if (added.length > 0) {
            action = `新增「${this.namesOf(added, GROUP_MULTI_LABELS)}」`;
          } else if (removed.length > 0) {
            action = `取消「${this.namesOf(removed, GROUP_MULTI_LABELS)}」`;
          }
          LogUtil.info('Index', `点击多选组 → ${action}，当前共 ${v.length} 项：${this.namesOf(v, GROUP_MULTI_LABELS)}（多选组可叠加选择）`);
        },
        multiple: true
      })
      Text(`   ↳ 当前选中：${this.namesOf(this.groupMulti, GROUP_MULTI_LABELS)}（共 ${this.groupMulti.length} 项，再点一次取消）`).fontSize(11).fontColor('#1565C0').width('100%')

      Text('③ 同一单选组的定制版（选择行为同 ①；仅 itemStyle 换肤 + chipGroupSpace 间距 + suffix 尾部「更多 ›」+ onChange 通知）').fontSize(12).fontColor('#666666').width('100%')
      ChipGroupV2({
        items: this.tailGroupItems,
        selectedIndexes: this.groupSuffix,
        $selectedIndexes: (v: number[]): void => {
          this.groupSuffix = v;
          LogUtil.info('Index', `点击自定义样式组 → 选中「${this.namesOf(v, GROUP_TAIL_LABELS)}」（单选行为；样式来自 itemStyle，间距来自 chipGroupSpace）`);
        },
        multiple: false,
        itemStyle: this.groupItemStyle,
        chipGroupSpace: this.groupSpace,
        onChange: (v: number[]): void => {
          LogUtil.info('Index', `自定义样式组 onChange 额外回调 → 当前「${this.namesOf(v, GROUP_TAIL_LABELS)}」（与 $selectedIndexes 同步触发，可用于通知业务层）`);
        },
        suffix: (): void => {
          this.groupSuffixTail()
        }
      })
      Text(`   ↳ 当前选中：${this.namesOf(this.groupSuffix, GROUP_TAIL_LABELS)} · 右侧「更多 ›」来自 suffix 自定义内容`).fontSize(11).fontColor('#1565C0').width('100%')
    }
    .width('100%')
    .padding(10)
    .borderRadius(10)
    .backgroundColor('#FAFAFA')
  }

  /** ChipGroupV2 尾部自定义内容（suffix builder） */
  @Builder
  groupSuffixTail() {
    Row({ space: 2 }) {
      Text('更多').fontSize(12).fontColor('#E65100')
      Text('›').fontSize(14).fontColor('#E65100')
    }
    .padding({ left: 8, right: 8, top: 4, bottom: 4 })
    .borderRadius(12)
    .backgroundColor('#FFF3E0')
    .onClick((): void => {
      LogUtil.info('Index', '点击自定义样式组尾部「更多 ›」→ suffix 传入的自定义内容被点击（可放筛选/设置入口）');
    })
  }

  /** 分区4：CounterV2——LIST/COMPACT/INLINE/INLINE_DATE 四类型（API 26 新增） */
  @Builder
  sectionCounter() {
    this.sectionTitle('4. CounterV2（API 26 新增）', '精确调节数值：列表型/紧凑型/数值内联型/日期内联型四种类型')
    Column({ space: 10 }) {
      Text(`列表型（LIST，0-20）：${this.listCounterValue}`).fontSize(12).fontColor('#666666').width('100%')
      CounterV2Component({
        options: {
          type: CounterV2Type.LIST,
          numberOptions: {
            value: this.listCounterValue,
            min: 0,
            max: 20,
            step: 1,
            onChange: (v: number): void => {
              this.listCounterValue = v;
              this.listLogic.setValue(v);
              LogUtil.info('Index', `点击「列表型计数器」→ 当前值 ${v}（范围 0-20，步进 1）`);
            }
          }
        } as CounterV2Options
      })
      Text(`紧凑型（COMPACT，1-9）：${this.compactCounterValue}`).fontSize(12).fontColor('#666666').width('100%')
      CounterV2Component({
        options: {
          type: CounterV2Type.COMPACT,
          numberOptions: {
            value: this.compactCounterValue,
            min: 1,
            max: 9,
            step: 1,
            onChange: (v: number): void => {
              this.compactCounterValue = v;
              this.compactLogic.setValue(v);
              LogUtil.info('Index', `点击「紧凑型计数器」→ 当前值 ${v}（范围 1-9，步进 1）`);
            }
          }
        } as CounterV2Options
      })
      Text(`数值内联型（INLINE，步进 5，0-100）：${this.inlineValue}`).fontSize(12).fontColor('#666666').width('100%')
      CounterV2Component({
        options: {
          type: CounterV2Type.INLINE,
          inlineOptions: {
            value: this.inlineValue,
            min: 0,
            max: 100,
            step: 5,
            onChange: (v: number): void => {
              this.inlineValue = v;
              this.inlineLogic.setValue(v);
              LogUtil.info('Index', `点击「数值内联型计数器」→ 当前值 ${v}（范围 0-100，步进 5）`);
            }
          }
        } as CounterV2Options
      })
      Text('日期内联型（INLINE_DATE）').fontSize(12).fontColor('#666666').width('100%')
      CounterV2Component({
        options: {
          type: CounterV2Type.INLINE_DATE,
          dateOptions: {
            onDateChange: (d: CounterV2DateData): void => {
              LogUtil.info('Index', `点击「日期内联型计数器」→ 当前日期 ${d.toString()}`);
            }
          }
        } as CounterV2Options
      })
    }
    .width('100%')
    .padding(10)
    .borderRadius(10)
    .backgroundColor('#FAFAFA')
  }

  /** 分区5：SegmentButtonV2——文本/图文混合（icon+symbol）/自定义样式 */
  @Builder
  sectionSegment() {
    this.sectionTitle('5. SegmentButtonV2（API 18+）', '分段按钮：页签型单选（自定义字体/颜色/圆角/间距）、胶囊型图文混合（Image 图标 + Symbol 图标）、胶囊型多选')
    Column({ space: 10 }) {
      Text(`页签型单选（自定义样式，当前：${['日', '周', '月'][this.tabSel]}）`).fontSize(12).fontColor('#666666').width('100%')
      TabSegmentButtonV2({
        items: this.tabSegmentItems,
        selectedIndex: this.tabSel,
        $selectedIndex: (v: number): void => {
          this.tabSel = v;
          LogUtil.info('Index', `点击「页签型单选」→ 选中「${['日', '周', '月'][v]}」（第 ${v + 1} 个；itemFontSize/SelectedFontSize、itemFontColor/SelectedFontColor、itemBorderRadius、itemSpace 均已自定义）`);
        },
        itemSpace: LengthMetrics.vp(6),
        itemFontSize: LengthMetrics.fp(13),
        itemSelectedFontSize: LengthMetrics.fp(15),
        itemFontColor: ColorMetrics.resourceColor('#666666'),
        itemSelectedFontColor: ColorMetrics.resourceColor('#1565C0'),
        itemSelectedFontWeight: FontWeight.Bold,
        itemBorderRadius: LengthMetrics.vp(8),
        itemSelectedBackgroundColor: ColorMetrics.resourceColor('#E3F2FD')
      })
      Text(`胶囊型单选（图文混合，当前：${['图片', '收藏', '星标'][this.capsuleSel]}）`).fontSize(12).fontColor('#666666').width('100%')
      CapsuleSegmentButtonV2({
        items: this.capsuleSegmentItems,
        selectedIndex: this.capsuleSel,
        $selectedIndex: (v: number): void => {
          this.capsuleSel = v;
          LogUtil.info('Index', `点击「胶囊型单选」→ 选中「${['图片', '收藏', '星标'][v]}」（第 ${v + 1} 个；第 1 项为 Image 图标+文本，第 2/3 项为 Symbol 图标+文本）`);
        },
        itemSpace: LengthMetrics.vp(4),
        itemFontColor: ColorMetrics.resourceColor('#666666'),
        itemSelectedFontColor: ColorMetrics.resourceColor('#0D47A1')
      })
      Text(`胶囊型多选（当前：${JSON.stringify(this.multiSel)}）`).fontSize(12).fontColor('#666666').width('100%')
      MultiCapsuleSegmentButtonV2({
        items: this.multiSegmentItems,
        selectedIndexes: this.multiSel,
        $selectedIndexes: (v: number[]): void => {
          this.multiSel = v;
          LogUtil.info('Index', `点击「胶囊型多选」→ 选中 ${v.length} 个（索引 ${v.length > 0 ? v.join('、') : '无'}）`);
        },
        itemSpace: LengthMetrics.vp(6)
      })
    }
    .width('100%')
    .padding(10)
    .borderRadius(10)
    .backgroundColor('#FAFAFA')
  }

  /** 分区6：Chip 进阶——后缀 Symbol 点击、ChipV2 字号与内边距、无障碍描述、动态启用/禁用 */
  @Builder
  sectionChipAdvanced() {
    this.sectionTitle('6. Chip 进阶（V1 / V2）',
      '后缀 Symbol 图标带独立点击回调、ChipV2 自定义 fontSize/padding、accessibilityDescription 无障碍描述、动态启用/禁用')
    Column({ space: 10 }) {
      Text('V1：suffixSymbol 外观 + suffixSymbolOptions.action 点击').fontSize(12).fontColor('#666666').width('100%')
      Row({ space: 8 }) {
        Chip({
          label: { text: '后缀 Symbol' } as LabelOptions,
          suffixSymbol: ChipConfigFactory.buildV1SymbolOptions(
            ChipConfigFactory.buildSymbolModifier($r('sys.symbol.chevron_right'), '#424242')),
          suffixSymbolOptions: ChipConfigFactory.buildSuffixSymbolOptions((): void => {
            this.advSuffixClicksV1 += 1;
            LogUtil.info('Index', `点击「V1 后缀 Symbol」右侧箭头 → suffixSymbolOptions.action 被触发（第 ${this.advSuffixClicksV1} 次）`);
          }),
          allowClose: false,
          onClicked: (): void => {
            LogUtil.info('Index', '点击「V1 后缀 Symbol」标签本体 → 无状态变化，右侧箭头才是独立点击热点');
          }
        })
        Chip({
          label: { text: '无障碍描述' } as LabelOptions,
          accessibilityDescription: '该标签演示 accessibilityDescription：读屏会朗读这句补充说明',
          allowClose: false,
          onClicked: (): void => {
            LogUtil.info('Index', '点击「无障碍描述」→ ChipOptions.accessibilityDescription 已配置，读屏可朗读补充说明');
          }
        })
      }
      Text('动态启用/禁用：enabled 切换后点击行为立即变化').fontSize(12).fontColor('#666666').width('100%')
      Row({ space: 8 }) {
        Chip({
          label: { text: this.advEnabled ? '当前可点击' : '已禁用，点击无响应' } as LabelOptions,
          enabled: this.advEnabled,
          allowClose: false,
          onClicked: (): void => {
            LogUtil.info('Index', '点击「动态启用/禁用」标签 → enabled=true 时点击有响应');
          }
        })
        Text(this.advEnabled ? '点我禁用 →' : '点我启用 →')
          .fontSize(12)
          .fontColor('#1565C0')
          .padding({ left: 8, right: 8, top: 4, bottom: 4 })
          .borderRadius(14)
          .backgroundColor('#E3F2FD')
          .onClick((): void => {
            this.advEnabled = !this.advEnabled;
            LogUtil.info('Index', `点击「启用/禁用切换」→ 标签 enabled=${this.advEnabled}：${this.advEnabled ? '恢复可点击' : '禁用后点击无任何响应'}`);
          })
      }
      Text('ChipV2：suffixIcon（Symbol）+ fontSize + padding').fontSize(12).fontColor('#666666').width('100%')
      Row({ space: 8 }) {
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: new ChipV2Label(ChipConfigFactory.buildLabelConfig('V2 后缀 Symbol')),
            suffixIcon: ChipConfigFactory.buildSuffixSymbolIcon(
              ChipConfigFactory.buildSymbolModifier($r('sys.symbol.chevron_right'), '#424242'),
              ChipConfigFactory.buildSymbolModifier($r('sys.symbol.chevron_right'), '#FFFFFF'),
              (): void => {
                this.advSuffixClicksV2 += 1;
                LogUtil.info('Index', `点击「V2 后缀 Symbol」右侧箭头 → ChipV2SuffixSymbolIcon.action 被触发（第 ${this.advSuffixClicksV2} 次）`);
              }),
            allowClose: false,
            onClicked: (): void => {
              LogUtil.info('Index', '点击「V2 后缀 Symbol」标签本体 → 无状态变化，右侧箭头才是独立点击热点');
            }
          })
        })
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: new ChipV2Label(ChipConfigFactory.buildLabelConfig('大字号 + 宽内边距')),
            fontSize: LengthMetrics.fp(15),
            padding: ChipConfigFactory.buildChipV2Padding(16, 16),
            allowClose: false,
            onClicked: (): void => {
              LogUtil.info('Index', '点击「大字号 + 宽内边距」→ fontSize=fp(15)、padding.start/end=16vp 生效，标签比默认更宽更高');
            }
          })
        })
      }
      Row({ space: 8 }) {
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: new ChipV2Label(ChipConfigFactory.buildLabelConfig('无障碍描述')),
            accessibilityDescription: '该 ChipV2 演示 accessibilityDescription 无障碍说明',
            allowClose: false,
            onClicked: (): void => {
              LogUtil.info('Index', '点击「V2 无障碍描述」→ accessibilityDescription 已配置，读屏可朗读补充说明');
            }
          })
        })
        Text(`后缀 Symbol 点击：V1 ${this.advSuffixClicksV1} 次 · V2 ${this.advSuffixClicksV2} 次`)
          .fontSize(11)
          .fontColor('#999999')
          .layoutWeight(1)
      }
      Text(`状态：动态标签${this.advEnabled ? '启用' : '禁用'} · 后缀箭头点击 V1 ${this.advSuffixClicksV1} 次 / V2 ${this.advSuffixClicksV2} 次`)
        .fontSize(11)
        .fontColor('#666666')
        .width('100%')
    }
    .width('100%')
    .padding(10)
    .borderRadius(10)
    .backgroundColor('#FAFAFA')
  }

  /** 分区7：ChipGroupV2 进阶——chipGroupPadding 留白 + 尾部图标组（点赞/收藏可点亮） */
  @Builder
  sectionGroupAdvanced() {
    this.sectionTitle('7. ChipGroupV2 进阶',
      'chipGroupPadding 调整分组上下留白、suffix 传入 ChipGroupV2IconGroupSuffix 尾部图标组（Image + 点赞/收藏 Symbol，点击点亮/熄灭）')
    Column({ space: 10 }) {
      Text(`当前选中：${this.namesOf(this.advGroupSel, ['推荐', '关注', '热榜'])}（分组上下各留 10vp）`).fontSize(12).fontColor('#666666').width('100%')
      // 翻转分支以销毁重建分组：suffix 图标组仅在分组挂载时以当次 items 构建点亮色
      if (this.advSuffixFlip) {
        this.advancedChipGroup()
      } else {
        this.advancedChipGroup()
      }
      Text(`尾部图标：点赞${this.advSuffixOn[0] ? '已点亮（橙）' : '未点亮（灰）'} · 收藏${this.advSuffixOn[1] ? '已点亮（橙）' : '未点亮（灰）'}`).fontSize(12).fontColor('#666666').width('100%')
      Text('   ↳ 右侧图标来自 suffix → ChipGroupV2IconGroupSuffix：点赞/收藏点击切换灰↔橙，且不改变组内选中项').fontSize(11).fontColor('#1565C0').width('100%')
    }
    .width('100%')
    .padding(10)
    .borderRadius(10)
    .backgroundColor('#FAFAFA')
  }

  /** 分区7 进阶分组主体（在 if/else 两分支中复用，分支翻转时整体重建） */
  @Builder
  advancedChipGroup() {
    ChipGroupV2({
      items: this.advGroupItems,
      selectedIndexes: this.advGroupSel,
      $selectedIndexes: (v: number[]): void => {
        this.advGroupSel = v;
        LogUtil.info('Index', `点击「进阶分组」→ 选中「${this.namesOf(v, ['推荐', '关注', '热榜'])}」（单选；chipGroupPadding 上下 10vp）`);
      },
      multiple: false,
      chipGroupPadding: this.advGroupPadding,
      suffix: (): void => {
        this.advancedGroupSuffix()
      }
    })
  }

  /** 分区7 尾部图标组（ChipGroupV2IconGroupSuffix） */
  @Builder
  advancedGroupSuffix() {
    ChipGroupV2IconGroupSuffix({ items: this.advGroupSuffixItems })
  }

  /** 分区8：CounterV2 进阶——label/step/textWidth/focus/hover/blur/日期初始值 */
  @Builder
  sectionCounterAdvanced() {
    this.sectionTitle('8. CounterV2 进阶',
      'label 文案、step 步进、textWidth 文本宽度、focus/blur/hover 业务回调、日期初始值（year/month/day）与日期变化')
    Column({ space: 10 }) {
      Text(`带 label 的列表型（step=2）：${this.advListValue} 份`).fontSize(12).fontColor('#666666').width('100%')
      CounterV2Component({
        options: {
          type: CounterV2Type.LIST,
          numberOptions: {
            value: this.advListValue,
            min: 0,
            max: 12,
            step: 2,
            label: '份数',
            onChange: (v: number): void => {
              this.advListValue = v;
              this.advListLogic.setValue(v);
              LogUtil.info('Index', `点击「带 label 列表型」→ 当前 ${v} 份（范围 0-12，步进 2，label=份数）`);
            },
            onFocusIncrease: (): void => {
              LogUtil.info('Index', '「带 label 列表型」加号获得焦点（键盘 / Tab 可达）');
            },
            onBlurIncrease: (): void => {
              LogUtil.info('Index', '「带 label 列表型」加号失去焦点');
            },
            onHoverIncrease: (isHover: boolean): void => {
              LogUtil.info('Index', `「带 label 列表型」加号悬停${isHover ? '进入' : '离开'}（需鼠标）`);
            },
            onHoverDecrease: (isHover: boolean): void => {
              LogUtil.info('Index', `「带 label 列表型」减号悬停${isHover ? '进入' : '离开'}（需鼠标）`);
            }
          }
        } as CounterV2Options
      })
      Text(`textWidth 的数值内联型（step=5）：${this.advInlineValue}`).fontSize(12).fontColor('#666666').width('100%')
      CounterV2Component({
        options: {
          type: CounterV2Type.INLINE,
          inlineOptions: {
            value: this.advInlineValue,
            min: 0,
            max: 100,
            step: 5,
            textWidth: 48,
            onChange: (v: number): void => {
              this.advInlineValue = v;
              this.advInlineLogic.setValue(v);
              LogUtil.info('Index', `点击「textWidth 内联型」→ 当前值 ${v}（范围 0-100，步进 5，textWidth=48）`);
            }
          }
        } as CounterV2Options
      })
      Text(`日期内联型（初始 ${this.advDateText}）：`).fontSize(12).fontColor('#666666').width('100%')
      CounterV2Component({
        options: {
          type: CounterV2Type.INLINE_DATE,
          dateOptions: {
            year: this.advYear,
            month: this.advMonth,
            day: this.advDay,
            onDateChange: (d: CounterV2DateData): void => {
              this.advDateText = d.toString();
              LogUtil.info('Index', `点击「进阶日期型」→ 当前日期 ${d.toString()}（初始 year/month/day 来自 dateOptions）`);
            }
          }
        } as CounterV2Options
      })
    }
    .width('100%')
    .padding(10)
    .borderRadius(10)
    .backgroundColor('#FAFAFA')
  }

  /** 分区9：SegmentButtonV2 进阶——纯 Symbol / 禁用条目 / onItemClicked / 图标样式 */
  @Builder
  sectionSegmentAdvanced() {
    this.sectionTitle('9. SegmentButtonV2 进阶',
      '纯 Symbol 条目（无文本）、禁用条目（enabled=false 点击无响应）、onItemClicked 回调、图标字号与选中色、自定义内边距与底色')
    Column({ space: 10 }) {
      Text(`纯 Symbol 胶囊（当前第 ${this.advSymbolSel + 1} 个图标）`).fontSize(12).fontColor('#666666').width('100%')
      CapsuleSegmentButtonV2({
        items: this.symbolSegmentItems,
        selectedIndex: this.advSymbolSel,
        $selectedIndex: (v: number): void => {
          this.advSymbolSel = v;
          LogUtil.info('Index', `点击「纯 Symbol 胶囊」→ 选中第 ${v + 1} 个图标（itemSymbolFontSize=fp(18)，选中色 #0D47A1）`);
        },
        onItemClicked: (v: number): void => {
          LogUtil.info('Index', `「纯 Symbol 胶囊」onItemClicked → 第 ${v + 1} 个条目被点击（与 $selectedIndex 同步触发）`);
        },
        itemSpace: LengthMetrics.vp(6),
        itemSymbolFontSize: LengthMetrics.fp(18),
        itemSymbolFontColor: ColorMetrics.resourceColor('#666666'),
        itemSelectedSymbolFontColor: ColorMetrics.resourceColor('#0D47A1'),
        itemPadding: {
          start: LengthMetrics.vp(14),
          end: LengthMetrics.vp(14),
          top: LengthMetrics.vp(6),
          bottom: LengthMetrics.vp(6)
        } as LocalizedPadding,
        buttonBackgroundColor: ColorMetrics.resourceColor('#F1F3F5'),
        itemMinHeight: LengthMetrics.vp(34)
      })
      Text(`禁用条目（第 2 项 enabled=false，当前：${['可用 A', '已禁用', '可用 B'][this.advDisabledSel]}）`).fontSize(12).fontColor('#666666').width('100%')
      CapsuleSegmentButtonV2({
        items: this.disabledSegmentItems,
        selectedIndex: this.advDisabledSel,
        $selectedIndex: (v: number): void => {
          this.advDisabledSel = v;
          LogUtil.info('Index', `点击「禁用条目胶囊」→ 选中「${['可用 A', '已禁用', '可用 B'][v]}」（第 2 项禁用时点击无响应）`);
        },
        itemSpace: LengthMetrics.vp(6)
      })
    }
    .width('100%')
    .padding(10)
    .borderRadius(10)
    .backgroundColor('#FAFAFA')
  }

  @Builder
  logArea() {
    Column({ space: 4 }) {
      Row({ space: 8 }) {
        Text('事件日志').fontSize(14).fontWeight(FontWeight.Medium)
        Text('（最新在上，每次点击都会新增一条）').fontSize(10).fontColor('#888888')
        Blank()
        Text(`断点：${this.bp}`).fontSize(11).fontColor('#999999')
      }
      .width('100%')

      List({ space: 4 }) {
        ForEach(this.logs, (line: string, index: number) => {
          ListItem() {
            Text(line).fontSize(12).width('100%')
          }
        }, (line: string, index: number) => `${index}-${line}`)
      }
      .layoutWeight(1)
      .width('100%')
      .backgroundColor('#F5F5F5')
      .borderRadius(8)
      .padding(8)
    }
    .layoutWeight(1)
    .width('100%')
  }

  build() {
    Column({ space: 10 }) {
      Text('Chip 与计数器：标签、计数与分段选择')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .width('100%')
      Text('Chip(V1) · ChipV2 · ChipGroupV2 · CounterV2（四类型）· SegmentButtonV2（三形态）')
        .fontSize(12)
        .fontColor('#666666')
        .width('100%')

      Row({ space: 10 }) {
        Text(`设备：${this.deviceType}`).fontSize(12)
        Text(`API：${this.apiVersion}`).fontSize(12)
        Text(this.osName).fontSize(12).layoutWeight(1).maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .width('100%')
      .padding(8)
      .backgroundColor('#E8F0FE')
      .borderRadius(8)

      Row({ space: 8 }) {
        Text('共 9 个分区，演示区可上下滑动').fontSize(11).fontColor('#888888')
        Blank()
        Text('跳到计数与分段 ↓')
          .fontSize(12)
          .fontColor('#1565C0')
          .padding({ left: 10, right: 10, top: 4, bottom: 4 })
          .borderRadius(12)
          .backgroundColor('#E3F2FD')
          .onClick(() => {
            this.demoScroller.scrollToIndex(3, false, ScrollAlign.START);
            LogUtil.info('Index', '点击「跳到计数与分段」→ 定位到第 4 分区（计数），继续下滑可看第 5 分区（分段按钮）与第 6-9 分区（进阶演示）');
          })
      }
      .width('100%')

      if (this.bp === 'sm') {
        // 窄屏：演示区滚动 + 日志固定高度
        List({ space: 12, scroller: this.demoScroller }) {
          ListItem() {
            Column() {
              this.sectionChipV1()
            }
          }
          ListItem() {
            Column() {
              this.sectionChipV2()
            }
          }
          ListItem() {
            Column() {
              this.sectionChipGroup()
            }
          }
          ListItem() {
            Column() {
              this.sectionCounter()
            }
          }
          ListItem() {
            Column() {
              this.sectionSegment()
            }
          }
          ListItem() {
            Column() {
              this.sectionChipAdvanced()
            }
          }
          ListItem() {
            Column() {
              this.sectionGroupAdvanced()
            }
          }
          ListItem() {
            Column() {
              this.sectionCounterAdvanced()
            }
          }
          ListItem() {
            Column() {
              this.sectionSegmentAdvanced()
            }
          }
        }
        .layoutWeight(1)
        .width('100%')
        .scrollBar(BarState.Auto)
        Column() {
          this.logArea()
        }
        .width('100%')
        .height(200)
      } else {
        // 宽屏：左演示右日志
        Row({ space: 12 }) {
          List({ space: 12, scroller: this.demoScroller }) {
            ListItem() {
              Column() {
                this.sectionChipV1()
              }
            }
            ListItem() {
              Column() {
                this.sectionChipV2()
              }
            }
            ListItem() {
              Column() {
                this.sectionChipGroup()
              }
            }
            ListItem() {
              Column() {
                this.sectionCounter()
              }
            }
            ListItem() {
              Column() {
                this.sectionSegment()
              }
            }
            ListItem() {
              Column() {
                this.sectionChipAdvanced()
              }
            }
            ListItem() {
              Column() {
                this.sectionGroupAdvanced()
              }
            }
            ListItem() {
              Column() {
                this.sectionCounterAdvanced()
              }
            }
            ListItem() {
              Column() {
                this.sectionSegmentAdvanced()
              }
            }
          }
          .layoutWeight(1)
          .scrollBar(BarState.Auto)

          Column() {
            this.logArea()
          }
          .width('38%')
        }
        .layoutWeight(1)
        .alignItems(VerticalAlign.Top)
      }
    }
    .padding(16)
    .width('100%')
    .height('100%')
    .onAreaChange((_oldArea: Area, newArea: Area) => {
      const widthVp: number = Number(newArea.width);
      const next: Breakpoint = DeviceUtil.getBreakpoint(widthVp);
      if (next !== this.bp) {
        this.bp = next;
        LogUtil.info('Index', `窗口宽度 ${widthVp.toFixed(0)}vp，断点切换为 ${next}`);
      }
    })
  }
}
