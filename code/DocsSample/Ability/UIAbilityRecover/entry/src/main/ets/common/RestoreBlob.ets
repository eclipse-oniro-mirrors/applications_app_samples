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

// [Start blob_ref]
import { common } from '@kit.AbilityKit';
import { fileIo as fs } from '@kit.CoreFileKit';

const FILE_PREFIX = 'restore_blob_';
const EXPIRE_MS = 7 * 24 * 60 * 60 * 1000; // 与系统备份数据 7 天过期对齐

/** 落盘引用：只包含文件名、版本与字节数，本身必须很小（小于 1KB），实际数据在沙箱文件中。 */
export class BlobRef {
  public file: string = '';
  public ver: number = 1;
  public size: number = 0;
}
// [End blob_ref]

/**
 * 超限数据落盘引用（方案 D）。
 * Want.parameters 存在传输大小限制，超限数据（如未提交的长草稿）将本体写入应用沙箱文件，
 * want.parameters 中只保存引用，恢复启动时按引用读回；引用失效时降级为正常加载，不白屏。
 */
export class RestoreBlob {
  // [Start blob_save]
  /** 保存超限数据：同步写入沙箱文件，返回轻量引用（进 want.parameters）。 */
  static save(context: common.Context, key: string, data: string): BlobRef {
    const fileName = FILE_PREFIX + key + '.json';
    const file = context.filesDir + '/' + fileName;
    const f = fs.openSync(file, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
    try {
      fs.writeSync(f.fd, data);
    } finally {
      fs.closeSync(f);
    }
    const ref = new BlobRef();
    ref.file = fileName;
    ref.ver = 1;
    ref.size = data.length;
    return ref;
  }
  // [End blob_save]

  // [Start blob_load]
  /** 按引用读回数据；引用失效（文件不存在/读取失败）时返回 null，由调用方降级处理。 */
  static load(context: common.Context, ref: BlobRef): string | null {
    try {
      const file = context.filesDir + '/' + ref.file;
      if (!fs.accessSync(file)) {
        return null;
      }
      // 直接读文本，避免 UTF-8 字节数与字符串长度不一致导致的截断
      return fs.readTextSync(file);
    } catch (e) {
      return null;
    }
  }
  // [End blob_load]

  // [Start blob_cleanup]
  /** 非恢复启动时清理过期引用文件，防止残留堆积（设备重启/正常退出不触发恢复，引用会残留）。 */
  static cleanup(context: common.Context): void {
    try {
      const names = fs.listFileSync(context.filesDir);
      const now = Date.now();
      for (let i = 0; i < names.length; i++) {
        const name = names[i];
        if (name.startsWith(FILE_PREFIX)) {
          const file = context.filesDir + '/' + name;
          const stat = fs.statSync(file);
          if (now - stat.mtime * 1000 > EXPIRE_MS) {
            fs.unlinkSync(file);
          }
        }
      }
    } catch (e) {
      // 清理失败不影响启动
    }
  }
  // [End blob_cleanup]
}
