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
    Text($r('app.string.d6_inner_count', gCustomParams!.buttons.length))
      .fontSize(14)
    Text($r('app.string.d6_inner_desc', gCustomParams!.sceneId))
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
  private disposed: boolean = false;

  aboutToAppear(): void {
    this.disposed = false;
    LogUtil.init((line: string) => {
      this.pushLog(line);
    });
    this.deviceType = DeviceUtil.getDeviceType();
    this.osName = DeviceUtil.getOsFullName();
    this.apiVersion = DeviceUtil.getSdkApiVersion();
    DeviceUtil.logDeviceProfile();
  }

  aboutToDisappear(): void {
    this.disposed = true;
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
      try {
        prompt.closeCustomDialog(this.current);
      } catch (err) {
        LogUtil.error(TAG, `Failed to close previous dialog: ${err instanceof Error ? err.message : 'Unknown error'}`);
      }
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
        LogUtil.error(TAG, `openCustomDialog failed: ${err.message}`);
      });
    } else {
      prompt.openCustomDialog(content, {
        autoCancel: true,
        alignment: DialogAlignment.Center,
        maskColor: '#4D000000'
      }).catch((err: Error) => {
        LogUtil.error(TAG, `openCustomDialog failed: ${err.message}`);
      });
    }
  }

  /** 关闭当前 openCustomDialog 弹窗（场景5 定时关闭与“关闭弹窗”按钮共用） */
  private closeTop(): void {
    if (this.current !== null) {
      try {
        this.getUIContext().getPromptAction().closeCustomDialog(this.current);
      } catch (err) {
        LogUtil.error(TAG, `Failed to close current dialog: ${err instanceof Error ? err.message : 'Unknown error'}`);
      }
      this.current = null;
    }
    if (this.interstitial !== null) {
      try {
        this.interstitial.closeDialog();
      } catch (err) {
        LogUtil.error(TAG, `Failed to close interstitial: ${err instanceof Error ? err.message : 'Unknown error'}`);
      }
      this.interstitial = null;
    }
  }

  /** 场景1：ConfirmDialogV2 确认对话框 */
  private showConfirm(): void {
    this.activeScene = 1;
    const params: ConfirmParams = new ConfirmParams();
    params.title = $r('app.string.d1_title');
    params.content = $r('app.string.d1_content');
    params.checkTips = $r('app.string.d1_check');
    params.primaryButton = buildPrimaryButton($r('app.string.d1_primary'), () => {
      this.logEvent(1, DialogEventLog.formatClick(1) + ' → primary button "Delete"');
      this.logEvent(1, DialogEventLog.formatClose(1, 'Confirm dialog'));
      this.closeTop();
    });
    params.secondaryButton = buildSecondaryButton($r('app.string.common_cancel'), () => {
      this.logEvent(1, DialogEventLog.formatClick(1) + ' → secondary button "Cancel"');
      this.logEvent(1, DialogEventLog.formatClose(1, 'Confirm dialog'));
      this.closeTop();
    });
    this.logEvent(1, DialogEventLog.formatOpen(1, 'Confirm dialog (ConfirmDialogV2)'));
    const content: ComponentContent<Object> =
      new ComponentContent<Object>(this.getUIContext(), wrapBuilder(confirmBuilder), params);
    this.showContent(content);
  }

  /** 场景2：AlertDialogV2 警告详情弹窗 */
  private showAlert(): void {
    this.activeScene = 2;
    const params: AlertParams = new AlertParams();
    params.primaryTitle = $r('app.string.d2_primary_title');
    params.secondaryTitle = $r('app.string.d2_secondary_title');
    params.content = $r('app.string.d2_content');
    params.primaryButton = buildPrimaryButton($r('app.string.d2_primary'), () => {
      this.logEvent(2, DialogEventLog.formatClick(2) + ' → primary button "Clean up"');
      this.logEvent(2, DialogEventLog.formatClose(2, 'Alert dialog'));
      this.closeTop();
    });
    params.secondaryButton = buildSecondaryButton($r('app.string.d2_secondary'), () => {
      this.logEvent(2, DialogEventLog.formatClick(2) + ' → secondary button "Later"');
      this.logEvent(2, DialogEventLog.formatClose(2, 'Alert dialog'));
      this.closeTop();
    });
    this.logEvent(2, DialogEventLog.formatOpen(2, 'Alert dialog (AlertDialogV2)'));
    const content: ComponentContent<Object> =
      new ComponentContent<Object>(this.getUIContext(), wrapBuilder(alertBuilder), params);
    this.showContent(content);
  }

  /** 场景3：SelectDialogV2 单选列表弹窗 */
  private showSelect(): void {
    this.activeScene = 3;
    const params: SelectParams = new SelectParams();
    params.title = $r('app.string.d3_title');
    params.content = $r('app.string.d3_content');
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
    params.confirm = buildPrimaryButton($r('app.string.common_confirm'), () => {
      this.selectedNetworkIndex = params.selectedIndex;
      this.logEvent(3, DialogEventLog.formatClick(3) + ' → confirm button');
      this.logEvent(3, DialogEventLog.formatClose(3, 'Select dialog'));
      this.closeTop();
    });
    this.logEvent(3, DialogEventLog.formatOpen(3, 'Select dialog (SelectDialogV2)'));
    const content: ComponentContent<Object> =
      new ComponentContent<Object>(this.getUIContext(), wrapBuilder(selectBuilder), params);
    this.showContent(content, true);
  }

  /** 场景4：TipsDialogV2 图示提示弹窗 */
  private showTips(): void {
    this.activeScene = 4;
    const params: TipsParams = new TipsParams();
    params.imageRes = $r('app.media.startIcon');
    params.title = $r('app.string.d4_title');
    params.content = $r('app.string.d4_content');
    params.checkTips = $r('app.string.d4_check');
    params.primaryButton = buildPrimaryButton($r('app.string.d4_primary'), () => {
      this.logEvent(4, DialogEventLog.formatClick(4) + ' → primary button "Enable now"');
      this.logEvent(4, DialogEventLog.formatClose(4, 'Tips dialog'));
      this.closeTop();
    });
    params.secondaryButton = buildSecondaryButton($r('app.string.d4_secondary'), () => {
      this.logEvent(4, DialogEventLog.formatClick(4) + ' → secondary button "Not now"');
      this.logEvent(4, DialogEventLog.formatClose(4, 'Tips dialog'));
      this.closeTop();
    });
    this.logEvent(4, DialogEventLog.formatOpen(4, 'Tips dialog (TipsDialogV2)'));
    const content: ComponentContent<Object> =
      new ComponentContent<Object>(this.getUIContext(), wrapBuilder(tipsBuilder), params);
    this.showContent(content);
  }

  /** 场景5：LoadingDialogV2 加载中弹窗（2s 后自动关闭） */
  private showLoading(): void {
    this.activeScene = 5;
    // 连点会重复进入：先清掉上一次还未触发的自动关闭定时器，避免遗留定时器误写日志
    if (this.loadingTimer !== -1) {
      clearTimeout(this.loadingTimer);
      this.loadingTimer = -1;
    }
    const params: LoadingParams = new LoadingParams();
    params.content = $r('app.string.d5_content');
    this.logEvent(5, DialogEventLog.formatOpen(5, 'Loading dialog (LoadingDialogV2)'));
    const content: ComponentContent<Object> =
      new ComponentContent<Object>(this.getUIContext(), wrapBuilder(loadingBuilder), params);
    this.showContent(content);
    this.loadingTimer = setTimeout(() => {
      this.loadingTimer = -1;
      this.logEvent(5, DialogEventLog.formatClose(5, 'Loading dialog (auto close after 2s)'));
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
    params.primaryTitle = $r('app.string.d6_primary_title');
    params.secondaryTitle = $r('app.string.d6_secondary_title');
    params.buttons = [
      buildSecondaryButton($r('app.string.d6_reset'), () => {
        this.customValue = 30;
        this.customCount = 0;
        this.logEvent(6, DialogEventLog.formatClick(6) + ' → Reset');
      }),
      buildPrimaryButton($r('app.string.d6_save'), () => {
        this.logEvent(6, `${DialogEventLog.formatClick(6)} → Save (value=${this.customValue})`);
        this.logEvent(6, DialogEventLog.formatClose(6, 'Custom dialog'));
        this.closeTop();
      })
    ];
    this.logEvent(6, DialogEventLog.formatOpen(6, 'Custom dialog (CustomContentDialogV2)'));
    gCustomParams = params;
    const content: ComponentContent<Object> =
      new ComponentContent<Object>(this.getUIContext(), wrapBuilder(customBuilder), params);
    this.showContent(content);
  }

  /** 场景8：InterstitialDialogAction 插屏弹窗 */
  private showInterstitial(): void {
    this.activeScene = 8;
    if (this.interstitial !== null) {
      this.logEvent(8, 'Interstitial is already open; duplicate click ignored');
      return;
    }
    const cfg: InterstitialConfig = new InterstitialConfig(
      $r('app.string.interstitial_title'), $r('app.string.interstitial_subtitle'),
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
              LogUtil.error(TAG, `Failed to close interstitial: ${err instanceof Error ? err.message : 'Unknown error'}`);
            }
          }
        },
        onDialogClose: () => {
          this.logEvent(8, DialogEventLog.formatClose(8, 'Interstitial'));
          this.interstitial = null;
        }
      });
      this.interstitial = dialog;
      dialog.openDialog();
      this.logEvent(8, DialogEventLog.formatOpen(8, 'Interstitial (InterstitialDialogAction)'));
    } catch (err) {
      this.interstitial = null;
      const e: Error = err instanceof Error ? err : new Error('Failed to open interstitial');
      this.logEvent(8, DialogEventLog.formatError(8, e.message));
    }
  }

  /** 场景9：ActionSheet 操作列表弹窗 */
  private showActionSheet(): void {
    this.activeScene = 9;
    this.logEvent(9, DialogEventLog.formatOpen(9, 'Action list (ActionSheet)'));
    this.getUIContext().showActionSheet({
      title: $r('app.string.d9_title'),
      subtitle: $r('app.string.d9_subtitle'),
      message: $r('app.string.d9_message'),
      autoCancel: true,
      confirm: {
        value: $r('app.string.common_cancel'),
        action: (): void => {
          this.logEvent(9, DialogEventLog.formatClose(9, 'Action list (cancel)'));
        }
      },
      cancel: (): void => {
        this.logEvent(9, DialogEventLog.formatClose(9, 'Action list (mask tap)'));
      },
      sheets: [
        {
          title: $r('app.string.d9_rename'),
          action: (): void => {
            this.logEvent(9, `${DialogEventLog.formatClick(9)} → Rename`);
            this.logEvent(9, DialogEventLog.formatClose(9, 'Action list'));
          }
        },
        {
          title: $r('app.string.d9_share'),
          action: (): void => {
            this.logEvent(9, `${DialogEventLog.formatClick(9)} → Share`);
            this.logEvent(9, DialogEventLog.formatClose(9, 'Action list'));
          }
        },
        {
          title: $r('app.string.d9_delete'),
          action: (): void => {
            this.logEvent(9, `${DialogEventLog.formatClick(9)} → Delete`);
            this.logEvent(9, DialogEventLog.formatClose(9, 'Action list'));
          }
        }
      ]
    });
  }

  /** 场景10：DatePickerDialog 日期选择弹窗 */
  private showDatePicker(): void {
    this.activeScene = 10;
    this.logEvent(10, DialogEventLog.formatOpen(10, 'Date picker (DatePickerDialog)'));
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
        this.logEvent(10, DialogEventLog.formatClose(10, 'Date picker'));
      },
      onCancel: (): void => {
        this.logEvent(10, DialogEventLog.formatClose(10, 'Date picker (cancel)'));
      }
    });
  }

  /** 场景11：TimePickerDialog 时间选择弹窗 */
  private showTimePicker(): void {
    this.activeScene = 11;
    this.logEvent(11, DialogEventLog.formatOpen(11, 'Time picker (TimePickerDialog)'));
    this.getUIContext().showTimePickerDialog({
      selected: new Date(),
      useMilitaryTime: true,
      onAccept: (value: TimePickerResult): void => {
        this.logEvent(11, `${DialogEventLog.formatClick(11)} → ${formatTimeValue(value.hour, value.minute)}`);
        this.logEvent(11, DialogEventLog.formatClose(11, 'Time picker'));
      },
      onCancel: (): void => {
        this.logEvent(11, DialogEventLog.formatClose(11, 'Time picker (cancel)'));
      }
    });
  }

  /** 场景12：TextPickerDialog 文本选择弹窗 */
  private showTextPicker(): void {
    this.activeScene = 12;
    this.logEvent(12, DialogEventLog.formatOpen(12, 'Text picker (TextPickerDialog)'));
    this.getUIContext().showTextPickerDialog({
      range: ['Beijing', 'Shanghai', 'Guangzhou', 'Shenzhen'],
      selected: 1,
      onAccept: (value: TextPickerResult): void => {
        const rawValue: string | string[] = value.value;
        const rawIndex: number | number[] = value.index;
        const text: string = typeof rawValue === 'string' ? rawValue : rawValue[0];
        const index: number = typeof rawIndex === 'number' ? rawIndex : rawIndex[0];
        this.logEvent(12, `${DialogEventLog.formatClick(12)} → ${formatTextValue(text, index)}`);
        this.logEvent(12, DialogEventLog.formatClose(12, 'Text picker'));
      },
      onCancel: (): void => {
        this.logEvent(12, DialogEventLog.formatClose(12, 'Text picker (cancel)'));
      }
    });
  }

  /** 场景13：Toast 轻提示（openToast + closeToast） */
  private showToast(): void {
    this.activeScene = 13;
    // 连点会重复进入：先清掉上一轮未触发的关闭定时器，避免遗留定时器关闭到过期的 toastId
    if (this.toastTimer !== -1) {
      clearTimeout(this.toastTimer);
      this.toastTimer = -1;
    }
    this.logEvent(13, DialogEventLog.formatOpen(13, 'Toast'));
    this.getUIContext().getPromptAction().openToast({
      message: $r('app.string.d13_message'),
      duration: 3000,
      bottom: '80vp'
    }).then((toastId: number): void => {
      // openToast 是异步的，回调可能晚于页面销毁
      if (this.disposed) {
        return;
      }
      this.logEvent(13, `toastId=${toastId}`);
      this.toastTimer = setTimeout((): void => {
        this.toastTimer = -1;
        if (this.disposed) {
          return;
        }
        this.getUIContext().getPromptAction().closeToast(toastId);
        this.logEvent(13, DialogEventLog.formatClose(13, 'Toast'));
      }, 1000);
    }).catch((err: Error): void => {
      if (this.disposed) {
        return;
      }
      this.logEvent(13, DialogEventLog.formatError(13, err.message));
    });
  }

  /** 场景14：PromptAction.showDialog 系统按钮弹窗 */
  private showSystemDialog(): void {
    this.activeScene = 14;
    this.logEvent(14, DialogEventLog.formatOpen(14, 'System button dialog (showDialog)'));
    this.getUIContext().getPromptAction().showDialog({
      title: $r('app.string.d14_title'),
      message: $r('app.string.d14_message'),
      buttons: [
        { text: $r('app.string.d14_no_save'), color: '#666666' },
        { text: $r('app.string.d14_save'), color: '#007DFF' }
      ]
    }).then((result: ShowDialogSuccessResponse): void => {
      this.logEvent(14, `${DialogEventLog.formatClick(14)} → index=${result.index}`);
      this.logEvent(14, DialogEventLog.formatClose(14, 'System button dialog'));
    }).catch((err: Error): void => {
      this.logEvent(14, DialogEventLog.formatError(14, err.message));
    });
  }

  @Builder
  buttonsArea() {
    Column({ space: 8 }) {
      Button($r('app.string.btn_scene_1'))
        .width('100%')
        .backgroundColor(this.activeScene === 1 ? '#007DFF' : '#F1F3F5')
        .fontColor(this.activeScene === 1 ? '#FFFFFF' : '#182431')
        .onClick(() => {
          this.showConfirm();
        })
      Button($r('app.string.btn_scene_2'))
        .width('100%')
        .backgroundColor(this.activeScene === 2 ? '#007DFF' : '#F1F3F5')
        .fontColor(this.activeScene === 2 ? '#FFFFFF' : '#182431')
        .onClick(() => {
          this.showAlert();
        })
      Button($r('app.string.btn_scene_3'))
        .width('100%')
        .backgroundColor(this.activeScene === 3 ? '#007DFF' : '#F1F3F5')
        .fontColor(this.activeScene === 3 ? '#FFFFFF' : '#182431')
        .onClick(() => {
          this.showSelect();
        })
      Button($r('app.string.btn_scene_4'))
        .width('100%')
        .backgroundColor(this.activeScene === 4 ? '#007DFF' : '#F1F3F5')
        .fontColor(this.activeScene === 4 ? '#FFFFFF' : '#182431')
        .onClick(() => {
          this.showTips();
        })
      Button($r('app.string.btn_scene_5'))
        .width('100%')
        .backgroundColor(this.activeScene === 5 ? '#007DFF' : '#F1F3F5')
        .fontColor(this.activeScene === 5 ? '#FFFFFF' : '#182431')
        .onClick(() => {
          this.showLoading();
        })
      Button($r('app.string.btn_scene_6'))
        .width('100%')
        .backgroundColor(this.activeScene === 6 ? '#007DFF' : '#F1F3F5')
        .fontColor(this.activeScene === 6 ? '#FFFFFF' : '#182431')
        .onClick(() => {
          this.showCustom();
        })
      Button($r('app.string.btn_scene_7'))
        .width('100%')
        .backgroundColor(this.activeScene === 7 ? '#007DFF' : '#F1F3F5')
        .fontColor(this.activeScene === 7 ? '#FFFFFF' : '#182431')
        .onClick(() => {
          this.activeScene = 7;
          this.popVisible = !this.popVisible;
          this.logEvent(7, `${DialogEventLog.formatOpen(7, 'Popover (PopoverDialogV2)')} visible=${this.popVisible}`);
        })
      Button($r('app.string.btn_scene_8'))
        .width('100%')
        .backgroundColor(this.activeScene === 8 ? '#007DFF' : '#F1F3F5')
        .fontColor(this.activeScene === 8 ? '#FFFFFF' : '#182431')
        .onClick(() => {
          this.showInterstitial();
        })
      Button($r('app.string.btn_scene_9'))
        .width('100%')
        .backgroundColor(this.activeScene === 9 ? '#007DFF' : '#F1F3F5')
        .fontColor(this.activeScene === 9 ? '#FFFFFF' : '#182431')
        .onClick(() => {
          this.showActionSheet();
        })
      Button($r('app.string.btn_scene_10'))
        .width('100%')
        .backgroundColor(this.activeScene === 10 ? '#007DFF' : '#F1F3F5')
        .fontColor(this.activeScene === 10 ? '#FFFFFF' : '#182431')
        .onClick(() => {
          this.showDatePicker();
        })
      Button($r('app.string.btn_scene_11'))
        .width('100%')
        .backgroundColor(this.activeScene === 11 ? '#007DFF' : '#F1F3F5')
        .fontColor(this.activeScene === 11 ? '#FFFFFF' : '#182431')
        .onClick(() => {
          this.showTimePicker();
        })
      Button($r('app.string.btn_scene_12'))
        .width('100%')
        .backgroundColor(this.activeScene === 12 ? '#007DFF' : '#F1F3F5')
        .fontColor(this.activeScene === 12 ? '#FFFFFF' : '#182431')
        .onClick(() => {
          this.showTextPicker();
        })
      Button($r('app.string.btn_scene_13'))
        .width('100%')
        .backgroundColor(this.activeScene === 13 ? '#007DFF' : '#F1F3F5')
        .fontColor(this.activeScene === 13 ? '#FFFFFF' : '#182431')
        .onClick(() => {
          this.showToast();
        })
      Button($r('app.string.btn_scene_14'))
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
        Text($r('app.string.log_title'))
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
        Blank()
        Text($r('app.string.breakpoint_prefix', this.bp))
          .fontSize(11)
          .fontColor('#999999')
        // 场景7：PopoverDialogV2 直接内嵌组件树，锚点为日志栏小按钮
        PopoverDialogV2({
          visible: this.popVisible,
          $visible: (visible: boolean) => {
            this.popVisible = visible;
            if (!visible) {
              this.logEvent(7, DialogEventLog.formatClose(7, 'Popover'));
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
      Text($r('app.string.page_title'))
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .width('100%')
      Text($r('app.string.page_subtitle'))
        .fontSize(12)
        .fontColor('#666666')
        .width('100%')

      Row({ space: 10 }) {
        Text($r('app.string.device_prefix', this.deviceType))
          .fontSize(12)
        Text($r('app.string.api_prefix', this.apiVersion))
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
        LogUtil.info(TAG, `Window width ${widthVp.toFixed(0)}vp, breakpoint switched to ${next}`);
      }
    })
  }

  /** 场景7 锚点：悬浮小按钮，点击自身也可切换显隐 */
  @Builder
  popAnchor() {
    Button(this.popVisible ? $r('app.string.pop_anchor_open') : $r('app.string.pop_anchor_closed'))
      .height(36)
      .onClick(() => {
        this.popVisible = !this.popVisible;
      })
  }

  /** 场景7 气泡内容 */
  @Builder
  popContent() {
    Column({ space: 6 }) {
      Text($r('app.string.pop_title'))
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
      Text($r('app.string.pop_desc'))
        .fontSize(12)
        .fontColor('#666666')
    }
    .padding(10)
  }
}
