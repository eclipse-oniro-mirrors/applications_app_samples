import { fileIo as fs } from '@kit.CoreFileKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { formatError } from './ErrorUtil';

export class SaveResult {
  success: boolean;
  path: string;
  bytes: number;
  message: string;

  constructor(success: boolean, path: string, bytes: number, message: string) {
    this.success = success;
    this.path = path;
    this.bytes = bytes;
    this.message = message;
  }
}

export function saveTextToSandbox(filesDir: string, fileName: string, content: string): SaveResult {
  if (filesDir.length === 0) {
    return new SaveResult(false, '', 0, 'filesDir 为空，无法写入沙箱');
  }
  const path = `${filesDir}/${fileName}`;
  let file: fs.File | null = null;
  try {
    file = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
    const bytes = fs.writeSync(file.fd, content);
    return new SaveResult(true, path, bytes, '已写入应用沙箱');
  } catch (err) {
    const error = err as BusinessError;
    return new SaveResult(false, path, 0, formatError('沙箱写入', error.code, error.message));
  } finally {
    if (file !== null) {
      try {
        fs.closeSync(file);
      } catch (err) {
        // 关闭失败不影响已写入结果
      }
    }
  }
}
