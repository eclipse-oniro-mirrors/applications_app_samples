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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import hilog from '@ohos.hilog';
const TAG: string = 'StorageSecurity_Test';
function logInfo(message: string): void {
  hilog.info(0xF811, TAG, '%{public}s', message);
}

class StorageConstKit {
  public static readonly GB_MAGNITUDE: number = 1024 * 1024 * 1024;
  public static readonly MB_MAGNITUDE: number = 1024 * 1024;
  public static readonly KB_MAGNITUDE: number = 1024;
  public static readonly GB_SYMBOL: string = 'GB';
  public static readonly MB_SYMBOL: string = 'MB';
  public static readonly KB_SYMBOL: string = 'KB';
}

class SizeParser {
  public static parseSizeToString(sizeData: number): string {
    let result: number = sizeData;
    if (sizeData <= StorageConstKit.MB_MAGNITUDE) {
      result = sizeData / StorageConstKit.KB_MAGNITUDE;
      return result.toFixed(result > 0.1 ? 1 : 0) + ' ' + StorageConstKit.KB_SYMBOL;
    } else if (sizeData <= StorageConstKit.GB_MAGNITUDE) {
      result = sizeData / StorageConstKit.MB_MAGNITUDE;
      return result.toFixed(result > 0.1 ? 1 : 0) + ' ' + StorageConstKit.MB_SYMBOL;
    }
    result = sizeData / StorageConstKit.GB_MAGNITUDE;
    return result.toFixed(result > 0.1 ? 1 : 0) + ' ' + StorageConstKit.GB_SYMBOL;
  }

  public static parseSize(sizeData: number): number {
    return sizeData / StorageConstKit.MB_MAGNITUDE;
  }

  public static calculatePercentage(molecule: number, denominator: number): string {
    return (molecule / denominator * 100).toFixed(1) + '%';
  }
}

class StorageItem {
  public name: string;
  public size: number;
  public color: string;

  constructor(name: string, size: number, color: string) {
    this.name = name;
    this.size = size;
    this.color = color;
  }

  public getSizeText(): string {
    return SizeParser.parseSizeToString(this.size);
  }

  public isValid(): boolean {
    return this.name.length > 0 && this.size >= 0;
  }

  public clone(): StorageItem {
    return new StorageItem(this.name, this.size, this.color);
  }
}

export default function storageSecurityTest(): void {
  describe('StorageSecurity_Test', () => {
    beforeAll(() => {
      logInfo('StorageSecurity_Test beforeAll');
    })
    afterAll(() => {
      logInfo('StorageSecurity_Test afterAll');
    })
    it('StorageSecurity_Test_0001', 0, () => {
      logInfo('StorageSecurity_Test_0001 begin');
      const value: number = 0;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0 KB');
      expect(SizeParser.parseSize(1048576)).assertEqual(1);
      expect(SizeParser.calculatePercentage(1048576, 2097152)).assertEqual('50.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageSecurity_Test_0001 end');
    })
    it('StorageSecurity_Test_0002', 0, () => {
      logInfo('StorageSecurity_Test_0002 begin');
      const value: number = 1;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0 KB');
      expect(SizeParser.parseSize(2097152)).assertEqual(2);
      expect(SizeParser.calculatePercentage(2097152, 3145728)).assertEqual('66.7%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageSecurity_Test_0002 end');
    })
    it('StorageSecurity_Test_0003', 0, () => {
      logInfo('StorageSecurity_Test_0003 begin');
      const value: number = 102;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0 KB');
      expect(SizeParser.parseSize(3145728)).assertEqual(3);
      expect(SizeParser.calculatePercentage(3145728, 4194304)).assertEqual('75.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageSecurity_Test_0003 end');
    })
    it('StorageSecurity_Test_0004', 0, () => {
      logInfo('StorageSecurity_Test_0004 begin');
      const value: number = 103;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0.1 KB');
      expect(SizeParser.parseSize(4194304)).assertEqual(4);
      expect(SizeParser.calculatePercentage(4194304, 5242880)).assertEqual('80.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageSecurity_Test_0004 end');
    })
    it('StorageSecurity_Test_0005', 0, () => {
      logInfo('StorageSecurity_Test_0005 begin');
      const value: number = 1024;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1.0 KB');
      expect(SizeParser.parseSize(5242880)).assertEqual(5);
      expect(SizeParser.calculatePercentage(5242880, 6291456)).assertEqual('83.3%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageSecurity_Test_0005 end');
    })
    it('StorageSecurity_Test_0006', 0, () => {
      logInfo('StorageSecurity_Test_0006 begin');
      const value: number = 1048575;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1024.0 KB');
      expect(SizeParser.parseSize(6291456)).assertEqual(6);
      expect(SizeParser.calculatePercentage(1048576, 7340032)).assertEqual('14.3%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageSecurity_Test_0006 end');
    })
    it('StorageSecurity_Test_0007', 0, () => {
      logInfo('StorageSecurity_Test_0007 begin');
      const value: number = 1048576;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1024.0 KB');
      expect(SizeParser.parseSize(7340032)).assertEqual(7);
      expect(SizeParser.calculatePercentage(2097152, 8388608)).assertEqual('25.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageSecurity_Test_0007 end');
    })
    it('StorageSecurity_Test_0008', 0, () => {
      logInfo('StorageSecurity_Test_0008 begin');
      const value: number = 1048577;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1.0 MB');
      expect(SizeParser.parseSize(8388608)).assertEqual(8);
      expect(SizeParser.calculatePercentage(3145728, 2097152)).assertEqual('150.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageSecurity_Test_0008 end');
    })
    it('StorageSecurity_Test_0009', 0, () => {
      logInfo('StorageSecurity_Test_0009 begin');
      const value: number = 1073741824;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1024.0 MB');
      expect(SizeParser.parseSize(1048576)).assertEqual(1);
      expect(SizeParser.calculatePercentage(4194304, 3145728)).assertEqual('133.3%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageSecurity_Test_0009 end');
    })
    it('StorageSecurity_Test_0010', 0, () => {
      logInfo('StorageSecurity_Test_0010 begin');
      const value: number = 1073741825;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1.0 GB');
      expect(SizeParser.parseSize(2097152)).assertEqual(2);
      expect(SizeParser.calculatePercentage(5242880, 4194304)).assertEqual('125.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageSecurity_Test_0010 end');
    })
    it('StorageSecurity_Test_0011', 0, () => {
      logInfo('StorageSecurity_Test_0011 begin');
      const value: number = 5368709120;
      expect(SizeParser.parseSizeToString(value)).assertEqual('5.0 GB');
      expect(SizeParser.parseSize(3145728)).assertEqual(3);
      expect(SizeParser.calculatePercentage(1048576, 5242880)).assertEqual('20.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageSecurity_Test_0011 end');
    })
    it('StorageSecurity_Test_0012', 0, () => {
      logInfo('StorageSecurity_Test_0012 begin');
      const value: number = 0;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0 KB');
      expect(SizeParser.parseSize(4194304)).assertEqual(4);
      expect(SizeParser.calculatePercentage(2097152, 6291456)).assertEqual('33.3%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageSecurity_Test_0012 end');
    })
    it('StorageSecurity_Test_0013', 0, () => {
      logInfo('StorageSecurity_Test_0013 begin');
      const value: number = 1;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0 KB');
      expect(SizeParser.parseSize(5242880)).assertEqual(5);
      expect(SizeParser.calculatePercentage(3145728, 7340032)).assertEqual('42.9%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageSecurity_Test_0013 end');
    })
    it('StorageSecurity_Test_0014', 0, () => {
      logInfo('StorageSecurity_Test_0014 begin');
      const value: number = 102;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0 KB');
      expect(SizeParser.parseSize(6291456)).assertEqual(6);
      expect(SizeParser.calculatePercentage(4194304, 8388608)).assertEqual('50.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageSecurity_Test_0014 end');
    })
    it('StorageSecurity_Test_0015', 0, () => {
      logInfo('StorageSecurity_Test_0015 begin');
      const value: number = 103;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0.1 KB');
      expect(SizeParser.parseSize(7340032)).assertEqual(7);
      expect(SizeParser.calculatePercentage(5242880, 2097152)).assertEqual('250.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageSecurity_Test_0015 end');
    })
    it('StorageSecurity_Test_0016', 0, () => {
      logInfo('StorageSecurity_Test_0016 begin');
      const value: number = 1024;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1.0 KB');
      expect(SizeParser.parseSize(8388608)).assertEqual(8);
      expect(SizeParser.calculatePercentage(1048576, 3145728)).assertEqual('33.3%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageSecurity_Test_0016 end');
    })
    it('StorageSecurity_Test_0017', 0, () => {
      logInfo('StorageSecurity_Test_0017 begin');
      const value: number = 1048575;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1024.0 KB');
      expect(SizeParser.parseSize(1048576)).assertEqual(1);
      expect(SizeParser.calculatePercentage(2097152, 4194304)).assertEqual('50.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageSecurity_Test_0017 end');
    })
    it('StorageSecurity_Test_0018', 0, () => {
      logInfo('StorageSecurity_Test_0018 begin');
      const value: number = 1048576;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1024.0 KB');
      expect(SizeParser.parseSize(2097152)).assertEqual(2);
      expect(SizeParser.calculatePercentage(3145728, 5242880)).assertEqual('60.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageSecurity_Test_0018 end');
    })
    it('StorageSecurity_Test_0019', 0, () => {
      logInfo('StorageSecurity_Test_0019 begin');
      const value: number = 1048577;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1.0 MB');
      expect(SizeParser.parseSize(3145728)).assertEqual(3);
      expect(SizeParser.calculatePercentage(4194304, 6291456)).assertEqual('66.7%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageSecurity_Test_0019 end');
    })
    it('StorageSecurity_Test_0020', 0, () => {
      logInfo('StorageSecurity_Test_0020 begin');
      const value: number = 1073741824;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1024.0 MB');
      expect(SizeParser.parseSize(4194304)).assertEqual(4);
      expect(SizeParser.calculatePercentage(5242880, 7340032)).assertEqual('71.4%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageSecurity_Test_0020 end');
    })
    it('StorageSecurity_Test_0021', 0, () => {
      logInfo('StorageSecurity_Test_0021 begin');
      const value: number = 1073741825;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1.0 GB');
      expect(SizeParser.parseSize(5242880)).assertEqual(5);
      expect(SizeParser.calculatePercentage(1048576, 8388608)).assertEqual('12.5%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageSecurity_Test_0021 end');
    })
    it('StorageSecurity_Test_0022', 0, () => {
      logInfo('StorageSecurity_Test_0022 begin');
      const value: number = 5368709120;
      expect(SizeParser.parseSizeToString(value)).assertEqual('5.0 GB');
      expect(SizeParser.parseSize(6291456)).assertEqual(6);
      expect(SizeParser.calculatePercentage(2097152, 2097152)).assertEqual('100.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageSecurity_Test_0022 end');
    })
    it('StorageSecurity_Test_0023', 0, () => {
      logInfo('StorageSecurity_Test_0023 begin');
      const value: number = 0;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0 KB');
      expect(SizeParser.parseSize(7340032)).assertEqual(7);
      expect(SizeParser.calculatePercentage(3145728, 3145728)).assertEqual('100.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageSecurity_Test_0023 end');
    })
    it('StorageSecurity_Test_0024', 0, () => {
      logInfo('StorageSecurity_Test_0024 begin');
      const value: number = 1;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0 KB');
      expect(SizeParser.parseSize(8388608)).assertEqual(8);
      expect(SizeParser.calculatePercentage(4194304, 4194304)).assertEqual('100.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageSecurity_Test_0024 end');
    })
    it('StorageSecurity_Test_0025', 0, () => {
      logInfo('StorageSecurity_Test_0025 begin');
      const value: number = 102;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0 KB');
      expect(SizeParser.parseSize(1048576)).assertEqual(1);
      expect(SizeParser.calculatePercentage(5242880, 5242880)).assertEqual('100.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageSecurity_Test_0025 end');
    })
    it('StorageSecurity_Test_0026', 0, () => {
      logInfo('StorageSecurity_Test_0026 begin');
      const value: number = 103;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0.1 KB');
      expect(SizeParser.parseSize(2097152)).assertEqual(2);
      expect(SizeParser.calculatePercentage(1048576, 6291456)).assertEqual('16.7%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageSecurity_Test_0026 end');
    })
    it('StorageSecurity_Test_0027', 0, () => {
      logInfo('StorageSecurity_Test_0027 begin');
      const value: number = 1024;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1.0 KB');
      expect(SizeParser.parseSize(3145728)).assertEqual(3);
      expect(SizeParser.calculatePercentage(2097152, 7340032)).assertEqual('28.6%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageSecurity_Test_0027 end');
    })
    it('StorageSecurity_Test_0028', 0, () => {
      logInfo('StorageSecurity_Test_0028 begin');
      const value: number = 1048575;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1024.0 KB');
      expect(SizeParser.parseSize(4194304)).assertEqual(4);
      expect(SizeParser.calculatePercentage(3145728, 8388608)).assertEqual('37.5%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageSecurity_Test_0028 end');
    })
    it('StorageSecurity_Test_0029', 0, () => {
      logInfo('StorageSecurity_Test_0029 begin');
      const value: number = 1048576;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1024.0 KB');
      expect(SizeParser.parseSize(5242880)).assertEqual(5);
      expect(SizeParser.calculatePercentage(4194304, 2097152)).assertEqual('200.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageSecurity_Test_0029 end');
    })
    it('StorageSecurity_Test_0030', 0, () => {
      logInfo('StorageSecurity_Test_0030 begin');
      const value: number = 1048577;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1.0 MB');
      expect(SizeParser.parseSize(6291456)).assertEqual(6);
      expect(SizeParser.calculatePercentage(5242880, 3145728)).assertEqual('166.7%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageSecurity_Test_0030 end');
    })
    it('StorageSecurity_Test_0031', 0, () => {
      logInfo('StorageSecurity_Test_0031 begin');
      const value: number = 1073741824;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1024.0 MB');
      expect(SizeParser.parseSize(7340032)).assertEqual(7);
      expect(SizeParser.calculatePercentage(1048576, 4194304)).assertEqual('25.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageSecurity_Test_0031 end');
    })
    it('StorageSecurity_Test_0032', 0, () => {
      logInfo('StorageSecurity_Test_0032 begin');
      const value: number = 1073741825;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1.0 GB');
      expect(SizeParser.parseSize(8388608)).assertEqual(8);
      expect(SizeParser.calculatePercentage(2097152, 5242880)).assertEqual('40.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageSecurity_Test_0032 end');
    })
    it('StorageSecurity_Test_0033', 0, () => {
      logInfo('StorageSecurity_Test_0033 begin');
      const value: number = 5368709120;
      expect(SizeParser.parseSizeToString(value)).assertEqual('5.0 GB');
      expect(SizeParser.parseSize(1048576)).assertEqual(1);
      expect(SizeParser.calculatePercentage(3145728, 6291456)).assertEqual('50.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageSecurity_Test_0033 end');
    })
      expect(StorageConstKit.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConstKit.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.GB_MAGNITUDE / StorageConstKit.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_MAGNITUDE / StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_SYMBOL).assertEqual('MB');
      expect(StorageConstKit.GB_SYMBOL).assertEqual('GB');
      expect(StorageConstKit.KB_SYMBOL).assertEqual('KB');
      expect(StorageConstKit.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConstKit.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.GB_MAGNITUDE / StorageConstKit.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_MAGNITUDE / StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_SYMBOL).assertEqual('MB');
      expect(StorageConstKit.GB_SYMBOL).assertEqual('GB');
      expect(StorageConstKit.KB_SYMBOL).assertEqual('KB');
      expect(StorageConstKit.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConstKit.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.GB_MAGNITUDE / StorageConstKit.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_MAGNITUDE / StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_SYMBOL).assertEqual('MB');
      expect(StorageConstKit.GB_SYMBOL).assertEqual('GB');
      expect(StorageConstKit.KB_SYMBOL).assertEqual('KB');
      expect(StorageConstKit.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConstKit.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.GB_MAGNITUDE / StorageConstKit.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_MAGNITUDE / StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_SYMBOL).assertEqual('MB');
      expect(StorageConstKit.GB_SYMBOL).assertEqual('GB');
      expect(StorageConstKit.KB_SYMBOL).assertEqual('KB');
      expect(StorageConstKit.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConstKit.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.GB_MAGNITUDE / StorageConstKit.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_MAGNITUDE / StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_SYMBOL).assertEqual('MB');
      expect(StorageConstKit.GB_SYMBOL).assertEqual('GB');
      expect(StorageConstKit.KB_SYMBOL).assertEqual('KB');
      expect(StorageConstKit.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConstKit.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.GB_MAGNITUDE / StorageConstKit.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_MAGNITUDE / StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_SYMBOL).assertEqual('MB');
      expect(StorageConstKit.GB_SYMBOL).assertEqual('GB');
      expect(StorageConstKit.KB_SYMBOL).assertEqual('KB');
      expect(StorageConstKit.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConstKit.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.GB_MAGNITUDE / StorageConstKit.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_MAGNITUDE / StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_SYMBOL).assertEqual('MB');
      expect(StorageConstKit.GB_SYMBOL).assertEqual('GB');
      expect(StorageConstKit.KB_SYMBOL).assertEqual('KB');
      expect(StorageConstKit.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConstKit.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.GB_MAGNITUDE / StorageConstKit.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_MAGNITUDE / StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_SYMBOL).assertEqual('MB');
      expect(StorageConstKit.GB_SYMBOL).assertEqual('GB');
      expect(StorageConstKit.KB_SYMBOL).assertEqual('KB');
      expect(StorageConstKit.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConstKit.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.GB_MAGNITUDE / StorageConstKit.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_MAGNITUDE / StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_SYMBOL).assertEqual('MB');
      expect(StorageConstKit.GB_SYMBOL).assertEqual('GB');
      expect(StorageConstKit.KB_SYMBOL).assertEqual('KB');
      expect(StorageConstKit.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConstKit.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.GB_MAGNITUDE / StorageConstKit.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_MAGNITUDE / StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_SYMBOL).assertEqual('MB');
      expect(StorageConstKit.GB_SYMBOL).assertEqual('GB');
      expect(StorageConstKit.KB_SYMBOL).assertEqual('KB');
      expect(StorageConstKit.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConstKit.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.GB_MAGNITUDE / StorageConstKit.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_MAGNITUDE / StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_SYMBOL).assertEqual('MB');
      expect(StorageConstKit.GB_SYMBOL).assertEqual('GB');
      expect(StorageConstKit.KB_SYMBOL).assertEqual('KB');
      expect(StorageConstKit.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConstKit.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.GB_MAGNITUDE / StorageConstKit.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_MAGNITUDE / StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_SYMBOL).assertEqual('MB');
      expect(StorageConstKit.GB_SYMBOL).assertEqual('GB');
      expect(StorageConstKit.KB_SYMBOL).assertEqual('KB');
      expect(StorageConstKit.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConstKit.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.GB_MAGNITUDE / StorageConstKit.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_MAGNITUDE / StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_SYMBOL).assertEqual('MB');
      expect(StorageConstKit.GB_SYMBOL).assertEqual('GB');
      expect(StorageConstKit.KB_SYMBOL).assertEqual('KB');
      expect(StorageConstKit.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConstKit.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.GB_MAGNITUDE / StorageConstKit.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_MAGNITUDE / StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_SYMBOL).assertEqual('MB');
      expect(StorageConstKit.GB_SYMBOL).assertEqual('GB');
      expect(StorageConstKit.KB_SYMBOL).assertEqual('KB');
      expect(StorageConstKit.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConstKit.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.GB_MAGNITUDE / StorageConstKit.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_MAGNITUDE / StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_SYMBOL).assertEqual('MB');
      expect(StorageConstKit.GB_SYMBOL).assertEqual('GB');
      expect(StorageConstKit.KB_SYMBOL).assertEqual('KB');
      expect(StorageConstKit.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConstKit.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.GB_MAGNITUDE / StorageConstKit.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_MAGNITUDE / StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_SYMBOL).assertEqual('MB');
      expect(StorageConstKit.GB_SYMBOL).assertEqual('GB');
      expect(StorageConstKit.KB_SYMBOL).assertEqual('KB');
      expect(StorageConstKit.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConstKit.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.GB_MAGNITUDE / StorageConstKit.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_MAGNITUDE / StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_SYMBOL).assertEqual('MB');
      expect(StorageConstKit.GB_SYMBOL).assertEqual('GB');
      expect(StorageConstKit.KB_SYMBOL).assertEqual('KB');
      expect(StorageConstKit.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConstKit.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.GB_MAGNITUDE / StorageConstKit.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_MAGNITUDE / StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_SYMBOL).assertEqual('MB');
      expect(StorageConstKit.GB_SYMBOL).assertEqual('GB');
      expect(StorageConstKit.KB_SYMBOL).assertEqual('KB');
      expect(StorageConstKit.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConstKit.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.GB_MAGNITUDE / StorageConstKit.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_MAGNITUDE / StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_SYMBOL).assertEqual('MB');
      expect(StorageConstKit.GB_SYMBOL).assertEqual('GB');
      expect(StorageConstKit.KB_SYMBOL).assertEqual('KB');
      expect(StorageConstKit.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConstKit.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.GB_MAGNITUDE / StorageConstKit.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_MAGNITUDE / StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_SYMBOL).assertEqual('MB');
      expect(StorageConstKit.GB_SYMBOL).assertEqual('GB');
      expect(StorageConstKit.KB_SYMBOL).assertEqual('KB');
      expect(StorageConstKit.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConstKit.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.GB_MAGNITUDE / StorageConstKit.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_MAGNITUDE / StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_SYMBOL).assertEqual('MB');
      expect(StorageConstKit.GB_SYMBOL).assertEqual('GB');
      expect(StorageConstKit.KB_SYMBOL).assertEqual('KB');
      expect(StorageConstKit.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConstKit.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.GB_MAGNITUDE / StorageConstKit.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_MAGNITUDE / StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_SYMBOL).assertEqual('MB');
      expect(StorageConstKit.GB_SYMBOL).assertEqual('GB');
      expect(StorageConstKit.KB_SYMBOL).assertEqual('KB');
      expect(StorageConstKit.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConstKit.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.GB_MAGNITUDE / StorageConstKit.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_MAGNITUDE / StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_SYMBOL).assertEqual('MB');
      expect(StorageConstKit.GB_SYMBOL).assertEqual('GB');
      expect(StorageConstKit.KB_SYMBOL).assertEqual('KB');
      expect(StorageConstKit.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConstKit.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.GB_MAGNITUDE / StorageConstKit.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_MAGNITUDE / StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_SYMBOL).assertEqual('MB');
      expect(StorageConstKit.GB_SYMBOL).assertEqual('GB');
      expect(StorageConstKit.KB_SYMBOL).assertEqual('KB');
      expect(StorageConstKit.GB_MAGNITUDE).assertEqual(1073741824);
      expect(StorageConstKit.MB_MAGNITUDE).assertEqual(1048576);
      expect(StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.GB_MAGNITUDE / StorageConstKit.MB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_MAGNITUDE / StorageConstKit.KB_MAGNITUDE).assertEqual(1024);
      expect(StorageConstKit.MB_SYMBOL).assertEqual('MB');
      expect(StorageConstKit.GB_SYMBOL).assertEqual('GB');
  })
}
