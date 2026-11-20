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

import { resourceManager } from '@kit.LocalizationKit';

export enum MessageType {
  CLOSE,
  INIT,
  KEY,
  RESET,
  CHOOSE,
  RESULT,
  UPDATE
}

export class PinyinMessage {
  public type: MessageType;

  constructor(_type: MessageType) {
    this.type = _type;
  }
}

export class PinyinInitMessage extends PinyinMessage {
  public descriptor: resourceManager.RawFileDescriptor;
  public filePath: string;

  constructor(_descriptor: resourceManager.RawFileDescriptor, _filePath: string) {
    super(MessageType.INIT);
    this.descriptor = _descriptor;
    this.filePath = _filePath;
  }
}

export class PinyinChooseMessage extends PinyinMessage {
  public candId: number;

  constructor(_candId: number) {
    super(MessageType.CHOOSE);
    this.candId = _candId;
  }
}

export class PinyinResultMessage extends PinyinMessage {
  public resultStr: string;

  constructor(_resultStr: string) {
    super(MessageType.RESULT);
    this.resultStr = _resultStr;
  }
}

export class PinyinKeyMessage extends PinyinMessage {
  public keyChar: string;
  public keyCode: number;

  constructor(_keyChar: string, _keyCode: number) {
    super(MessageType.KEY);
    this.keyChar = _keyChar;
    this.keyCode = _keyCode;
  }
}

export class PinyinUpdateMessage extends PinyinMessage {
  public pinyin: string;
  public candidates: string[];

  constructor(_pinyin: string, _candidates: string[]) {
    super(MessageType.UPDATE);
    this.pinyin = _pinyin;
    this.candidates = _candidates;
  }
}
