'use static'

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