/**
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


import { deviceInfo, BusinessError, emitter } from '@kit.BasicServicesKit';
import { inputMethodEngine, InputMethodExtensionContext, inputMethod, PanelInfo } from '@kit.IMEKit';
import { display } from '@kit.ArkUI';
import Log from './Log';
import {
  StyleConfiguration,
  ConstantNum,
  FocusCol,
  FocusRow,
  inputStyleConfig,
  InputStyleConfiguration
} from '../common/StyleConfiguration';
import { MessageEvents, worker } from '@kit.ArkTS';
import { resourceManager } from '@kit.LocalizationKit';
import {
  MessageType,
  PinyinChooseMessage,
  PinyinInitMessage,
  PinyinKeyMessage,
  PinyinMessage,
  PinyinResultMessage,
  PinyinUpdateMessage
} from './PinyinMessage';
import { ChineseDataSource } from './ChineseDataSource';
import { getKey, keyInfo } from './FocusInfo';
import {
  chineseInputList,
  FuncKey,
  keyInputList,
  keySourceListType,
  KeyState,
  KeyValue,
  Menu,
  MenuKey,
  MenuType,
  numInputList,
  numInputListVice,
  sourceListType,
  SymbolKey,
  symInputList
} from './KeyboardKeyData';
import { getString } from '../components/KeyMenu';
import { KeyCode, Action, KeyEvent } from '@kit.InputKit';

interface DeviceSize {
  width: number;
  height: number;
}

interface CursorInfo {
  x: number;
  y: number;
  height: number;
}

const previewContent: string = 'hello world';
const imeAbility: inputMethodEngine.InputMethodAbility = inputMethodEngine.getInputMethodAbility();
const TAG: string = 'KeyboardController->';
const tag: string = 'KeyboardController-->';

const isDebug: boolean = false;
// 定义不同设备的宽高，用于键盘显示适配不同设备
const DEVICE_PHONE: DeviceSize = {
  width: 1344,
  height: 2772
}
const DEVICE_RK: DeviceSize = {
  width: 720,
  height: 1280
}
const DEVICE_BIG: DeviceSize = {
  width: 2560,
  height: 1600
}

export const DEVICE_SIZE_4K: DeviceSize = {
  width: 3840,
  height: 2160
}

// 定义键盘在不同设备上占设备高度的比例，用于键盘显示适配不同设备
const KEYBOARD_HEIGHT_RATE_DEFAULT: number = 0.40;
const KEYBOARD_HEIGHT_RATE_PHONE: number = 0.38;
const KEYBOARD_HEIGHT_RATE_PHONE_LAND: number = 0.5;
const KEYBOARD_HEIGHT_RATE_BIG_LAND: number = 0.38;
const KEYBOARD_HEIGHT_RATE_BIG: number = 0.3;
// 定义默认的底部导航栏高度
const NAVIGATIONBAR_HEIGHT_DEFAULT: number = 72;

let KEYCODE_DEL: number = 67;

let inputType: number;

export class InputHandler {
  private mKbController: inputMethodEngine.KeyboardController | undefined;
  private mTextInputClient: inputMethodEngine.InputClient | undefined;
  private mEditorAttribute: inputMethodEngine.EditorAttribute | undefined;
  private cursorInfo: CursorInfo = { x: 0, y: 0, height: 0 };
  private selectInfo: string = '';
  private textInfo: string = '';
  private inputInfo: string = '';
  // private intputText: string = '';


  private dataSource: ChineseDataSource = new ChineseDataSource();
  private workerInstance?: worker.ThreadWorker = undefined;

  private constructor() {
    this.mKbController = undefined;
    this.mTextInputClient = undefined;
    this.mEditorAttribute = undefined;
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
    let editorAttribute = this.mTextInputClient.getEditorAttribute();
    this.addLog(`onInputStart editorAttribute = ${JSON.stringify(editorAttribute)}`);
    editorAttribute.then((res: inputMethodEngine.EditorAttribute) => {
      this.mEditorAttribute = res;
      if (res.enterKeyType == ConstantNum.NUM_8) {
        AppStorage.setOrCreate('menuType', MenuType.NUMBER);
      }
      AppStorage.setOrCreate('enterKeyType', res.enterKeyType);
      AppStorage.setOrCreate('inputPattern', res.inputPattern);

    })
  }

  public hideKeyboardSelf(): void {
    this.addLog('hideKeyboardSelf');
    if (this.mKbController !== undefined) {
      if (inputType == ConstantNum.NUM_8) {
        AppStorage.setOrCreate('menuType', MenuType.NUMBER);
      } else {
        AppStorage.setOrCreate('menuType', MenuType.NORMAL);
      }
      this.mKbController.hide();
    } else {
      this.addLog('hideKeyboardSelf this.mKbController is undefined');
    }
  }

  public deleteBackward(length: number): void {
    this.addLog('deleteBackward');
    let pinyin = AppStorage.get('pinyin') as string | undefined || ''; // 默认值处理
    if (this.mTextInputClient !== undefined) {
      if (pinyin.length > 1) {
        let pinyins = pinyin.slice(0, -1);
        AppStorage.setOrCreate('pinyin', pinyins); // 注意：slice 的参数应为整数，如 pinyin.slice(0, -1)
        let data = new PinyinKeyMessage('\b', KEYCODE_DEL);
        this.workerInstance!.postMessage(data);
      } else if (pinyin.length == 1) {
        InputHandler.getInstance().resetPinyin();
      } else {
        this.mTextInputClient.deleteBackward(length);
      }
    }
    if (isDebug) {
      this.refreshInfo();
    }
  }

  public deleteForward(length: number): void {
    this.addLog('deleteForward');
    let pinyin = AppStorage.get('pinyin') as string | undefined || '';
    if (this.mTextInputClient !== undefined) {
      if (pinyin && pinyin.length > 1) {
        let pinyins = pinyin.slice(0, -1);
        AppStorage.setOrCreate('pinyin', pinyins); // 注意：slice 的参数应为整数，如 pinyin.slice(0, -1)
        let data = new PinyinKeyMessage('\b', KEYCODE_DEL);
        this.workerInstance!.postMessage(data);
      } else if (pinyin.length === 1) {
        InputHandler.getInstance().resetPinyin();
      } else {
        this.mTextInputClient.deleteForward(length);
      }
    } else {
      this.addLog('deleteForward this.mTextInputClient is undefined');
    }
    if (isDebug) {
      this.refreshInfo();
    }
  }


  public insertText(text: string): void {
    if (this.mTextInputClient !== undefined) {
      this.mTextInputClient.insertText(text);
    }
  }

  public addLog(message: string): void {
    Log.showInfo(TAG, `kikaInput-js: ${message}`);
  }

  public setCursorInfo(info: CursorInfo): void {
    this.addLog(`setCursorInfo info = ${JSON.stringify(info)}`);
    this.cursorInfo = info;
  }


  public setSelectInfo(info: string): void {
    this.selectInfo = info;
    this.addLog(`setSelectInfo info = ${info}`);
  }

  public setTextInfo(info: string): void {
    this.textInfo = info;
    this.addLog(`setTextInfo info = ${info}`);
  }

  public setInputInfo(info: string): void {
    this.inputInfo = info;
    this.addLog(`setInputInfo info = ${info}`);
  }

  public refreshInfo(): void {
    this.addLog('refreshInfo');
    let showText = '';
    this.addLog('refreshInfo1');
    if (this.mTextInputClient) {
      showText += 'five chars: before：[' + this.mTextInputClient.getForward(5) + '];after：[' +
        this.mTextInputClient.getBackward(5) + ']\n';
    }
    this.addLog('refreshInfo2');
    showText += this.cursorInfo + '\n';
    this.addLog('refreshInfo3');
    showText += this.selectInfo + '\n';
    this.addLog('refreshInfo4');
    showText += this.textInfo + '\n';
    this.addLog('refreshInfo5');
    showText += this.inputInfo;
    this.addLog('refreshInfo6');
    AppStorage.set<string>('showLog', showText);
    this.addLog('refreshInfo7');
    this.addLog('result is = ' + showText);
  }

  public initPinyin(descriptor: resourceManager.RawFileDescriptor, filePath: string) {
    this.addLog(`initPinyin`);
    //  主线程中创建Worker对象
    let workerInstance = new worker.ThreadWorker('entry/ets/worker/Worker.ets');
    workerInstance.onmessage = (e: MessageEvents): void => {
      this.addLog('onmessage');
      let data = e.data as PinyinMessage;
      let type = data.type;
      switch (type) {
        case MessageType.UPDATE: {
          let updateData = data as PinyinUpdateMessage;
          this.updateAppStorage(updateData);
          this.addLog(`workerPort.onmessage update`);
          break;
        }
        case MessageType.RESULT: {
          let resultData = data as PinyinResultMessage;
          this.addLog(`workerPort.onmessage result str: ${resultData.resultStr}}`);
          if (this.mTextInputClient != undefined) {
            this.mTextInputClient.insertText(resultData.resultStr);
          }
          break;
        }
      }
    }
    workerInstance.onexit = (code) => {
      this.addLog('workerInstance onexit');
    }
    let data = new PinyinInitMessage(descriptor, filePath);
    workerInstance.postMessage(data);

    this.workerInstance = workerInstance;
  }

  public destroyPinyin() {
    this.addLog(`destroyPinyin`);
    AppStorage.delete('SelectTextLength');
    if (this.workerInstance != undefined) {
      try {
        let data = new PinyinMessage(MessageType.CLOSE);
        this.workerInstance!.postMessage(data);
        this.workerInstance!.terminate();
      } catch (_) {
      }
    }
  }

  public resetPinyin() {
    AppStorage.delete('SelectTextLength');
    if (this.workerInstance != undefined) {
      try {
        let data = new PinyinMessage(MessageType.RESET);
        this.workerInstance!.postMessage(data);
      } catch (_) {
      }
    }
  }

  public onKeyClick(keyChar: string, keyCode: number) {
    if (this.workerInstance != undefined) {
      try {
        // 构造输入法键盘消息对象并通过Worker线程发送
        let data = new PinyinKeyMessage(keyChar, keyCode);
        this.workerInstance!.postMessage(data);
      } catch (_) {
      }
    }
  }

  private updateAppStorage(data: PinyinUpdateMessage) {
    if (data.candidates.length <= 0) {
      AppStorage.setOrCreate('isMoreText', false);
    }
    AppStorage.setOrCreate('pinyin', data.pinyin);
    this.dataSource.setData(data.candidates);
  }

  public getDataSource(): ChineseDataSource {
    return this.dataSource;
  }
}

class KeyboardController {
  private barPosition: number = 0;
  private mContext: InputMethodExtensionContext | undefined;
  private panel: inputMethodEngine.Panel | undefined;
  private inputHandle: InputHandler = InputHandler.getInstance();
  private mKeyboardDelegate: inputMethodEngine.KeyboardDelegate | undefined;
  private menuType: number = MenuType.NORMAL;
  private symbolType: number = SymbolKey.ZERO;
  private keyState: number = 0;
  private focusInfo = {} as keyInfo;
  private resolveSpace: boolean = false;
  private resolveLeftSpace: boolean = false;
  private resolveRightSpace: boolean = false;
  private isEnding: boolean = false;

  constructor() {
    this.mContext = undefined;
    this.panel = undefined;
    this.mKeyboardDelegate = undefined;
  }

  public onCreate(context: InputMethodExtensionContext): void {
    this.mContext = context;
    this.inputHandle.addLog('onCreate');
    this.registerListener();
    this.initWindow();
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
    let flagType = inputMethodEngine.PanelFlag.FLG_FIXED;
    let positionX = 0;
    let positionY = 0;
    this.inputHandle.addLog('initWindow');
    let dis = display.getDefaultDisplaySync();
    this.inputHandle.addLog('initWindow-oncall display');
    let dWidth = dis.width;
    let dHeight = dis.height;
    let navigationBarHeight = NAVIGATIONBAR_HEIGHT_DEFAULT;
    let keyHeightRate = KEYBOARD_HEIGHT_RATE_DEFAULT;
    AppStorage.setOrCreate('windowWidth', dis.width);
    AppStorage.setOrCreate('windowHeight', dis.height);
    let isLandscape = false;
    let isRkDevice = false;
    if (dis.width > dis.height) {
      isLandscape = true;
      AppStorage.setOrCreate('isLandscape', true);
    } else {
      AppStorage.setOrCreate('isLandscape', false);
    }
    this.inputHandle.addLog('width: ' + dWidth + ' height: ' + dHeight + ' isLandscape: ' + isLandscape);
    if (dWidth === DEVICE_PHONE.width && dHeight === DEVICE_PHONE.height) {
      navigationBarHeight = 0;
      keyHeightRate = KEYBOARD_HEIGHT_RATE_PHONE;
    } else if (dWidth === DEVICE_PHONE.height && dHeight === DEVICE_PHONE.width) {
      navigationBarHeight = 0;
      keyHeightRate = KEYBOARD_HEIGHT_RATE_PHONE_LAND;
    } else if (dWidth === DEVICE_RK.width && dHeight === DEVICE_RK.height) {
      navigationBarHeight = KEYBOARD_HEIGHT_RATE_DEFAULT;
      AppStorage.setOrCreate('isRkDevice', true);
      isRkDevice = true;
    } else if (dWidth === DEVICE_BIG.width && dHeight === DEVICE_BIG.height) {
      navigationBarHeight = 0;
      keyHeightRate = KEYBOARD_HEIGHT_RATE_BIG_LAND;
    } else if (dWidth === DEVICE_BIG.height && dHeight === DEVICE_BIG.width) {
      navigationBarHeight = 0;
      keyHeightRate = KEYBOARD_HEIGHT_RATE_BIG;
    } else if (`${dWidth}` == `${DEVICE_SIZE_4K.width}` && `${dHeight}` == `${DEVICE_SIZE_4K.height}`) {
      flagType = inputMethodEngine.PanelFlag.FLG_FLOATING;
      positionX = 500;
      positionY = 250;
      dWidth = dis.width - 1000;
    }
    let keyHeight = dHeight * keyHeightRate;
    this.barPosition = dHeight - keyHeight - navigationBarHeight + positionY;
    this.inputHandle.addLog(`initWindow-dWidth = ${dWidth};dHeight = ${dHeight};keyboard height = ${keyHeight};;navibar height = navigationBarHeight`);
    this.inputHandle.addLog(`initWindow-deviceType = ${deviceInfo.deviceType}`);
    let panelInfo: inputMethodEngine.PanelInfo = {
      type: inputMethodEngine.PanelType.SOFT_KEYBOARD,
      flag: flagType
    }
    let inputStyle = StyleConfiguration.getInputStyle(isLandscape, isRkDevice, deviceInfo.deviceType);
    AppStorage.setOrCreate('inputStyle', inputStyle);
    imeAbility.createPanel(this.mContext, panelInfo).then((panel: inputMethodEngine.Panel) => {
      this.panel = panel;
      panel.resize(dWidth, keyHeight).then(() => {
        panel.moveTo(positionX, this.barPosition).then(() => {
          panel.setUiContent('pages/Index').then(() => {
            this.inputHandle.addLog('loadContent finished');
          })
        })
      })
    })
  }

  private destroyPanel(): void {
    this.inputHandle.addLog('destroyPanel');
    if (this.panel) {
      imeAbility.destroyPanel(this.panel);
    }
  }

  private resizePanel(): void {
    this.inputHandle.addLog('resizeWindow');
    let dis = display.getDefaultDisplaySync();
    this.inputHandle.addLog('resizeWindow-oncall display');
    let dWidth = dis.width;
    let dHeight = dis.height;
    let navigationBarHeight = dHeight * 0.07; // 有些产品导航栏高度为0，默认为0.07
    let keyHeightRate = KEYBOARD_HEIGHT_RATE_DEFAULT;
    AppStorage.setOrCreate<number>('windowWidth', dis.width);
    AppStorage.setOrCreate<number>('windowHeight', dis.height);
    let isLandscape = false;
    let isRkDevice = false;
    if (dis.width > dis.height) {
      isLandscape = true;
      AppStorage.setOrCreate('isLandscape', true);
    } else {
      AppStorage.setOrCreate('isLandscape', false);
    }
    if (dWidth === DEVICE_PHONE.width && dHeight === DEVICE_PHONE.height) {
      navigationBarHeight = 0;
      keyHeightRate = KEYBOARD_HEIGHT_RATE_PHONE;
    } else if (dWidth === DEVICE_PHONE.height && dHeight === DEVICE_PHONE.width) {
      navigationBarHeight = 0;
      keyHeightRate = KEYBOARD_HEIGHT_RATE_PHONE_LAND;
    } else if (dWidth === DEVICE_RK.width && dHeight === DEVICE_RK.height) {
      navigationBarHeight = KEYBOARD_HEIGHT_RATE_DEFAULT;
      AppStorage.setOrCreate('isRkDevice', true);
      isRkDevice = true;
    } else if (dWidth === DEVICE_BIG.width && dHeight === DEVICE_BIG.height) {
      navigationBarHeight = 0;
      keyHeightRate = KEYBOARD_HEIGHT_RATE_BIG_LAND;
    } else if (dWidth === DEVICE_BIG.height && dHeight === DEVICE_BIG.width) {
      navigationBarHeight = 0;
      keyHeightRate = KEYBOARD_HEIGHT_RATE_BIG;
    }
    let keyHeight = dHeight * keyHeightRate;
    let inputStyle = StyleConfiguration.getInputStyle(isLandscape, isRkDevice, deviceInfo.deviceType);
    AppStorage.setOrCreate('inputStyle', inputStyle);
    if (this.panel) {
      this.panel.resize(dWidth - 200, keyHeight).then(() => {
        if (this.panel) {
          this.panel.moveTo(100, dHeight - keyHeight - navigationBarHeight).then(() => {
            this.inputHandle.addLog('resizePanel-moveTo success');
          })
        }
      }).catch((err: BusinessError) => {
        this.inputHandle.addLog('resizePanel-moveTo err' + JSON.stringify(err));
      })
    }
  }

  private registerListener(): void {
    this.inputHandle.addLog('registerListener');

    display.on('change', () => {
      this.inputHandle.addLog('screenChangeEvent');
      this.resizePanel();
    });
    imeAbility.on('inputStart',
      (kbController: inputMethodEngine.KeyboardController, textInputClient: inputMethodEngine.InputClient) => {
        this.inputHandle.addLog('keyboard inputStart');
        this.inputHandle.onInputStart(kbController, textInputClient);
      })
    imeAbility.on('inputStop', () => {
      this.inputHandle.addLog('keyboard inputStop');
      this.onDestroy();
      if (this.mContext) {
        this.mContext.destroy();
      }
    });

    this.mKeyboardDelegate = inputMethodEngine.getKeyboardDelegate();

    imeAbility.on('keyboardShow', () => {
      this.mKeyboardDelegate?.on('keyEvent', (keyEvent: KeyEvent) => {
        if (keyEvent.key.code === KeyCode.KEYCODE_BACK && keyEvent.action === Action.UP) {
          this.hideKeyboard();
          return true;
        }
        return false;
      });
      this.mKeyboardDelegate?.on('keyDown', (keyEvent: inputMethodEngine.KeyEvent) => {
        if (keyEvent.keyCode == 2047) {
          return false;
        }
        let result = this.onKeyDown(keyEvent);
        return result;
      });
      this.mKeyboardDelegate?.on('keyUp', (keyEvent: inputMethodEngine.KeyEvent) => {
        if (keyEvent.keyCode == 2047) {
          return false;
        }
        let result = this.onKeyUp(keyEvent);
        return result;
      });
      this.inputHandle.addLog('keyboardShow');
    });

    imeAbility.on('keyboardHide', () => {
      //初始化
      let uiContext: UIContext = AppStorage.get('UIContext') as UIContext;
      try {
        uiContext.getFocusController().requestFocus(getKey({
          panel: Menu.Key,
          col: 1,
          index: 0
        }))
      } catch (e) {
        Log.showError(TAG, '%{public}s', 'requestFocus error: ' + JSON.stringify(e));
      }
      this.menuType = 0;
      AppStorage.setOrCreate('menuType', this.menuType);
      this.mKeyboardDelegate?.off('keyDown');
      this.mKeyboardDelegate?.off('keyUp');
      this.mKeyboardDelegate?.off('keyEvent');
    });
    this.mKeyboardDelegate.on('cursorContextChange', (x: number, y: number, height: number) => {
      let cursorInfo: CursorInfo = { x: x, y: y, height: height };
      this.inputHandle.setCursorInfo(cursorInfo);
    });
    if (isDebug) {
      this.mKeyboardDelegate.on('selectionChange',
        (oldBegin: number, oldEnd: number, newBegin: number, newEnd: number) => {
          this.inputHandle.setSelectInfo('selectInfo: from(' + oldBegin + ',' + oldEnd + ') to (' + newBegin + ',' +
            newEnd + ')');
        });
      this.mKeyboardDelegate.on('textChange', (text: string) => {
        this.inputHandle.setTextInfo('textInfo: ' + text);
      });
    }
  }

  public onKeyDown(keyEvent: inputMethodEngine.KeyEvent): boolean {
    let keyCode = keyEvent.keyCode;
    return this.inputHardKeyCode(keyCode);
  }

  public onKeyUp(keyEvent: inputMethodEngine.KeyEvent): boolean {
    let keyCode = keyEvent.keyCode;
    //添加拦截回车键
    if (keyCode === 2055 || keyCode === 2071 || (keyCode >= 2012 && keyCode <= 2016) || keyCode === 2054) {
      return true;
    }
    return true;
  }

  public inputHardKeyCode(keyValue: number): boolean {
    if (this.processFunctionKeys(keyValue)) {
      return true;
    }
    return true;
  }

  public processFunctionKeys(keyValue: number): boolean {
    this.inputHandle.addLog('processFunctionKeys keyValue: ' + keyValue);
    switch (keyValue) {
      case KeyValue.KEYCODE_DEL:
        this.inputHandle.deleteForward(1);
        return true;
      case KeyValue.KEYCODE_FORWARD_DEL:
        this.inputHandle.deleteBackward(1);
        return true;
      case KeyValue.KEYCODE_DPAD_UP:
        this.moveFocusToUp();
        return true;
      case KeyValue.KEYCODE_DPAD_DOWN:
        this.moveFocusToDown();
        return true;
      case KeyValue.KEYCODE_DPAD_LEFT:
        this.moveFocusToLeft();
        return true;
      case KeyValue.KEYCODE_DPAD_RIGHT:
        this.moveFocusToRight();
        return true;
      case KeyValue.KEYCODE_ENTER:
        this.sendMessageToInput();
        return true;
      default:
        return false;
    }
  }

  private unRegisterListener(): void {
    imeAbility.off('keyboardShow');
    imeAbility.off('keyboardHide');
    imeAbility.off('inputStop', () => {
    });
    if (this.mKeyboardDelegate) {
      this.mKeyboardDelegate.off('keyDown');
      this.mKeyboardDelegate.off('keyUp');
    }
  }

  public moveFocusToUp = () => this.moveFocus('up');
  public moveFocusToDown = () => this.moveFocus('down');
  public moveFocusToLeft = () => this.moveFocus('left');
  public moveFocusToRight = () => this.moveFocus('right');

  parseFocusInfo(focusItem: string): keyInfo {
    try {
      let focusInfo: keyInfo = {
        panel: focusItem.split('_')[0],
        col: parseInt(focusItem.split('_')[1]),
        index: parseInt(focusItem.split('_')[2])
      };
      return focusInfo;
    } catch (e) {
      Log.showError(TAG, '%{public}s', 'parseFocusInfo error: ' + JSON.stringify(e));
      this.parseFocusInfo(focusItem);
    }
    return {
      panel: '',
      col: 0,
      index: 0
    }
  }

  moveFocus(direction: 'up' | 'down' | 'left' | 'right'): void {
    let focusItem = AppStorage.get('focusItem') as string;
    let uiContext: UIContext = AppStorage.get('UIContext') as UIContext;
    let focusInfo = this.parseFocusInfo(focusItem) as keyInfo;
    let pinyin = AppStorage.get('pinyin') as string;
    this.inputHandle.addLog('moveFocus direction: ' + direction + ' ' + JSON.stringify(focusItem) + ' ' + JSON.stringify(focusInfo));
    if (focusInfo.col != FocusCol.COL_3 && focusInfo.index != FocusRow.ROW_11) {
      AppStorage.setOrCreate('LoopIndex', FocusRow.ROW_9);
    }
    if (focusInfo.col == FocusCol.COL_1 && focusInfo.index == FocusRow.ROW_11) {
      AppStorage.setOrCreate('LoopIndex', FocusRow.ROW_3);
    }
    if (focusInfo.col == FocusCol.COL_3 && focusInfo.index == FocusRow.ROW_9) {
      AppStorage.setOrCreate('LoopIndex', FocusRow.ROW_4);
    }
    // 根据不同方向进行不同的操作
    switch (direction) {
      case 'up':
        if (this.menuType == MenuType.CHINESE && pinyin.length > 0 && focusInfo.col == FocusCol.COL_1) {
          focusInfo.col--;
          let lengthlist = AppStorage.get('SelectTextLength') as Array<number>
          this.inputHandle.addLog('moveFocus lengthlist: ' + JSON.stringify(lengthlist));
          if (lengthlist && lengthlist.length > 0) {
            focusInfo.index = lengthlist[lengthlist.length -1];
          } else {
            focusInfo.index = FocusRow.ROW_0;
          }
        } else if (focusInfo.col === FocusCol.COL_0) {
        } else {
          this.isEnding = false;
          //处理空白键逻辑
          if (focusInfo.col === FocusCol.COL_3 && focusInfo.index > FocusRow.ROW_5 && focusInfo.panel != 'NumMenu') {
            focusInfo.index = focusInfo.index + 1;
            this.resolveSpace = false;
          }
          if (focusInfo.panel != 'NumMenu' && (this.resolveSpace || this.resolveLeftSpace)) {
            focusInfo.index = focusInfo.index + 1;
            this.resolveSpace = false;
            this.resolveLeftSpace = false;
          }
          focusInfo.col--;
        }
        break;
      case 'down':
        if (focusInfo.col != FocusCol.COL_3) {
          if (focusInfo.col === FocusCol.COL_2 && focusInfo.index >= FocusRow.ROW_6 && focusInfo.panel != 'NumMenu') {
            //空格占两行，强制减1
            focusInfo.index = focusInfo.index - 1;
            if (focusInfo.index == FocusRow.ROW_5) {
              this.resolveSpace = true;
            } else {
              this.resolveSpace = false;
            }
          } else {
            this.resolveSpace = false;
          }
          focusInfo.col++;
          let nextRowLength = this.getRowLength(focusInfo.panel, focusInfo.col);
          focusInfo.index = Math.min(nextRowLength - 1, focusInfo.index);
        }
        break;
      case 'left':
        if (focusInfo.index == 0) {
          if (focusInfo.col == FocusCol.COL_1) {
            AppStorage.setOrCreate('LoopIndex', 0);
            focusInfo.index = FocusRow.ROW_12;
          } else if (focusInfo.col == FocusCol.COL_2) {
            AppStorage.setOrCreate('LoopIndex', 1);
            focusInfo.index = FocusRow.ROW_12;
          } else if (focusInfo.col == FocusCol.COL_3) {
            focusInfo.col = FocusCol.COL_2;
            AppStorage.setOrCreate('LoopIndex', FocusRow.ROW_2);
            focusInfo.index = FocusRow.ROW_12;
          }
        }
        if (focusInfo.col == FocusCol.COL_2 && focusInfo.panel == 'NumMenu' && focusInfo.index == FocusRow.ROW_11) {
          if (AppStorage.get('LoopIndex') == 2) {
            this.isEnding = true;
          }
        }
        if (focusInfo.index > FocusRow.ROW_0) {
          if (this.menuType == MenuType.CHINESE && pinyin.length > 0 && focusInfo.col == FocusCol.COL_0) {
            let appear = AppStorage.get('TextItem_' + `${focusInfo.index - 1}`) as boolean;
            if (appear) {
              focusInfo.index--;
            } else {
              let lengthlist = AppStorage.get('SelectTextLength') as Array<number>
              let length = 0;
              if (lengthlist.length > 1) {
                length = lengthlist[lengthlist.length-1] - lengthlist[lengthlist.length-2];
              } else {
                length = lengthlist[0];
              }
              this.inputHandle.addLog('moveFocus: ' + JSON.stringify(lengthlist));
              let list = lengthlist.slice(0, lengthlist.length - 1);
              AppStorage.setOrCreate('SelectTextLength', list);
              focusInfo.index -= length
              let eventData: emitter.EventData = {
                data: {
                  'index': focusInfo.index,
                }
              };
              let innerEvent: emitter.InnerEvent = {
                eventId: 120,
              };
              emitter.emit(innerEvent, eventData);
            }
          } else {
            this.resolveSpace = false;
            if (this.isEnding && focusInfo.index == 11) {
              this.isEnding = false;
              focusInfo.col = FocusCol.COL_3;
              focusInfo.index = focusInfo.panel == 'NumMenu' ? FocusRow.ROW_10 : FocusRow.ROW_9;
            } else {
              if (AppStorage.get('LoopIndex') == FocusRow.ROW_2 && focusInfo.index == FocusRow.ROW_11 &&
                focusInfo.col == FocusCol.COL_2) {
                focusInfo.col = FocusCol.COL_3;
                if (focusInfo.panel == 'NumMenu') {
                  focusInfo.index = FocusRow.ROW_11;
                }
                focusInfo.index = FocusRow.ROW_10;
              }
              focusInfo.index--;
            }
            if (focusInfo.col == FocusCol.COL_3 && focusInfo.index == FocusRow.ROW_5) {
              this.resolveLeftSpace = true;
            } else {
              this.resolveLeftSpace = false;
            }
          }
        }
        break;
      case 'right':
        if (focusInfo.index == FocusRow.ROW_11) {
          if (focusInfo.col == FocusCol.COL_1 || focusInfo.col == FocusCol.COL_2) {
            if (AppStorage.get('LoopIndex') == FocusRow.ROW_4 || AppStorage.get('LoopIndex') == FocusRow.ROW_2) {
              focusInfo.col = FocusCol.COL_3;
              focusInfo.index = -1;
            }
            focusInfo.index = -1;
          }
        }
        if (this.menuType == MenuType.CHINESE && pinyin.length > 0 && focusInfo.col == FocusCol.COL_0) {
          let appear = AppStorage.get('TextItem_' + `${focusInfo.index + 1}`) as boolean;
          if (appear) {
            focusInfo.index++;
          } else {
            let maxlength = InputHandler.getInstance().getDataSource().totalCount();
            if (focusInfo.index + 1 == maxlength) {
              focusInfo.index = Math.min(maxlength - 1, focusInfo.index + 1);
            } else {
              let lengthlist = AppStorage.get('SelectTextLength') as Array<number>
              let start = 0;
              if (!lengthlist) {
                lengthlist = [];
              } else {
                start = lengthlist[lengthlist.length-1] ?? 0;
              }
              let end: number = focusInfo.index + 1;
              let length = end - start;
              if (start === end) {
                if (lengthlist.length > 0) {
                  lengthlist.splice(-1);
                }
                break;
              }
              lengthlist.push(end);
              AppStorage.setOrCreate('SelectTextLength', lengthlist);
              let eventData: emitter.EventData = {
                data: {
                  'index': focusInfo.index + length,
                }
              };
              let innerEvent: emitter.InnerEvent = {
                eventId: 120,
              };
              emitter.emit(innerEvent, eventData);
              focusInfo.index++
            }
          }
        } else {
          let currentRowLength = this.getRowLength(focusInfo.panel, focusInfo.col);
          if (focusInfo.panel == 'NumMenu' && focusInfo.col == FocusCol.COL_3 && focusInfo.index == FocusRow.ROW_10) {
            focusInfo.col = FocusCol.COL_2;
            focusInfo.index = FocusRow.ROW_11;
            this.isEnding = true;
          } else if (focusInfo.panel != 'NumMenu' && focusInfo.col == FocusCol.COL_3 &&
            focusInfo.index == FocusRow.ROW_9) {
            focusInfo.col = FocusCol.COL_2;
            focusInfo.index = FocusRow.ROW_11;
            this.isEnding = true;
          } else {
            focusInfo.index = Math.min(currentRowLength - 1, focusInfo.index + 1);
          }
        }
        this.resolveSpace = false;
        if (focusInfo.col == FocusCol.COL_3 && focusInfo.index == FocusRow.ROW_5) {
          this.resolveRightSpace = true;
        } else {
          this.resolveRightSpace = false;
        }
        break;
    }
    // 更新焦点
    this.inputHandle.addLog(`moveFocus panel:${focusInfo.panel},col:${focusInfo.col},index:${focusInfo.index}`);
    setTimeout(() => {
      try {
        uiContext.getFocusController().requestFocus(getKey({
          panel: focusInfo.panel,
          col: focusInfo.col,
          index: focusInfo.index
        }));
      } catch (e) {
        if (direction === 'up' && focusInfo.col === 0 && focusInfo.panel === 'ChineseMenu') {
          let lengthlist = AppStorage.get('SelectTextLength') as Array<number>
          this.inputHandle.addLog('moveFocus lengthlist: ' + JSON.stringify(lengthlist));
          lengthlist.pop();
          this.inputHandle.addLog('moveFocus new lengthlist: ' + JSON.stringify(lengthlist));
          uiContext.getFocusController().requestFocus(getKey({
            panel: focusInfo.panel,
            col: focusInfo.col,
            index: lengthlist[lengthlist.length-1]
          }));
        }
        Log.showError(TAG, '%{public}s', 'moveFocus error: ' + JSON.stringify(e));
      }
    }, 50)
  }

  getRowLength(panel: string, col: number): number {
    switch (panel) {
      case Menu.Key:
        switch (col) {
          case FocusCol.COL_1:
            return keyInputList.rowFirst.length;
          case FocusCol.COL_2:
            return keyInputList.rowSecond.length;
          case FocusCol.COL_3:
            return keyInputList.rowThird.length;
          case FocusCol.COL_4:
            return keyInputList.rowForth.length;
        }
        break;
      case Menu.Num:
        let keyData = numInputList;
        if (AppStorage.get('SymbolID')) {
          if (AppStorage.get('SymbolID') == SymbolKey.ZERO) {
            keyData = numInputList;
          } else if (AppStorage.get('SymbolID') == SymbolKey.ONE) {
            keyData = numInputListVice;
          }
        }
        switch (col) {
          case FocusCol.COL_1:
            return keyData.rowFirst.length;
          case FocusCol.COL_2:
            return keyData.rowSecond.length;
          case FocusCol.COL_3:
            return keyData.rowThird.length;
          case FocusCol.COL_4:
            return keyData.rowForth.length;
        }
        break;
      case Menu.Chn:
        switch (col) {
          case FocusCol.COL_1:
            return chineseInputList.rowFirst.length;
          case FocusCol.COL_2:
            return chineseInputList.rowSecond.length;
          case FocusCol.COL_3:
            return chineseInputList.rowThird.length;
          case FocusCol.COL_4:
            return chineseInputList.rowForth.length;
        }
      case Menu.Sym:
        switch (col) {
          case FocusCol.COL_1:
            return symInputList.rowFirst.length;
          case FocusCol.COL_2:
            return symInputList.rowSecond.length;
          case FocusCol.COL_3:
            return symInputList.rowThird.length;
          case FocusCol.COL_4:
            return symInputList.rowForth.length;
        }
    }
    return 0;
  }

  getKeyValue(panel: string, col: number, index: number): keySourceListType {
    if (panel == Menu.Key) {
      switch (col) {
        case FocusCol.COL_1:
          return keyInputList.rowFirst[index];
        case FocusCol.COL_2:
          return keyInputList.rowSecond[index];
        case FocusCol.COL_3:
          return keyInputList.rowThird[index];
        case FocusCol.COL_4:
          return keyInputList.rowForth[index];
      }
    } else {
      switch (col) {
        case FocusCol.COL_1:
          return chineseInputList.rowFirst[index];
        case FocusCol.COL_2:
          return chineseInputList.rowSecond[index];
        case FocusCol.COL_3:
          return chineseInputList.rowThird[index];
        case FocusCol.COL_4:
          return chineseInputList.rowForth[index];
      }
    }
    return { title: '', content: '', upperContent: '' } as keySourceListType;
  }

  getSourceValue(panel: string, col: number, index: number): sourceListType {
    if (panel === Menu.Num) {
      let keyData = numInputList;
      if (AppStorage.get('SymbolID')) {
        if (AppStorage.get('SymbolID') == SymbolKey.ZERO) {
          keyData = numInputList;
        } else if (AppStorage.get('SymbolID') == SymbolKey.ONE) {
          keyData = numInputListVice;
        }
      }
      switch (col) {
        case FocusCol.COL_1:
          return keyData.rowFirst[index];
        case FocusCol.COL_2:
          return keyData.rowSecond[index];
        case FocusCol.COL_3:
          return keyData.rowThird[index];
        case FocusCol.COL_4:
          return keyData.rowForth[index];
      }
    }
    if (panel === Menu.Sym) {
      switch (col) {
        case FocusCol.COL_1:
          return symInputList.rowFirst[index];
        case FocusCol.COL_2:
          return symInputList.rowSecond[index];
        case FocusCol.COL_3:
          return symInputList.rowThird[index];
        case FocusCol.COL_4:
          return symInputList.rowForth[index];
      }
    }
    return { content: '' } as sourceListType;
  }

  sendMessageToInput() {
    let focusItem = AppStorage.get('focusItem') as string;
    if (!focusItem) {
      Log.showError(TAG, '%{public}s', 'focusItem is undefined, using default value.');
      focusItem = 'Key_1_0';
    }
    let keyValue: keySourceListType = { title: '', content: '', upperContent: '' }
    let sourceValue: sourceListType = { content: '' }
    this.focusInfo.panel = focusItem.split('_')[0];
    this.focusInfo.col = parseInt(focusItem.split('_')[1]);
    this.focusInfo.index = parseInt(focusItem.split('_')[2]);
    this.inputHandle.addLog(`sendMessageToInput panel:${this.focusInfo.panel},col:${this.focusInfo.col},index:${this.focusInfo.index}`);
    //判断为keyMenu键盘
    if (this.focusInfo.panel === Menu.Key) {
      keyValue = this.getKeyValue(this.focusInfo.panel, this.focusInfo.col, this.focusInfo.index);
      this.handleKeyInput(keyValue);
      return;
    } else if (this.focusInfo.panel === Menu.Chn) {
      if (this.focusInfo.col == 0) {
        let item = AppStorage.get('TextItem') as string;
        if (item != '') {
          InputHandler.getInstance().insertText(item);
          AppStorage.setOrCreate('TextItem', '');
          InputHandler.getInstance().resetPinyin();
        } else {
          this.hideKeyboard();
        }
      }
      keyValue = this.getKeyValue(this.focusInfo.panel, this.focusInfo.col, this.focusInfo.index);
      this.handleKeyInput(keyValue);
    } else {
      sourceValue = this.getSourceValue(this.focusInfo.panel, this.focusInfo.col, this.focusInfo.index);
      this.handleSourceInput(sourceValue, this.focusInfo.panel);
      return;
    }
  }

  handleKeyInput(keyValue: keySourceListType) {
    this.inputHandle.addLog('handleKeyInput ' + keyValue.content);
    switch (keyValue.content) {
      case FuncKey.SHIFT:
        this.toggleKeyState();
        break;
      case FuncKey.DELETE:
        this.inputHandle.deleteForward(1);
        break;
      case FuncKey.ENTER:
        this.hideKeyboard();
        break;
      case MenuKey.NORMAL_KEY:
        this.switchPanel(MenuType.NORMAL);
        break;
      case MenuKey.NUMBER_KEY:
        this.switchPanel(MenuType.NUMBER);
        break;
      case MenuKey.SWITCH_KEY:
        this.menuType != 3 ? this.switchPanel(MenuType.CHINESE) : this.switchPanel(MenuType.NORMAL);
        break;
      case MenuKey.SPECIAL_KEY:
        this.switchPanel(MenuType.SPECIAL);
        break;
      default:
        this.insertText(keyValue);
    }
  }

  handleSourceInput(sourceValue: sourceListType, panel: string) {
    this.inputHandle.addLog('handleSourceInput ' + JSON.stringify(sourceValue) + ' panel ' + JSON.stringify(panel));
    if (panel === Menu.Num) {
      switch (sourceValue.content) {
        case FuncKey.DELETE:
          this.inputHandle.deleteForward(1);
          break;
        case MenuKey.BACK_KEY:
          this.switchPanel(MenuType.NORMAL);
          break;
        case FuncKey.ENTER:
          this.hideKeyboard();
          break;
        case MenuKey.SPECIAL_KEY:
          this.switchPanel(MenuType.SPECIAL);
          break;
        case MenuKey.NUMBER_KEY_SWICH:
          this.switchSymbol();
          break;
        default:
          this.inputHandle.insertText(sourceValue.content);
      }
    }
    if (panel === Menu.Sym) {
      switch (sourceValue.content) {
        case FuncKey.DELETE:
          this.inputHandle.deleteForward(1);
          break;
        case MenuKey.NORMAL_KEY:
          this.switchPanel(MenuType.NORMAL);
          break;
        case FuncKey.ENTER:
          this.hideKeyboard();
          break;
        case MenuKey.NUMBER_KEY:
          this.switchPanel(MenuType.NUMBER);
          break;
        default:
          this.inputHandle.insertText(sourceValue.content);
      }
    }
  }

  switchPanel(newPanelType: MenuType) {
    this.menuType = AppStorage.get('menuType') as number;
    this.menuType = newPanelType;
    AppStorage.setOrCreate('menuType', this.menuType);
  }

  switchSymbol() {
    this.menuType = AppStorage.get('SymbolID') as number;
    if (this.menuType == SymbolKey.ONE) {
      this.menuType = SymbolKey.ZERO;
    } else if (this.menuType == SymbolKey.ZERO) {
      this.menuType = SymbolKey.ONE;
    } else {
      this.menuType = SymbolKey.ZERO;
    }
    AppStorage.setOrCreate('SymbolID', this.menuType);
    this.inputHandle.addLog('switchSymbol ' + this.menuType);
  }

  // 定义切换大小写状态的函数
  toggleKeyState() {
    this.keyState = AppStorage.get('keyState') as number;
    this.keyState = (this.keyState + 1) % 3;
    AppStorage.setOrCreate('keyState', this.keyState);
  }

  insertText(value: keySourceListType) {
    this.keyState = AppStorage.get('keyState') as number;
    if (value && this.menuType == 3 && this.keyState === KeyState.LOWER_CASE) {
      if (value.content == ' ' || value.content == getString($r('app.string.symbol_2')) ||
        value.content == getString($r('app.string.symbol_1'))) {
        this.inputHandle.insertText(value.content);
      } else {
        this.inputHandle.onKeyClick(value.content, 0);
      }
      this.inputHandle.addLog(tag + ' this.upper=0 ' + value.content);
    } else if ((this.keyState === KeyState.LOWER_CASE && value)) {
      this.inputHandle.insertText(value.content);
    } else if (value) {
      if (this.keyState === KeyState.ONCE_UPPER_CASE) {
        this.keyState = KeyState.LOWER_CASE;
        AppStorage.setOrCreate('keyState', this.keyState);
      }
      this.inputHandle.insertText(value.upperContent);
    }
  }

  hideKeyboard() {
    AppStorage.setOrCreate('menuType', MenuType.NORMAL);
    this.inputHandle.hideKeyboardSelf();
  }
}

export const keyboardController: KeyboardController = new KeyboardController();
