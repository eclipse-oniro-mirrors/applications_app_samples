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

import { common } from '@kit.AbilityKit';
import { resourceManager } from '@kit.LocalizationKit';
import { PcmItem } from './PcmData';
import { Logger } from '../utils/Logger';
import { fileIo } from '@kit.CoreFileKit';

export default class PcmItemBuilder {
  private context: common.UIAbilityContext | undefined = AppStorage.get('context');
  private rawFileDescriptor?: resourceManager.RawFileDescriptor;
  private pcmItem: PcmItem | null = null;

  public async build(pcmItem: PcmItem): Promise<PcmItem> {
    this.pcmItem = pcmItem;
    if (!this.context) {
      return this.pcmItem
    }
    let filePath = this.context.filesDir + '/audioExample.pcm';
    let file = await fileIo.openSync(filePath, fileIo.OpenMode.READ_ONLY);
    let fileInfo = await fileIo.statSync(filePath);
    let fileSize = fileInfo.size;
    let rawFileDescriptor: resourceManager.RawFileDescriptor = {
      fd: file.fd,
      offset: 0,
      length: fileSize
    }
    if (rawFileDescriptor) {
      this.rawFileDescriptor = rawFileDescriptor;
    }
    Logger.info('MediaAssetBuilder build rawFileDescriptor1111:' + JSON.stringify(this.rawFileDescriptor));
    return this.pcmItem;
  }

  public getRawFileDescriptor(): resourceManager.RawFileDescriptor | undefined {
    Logger.info(`rawFileDescriptor: ${this.rawFileDescriptor}`);
    return this.rawFileDescriptor;
  }

  public async release(): Promise<void> {
    if (this.context && this.context !== null && this.pcmItem !== null) {
      this.context.resourceManager.closeRawFd(this.pcmItem.src);
    }
    this.pcmItem = null;
  }
}