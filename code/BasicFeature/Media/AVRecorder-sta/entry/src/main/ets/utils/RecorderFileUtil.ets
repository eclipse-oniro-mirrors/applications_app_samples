'use static'

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

import common from '@ohos.app.ability.common';
import fileIo from '@ohos.file.fs';
import DateTimeUtil from './DateTimeUtil';

class RecorderFileUtil {
  private datetimeUtil: DateTimeUtil = new DateTimeUtil();

  async createAudioFile(context: common.Context): Promise<int> {
    let path: string = `${context.filesDir}/AUDIO_${this.datetimeUtil.getDate()}_${this.datetimeUtil.getTime()}.m4a`;
    let file: fileIo.File = await fileIo.open(path, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
    return file.fd;
  }

  async createVideoFile(context: common.Context): Promise<int> {
    let path: string = `${context.filesDir}/VIDEO_${this.datetimeUtil.getDate()}_${this.datetimeUtil.getTime()}.mp4`;
    let file: fileIo.File = await fileIo.open(path, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
    return file.fd;
  }

}

export default new RecorderFileUtil();