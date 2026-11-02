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
