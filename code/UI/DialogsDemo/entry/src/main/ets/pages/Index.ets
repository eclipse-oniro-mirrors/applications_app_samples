/**
 * DialogsDemo 主页面
 * 展示：设备信息卡 / 8 个弹窗场景按钮 / 事件日志面板
 * 场景1-6：DialogV2 家族（ComponentContent + getPromptAction().openCustomDialog 呈现）
 * 场景7：PopoverDialogV2（直接内嵌组件树的气泡弹窗）
 * 场景8：InterstitialDialogAction 插屏弹窗（原子化服务弹框 API）
 * 布局适配：sm（<600vp）单栏上下；md/lg 双栏（左按钮右日志）
 */
import {
  ComponentContent, AlertDialogV2, ConfirmDialogV2, SelectDialogV2, TipsDialogV2,
  LoadingDialogV2, CustomContentDialogV2, PopoverDialogV2, PopoverDialogV2Options,
  InterstitialDialogAction, IconStyle, TitlePosition, BottomOffset
} from '@kit.ArkUI';
import {
  DialogEventLog, InterstitialConfig, buildPrimaryButton, buildSecondaryButton, buildSheetInfos,
  ConfirmParams, AlertParams, SelectParams, TipsParams, LoadingParams, CustomParams
} from '../model/DialogModels';
import { LogUtil } from '../model/utils/LogUtil';
import { DeviceUtil, Breakpoint } from '../model/utils/DeviceUtil';

const TAG = 'DialogsDemo';
const MAX_LOG_COUNT = 120;

/** ComponentContent 呈现等价 customStyle=true：弹窗容器不带任何背景，
 *  DialogV2 组件自身也是透明排版，故每个 Builder 根节点需自绘白色圆角表面 */

/** 场景1：确认对话框 */
@Builder
function confirmBuilder(params: Object) {
  Column() {
    ConfirmDialogV2({
      title: (params as ConfirmParams).title,
      content: (params as ConfirmParams).content,
      checkTips: (params as ConfirmParams).checkTips,
      primaryButton: (params as ConfirmParams).primaryButton!,
      secondaryButton: (params as ConfirmParams).secondaryButton!
    })
  }
  .width('90%')
  .constraintSize({ maxWidth: 400 })
  .backgroundColor('#FFFFFF')
  .borderRadius(28)
  .clip(true)
}

/** 场景2：警告详情弹窗 */
@Builder
function alertBuilder(params: Object) {
  Column() {
    AlertDialogV2({
      primaryTitle: (params as AlertParams).primaryTitle,
      secondaryTitle: (params as AlertParams).secondaryTitle,
      content: (params as AlertParams).content,
      primaryButton: (params as AlertParams).primaryButton!,
      secondaryButton: (params as AlertParams).secondaryButton!
    })
  }
  .width('90%')
  .constraintSize({ maxWidth: 400 })
  .backgroundColor('#FFFFFF')
  .borderRadius(28)
  .clip(true)
}

/** 场景3：单选列表弹窗 */
@Builder
function selectBuilder(params: Object) {
  Column() {
    SelectDialogV2({
      title: (params as SelectParams).title,
      content: (params as SelectParams).content,
      selectedIndex: (params as SelectParams).selectedIndex,
      radioContent: (params as SelectParams).radioContent,
      confirm: (params as SelectParams).confirm!
    })
  }
  .width('90%')
  .constraintSize({ maxWidth: 400 })
  .backgroundColor('#FFFFFF')
  .borderRadius(28)
  .clip(true)
}

/** 场景4：图示提示弹窗 */
@Builder
function tipsBuilder(params: Object) {
  Column() {
    TipsDialogV2({
      imageRes: (params as TipsParams).imageRes,
      title: (params as TipsParams).title,
      content: (params as TipsParams).content,
      checkTips: (params as TipsParams).checkTips,
      primaryButton: (params as TipsParams).primaryButton!,
      secondaryButton: (params as TipsParams).secondaryButton!
    })
  }
  .width('90%')
  .constraintSize({ maxWidth: 400 })
  .backgroundColor('#FFFFFF')
  .borderRadius(28)
  .clip(true)
}

/** 场景5：加载中弹窗 */
@Builder
function loadingBuilder(params: Object) {
  Column() {
    LoadingDialogV2({
      content: (params as LoadingParams).content
    })
  }
  .width('90%')
  .constraintSize({ maxWidth: 400 })
  .backgroundColor('#FFFFFF')
  .borderRadius(28)
  .clip(true)
}

/** 场景6：自定义内容弹窗 */
@Builder
function customBuilder(params: Object) {
  Column() {
    CustomContentDialogV2({
      primaryTitle: (params as CustomParams).primaryTitle,
      secondaryTitle: (params as CustomParams).secondaryTitle,
      contentBuilder: customInnerBuilder,
      buttons: (params as CustomParams).buttons
    })
  }
  .width('90%')
  .constraintSize({ maxWidth: 400 })
  .backgroundColor('#FFFFFF')
  .borderRadius(28)
  .clip(true)
}

/** 场景6 自定义内容区：contentBuilder 须为零参 @Builder 直接引用，
 *  箭头闭包在 ComponentContent 分离上下文中会丢失组件 this 导致崩溃 */
let gCustomParams: CustomParams | null = null;

@Builder
function customInnerBuilder() {
  Column({ space: 8 }) {
    Text(`按钮数组元素数：${gCustomParams!.buttons.length}`)
      .fontSize(14)
    Text(`场景 id：${gCustomParams!.sceneId}，内容由 contentBuilder 渲染`)
      .fontSize(12)
      .fontColor('#666666')
  }
  .width('100%')
}

/** 场景7 气泡内容区：全局 @Builder 在 popover 渲染中会被无绑定调用（this 丢失），
 *  故改用 Index 的 @Builder 方法 + 箭头闭包词法捕获页面上下文 */

@Entry
@Component
struct Index {
  @State logs: string[] = [];
  @State bp: Breakpoint = 'sm';
  @State deviceType: string = '';
  @State osName: string = '';
  @State apiVersion: number = 0;
  @State popVisible: boolean = false;
  @State activeScene: number = 0;
  private selectedNetworkIndex: number = 1;
  @State customValue: number = 30;
  @State customCount: number = 0;
  private eventLog: DialogEventLog = new DialogEventLog();
  private current: ComponentContent<Object> | null = null;
  private interstitial: InterstitialDialogAction | null = null;

  aboutToAppear(): void {
    LogUtil.init((line: string) => {
      this.pushLog(line);
    });
    this.deviceType = DeviceUtil.getDeviceType();
    this.osName = DeviceUtil.getOsFullName();
    this.apiVersion = DeviceUtil.getSdkApiVersion();
    DeviceUtil.logDeviceProfile();
  }

  onPageShow(): void {
    // 插屏退到后台时可能被系统直接收起且不回调 onDialogClose，
    // 回到前台清掉引用，避免后续点击被“已打开”保护误拦
    this.interstitial = null;
  }

  private pushLog(line: string): void {
    this.logs = [line, ...this.logs].slice(0, MAX_LOG_COUNT);
  }

  /** 统一事件出口：模型簿记 + 面板日志 */
  private logEvent(sceneId: number, line: string): void {
    this.eventLog.record(line);
    LogUtil.info(TAG, line);
  }

  /** 以 ComponentContent + openCustomDialog 呈现任意 V2 弹窗内容；
   *  instant=true 时禁用显隐动画（场景3 选项点击后重开，避免闪动） */
  private showContent(content: ComponentContent<Object>, instant: boolean = false): void {
    const prompt = this.getUIContext().getPromptAction();
    if (this.current !== null) {
      prompt.closeCustomDialog(this.current);
      this.current = null;
    }
    this.current = content;
    if (instant) {
      prompt.openCustomDialog(content, {
        autoCancel: true,
        alignment: DialogAlignment.Center,
        maskColor: '#4D000000',
        transition: TransitionEffect.IDENTITY
      }).catch((err: Error) => {
        LogUtil.error(TAG, `openCustomDialog 失败：${err.message}`);
      });
    } else {
      prompt.openCustomDialog(content, {
        autoCancel: true,
        alignment: DialogAlignment.Center,
        maskColor: '#4D000000'
      }).catch((err: Error) => {
        LogUtil.error(TAG, `openCustomDialog 失败：${err.message}`);
      });
    }
  }

  /** 关闭当前 openCustomDialog 弹窗（场景5 定时关闭与“关闭弹窗”按钮共用） */
  private closeTop(): void {
    if (this.current !== null) {
      this.getUIContext().getPromptAction().closeCustomDialog(this.current);
      this.current = null;
    }
    if (this.interstitial !== null) {
      this.interstitial.closeDialog();
      this.interstitial = null;
    }
  }

  /** 场景1：ConfirmDialogV2 确认对话框 */
  private showConfirm(): void {
    this.activeScene = 1;
    const params: ConfirmParams = new ConfirmParams();
    params.title = '删除这条记录？';
    params.content = '删除后不可恢复，请谨慎操作。';
    params.checkTips = '不再提示';
    params.primaryButton = buildPrimaryButton('删除', () => {
      this.logEvent(1, DialogEventLog.formatClick(1) + ' → 主按钮“删除”');
      this.logEvent(1, DialogEventLog.formatClose(1, '确认框'));
      this.closeTop();
    });
    params.secondaryButton = buildSecondaryButton('取消', () => {
      this.logEvent(1, DialogEventLog.formatClick(1) + ' → 次按钮“取消”');
      this.logEvent(1, DialogEventLog.formatClose(1, '确认框'));
      this.closeTop();
    });
    this.logEvent(1, DialogEventLog.formatOpen(1, '确认框 ConfirmDialogV2'));
    const content: ComponentContent<Object> =
      new ComponentContent<Object>(this.getUIContext(), wrapBuilder(confirmBuilder), params);
    this.showContent(content);
  }

  /** 场景2：AlertDialogV2 警告详情弹窗 */
  private showAlert(): void {
    this.activeScene = 2;
    const params: AlertParams = new AlertParams();
    params.primaryTitle = '存储空间不足';
    params.secondaryTitle = '建议立即清理';
    params.content = '缓存已占用 3.2GB，继续下载可能失败。';
    params.primaryButton = buildPrimaryButton('去清理', () => {
      this.logEvent(2, DialogEventLog.formatClick(2) + ' → 主按钮“去清理”');
      this.logEvent(2, DialogEventLog.formatClose(2, '警告框'));
      this.closeTop();
    });
    params.secondaryButton = buildSecondaryButton('稍后', () => {
      this.logEvent(2, DialogEventLog.formatClick(2) + ' → 次按钮“稍后”');
      this.logEvent(2, DialogEventLog.formatClose(2, '警告框'));
      this.closeTop();
    });
    this.logEvent(2, DialogEventLog.formatOpen(2, '警告框 AlertDialogV2'));
    const content: ComponentContent<Object> =
      new ComponentContent<Object>(this.getUIContext(), wrapBuilder(alertBuilder), params);
    this.showContent(content);
  }

  /** 场景3：SelectDialogV2 单选列表弹窗 */
  private showSelect(): void {
    this.activeScene = 3;
    const params: SelectParams = new SelectParams();
    params.title = '选择网络';
    params.content = '连接到以下设备热点';
    params.selectedIndex = this.selectedNetworkIndex;
    params.radioContent = buildSheetInfos(['OHOS-Home-5G', 'OHOS-Office', 'OHOS-Guest'], (index: number) => {
      this.logEvent(3, DialogEventLog.formatSelect(3, index));
      // 本 ROM 的 SelectDialogV2 点击选项后由组件内部关闭弹窗，
      // 以新选中项重新呈现同一弹窗，保持“先选择、再确定”的交互
      params.selectedIndex = index;
      const reopen: ComponentContent<Object> =
        new ComponentContent<Object>(this.getUIContext(), wrapBuilder(selectBuilder), params);
      this.showContent(reopen, true);
    });
    params.confirm = buildPrimaryButton('确定', () => {
      this.selectedNetworkIndex = params.selectedIndex;
      this.logEvent(3, DialogEventLog.formatClick(3) + ' → 确认按钮');
      this.logEvent(3, DialogEventLog.formatClose(3, '选择框'));
      this.closeTop();
    });
    this.logEvent(3, DialogEventLog.formatOpen(3, '选择框 SelectDialogV2'));
    const content: ComponentContent<Object> =
      new ComponentContent<Object>(this.getUIContext(), wrapBuilder(selectBuilder), params);
    this.showContent(content, true);
  }

  /** 场景4：TipsDialogV2 图示提示弹窗 */
  private showTips(): void {
    this.activeScene = 4;
    const params: TipsParams = new TipsParams();
    params.imageRes = $r('app.media.startIcon');
    params.title = '开启智能同步';
    params.content = '开启后在 WLAN 环境自动备份相册与联系人。';
    params.checkTips = '记住我的选择';
    params.primaryButton = buildPrimaryButton('立即开启', () => {
      this.logEvent(4, DialogEventLog.formatClick(4) + ' → 主按钮“立即开启”');
      this.logEvent(4, DialogEventLog.formatClose(4, '提示框'));
      this.closeTop();
    });
    params.secondaryButton = buildSecondaryButton('暂不', () => {
      this.logEvent(4, DialogEventLog.formatClick(4) + ' → 次按钮“暂不”');
      this.logEvent(4, DialogEventLog.formatClose(4, '提示框'));
      this.closeTop();
    });
    this.logEvent(4, DialogEventLog.formatOpen(4, '提示框 TipsDialogV2'));
    const content: ComponentContent<Object> =
      new ComponentContent<Object>(this.getUIContext(), wrapBuilder(tipsBuilder), params);
    this.showContent(content);
  }

  /** 场景5：LoadingDialogV2 加载中弹窗（2s 后自动关闭） */
  private showLoading(): void {
    this.activeScene = 5;
    const params: LoadingParams = new LoadingParams();
    params.content = '正在同步数据…';
    this.logEvent(5, DialogEventLog.formatOpen(5, '加载框 LoadingDialogV2'));
    const content: ComponentContent<Object> =
      new ComponentContent<Object>(this.getUIContext(), wrapBuilder(loadingBuilder), params);
    this.showContent(content);
    setTimeout(() => {
      this.logEvent(5, DialogEventLog.formatClose(5, '加载框（2s 自动关闭）'));
      this.closeTop();
    }, 2000);
  }

  /** 场景6：CustomContentDialogV2 自定义内容弹窗 */
  private showCustom(): void {
    this.activeScene = 6;
    const params: CustomParams = new CustomParams();
    params.primaryTitle = '偏好设置';
    params.secondaryTitle = '自定义内容区';
    params.buttons = [
      buildSecondaryButton('重置', () => {
        this.customValue = 30;
        this.customCount = 0;
        this.logEvent(6, DialogEventLog.formatClick(6) + ' → 重置');
      }),
      buildPrimaryButton('保存', () => {
        this.logEvent(6, `${DialogEventLog.formatClick(6)} → 保存（值=${this.customValue}）`);
        this.logEvent(6, DialogEventLog.formatClose(6, '自定义框'));
        this.closeTop();
      })
    ];
    this.logEvent(6, DialogEventLog.formatOpen(6, '自定义框 CustomContentDialogV2'));
    gCustomParams = params;
    const content: ComponentContent<Object> =
      new ComponentContent<Object>(this.getUIContext(), wrapBuilder(customBuilder), params);
    this.showContent(content);
  }

  /** 场景8：InterstitialDialogAction 插屏弹窗 */
  private showInterstitial(): void {
    this.activeScene = 8;
    if (this.interstitial !== null) {
      this.logEvent(8, '插屏已打开，忽略重复点击');
      return;
    }
    const cfg: InterstitialConfig = new InterstitialConfig(
      '版本更新提示', '发现新版本 2.0.0，是否立即升级？',
      TitlePosition.BOTTOM, IconStyle.LIGHT, BottomOffset.OFFSET_FOR_NONE);
    try {
      const dialog: InterstitialDialogAction = new InterstitialDialogAction({
        uiContext: this.getUIContext(),
        title: cfg.title,
        subtitle: cfg.subtitle,
        titlePosition: cfg.titlePosition,
        iconStyle: cfg.iconStyle,
        bottomOffsetType: cfg.bottomOffsetType,
        backgroundImage: $r('app.media.background'),
        foregroundImage: $r('app.media.startIcon'),
        onDialogClick: () => {
          this.logEvent(8, DialogEventLog.formatClick(8));
          // 点击插屏本体后组件会自行收起且不一定回调 onDialogClose，
          // 主动关闭并清空引用，保证再次点击场景8可重新弹出
          const dlg = this.interstitial;
          this.interstitial = null;
          if (dlg !== null) {
            try {
              dlg.closeDialog();
            } catch (err) {
              LogUtil.error(TAG, `插屏关闭失败：${(err as Error).message}`);
            }
          }
        },
        onDialogClose: () => {
          this.logEvent(8, DialogEventLog.formatClose(8, '插屏'));
          this.interstitial = null;
        }
      });
      this.interstitial = dialog;
      dialog.openDialog();
      this.logEvent(8, DialogEventLog.formatOpen(8, '插屏 InterstitialDialogAction'));
    } catch (err) {
      this.interstitial = null;
      const e = err as Error;
      this.logEvent(8, DialogEventLog.formatError(8, e.message));
    }
  }

  @Builder
  buttonsArea() {
    Column({ space: 8 }) {
      Button('场景1：ConfirmDialogV2 确认对话框（复选框/主次按钮）')
        .width('100%')
        .backgroundColor(this.activeScene === 1 ? '#007DFF' : '#F1F3F5')
        .fontColor(this.activeScene === 1 ? '#FFFFFF' : '#182431')
        .onClick(() => {
          this.showConfirm();
        })
      Button('场景2：AlertDialogV2 警告详情弹窗（双标题）')
        .width('100%')
        .backgroundColor(this.activeScene === 2 ? '#007DFF' : '#F1F3F5')
        .fontColor(this.activeScene === 2 ? '#FFFFFF' : '#182431')
        .onClick(() => {
          this.showAlert();
        })
      Button('场景3：SelectDialogV2 单选列表弹窗（预选中/确认）')
        .width('100%')
        .backgroundColor(this.activeScene === 3 ? '#007DFF' : '#F1F3F5')
        .fontColor(this.activeScene === 3 ? '#FFFFFF' : '#182431')
        .onClick(() => {
          this.showSelect();
        })
      Button('场景4：TipsDialogV2 图示提示弹窗（图标/勾选）')
        .width('100%')
        .backgroundColor(this.activeScene === 4 ? '#007DFF' : '#F1F3F5')
        .fontColor(this.activeScene === 4 ? '#FFFFFF' : '#182431')
        .onClick(() => {
          this.showTips();
        })
      Button('场景5：LoadingDialogV2 加载弹窗（2s 自动关闭）')
        .width('100%')
        .backgroundColor(this.activeScene === 5 ? '#007DFF' : '#F1F3F5')
        .fontColor(this.activeScene === 5 ? '#FFFFFF' : '#182431')
        .onClick(() => {
          this.showLoading();
        })
      Button('场景6：CustomContentDialogV2 自定义内容弹窗（按钮数组）')
        .width('100%')
        .backgroundColor(this.activeScene === 6 ? '#007DFF' : '#F1F3F5')
        .fontColor(this.activeScene === 6 ? '#FFFFFF' : '#182431')
        .onClick(() => {
          this.showCustom();
        })
      Button('场景7：PopoverDialogV2 气泡弹窗（锚点显隐）')
        .width('100%')
        .backgroundColor(this.activeScene === 7 ? '#007DFF' : '#F1F3F5')
        .fontColor(this.activeScene === 7 ? '#FFFFFF' : '#182431')
        .onClick(() => {
          this.activeScene = 7;
          this.popVisible = !this.popVisible;
          this.logEvent(7, `${DialogEventLog.formatOpen(7, '气泡 PopoverDialogV2')} visible=${this.popVisible}`);
        })
      Button('场景8：InterstitialDialogAction 插屏弹窗（原子化服务弹框）')
        .width('100%')
        .backgroundColor(this.activeScene === 8 ? '#007DFF' : '#F1F3F5')
        .fontColor(this.activeScene === 8 ? '#FFFFFF' : '#182431')
        .onClick(() => {
          this.showInterstitial();
        })
    }
    .width('100%')
  }

  @Builder
  logArea() {
    Column({ space: 4 }) {
      Row({ space: 8 }) {
        Text('事件日志')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
        Blank()
        Text(`断点：${this.bp}`)
          .fontSize(11)
          .fontColor('#999999')
        // 场景7：PopoverDialogV2 直接内嵌组件树，锚点为日志栏小按钮
        PopoverDialogV2({
          visible: this.popVisible,
          $visible: (visible: boolean) => {
            this.popVisible = visible;
            if (!visible) {
              this.logEvent(7, DialogEventLog.formatClose(7, '气泡'));
            }
          },
          popover: {
            builder: (): void => {
              this.popContent()
            },
            placement: Placement.Bottom
          } as PopoverDialogV2Options,
          targetBuilder: (): void => {
            this.popAnchor()
          }
        })
      }
      .width('100%')

      List({ space: 4 }) {
        ForEach(this.logs, (line: string, index: number) => {
          ListItem() {
            Text(line)
              .fontSize(12)
              .width('100%')
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
    Column({ space: 12 }) {
      Text('弹窗组件：DialogV2 与插屏弹窗')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .width('100%')
      Text('DialogV2（API 18+）标准弹窗家族 · InterstitialDialogAction（API 12+）插屏弹窗 · 保持上下文的临时交互')
        .fontSize(12)
        .fontColor('#666666')
        .width('100%')

      Row({ space: 10 }) {
        Text(`设备：${this.deviceType}`)
          .fontSize(12)
        Text(`API：${this.apiVersion}`)
          .fontSize(12)
        Text(this.osName)
          .fontSize(12)
          .layoutWeight(1)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .width('100%')
      .padding(8)
      .backgroundColor('#E8F0FE')
      .borderRadius(8)

      if (this.bp === 'sm') {
        this.buttonsArea()
        this.logArea()
      } else {
        Row({ space: 12 }) {
          Column() {
            this.buttonsArea()
          }
          .width('38%')

          Column() {
            this.logArea()
          }
          .width('62%')
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
        LogUtil.info(TAG, `窗口宽度 ${widthVp.toFixed(0)}vp，断点切换为 ${next}`);
      }
    })
  }

  /** 场景7 锚点：悬浮小按钮，点击自身也可切换显隐 */
  @Builder
  popAnchor() {
    Button(this.popVisible ? '收起气泡' : '气泡锚点')
      .height(36)
      .onClick(() => {
        this.popVisible = !this.popVisible;
      })
  }

  /** 场景7 气泡内容 */
  @Builder
  popContent() {
    Column({ space: 6 }) {
      Text('PopoverDialogV2 气泡')
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
      Text('visible/$visible 控制显隐，targetBuilder 为锚点')
        .fontSize(12)
        .fontColor('#666666')
    }
    .padding(10)
  }
}
