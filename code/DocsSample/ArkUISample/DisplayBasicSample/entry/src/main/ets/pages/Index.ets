/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

import { display } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { PromptAction, UIContext } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

interface GeneratedTypeLiteralInterface {
  text: string | Resource;
  action: () => void;
}

const DOMAIN = 0x0000;

@Entry
@Component
struct Index {
  uiContext: UIContext = this.getUIContext();
  promptAction: PromptAction = this.uiContext.getPromptAction();

  private buttonList: Array<GeneratedTypeLiteralInterface> = [
    {
      text: $r('app.string.button_get_display_object'),
      action: () => this.callGetDisplayClass()
    },
    {
      text: $r('app.string.button_get_display_attributes'),
      action: () => this.callGetDisplayInfo()
    },
    {
      text: $r('app.string.button_get_cutout_info'),
      action: () => this.callGetCutoutInfo()
    },
    {
      text: $r('app.string.button_get_captured_status'),
      action: () => this.callGetDisplayCaptured()
    },
    {
      text: $r('app.string.button_test_display_listener'),
      action: () => this.callDealListenCallback()
    },
    {
      text: $r('app.string.button_foldable_device_check'),
      action: () => this.callDealFoldableDevice()
    },
    {
      text: $r('app.string.button_get_all_source_mode'),
      action: () => this.callGetAllDisplaysSourceMode()
    },
    {
      text: $r('app.string.button_get_source_mode_by_id'),
      action: () => this.callGetDisplaySourceModeById()
    },
    {
      text: $r('app.string.button_listen_source_mode_change'),
      action: () => this.callListenSourceModeChange()
    },
    {
      text: $r('app.string.button_get_global_position'),
      action: () => this.callGetDisplayGlobalPosition()
    },
    {
      text: $r('app.string.button_relative_to_global'),
      action: () => this.callConvertRelativeToGlobal()
    },
    {
      text: $r('app.string.button_global_to_relative'),
      action: () => this.callConvertGlobalToRelative()
    },
    {
      text: $r('app.string.button_get_display_id_by_position'),
      action: () => this.callGetDisplayIdByGlobalPosition()
    }
  ]

  private callGetDisplayClass(): void {
    this.promptAction.openToast({ message: $r('app.string.toast_get_display_class') }).catch((error: Error) => {
      hilog.error(DOMAIN, 'DisplayTest', `callGetDisplayClass error ${JSON.stringify(error)}`);
    }).then(() => {
      this.getDisplayClass();
    });
  }

  private callGetDisplayInfo(): void {
    this.promptAction.openToast({ message: $r('app.string.toast_get_display_info') }).catch((error: Error) => {
      hilog.error(DOMAIN, 'DisplayTest', `callGetDisplayInfo error ${JSON.stringify(error)}`);
    }).then(() => {
      this.getDisplayInfo();
    });
  }

  private callGetCutoutInfo(): void {
    this.promptAction.openToast({ message: $r('app.string.toast_get_cutout_info') }).catch((error: Error) => {
      hilog.error(DOMAIN, 'DisplayTest', `callGetCutoutInfo error ${JSON.stringify(error)}`);
    }).then(() => {
      this.getCutoutInfo();
    });
  }

  private callGetDisplayCaptured(): void {
    this.promptAction.openToast({ message: $r('app.string.toast_get_captured_status') }).catch((error: Error) => {
      hilog.error(DOMAIN, 'DisplayTest', `callGetDisplayCaptured error ${JSON.stringify(error)}`);
    }).then(() => {
      this.getDisplayCaptured();
    });
  }

  private callDealListenCallback(): void {
    this.promptAction.openToast({ message: $r('app.string.toast_deal_listen_callback') }).catch((error: Error) => {
      hilog.error(DOMAIN, 'DisplayTest', `callDealListenCallback error ${JSON.stringify(error)}`);
    }).then(() => {
      this.dealListenCallback();
    });
  }

  private callDealFoldableDevice(): void {
    this.promptAction.openToast({ message: $r('app.string.toast_deal_foldable_device') }).catch((error: Error) => {
      hilog.error(DOMAIN, 'DisplayTest', `callDealFoldableDevice error ${JSON.stringify(error)}`);
    }).then(() => {
      this.dealFoldableDevice();
    });
  }

  private callGetAllDisplaysSourceMode(): void {
    this.promptAction.openToast({ message: $r('app.string.toast_get_all_source_mode') }).catch((error: Error) => {
      hilog.error(DOMAIN, 'DisplayTest', `callGetAllDisplaysSourceMode error ${JSON.stringify(error)}`);
    }).then(() => {
      this.getAllDisplaysSourceMode();
    });
  }

  private callGetDisplaySourceModeById(): void {
    this.promptAction.openToast({ message: $r('app.string.toast_get_source_mode_by_id') }).catch((error: Error) => {
      hilog.error(DOMAIN, 'DisplayTest', `callGetDisplaySourceModeById error ${JSON.stringify(error)}`);
    }).then(() => {
      this.getDisplaySourceModeById();
    });
  }

  private callListenSourceModeChange(): void {
    this.promptAction.openToast({ message: $r('app.string.toast_listen_source_mode_change') }).catch((error: Error) => {
      hilog.error(DOMAIN, 'DisplayTest', `callListenSourceModeChange error ${JSON.stringify(error)}`);
    }).then(() => {
      this.listenSourceModeChange();
    });
  }

  private callGetDisplayGlobalPosition(): void {
    this.promptAction.openToast({ message: $r('app.string.toast_get_global_position') }).catch((error: Error) => {
      hilog.error(DOMAIN, 'DisplayTest', `callGetDisplayGlobalPosition error ${JSON.stringify(error)}`);
    }).then(() => {
      this.getDisplayGlobalPosition();
    });
  }

  private callConvertRelativeToGlobal(): void {
    this.promptAction.openToast({ message: $r('app.string.toast_relative_to_global') }).catch((error: Error) => {
      hilog.error(DOMAIN, 'DisplayTest', `callConvertRelativeToGlobal error ${JSON.stringify(error)}`);
    }).then(() => {
      this.convertRelativeToGlobal();
    });
  }

  private callConvertGlobalToRelative(): void {
    this.promptAction.openToast({ message: $r('app.string.toast_global_to_relative') }).catch((error: Error) => {
      hilog.error(DOMAIN, 'DisplayTest', `callConvertGlobalToRelative error ${JSON.stringify(error)}`);
    }).then(() => {
      this.convertGlobalToRelative();
    });
  }

  private callGetDisplayIdByGlobalPosition(): void {
    this.promptAction.openToast({ message: $r('app.string.toast_display_id_by_position') }).catch((error: Error) => {
      hilog.error(DOMAIN, 'DisplayTest', `callGetDisplayIdByGlobalPosition error ${JSON.stringify(error)}`);
    }).then(() => {
      this.getDisplayIdByGlobalPosition();
    });
  }

  private getDisplayClass(): void {
    // [Start get_display_class]
    let displayClass: display.Display | null = null;
    try {
      displayClass = display.getDefaultDisplaySync();
      hilog.info(DOMAIN, 'DisplayTest', `The display info is: ${JSON.stringify(displayClass)}`);
    } catch (exception) {
      hilog.error(DOMAIN, 'DisplayTest',
        `Failed to get default display. Code: ${exception.code}, message: ${exception.message}`);
    }
    // [End get_display_class]
  }

  private getDisplayInfo(): void {
    // [Start get_display_info]
    let displayClass: display.Display | null = null;
    try {
      displayClass = display.getDefaultDisplaySync();
      // 获取屏幕Id
      hilog.info(DOMAIN, 'DisplayTest', `The screen Id is ${displayClass.id}.`);
      // 获取屏幕刷新率
      hilog.info(DOMAIN, 'DisplayTest', `The screen is ${displayClass.refreshRate}.`);
      // 获取屏幕宽度
      hilog.info(DOMAIN, 'DisplayTest', `The screen width is ${displayClass.width}.`);
      // 获取屏幕高度
      hilog.info(DOMAIN, 'DisplayTest', `The screen height is ${displayClass.height}.`);
      // ...
    } catch (exception) {
      hilog.error(DOMAIN, 'DisplayTest',
        `Failed to get default display. Code: ${exception.code}, message: ${exception.message}`);
    }
    // [End get_display_info]
  }

  private getCutoutInfo(): void {
    // [Start get_cutoutInfo]
    let displayClass: display.Display | null = null;
    try {
      displayClass = display.getDefaultDisplaySync();
      displayClass.getCutoutInfo().then((cutoutInfo: display.CutoutInfo) => {
        // 在有挖孔信息的时候进行处理
        if (cutoutInfo.boundingRects.length > 0) {
          hilog.info(DOMAIN, 'DisplayTest', `cutoutInfo boundingRects: ${JSON.stringify(cutoutInfo.boundingRects)}`);
        } else {
          hilog.info(DOMAIN, 'DisplayTest', 'There is no cutout info on the screen.');
        }
        // 处理瀑布屏的区域信息
        hilog.info(DOMAIN, 'DisplayTest',
          `cutoutInfo waterfallDisplayAreaRects: ${JSON.stringify(cutoutInfo.waterfallDisplayAreaRects)}`);
      }).catch((err: BusinessError) => {
        hilog.error(DOMAIN, 'DisplayTest',
          `Failed to obtain the cutout info object. Code: ${err.code}, message: ${err.message}`);
      });
    } catch (exception) {
      hilog.error(DOMAIN, 'DisplayTest',
        `Failed to get default display. Code: ${exception.code}, message: ${exception.message}`);
    }
    // [End get_cutoutInfo]
  }

  private getDisplayCaptured(): void {
    // [Start get_display_captured]
    try {
      hilog.info(DOMAIN, 'DisplayTest', `The screen is captured or not : ${display.isCaptured()}`);
    } catch (exception) {
      hilog.error(DOMAIN, 'DisplayTest',
        `Failed to get display isCaptured. Code: ${exception.code}, message: ${exception.message}`);
    }
    // [End get_display_captured]
  }

  private dealListenCallback(): void {
    // [Start add_listen_callback]
    /**
     * 注册监听的callback参数要采用对象传递.
     * 若使用匿名函数注册，每次调用会创建一个新的底层对象，引起内存泄漏问题。
     */
    let callback1: Callback<number> = (displayId: number) => {
      hilog.info(DOMAIN, 'DisplayTest', `Listening enabled. displayId: ${displayId}`);
    };
    try {
      // 此处以监听显示设备的增加为例
      display.on('add', callback1);
      hilog.info(DOMAIN, 'DisplayTest', `register add success`);

      // 关闭单个callback监听
      display.off('add', callback1);
      hilog.info(DOMAIN, 'DisplayTest', `unregister add success`);
      // 如果通过on注册多个callback，同时关闭所有callback监听
      display.off('add');
      hilog.info(DOMAIN, 'DisplayTest', `unregister all add success`);
    } catch (exception) {
      hilog.error(DOMAIN, 'DisplayTest',
        `Failed to register/unregister callback. Code: ${exception.code}, message: ${exception.message}`);
    }
    // [End add_listen_callback]
    // [Start capture_listen_callback]
    let callback2: Callback<boolean> = (captureStatus: boolean) => {
      // captureStatus为true表示显示设备开始截屏、投屏或录屏，false表示结束截屏、投屏或录屏
      hilog.info(DOMAIN, 'DisplayTest', 'Listening capture status: ' + captureStatus);
    };

    try {
      // 开启屏幕截屏、投屏、录屏状态变化的监听
      display.on('captureStatusChange', callback2);
      hilog.info(DOMAIN, 'DisplayTest', `register captureStatusChange success`);
      // 关闭屏幕截屏、投屏、录屏状态变化的监听
      display.off('captureStatusChange', callback2);
      hilog.info(DOMAIN, 'DisplayTest', `unregister captureStatusChange success`);
    } catch (exception) {
      hilog.error(DOMAIN, 'DisplayTest',
        `Failed to register/unregister callback. Code: ${exception.code}, message: ${exception.message}`);
    }
    // [End capture_listen_callback]
    // [Start available_listen_callback]
    /**
     * 注册监听的callback参数要采用对象传递.
     * 若使用匿名函数注册，每次调用会创建一个新的底层对象，引起内存泄漏问题。
     */
    let callback3: Callback<display.Rect> = (data: display.Rect) => {
      hilog.info(DOMAIN, 'DisplayTest', 'Listening enabled. Data: ' + JSON.stringify(data));
    };
    let displayClass: display.Display | null = null;
    try {
      displayClass = display.getDefaultDisplaySync();
      // 开启当前屏幕可用区域变化的监听
      displayClass.on('availableAreaChange', callback3);
      hilog.info(DOMAIN, 'DisplayTest', `register availableAreaChange success`);
      // 关闭当前屏幕可用区域变化的监听
      displayClass.off('availableAreaChange', callback3);
      hilog.info(DOMAIN, 'DisplayTest', `unregister availableAreaChange success`);
    } catch (exception) {
      hilog.error(DOMAIN, 'DisplayTest',
        `Failed to register/unregister callback. Code: ${exception.code}, message: ${exception.message}`);
    }
    // [End available_listen_callback]
  }

  private dealFoldableDevice(): void {
    // [Start get_fold_device]
    let isFoldableDevice: boolean = false;
    try {
      isFoldableDevice = display.isFoldable();
      // 打印此设备是否为折叠设备
      hilog.info(DOMAIN, 'DisplayTest', `This device is foldable: ${isFoldableDevice}`);
    } catch (exception) {
      hilog.error(DOMAIN, 'DisplayTest',
        `Failed to get foldable message. Code: ${exception.code}, message: ${exception.message}`);
    }
    // [End get_fold_device]

    if (isFoldableDevice) {
      // [Start fold_device_listen]
      /**
       * 注册监听的callback参数要采用对象传递.
       * 若使用匿名函数注册，每次调用会创建一个新的底层对象，引起内存泄漏问题。
       */
      let callback: Callback<display.FoldStatus> = (data: display.FoldStatus) => {
        hilog.info(DOMAIN, 'DisplayTest', 'Listening enabled. Data: ' + JSON.stringify(data));
      };
      try {
        display.on('foldStatusChange', callback);
        // 如果通过on注册多个callback，同时关闭所有callback监听
        hilog.info(DOMAIN, 'DisplayTest', `register foldStatusChange success`);

        // 关闭单个callback监听
        display.off('foldStatusChange', callback);
        hilog.info(DOMAIN, 'DisplayTest', `unregister foldStatusChange success`);
        // 关闭所有callback监听
        display.off('foldStatusChange');
        hilog.info(DOMAIN, 'DisplayTest', `unregister all foldStatusChange success`);
      } catch (exception) {
        hilog.error(DOMAIN, 'DisplayTest',
          `Failed to register/unregister callback. Code: ${exception.code}, message: ${exception.message}`);
      }
      // [End fold_device_listen]
    }
  }

  private getAllDisplaysSourceMode(): void {
    // [Start get_all_displays_source_mode]
    display.getAllDisplays().then((displays: Array<display.Display>) => {
      for (let i = 0; i < displays.length; i++) {
        // 获取屏幕ID
        hilog.info(DOMAIN, 'DisplayTest', `The display id is ${displays[i].id}`);
        // 获取屏幕显示模式
        hilog.info(DOMAIN, 'DisplayTest', `The display sourceMode is ${displays[i].sourceMode}`);
        if (displays[i].sourceMode === display.DisplaySourceMode.EXTEND) {
          // 对扩展屏进行相应的业务处理，例如在扩展屏上创建窗口显示内容
        }
      }
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, 'DisplayTest',
        `Failed to get all displays. Code: ${err.code}, message: ${err.message}`);
    });
    // [End get_all_displays_source_mode]
  }

  private getDisplaySourceModeById(): void {
    // [Start get_display_source_mode_by_id]
    let displayClass: display.Display | null = null;
    try {
      // 此处displayId仅为示例，实际取值以业务场景为准
      let displayId: number = 1;
      displayClass = display.getDisplayByIdSync(displayId);
      // 获取指定屏幕的显示模式
      hilog.info(DOMAIN, 'DisplayTest', `The display sourceMode is ${displayClass.sourceMode}`);
    } catch (exception) {
      hilog.error(DOMAIN, 'DisplayTest',
        `Failed to get display. Code: ${exception.code}, message: ${exception.message}`);
    }
    // [End get_display_source_mode_by_id]
  }

  private listenSourceModeChange(): void {
    // [Start listen_source_mode_change]
    let callback: Callback<number> = (displayId: number) => {
      hilog.info(DOMAIN, 'DisplayTest', `Display changed. displayId: ${displayId}`);
      // 屏幕发生变化后，重新查询各屏幕的显示模式并更新业务逻辑
      display.getAllDisplays().then((displays: Array<display.Display>) => {
        for (let i = 0; i < displays.length; i++) {
          hilog.info(DOMAIN, 'DisplayTest',
            `The display ${displays[i].id} sourceMode is ${displays[i].sourceMode}`);
        }
      });
    };
    try {
      // 监听显示设备的增加，例如插入显示器
      display.on('add', callback);
      // 监听显示设备的移除，例如移除显示器
      display.on('remove', callback);
      // 监听显示设备的改变，例如显示模式切换
      display.on('change', callback);
      // 不需要监听时，关闭对应的监听
      display.off('add', callback);
      display.off('remove', callback);
      display.off('change', callback);
    } catch (exception) {
      hilog.error(DOMAIN, 'DisplayTest',
        `Failed to register/unregister callback. Code: ${exception.code}, message: ${exception.message}`);
    }
    // [End listen_source_mode_change]
  }

  private getDisplayGlobalPosition(): void {
    // [Start get_display_global_position]
    display.getAllDisplays().then((displays: Array<display.Display>) => {
      for (let i = 0; i < displays.length; i++) {
        if (displays[i].sourceMode === display.DisplaySourceMode.EXTEND) {
          // 获取扩展屏左上角在全局坐标系中的坐标
          hilog.info(DOMAIN, 'DisplayTest',
            `The extended display top-left corner is (${displays[i].x}, ${displays[i].y})`);
        }
      }
    }).catch((err: BusinessError) => {
      hilog.error(DOMAIN, 'DisplayTest',
        `Failed to get all displays. Code: ${err.code}, message: ${err.message}`);
    });
    // [End get_display_global_position]
  }

  private convertRelativeToGlobal(): void {
    // [Start convert_relative_to_global]
    // 定义需要转换的相对坐标，displayId为相对坐标系原点所在的屏幕ID
    let relativePosition: display.RelativePosition = {
      displayId: 1,
      position: {
        x: 100,
        y: 200
      }
    };

    try {
      // 将相对坐标转换为全局坐标
      let position: display.Position = display.convertRelativeToGlobalCoordinate(relativePosition);
      hilog.info(DOMAIN, 'DisplayTest', `The global coordinate is (${position.x}, ${position.y})`);
    } catch (exception) {
      hilog.error(DOMAIN, 'DisplayTest',
        `Failed to convert the relative coordinate to the global coordinate. Code: ${exception.code}, ` +
        `message: ${exception.message}`);
    }
    // [End convert_relative_to_global]
  }

  private convertGlobalToRelative(): void {
    // [Start convert_global_to_relative]
    // 定义需要转换的全局坐标
    let position: display.Position = {
      x: 2660,
      y: 200
    };

    try {
      // 将全局坐标转换为displayId为1的屏幕的相对坐标
      let relPos: display.RelativePosition = display.convertGlobalToRelativeCoordinate(position, 1);
      hilog.info(DOMAIN, 'DisplayTest',
        `The relative coordinate is displayId: ${relPos.displayId}, x: ${relPos.position.x}, y: ${relPos.position.y}`);
    } catch (exception) {
      hilog.error(DOMAIN, 'DisplayTest',
        `Failed to convert the global coordinate to the relative coordinate. Code: ${exception.code}, ` +
        `message: ${exception.message}`);
    }
    // [End convert_global_to_relative]
  }

  private getDisplayIdByGlobalPosition(): void {
    // [Start get_display_id_by_global_position]
    // 定义需要判断的全局坐标
    let position: display.Position = {
      x: 2660,
      y: 200
    };

    try {
      // 不传入displayId，返回全局坐标所在屏幕的相对坐标
      let relPos: display.RelativePosition = display.convertGlobalToRelativeCoordinate(position);
      // relPos.displayId即该全局坐标所在屏幕的Id
      hilog.info(DOMAIN, 'DisplayTest', `The position is on the display ${relPos.displayId}`);
    } catch (exception) {
      hilog.error(DOMAIN, 'DisplayTest',
        `Failed to convert the global coordinate to the relative coordinate. Code: ${exception.code}, ` +
        `message: ${exception.message}`);
    }
    // [End get_display_id_by_global_position]
  }

  build() {
    Column() {
      // 页面标题
      Text($r('app.string.page_title'))
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin(20)

      // 网格布局：2列（无图标，仅文字），超出可纵向滚动
      Grid() {
        ForEach(this.buttonList, (item: GeneratedTypeLiteralInterface) => {
          GridItem() {
            Button() {
              Text(item.text)
                .fontSize(16)
                .textAlign(TextAlign.Center) // 文字居中
                .maxLines(2) // 最多显示2行（避免文字过长占太多空间）
                .textOverflow({ overflow: TextOverflow.Ellipsis })
                .padding({ left: 5, right: 5 }) // 文字左右留边距
                .fontColor('#ffffffff')
            } // 直接使用文字作为按钮内容
            .type(ButtonType.Capsule)
            .backgroundColor('#007DFF') // 直接指定颜色（无需资源文件）
            .fontSize(16)
            .width('90%')
            .height(80)
            .onClick(() => {
              item.action() // 触发对应功能
            })
          }
        })
      }
      .columnsTemplate('1fr 1fr') // 2列等宽
      .columnsGap(15) // 列间距
      .rowsGap(10) // 行间距
      .padding(15)
      .flexGrow(1) // 占满剩余空间
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5') // 背景色
  }
}