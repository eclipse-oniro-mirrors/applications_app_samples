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

import { worker, MessageEvents, ErrorEvent } from '@kit.ArkTS';
import { DecodingInfo, ImeState } from '../model/DecodingInfo';
import {
  PinyinMessage,
  PinyinInitMessage,
  PinyinKeyMessage,
  PinyinUpdateMessage,
  PinyinChooseMessage,
  PinyinResultMessage,
  MessageType
} from '../model/PinyinMessage';
import Log from '../model/Log';

const TAG: string = '[imePinYin worker]';

// 创建worker线程中与主线程通信的对象
const workerPort = worker.workerPort;
let decInfo: DecodingInfo = new DecodingInfo();
let KEYCODE_DEL: number = 67;

// worker线程接收主线程信息
workerPort.onmessage = (e: MessageEvents) => {
  // data:主线程发送的消息
  let data = e.data as PinyinMessage;
  let type = data.type;
  switch (type) {
    case MessageType.CLOSE: {
      // 关闭线程
      Log.showInfo(TAG, '%{public}s', 'workerPort.onmessage close');
      decInfo.destroyPinyin();
      workerPort.close();
      break;
    }

    case MessageType.INIT: {
      let initData = data as PinyinInitMessage;
      Log.showInfo(TAG, '%{public}s', `workerPort.onmessage init: ${initData.filePath}`);
      try {
        decInfo.initPinyin(initData.descriptor, initData.filePath);
      } catch (e) {
        Log.showError(TAG, '%{public}s', `workerPort.onmessage init error: ${e}`);
      }
      break;
    }

    case MessageType.RESET: {
      Log.showInfo(TAG, '%{public}s', 'workerPort.onmessage reset');
      decInfo.reset();
      updateAppStorage();
      break;
    }

    case MessageType.CHOOSE: {
      let choiceData = data as PinyinChooseMessage;
      Log.showInfo(TAG, '%{public}s', `workerPort.onmessage choose candId: ${choiceData.candId}`);
      chooseAndUpdate(choiceData.candId);
      break;
    }

    case MessageType.KEY: {
      let keyData = data as PinyinKeyMessage;
      Log.showInfo(TAG, '%{public}s', `workerPort.onmessage key char: ${keyData.keyChar}, code: ${keyData.keyCode}`);
      onKeyClick(keyData.keyChar, keyData.keyCode);
      break;
    }

    default: {
      Log.showError(TAG, '%{public}s', 'workerPort.onmessage message type error');
    }
  }
};
// worker线程发生error的回调
workerPort.onerror = (e: ErrorEvent) => {
  Log.showInfo(TAG, '%{public}s', `workerPort.onerror ${JSON.stringify(e)}`);
};

function onKeyClick(keyChar: string, keyCode: number): boolean {
  if (decInfo.isSplStrFull()) {
    return true;
  }

  if ((keyChar >= 'a' && keyChar <= 'z') ||
    (keyChar === '\'' && !decInfo.charBeforeCursorIsSeparator()) ||
    (((keyChar >= '0' && keyChar <= '9') || keyChar === ' ') && ImeState.STATE_COMPOSING === decInfo.mImeState)) {
    decInfo.addSplChar(keyChar, false);
    chooseAndUpdate(-1);
  } else if (keyCode === KEYCODE_DEL) {
    decInfo.prepareDeleteBeforeCursor();
    chooseAndUpdate(-1);
  }
  return true;
}

function updateAppStorage() {
  let data = new PinyinUpdateMessage(decInfo.getComposingStr(),
    decInfo.mCandidatesList.slice(0));
  workerPort.postMessage(data);
}

function chooseAndUpdate(candId: number) {
  if (ImeState.STATE_PREDICT !== decInfo.mImeState) {
    decInfo.chooseDecodingCandidate(candId);
  } else {
    // Choose a prediction item.
    decInfo.choosePredictChoice(candId);
  }

  updateAppStorage();

  if (decInfo.getComposingStr().length > 0) {
    let resultStr: string;
    resultStr = decInfo.getComposingStrActivePart();

    // choiceId >= 0 means user finishes a choice selection.
    if (candId >= 0 && decInfo.canDoPrediction()) {
      let data = new PinyinResultMessage(resultStr);
      workerPort.postMessage(data);
      Log.showInfo(TAG, '%{public}s', 'resultStr: ' + resultStr);
      decInfo.reset();
      updateAppStorage();
    } else {
      Log.showInfo(TAG, '%{public}s', 'resetCandidates');
      decInfo.resetCandidates();
    }
  } else {
    Log.showInfo(TAG, '%{public}s', 'getComposingStr null');
  }
}
