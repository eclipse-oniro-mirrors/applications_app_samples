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

import { BusinessError, deviceInfo } from '@kit.BasicServicesKit';
import { inputMethodEngine, InputMethodExtensionContext } from '@kit.IMEKit';
import { display, window } from '@kit.ArkUI';
import Log from '../../model/Log';
import { StyleConfiguration } from '../../common/StyleConfiguration';

const previewContent: string = 'hello world';
const inputMethodAbility: inputMethodEngine.InputMethodAbility = inputMethodEngine.getInputMethodAbility();
const TAG: string = 'KeyboardController->';

// 定义键盘在不同设备上占设备高度的比例，用于键盘显示适配不同设备
const KEYBOARD_HEIGHT_RATE_PHONE: number = 0.45;
// 分体键盘面板高度占屏幕高度的比例
const KEYBOARD_DETACHED_HEIGHT_RATE: number = 0.5;
// 分体键盘左右两半各占面板宽度的比例
const KEYBOARD_SPLIT_WIDTH_RATE: number = 0.4;

export class InputHandler {
  private mKbController: inputMethodEngine.KeyboardController | undefined;
  private mTextInputClient: inputMethodEngine.InputClient | undefined;
  private mPanel: inputMethodEngine.Panel | undefined;
  // 记录分体面板当前宽度与高度，moveTo 后按此尺寸刷新热区
  private mPanelWidth: number = 0;
  private mPanelHeight: number = 0;

  private constructor() {
    this.mKbController = undefined;
    this.mTextInputClient = undefined;
  }

  public static getInstance(): InputHandler {
    let instance = AppStorage.get<InputHandler>('inputHandler');
    if (instance === undefined) {
      instance = new InputHandler();
      AppStorage.setOrCreate('inputHandler', instance);
    }
    return instance;
  }

  public onInputStart(kbController: inputMethodEngine.KeyboardController,
    textInputClient: inputMethodEngine.InputClient): void {
    this.mKbController = kbController;
    this.mTextInputClient = textInputClient;
    this.mTextInputClient.getEditorAttribute().then((res: inputMethodEngine.EditorAttribute) => {
      AppStorage.setOrCreate('enterKeyType', res.enterKeyType);
      AppStorage.setOrCreate('inputPattern', res.inputPattern);
      this.addLog(
        `onInputStart editorAttribute enterKeyType : ${res.enterKeyType}, inputPattern : ${res.inputPattern}`);
    }).catch((err: BusinessError) => {
      this.addLog(`onInputStart getEditorAttribute catch error: ${err.code} ${err.message}`);
    });
  }

  public setPanel(panel: inputMethodEngine.Panel): void {
    this.mPanel = panel;
  }

  // 按分体面板尺寸刷新左右热区，中间透明区域不接收输入事件
  public refreshSplitHotZone(width: number, height: number): void {
    if (this.mPanel === undefined) {
      this.addLog('refreshSplitHotZone panel is undefined');
      return;
    }
    if (width <= 0 || height <= 0) {
      this.addLog(`refreshSplitHotZone invalid size, width = ${width}, height = ${height}`);
      return;
    }
    let halfWidth = Math.floor(width * KEYBOARD_SPLIT_WIDTH_RATE);
    let inputRegion: Array<window.Rect> = [
      { left: 0, top: 0, width: halfWidth, height: height },
      { left: width - halfWidth, top: 0, width: halfWidth, height: height }
    ];
    try {
      this.mPanel.updateRegion(inputRegion);
      this.addLog(`refreshSplitHotZone success, width = ${width}, height = ${height}`);
    } catch (err) {
      let error = err as BusinessError;
      this.addLog(`refreshSplitHotZone catch error: ${error.code} ${error.message}`);
    }
  }

  public switchToDetachedPanel(): void {
    if (this.mPanel === undefined) {
      this.addLog('switchToDetachedPanel panel is undefined');
      return;
    }
    let dis: display.Display | undefined = undefined;
    try {
      dis = display.getPrimaryDisplaySync();
    } catch (err) {
      let error = err as BusinessError;
      this.addLog(`switchToDetachedPanel get display catch error: ${error.code} ${error.message}`);
      return;
    }
    if (dis === undefined) {
      this.addLog('switchToDetachedPanel display is undefined');
      return;
    }
    let screenWidth = dis.width;
    let screenHeight = dis.height;
    if (dis.width > dis.height) {
      screenWidth = dis.height;
      screenHeight = dis.width;
    }
    let detachedHeight = Math.floor(screenHeight * KEYBOARD_DETACHED_HEIGHT_RATE);
    let landHeight = Math.floor(screenWidth * KEYBOARD_DETACHED_HEIGHT_RATE)
    let landscapeRect: window.Rect = {
      left: 0,
      top: screenWidth - landHeight,
      width: screenHeight,
      height: landHeight
    };
    let portraitRect: window.Rect = {
      left: 0,
      top: screenHeight - detachedHeight,
      width: screenWidth,
      height: detachedHeight
    };
    let panelRect: inputMethodEngine.PanelRect = {
      landscapeRect: landscapeRect,
      portraitRect: portraitRect
    };
    try {
      this.mPanel.updatePanelRectSync(inputMethodEngine.PanelFlag.FLAG_DETACHED, panelRect);
      this.mPanelWidth = dis.width;
      this.mPanelHeight = dis.width > dis.height ? landHeight : detachedHeight;
      this.addLog(`switchToDetachedPanel success, width = ${dis.width}, height = ${detachedHeight}`);
    } catch (err) {
      let error = err as BusinessError;
      this.addLog(`switchToDetachedPanel catch error: ${error.code} ${error.message}`);
    }
    // 将左右两半键盘区域设置为热区，中间透明区域不接收输入事件
    this.refreshSplitHotZone(dis.width, detachedHeight);
  }

  public switchToFixedPanel(): void {
    if (this.mPanel === undefined) {
      this.addLog('switchToFixedPanel panel is undefined');
      return;
    }
    let dis: display.Display | undefined = undefined;
    try {
      dis = display.getPrimaryDisplaySync();
    } catch (err) {
      let error = err as BusinessError;
      this.addLog(`switchToFixedPanel get display catch error: ${error.code} ${error.message}`);
      return;
    }
    if (dis === undefined) {
      this.addLog('switchToFixedPanel display is undefined');
      return;
    }
    let screenWidth = dis.width;
    let screenHeight = dis.height;
    if (dis.width > dis.height) {
      screenWidth = dis.height;
      screenHeight = dis.width;
    }
    let keyHeight = Math.floor(screenHeight * KEYBOARD_HEIGHT_RATE_PHONE);
    let landHeight = Math.floor(screenWidth * KEYBOARD_HEIGHT_RATE_PHONE)
    let landscapeRect: window.Rect = {
      left: 0,
      top: screenWidth - landHeight,
      width: screenHeight,
      height: landHeight
    };
    let portraitRect: window.Rect = {
      left: 0,
      top: screenHeight - keyHeight,
      width: screenWidth,
      height: keyHeight
    };
    let panelRect: inputMethodEngine.PanelRect = {
      landscapeRect: landscapeRect,
      portraitRect: portraitRect
    };
    try {
      this.mPanel.updatePanelRectSync(inputMethodEngine.PanelFlag.FLG_FIXED, panelRect);
      this.addLog(`switchToFixedPanel success`);
    } catch (err) {
      let error = err as BusinessError;
      this.addLog(`switchToFixedPanel catch error: ${error.code} ${error.message}`);
    }
    // 恢复普通键盘后，将热区重置为整个面板区域
    let inputRegion: Array<window.Rect> = [
      { left: 0, top: 0, width: dis.width, height: keyHeight }
    ];
    try {
      this.mPanel.updateRegion(inputRegion);
      this.addLog('switchToFixedPanel updateRegion success');
    } catch (err) {
      let error = err as BusinessError;
      this.addLog(`switchToFixedPanel updateRegion catch error: ${error.code} ${error.message}`);
    }
  }

  public startMovingPanel(): void {
    if (this.mPanel === undefined) {
      this.addLog('startMovingPanel panel is undefined');
      return;
    }
    try {
      this.mPanel.startMoving();
      this.addLog('startMovingPanel success');
    } catch (err) {
      let error = err as BusinessError;
      this.addLog(`startMovingPanel catch error: ${error.code} ${error.message}`);
    }
  }

  // 移动键盘位置；onComplete 用于拖动场景串行化：上一次 moveTo 完成后回调，再发下一次
  public movePanel(componentX: number, componentY: number,
    onComplete?: (x: number, y: number, success: boolean) => void): void {
    if (this.mPanel === undefined) {
      this.addLog('movePanelByComponentPos panel is undefined');
      if (onComplete !== undefined) {
        onComplete(componentX, componentY, false);
      }
      return;
    }
    this.mPanel.moveTo(componentX, componentY).then(() => {
      if (onComplete !== undefined) {
        onComplete(componentX, componentY, true);
      }
    }).catch((err: BusinessError) => {
      this.addLog(`movePanelByComponentPos catch error: ${err.code} ${err.message}`);
      if (onComplete !== undefined) {
        onComplete(componentX, componentY, false);
      }
    });
  }

  // 移动键盘位置后刷新热区
  public movePanelByComponentPos(componentX: number, componentY: number): void {
    if (this.mPanel === undefined) {
      this.addLog('movePanelByComponentPos panel is undefined');
      return;
    }
    this.mPanel.moveTo(componentX, componentY).then(() => {
      // 移动后按当前面板尺寸刷新热区，否则移动后键盘点击不生效
      this.refreshSplitHotZone(this.mPanelWidth, this.mPanelHeight);
    }).catch((err: BusinessError) => {
      this.addLog(`movePanelByComponentPos catch error: ${err.code} ${err.message}`);
    });
  }

  public hideKeyboardSelf(): void {
    if (this.mKbController !== undefined) {
      this.mKbController.hide().then(() => {
        this.addLog('Succeeded in hideKeyboardSelf.');
      }).catch((err: BusinessError) => {
        Log.showError(TAG, `Failed to hideKeyboardSelf: ${err.code} ${err.message}`);
      });
    } else {
      this.addLog('hideKeyboardSelf this.mKbController is undefined');
    }
  }

  public deleteBackward(length: number): void {
    if (this.mTextInputClient !== undefined) {
      this.mTextInputClient.deleteBackward(length).then(() => {
        this.addLog('Succeeded in deleteBackward.');
      }).catch((err: BusinessError) => {
        Log.showError(TAG, `Failed to deleteBackward: ${err.code} ${err.message}`);
      });
    } else {
      this.addLog('deleteBackward this.mTextInputClient is undefined');
    }
  }

  public deleteForward(length: number): void {
    if (this.mTextInputClient !== undefined) {
      this.mTextInputClient.deleteForward(length).then(() => {
        this.addLog('Succeeded in deleteForward.');
      }).catch((err: BusinessError) => {
        Log.showError(TAG, `Failed to deleteForward: ${err.code} ${err.message}`);
      });
    } else {
      this.addLog('deleteForward this.mTextInputClient is undefined');
    }
  }

  public sendKeyFunction(): void {
    if (this.mTextInputClient !== undefined) {
      this.mTextInputClient.sendKeyFunction(inputMethodEngine.ENTER_KEY_TYPE_NEWLINE).then(() => {
        this.addLog('Succeeded in sendKeyFunction.');
      }).catch((err: BusinessError) => {
        Log.showError(TAG, `Failed to sendKeyFunction: ${err.code} ${err.message}`);
      });
    } else {
      this.addLog('sendKeyFunction this.mTextInputClient is undefined');
    }
  }

  public insertText(text: string): void {
    this.addLog(`insertText = ${text}`);
    if (this.mTextInputClient !== undefined) {
      try {
        this.mTextInputClient.insertTextSync(text);
      } catch (err) {
        let error = err as BusinessError;
        this.addLog(`insertText catch error: ${error.code} ${error.message}`);
      }
    } else {
      this.addLog('insertText this.mTextInputClient is undefined');
    }
  }

  public addLog(message: string): void {
    Log.showInfo(TAG, `kikaInput-js: ${message}`);
  }

  public sendExtendAction(action: inputMethodEngine.ExtendAction): void {
    if (this.mTextInputClient !== undefined) {
      this.mTextInputClient.sendExtendAction(action).then(() => {
        this.addLog('Succeeded in sendExtendAction.');
      }).catch((err: BusinessError) => {
        Log.showError(TAG, `Failed to sendExtendAction: ${err.code} ${err.message}`);
      });
    } else {
      this.addLog('sendExtendAction this.mTextInputClient is undefined');
    }
  }
}

class KeyboardController {
  private mContext: InputMethodExtensionContext | undefined;
  private panel: inputMethodEngine.Panel | undefined;
  private inputHandle: InputHandler = InputHandler.getInstance();

  constructor() {
    this.mContext = undefined;
    this.panel = undefined;
  }

  public onCreate(context: InputMethodExtensionContext): void {
    this.mContext = context;
    this.inputHandle.addLog('onCreate');
    this.initWindow();
    this.registerListener();
  }

  public onDestroy(): void {
    this.inputHandle.addLog('onDestroy');
    this.unRegisterListener();
    this.destroyPanel();
  }

  private initWindow(): void {
    if (this.mContext === undefined) {
      return;
    }
    this.inputHandle.addLog('initWindow');
    let dis: display.Display | undefined = undefined;
    try {
      dis = display.getPrimaryDisplaySync();
    } catch (err) {
      let error = err as BusinessError;
      Log.showError(TAG, `getPrimaryDisplaySync catch error: ${error.code} ${error.message}`);
      return;
    }
    if (dis == undefined) {
      return;
    }
    this.inputHandle.addLog("initWindow-oncall display");
    let dWidth = dis.width;
    let dHeight = dis.height;
    let isLandscape = false;
    let isRkDevice = false;
    if (dis.width > dis.height) {
      isLandscape = true;
      AppStorage.setOrCreate('isLandscape', true);
    } else {
      AppStorage.setOrCreate('isLandscape', false);
    }
    let keyHeight = dHeight * KEYBOARD_HEIGHT_RATE_PHONE;
    this.inputHandle.addLog(
      `initWindow-dWidth = ${dWidth};dHeight = ${dHeight};keyboard height = ${keyHeight}`);
    let panelInfo: inputMethodEngine.PanelInfo = {
      type: inputMethodEngine.PanelType.SOFT_KEYBOARD,
      flag: inputMethodEngine.PanelFlag.FLG_FIXED
    }
    let inputStyle = StyleConfiguration.getInputStyle(isLandscape, isRkDevice, deviceInfo.deviceType);
    AppStorage.setOrCreate('inputStyle', inputStyle);
    inputMethodAbility.createPanel(this.mContext, panelInfo).then((panel: inputMethodEngine.Panel) => {
      this.panel = panel;
      this.inputHandle.setPanel(panel);
      try {
        panel.updatePanelRectSync(inputMethodEngine.PanelFlag.FLG_FIXED, {
          landscapeRect: {
            left: 0,
            top: 0,
            width: dHeight,
            height: dWidth * KEYBOARD_HEIGHT_RATE_PHONE
          },
          portraitRect: {
            left: 0,
            top: 0,
            width: dWidth,
            height: keyHeight
          }
        })
      } catch (err) {
        let error = err as BusinessError;
        Log.showError(TAG, `switchToFixedPanel catch error: ${error.code} ${error.message}`);
      }
      panel.setUiContent('InputMethodExtensionAbility/pages/Index').then(() => {
        this.inputHandle.addLog('loadContent finished');
      }).catch((err: BusinessError) => {
        Log.showError(TAG, `Failed to setUiContent: ${err.code} ${err.message}`);
      });
    }).catch((err: BusinessError) => {
      Log.showError(TAG, `Failed to createPanel: ${err.code} ${err.message}`);
    });
  }

  private destroyPanel(): void {
    this.inputHandle.addLog('destroyPanel');
    if (this.panel) {
      inputMethodAbility.destroyPanel(this.panel).then(() => {
        this.inputHandle.addLog('Succeeded in destroyPanel.');
      }).catch((err: BusinessError) => {
        Log.showError(TAG, `Failed to destroyPanel: ${err.code} ${err.message}`);
      });
    }
  }

  private registerListener(): void {
    this.inputHandle.addLog('registerListener');
    try {
      display.on('foldStatusChange', (foldStatus: display.FoldStatus) => {
        this.inputHandle.addLog('screenChangeEvent');
        let dis = display.getPrimaryDisplaySync();
        if (dis.width > dis.height) {
          AppStorage.setOrCreate('isLandscape', true);
        } else {
          AppStorage.setOrCreate('isLandscape', false);
        }
        // 根据当前屏幕大小重新设置输入法窗口大小，比例不变
        if (this.panel) {
          let keyHeight = Math.floor(dis.height * KEYBOARD_HEIGHT_RATE_PHONE);
          try {
            this.panel?.resize(dis.width, keyHeight);
            this.inputHandle.addLog(`screenChange resize success, width = ${dis.width}, height = ${keyHeight}`);
          } catch (err) {
            let error = err as BusinessError;
            this.inputHandle.addLog(`screenChange resize catch error: ${error.code} ${error.message}`);
          }
        }
      });
    } catch (err) {
      let error = err as BusinessError;
      Log.showError(TAG, `display on change catch error: ${error.code} ${error.message}`);
    }
    inputMethodAbility.on('inputStart',
      (kbController: inputMethodEngine.KeyboardController, textInputClient: inputMethodEngine.InputClient) => {
        this.inputHandle.addLog('keyboard inputStart');
        this.inputHandle.onInputStart(kbController, textInputClient);
      })

    inputMethodAbility.on('inputStop', () => {
      this.inputHandle.addLog('keyboard inputStop');
      this.onDestroy();
      if (this.mContext) {
        this.mContext.destroy();
      }
    });
  }

  private unRegisterListener(): void {
    this.inputHandle.addLog('unRegisterListener');
    try {
      display.off('change');
    } catch (err) {
      let error = err as BusinessError;
      Log.showError(TAG, `display off change catch error: ${error.code} ${error.message}`);
    }
    inputMethodAbility.off('inputStop', () => {
      this.inputHandle.addLog('inputStop off');
    });
  }
}

export const keyboardController: KeyboardController = new KeyboardController();