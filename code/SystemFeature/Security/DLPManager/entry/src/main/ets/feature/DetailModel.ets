/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { FileDescriptor, describeFile, kindLabel } from '../core/FileKindCore';
import { formatSize, formatTimestamp } from '../core/FormatCore';

export class DetailRow {
  public readonly label: string;
  public readonly value: string;

  constructor(label: string, value: string) {
    this.label = label;
    this.value = value;
  }
}

export class DetailModel {
  static build(name: string, uri: string, sizeBytes: number, modifiedAtSec: number,
    useUtc: boolean): Array<DetailRow> {
    const rows: Array<DetailRow> = [];
    const descriptor: FileDescriptor = describeFile(name, sizeBytes);
    rows.push(new DetailRow('名称', name));
    rows.push(new DetailRow('类型', kindLabel(descriptor.kind)));
    rows.push(new DetailRow('MIME', descriptor.mimeType));
    rows.push(new DetailRow('大小', sizeBytes < 0 ? '未知' : formatSize(sizeBytes, 1)));
    const timeText: string = modifiedAtSec <= 0 ? '未知' : formatTimestamp(modifiedAtSec, useUtc);
    rows.push(new DetailRow('修改时间', timeText));
    rows.push(new DetailRow('加密文件', descriptor.isDlp ? '是' : '否'));
    if (descriptor.isDlp) {
      rows.push(new DetailRow('容器内文件', descriptor.displayName));
    }
    rows.push(new DetailRow('访问路径', uri.length > 0 ? uri : '未知'));
    return rows;
  }

  static summary(name: string, sizeBytes: number): string {
    const descriptor: FileDescriptor = describeFile(name, sizeBytes);
    return kindLabel(descriptor.kind) + ' · ' + (sizeBytes < 0 ? '大小未知' : formatSize(sizeBytes, 1));
  }
}
