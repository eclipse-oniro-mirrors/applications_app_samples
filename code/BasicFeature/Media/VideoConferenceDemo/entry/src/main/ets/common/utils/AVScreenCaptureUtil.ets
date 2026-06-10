import { fileIo as fs } from '@kit.CoreFileKit';
import { Logger } from './Logger';
import capture from 'libentry.so'
import { startContinuousTask, stopContinuousTask } from './BackgroundUtil';

export function startCapture(context: Context, isMicrophone: boolean) {
    let filePath: string = context.filesDir + '/example.m4a';
    try {
      let audioFile: fs.File = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let fileFd = audioFile?.fd as number;
      capture.startScreenCaptureToFile(fileFd, isMicrophone);
      startContinuousTask(context);
    } catch (error) {
      let err: BusinessError = error as BusinessError;
      Logger.error(`Failed to open file, error code: ${err.code}, message: ${err.message}`);
    }
}

export function stopCapture(context: Context) {
  capture.stopScreenCaptureToFile();
  stopContinuousTask(context);
}

