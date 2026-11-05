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
 
import {
  ComponentContent, AlertDialogV2, ConfirmDialogV2, SelectDialogV2, TipsDialogV2,
  LoadingDialogV2, CustomContentDialogV2, PopoverDialogV2, PopoverDialogV2Options,
  InterstitialDialogAction, IconStyle, TitlePosition, BottomOffset, ShowDialogSuccessResponse
} from '@kit.ArkUI';
import {
  DialogEventLog, InterstitialConfig, buildPrimaryButton, buildSecondaryButton, buildSheetInfos,
  ConfirmParams, AlertParams, SelectParams, TipsParams, LoadingParams, CustomParams,
  formatDateValue, formatTimeValue, formatTextValue
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
  private dialogLog: DialogEventLog = new DialogEventLog();
  private current: ComponentContent<Object> | null = null;
  private interstitial: InterstitialDialogAction | null = null;
  private loadingTimer: number = -1;
  private toastTimer: number = -1;

  aboutToAppear(): void {
    LogUtil.init((line: string) => {
      this.pushLog(line);
    });
    this.deviceType = DeviceUtil.getDeviceType();
    this.osName = DeviceUtil.getOsFullName();
    this.apiVersion = DeviceUtil.getSdkApiVersion();
    DeviceUtil.logDeviceProfile();
  }

  aboutToDisappear(): void {
    if (this.loadingTimer !== -1) {
      clearTimeout(this.loadingTimer);
      this.loadingTimer = -1;
    }
    if (this.toastTimer !== -1) {
      clearTimeout(this.toastTimer);
      this.toastTimer = -1;
    }
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
    this.dialogLog.record(line);
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
    params.checkTips = '记住本次选择';
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
    this.loadingTimer = setTimeout(() => {
      this.loadingTimer = -1;
      this.logEvent(5, DialogEventLog.formatClose(5, '加载框（2s 自动关闭）'));
      // 只关闭本次 loading 弹窗；期间若已打开其它弹窗，不能误关
      if (this.current === content) {
        this.closeTop();
      }
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
              LogUtil.error(TAG, `插屏关闭失败：${err instanceof Error ? err.message : '未知错误'}`);
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
      const e: Error = err instanceof Error ? err : new Error('插屏打开失败');
      this.logEvent(8, DialogEventLog.formatError(8, e.message));
    }
  }

  /** 场景9：ActionSheet 操作列表弹窗 */
  private showActionSheet(): void {
    this.activeScene = 9;
    this.logEvent(9, DialogEventLog.formatOpen(9, '操作列表 ActionSheet'));
    this.getUIContext().showActionSheet({
      title: '文件操作',
      subtitle: 'example.png · 2.4MB',
      message: '选择要执行的操作',
      autoCancel: true,
      confirm: {
        value: '取消',
        action: (): void => {
          this.logEvent(9, DialogEventLog.formatClose(9, '操作列表（取消）'));
        }
      },
      cancel: (): void => {
        this.logEvent(9, DialogEventLog.formatClose(9, '操作列表（点遮罩）'));
      },
      sheets: [
        {
          title: '重命名',
          action: (): void => {
            this.logEvent(9, `${DialogEventLog.formatClick(9)} → 重命名`);
            this.logEvent(9, DialogEventLog.formatClose(9, '操作列表'));
          }
        },
        {
          title: '分享',
          action: (): void => {
            this.logEvent(9, `${DialogEventLog.formatClick(9)} → 分享`);
            this.logEvent(9, DialogEventLog.formatClose(9, '操作列表'));
          }
        },
        {
          title: '删除',
          action: (): void => {
            this.logEvent(9, `${DialogEventLog.formatClick(9)} → 删除`);
            this.logEvent(9, DialogEventLog.formatClose(9, '操作列表'));
          }
        }
      ]
    });
  }

  /** 场景10：DatePickerDialog 日期选择弹窗 */
  private showDatePicker(): void {
    this.activeScene = 10;
    this.logEvent(10, DialogEventLog.formatOpen(10, '日期选择 DatePickerDialog'));
    const now: Date = new Date();
    const start: Date = new Date(now.getFullYear() - 1, 0, 1);
    const end: Date = new Date(now.getFullYear() + 1, 11, 31);
    this.getUIContext().showDatePickerDialog({
      start: start,
      end: end,
      selected: now,
      lunar: false,
      onDateAccept: (value: Date): void => {
        this.logEvent(10, `${DialogEventLog.formatClick(10)} → ${formatDateValue(value)}`);
        this.logEvent(10, DialogEventLog.formatClose(10, '日期选择'));
      },
      onCancel: (): void => {
        this.logEvent(10, DialogEventLog.formatClose(10, '日期选择（取消）'));
      }
    });
  }

  /** 场景11：TimePickerDialog 时间选择弹窗 */
  private showTimePicker(): void {
    this.activeScene = 11;
    this.logEvent(11, DialogEventLog.formatOpen(11, '时间选择 TimePickerDialog'));
    this.getUIContext().showTimePickerDialog({
      selected: new Date(),
      useMilitaryTime: true,
      onAccept: (value: TimePickerResult): void => {
        this.logEvent(11, `${DialogEventLog.formatClick(11)} → ${formatTimeValue(value.hour, value.minute)}`);
        this.logEvent(11, DialogEventLog.formatClose(11, '时间选择'));
      },
      onCancel: (): void => {
        this.logEvent(11, DialogEventLog.formatClose(11, '时间选择（取消）'));
      }
    });
  }

  /** 场景12：TextPickerDialog 文本选择弹窗 */
  private showTextPicker(): void {
    this.activeScene = 12;
    this.logEvent(12, DialogEventLog.formatOpen(12, '文本选择 TextPickerDialog'));
    this.getUIContext().showTextPickerDialog({
      range: ['北京', '上海', '广州', '深圳'],
      selected: 1,
      onAccept: (value: TextPickerResult): void => {
        const rawValue: string | string[] = value.value;
        const rawIndex: number | number[] = value.index;
        const text: string = typeof rawValue === 'string' ? rawValue : rawValue[0];
        const index: number = typeof rawIndex === 'number' ? rawIndex : rawIndex[0];
        this.logEvent(12, `${DialogEventLog.formatClick(12)} → ${formatTextValue(text, index)}`);
        this.logEvent(12, DialogEventLog.formatClose(12, '文本选择'));
      },
      onCancel: (): void => {
        this.logEvent(12, DialogEventLog.formatClose(12, '文本选择（取消）'));
      }
    });
  }

  /** 场景13：Toast 轻提示（openToast + closeToast） */
  private showToast(): void {
    this.activeScene = 13;
    this.logEvent(13, DialogEventLog.formatOpen(13, '轻提示 Toast'));
    this.getUIContext().getPromptAction().openToast({
      message: '已保存到相册',
      duration: 3000,
      bottom: '80vp'
    }).then((toastId: number): void => {
      this.logEvent(13, `toastId=${toastId}`);
      this.toastTimer = setTimeout((): void => {
        this.toastTimer = -1;
        this.getUIContext().getPromptAction().closeToast(toastId);
        this.logEvent(13, DialogEventLog.formatClose(13, '轻提示'));
      }, 1000);
    }).catch((err: Error): void => {
      this.logEvent(13, DialogEventLog.formatError(13, err.message));
    });
  }

  /** 场景14：PromptAction.showDialog 系统按钮弹窗 */
  private showSystemDialog(): void {
    this.activeScene = 14;
    this.logEvent(14, DialogEventLog.formatOpen(14, '系统按钮弹窗 showDialog'));
    this.getUIContext().getPromptAction().showDialog({
      title: '保存更改？',
      message: '你有未保存的更改，是否保存后退出？',
      buttons: [
        { text: '不保存', color: '#666666' },
        { text: '保存', color: '#007DFF' }
      ]
    }).then((result: ShowDialogSuccessResponse): void => {
      this.logEvent(14, `${DialogEventLog.formatClick(14)} → index=${result.index}`);
      this.logEvent(14, DialogEventLog.formatClose(14, '系统按钮弹窗'));
    }).catch((err: Error): void => {
      this.logEvent(14, DialogEventLog.formatError(14, err.message));
    });
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
      Button('场景9：ActionSheet 操作列表弹窗（多项操作/取消）')
        .width('100%')
        .backgroundColor(this.activeScene === 9 ? '#007DFF' : '#F1F3F5')
        .fontColor(this.activeScene === 9 ? '#FFFFFF' : '#182431')
        .onClick(() => {
          this.showActionSheet();
        })
      Button('场景10：DatePickerDialog 日期选择弹窗')
        .width('100%')
        .backgroundColor(this.activeScene === 10 ? '#007DFF' : '#F1F3F5')
        .fontColor(this.activeScene === 10 ? '#FFFFFF' : '#182431')
        .onClick(() => {
          this.showDatePicker();
        })
      Button('场景11：TimePickerDialog 时间选择弹窗')
        .width('100%')
        .backgroundColor(this.activeScene === 11 ? '#007DFF' : '#F1F3F5')
        .fontColor(this.activeScene === 11 ? '#FFFFFF' : '#182431')
        .onClick(() => {
          this.showTimePicker();
        })
      Button('场景12：TextPickerDialog 文本选择弹窗')
        .width('100%')
        .backgroundColor(this.activeScene === 12 ? '#007DFF' : '#F1F3F5')
        .fontColor(this.activeScene === 12 ? '#FFFFFF' : '#182431')
        .onClick(() => {
          this.showTextPicker();
        })
      Button('场景13：Toast 轻提示（openToast/closeToast）')
        .width('100%')
        .backgroundColor(this.activeScene === 13 ? '#007DFF' : '#F1F3F5')
        .fontColor(this.activeScene === 13 ? '#FFFFFF' : '#182431')
        .onClick(() => {
          this.showToast();
        })
      Button('场景14：showDialog 系统按钮弹窗')
        .width('100%')
        .backgroundColor(this.activeScene === 14 ? '#007DFF' : '#F1F3F5')
        .fontColor(this.activeScene === 14 ? '#FFFFFF' : '#182431')
        .onClick(() => {
          this.showSystemDialog();
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

      if (this.bp === 'sm') {
        Column() {
          this.logList()
        }
        .height(240)
        .width('100%')
      } else {
        Column() {
          this.logList()
        }
        .layoutWeight(1)
        .width('100%')
      }
    }
    .layoutWeight(this.bp === 'sm' ? 0 : 1)
    .width('100%')
  }

  @Builder
  logList() {
    List({ space: 4 }) {
      ForEach(this.logs, (line: string, index: number) => {
        ListItem() {
          Text(line)
            .fontSize(12)
            .width('100%')
        }
      }, (line: string, index: number) => `${index}-${line}`)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
    .borderRadius(8)
    .padding(8)
  }

  build() {
    Column({ space: 12 }) {
      Text('弹窗组件：DialogV2 与插屏弹窗')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .width('100%')
      Text('DialogV2 标准弹窗家族 · InterstitialDialogAction 插屏 · ActionSheet/选择器/Toast/showDialog 系统弹窗')
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
        Scroll() {
          Column({ space: 12 }) {
            this.buttonsArea()
            this.logArea()
          }
          .width('100%')
        }
        .layoutWeight(1)
        .width('100%')
        .scrollBar(BarState.Auto)
        .edgeEffect(EdgeEffect.Spring)
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
    .padding({ left: 16, right: 16, top: 16, bottom: 24 })
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
