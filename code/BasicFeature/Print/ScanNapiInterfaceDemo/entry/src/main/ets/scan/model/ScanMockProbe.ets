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
import { scan } from '@kit.BasicServicesKit';
import { ScanMockSource } from './ScanMockSource';

/**
 * ScanMockSource 的状态快照工具。
 * 快照串格式：count=n;first=a;last=b;tcp=n;usb=n;full=0|1;empty=0|1
 */
export class ScanMockProbe {
  private static readonly OP_NONE: string = 'none';
  private static readonly OP_ADD: string = 'add';
  private static readonly OP_REMOVE: string = 'remove';
  private static readonly OP_RENAME: string = 'rename';
  private static readonly OP_REPLACE: string = 'replace';
  private static readonly OP_REPLACE_DUP: string = 'replaceDup';
  private static readonly OP_COPY: string = 'copy';
  private static readonly OP_RESET: string = 'reset';

  static device(scannerId: string, usb: boolean): scan.ScannerDevice {
    const mode: scan.ScannerDiscoveryMode =
      usb ? scan.ScannerDiscoveryMode.USB_STR : scan.ScannerDiscoveryMode.TCP_STR;
    return ScanMockSource.createDevice(scannerId, `uid_${scannerId}`, 'Acme', 'M100',
      `name_${scannerId}`, mode);
  }

  static incoming(total: number, usb: boolean): scan.ScannerDevice[] {
    const list: scan.ScannerDevice[] = [];
    for (let index = 0; index < total; index++) {
      list.push(ScanMockProbe.device(`R${index}`, usb));
    }
    return list;
  }

  /** 预置 seed 台设备：id 为 S0..Sn-1，奇数序为 USB，偶数序为 TCP。 */
  static seeded(seed: number): ScanMockSource {
    const source: ScanMockSource = new ScanMockSource();
    for (let index = 0; index < seed; index++) {
      source.add(ScanMockProbe.device(`S${index}`, index % 2 === 1));
    }
    return source;
  }

  static run(seed: number, op: string, arg: string, usbFlag: number): string {
    const usb: boolean = usbFlag === 1;
    const source: ScanMockSource = ScanMockProbe.seeded(seed);
    if (op === ScanMockProbe.OP_ADD) {
      source.add(ScanMockProbe.device(arg, usb));
    } else if (op === ScanMockProbe.OP_REMOVE) {
      source.remove(arg);
    } else if (op === ScanMockProbe.OP_RENAME) {
      source.rename(arg, `renamed_${arg}`);
    } else if (op === ScanMockProbe.OP_REPLACE) {
      source.replace(ScanMockProbe.incoming(Number.parseInt(arg, 10), usb));
    } else if (op === ScanMockProbe.OP_REPLACE_DUP) {
      const total: number = Number.parseInt(arg, 10);
      const repeated: scan.ScannerDevice[] = [];
      for (let index = 0; index < total; index++) {
        repeated.push(ScanMockProbe.device(`R${index % 3}`, usb));
      }
      source.replace(repeated);
    } else if (op === ScanMockProbe.OP_COPY) {
      const copy: scan.ScannerDevice[] = source.getAll();
      copy.push(ScanMockProbe.device('EXTRA', usb));
      source.add(ScanMockProbe.device('EXTRA', usb));
    } else if (op === ScanMockProbe.OP_RESET) {
      source.reset();
    }
    return ScanMockProbe.snapshot(source);
  }

  static snapshot(source: ScanMockSource): string {
    const devices: scan.ScannerDevice[] = source.getAll();
    const head: scan.ScannerDevice | undefined = source.first();
    const firstId: string = head === undefined ? '-' : head.scannerId;
    const lastId: string = devices.length === 0 ? '-' : devices[devices.length - 1].scannerId;
    const tcp: number = source.countByMode(scan.ScannerDiscoveryMode.TCP_STR);
    const usb: number = source.countByMode(scan.ScannerDiscoveryMode.USB_STR);
    const full: number = source.isFull() ? 1 : 0;
    const empty: number = source.isEmpty() ? 1 : 0;
    return `count=${source.count()};first=${firstId};last=${lastId};` +
      `tcp=${tcp};usb=${usb};full=${full};empty=${empty}`;
  }

  static field(snapshot: string, name: string): string {
    const parts: string[] = snapshot.split(';');
    const prefix: string = `${name}=`;
    for (let index = 0; index < parts.length; index++) {
      if (parts[index].startsWith(prefix)) {
        return parts[index].substring(prefix.length);
      }
    }
    return '';
  }

  static countOf(snapshot: string): number {
    return Number.parseInt(ScanMockProbe.field(snapshot, 'count'), 10);
  }

  static firstOf(snapshot: string): string {
    return ScanMockProbe.field(snapshot, 'first');
  }

  static lastOf(snapshot: string): string {
    return ScanMockProbe.field(snapshot, 'last');
  }

  static flagOf(snapshot: string, name: string): number {
    return Number.parseInt(ScanMockProbe.field(snapshot, name), 10);
  }
}
