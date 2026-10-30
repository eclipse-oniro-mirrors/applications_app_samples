/**
 * ChipAndCounterDemo 主页面
 * 分区展示：Chip V1 / ChipV2 / ChipGroupV2 / CounterV2（四类型）/ SegmentButtonV2（三形态）
 * 布局适配：sm（<600vp）单栏；md/lg（平板/2in1/横屏）左演示右日志双栏
 * 所有交互（激活切换/关闭/选择变化/计数变化）均输出日志。
 */
import { LogUtil } from '../model/utils/LogUtil';
import { DeviceUtil, Breakpoint } from '../model/utils/DeviceUtil';
import { TagStore, CounterLogic, ChipConfigFactory } from '../model/ChipModels';
import {
  Chip, ChipOptions, ChipSize, LabelOptions, PrefixIconOptions, SuffixIconOptions, CloseOptions,
  ChipV2, ChipV2Options, ChipV2Size, ChipV2Label, ChipV2PrefixImageIcon,
  ChipV2SuffixImageIcon, ChipV2SuffixImageIconConfig,
  ChipGroupV2, ChipGroupV2Items, ChipGroupV2ItemStyle, ChipGroupV2Space,
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
  private store: TagStore = new TagStore();
  private logSeq: number = 0;
  private demoScroller: Scroller = new Scroller();
  private listLogic: CounterLogic = new CounterLogic(5, 0, 20, 1);
  private compactLogic: CounterLogic = new CounterLogic(1, 1, 9, 1);
  private inlineLogic: CounterLogic = new CounterLogic(10, 0, 100, 5);
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
        Text('共 5 个分区，演示区可上下滑动').fontSize(11).fontColor('#888888')
        Blank()
        Text('跳到计数与分段 ↓')
          .fontSize(12)
          .fontColor('#1565C0')
          .padding({ left: 10, right: 10, top: 4, bottom: 4 })
          .borderRadius(12)
          .backgroundColor('#E3F2FD')
          .onClick(() => {
            this.demoScroller.scrollToIndex(3, false, ScrollAlign.START);
            LogUtil.info('Index', '点击「跳到计数与分段」→ 定位到第 4 分区（计数），继续下滑可看第 5 分区（分段按钮）');
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
