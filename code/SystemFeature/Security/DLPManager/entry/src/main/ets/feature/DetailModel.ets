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
import { textOf } from '../core/TextCatalog';

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
    useUtc: boolean): DetailRow[] {
    const rows: DetailRow[] = [];
    const descriptor: FileDescriptor = describeFile(name, sizeBytes);
    rows.push(new DetailRow(textOf('dlp_detail_label_name'), name));
    rows.push(new DetailRow(textOf('dlp_detail_label_kind'), kindLabel(descriptor.kind)));
    rows.push(new DetailRow(textOf('dlp_detail_label_mime'), descriptor.mimeType));
    rows.push(new DetailRow(textOf('dlp_detail_label_size'),
      sizeBytes < 0 ? textOf('dlp_value_unknown') : formatSize(sizeBytes, 1)));
    const timeText: string = modifiedAtSec <= 0 ? textOf('dlp_value_unknown') : formatTimestamp(modifiedAtSec, useUtc);
    rows.push(new DetailRow(textOf('dlp_detail_label_modified'), timeText));
    rows.push(new DetailRow(textOf('dlp_detail_label_encrypted'),
      descriptor.isDlp ? textOf('dlp_value_yes') : textOf('dlp_value_no')));
    if (descriptor.isDlp) {
      rows.push(new DetailRow(textOf('dlp_detail_label_container'), descriptor.displayName));
    }
    rows.push(new DetailRow(textOf('dlp_detail_label_uri'), uri.length > 0 ? uri : textOf('dlp_value_unknown')));
    return rows;
  }

  static summary(name: string, sizeBytes: number): string {
    const descriptor: FileDescriptor = describeFile(name, sizeBytes);
    return kindLabel(descriptor.kind) + ' · ' +
      (sizeBytes < 0 ? textOf('dlp_detail_summary_unknown') : formatSize(sizeBytes, 1));
  }
}
