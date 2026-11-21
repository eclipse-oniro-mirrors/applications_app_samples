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
const TAG: string = 'StorageListPageTest';
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

export default function storageListPageTest(): void {
  describe('StorageListPageTest', () => {
    beforeAll(() => {
      logInfo('StorageListPageTest beforeAll');
    })
    afterAll(() => {
      logInfo('StorageListPageTest afterAll');
    })
    it('StorageListPageTest_0001', 0, () => {
      logInfo('StorageListPageTest_0001 begin');
      const value: number = 0;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0 KB');
      expect(SizeParser.parseSize(1048576)).assertEqual(1);
      expect(SizeParser.calculatePercentage(1048576, 2097152)).assertEqual('50.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0001 end');
    })
    it('StorageListPageTest_0002', 0, () => {
      logInfo('StorageListPageTest_0002 begin');
      const value: number = 1;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0 KB');
      expect(SizeParser.parseSize(2097152)).assertEqual(2);
      expect(SizeParser.calculatePercentage(2097152, 3145728)).assertEqual('66.7%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0002 end');
    })
    it('StorageListPageTest_0003', 0, () => {
      logInfo('StorageListPageTest_0003 begin');
      const value: number = 102;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0 KB');
      expect(SizeParser.parseSize(3145728)).assertEqual(3);
      expect(SizeParser.calculatePercentage(3145728, 4194304)).assertEqual('75.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0003 end');
    })
    it('StorageListPageTest_0004', 0, () => {
      logInfo('StorageListPageTest_0004 begin');
      const value: number = 103;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0.1 KB');
      expect(SizeParser.parseSize(4194304)).assertEqual(4);
      expect(SizeParser.calculatePercentage(4194304, 5242880)).assertEqual('80.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0004 end');
    })
    it('StorageListPageTest_0005', 0, () => {
      logInfo('StorageListPageTest_0005 begin');
      const value: number = 1024;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1.0 KB');
      expect(SizeParser.parseSize(5242880)).assertEqual(5);
      expect(SizeParser.calculatePercentage(5242880, 6291456)).assertEqual('83.3%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0005 end');
    })
    it('StorageListPageTest_0006', 0, () => {
      logInfo('StorageListPageTest_0006 begin');
      const value: number = 1048575;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1024.0 KB');
      expect(SizeParser.parseSize(6291456)).assertEqual(6);
      expect(SizeParser.calculatePercentage(1048576, 7340032)).assertEqual('14.3%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0006 end');
    })
    it('StorageListPageTest_0007', 0, () => {
      logInfo('StorageListPageTest_0007 begin');
      const value: number = 1048576;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1024.0 KB');
      expect(SizeParser.parseSize(7340032)).assertEqual(7);
      expect(SizeParser.calculatePercentage(2097152, 8388608)).assertEqual('25.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0007 end');
    })
    it('StorageListPageTest_0008', 0, () => {
      logInfo('StorageListPageTest_0008 begin');
      const value: number = 1048577;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1.0 MB');
      expect(SizeParser.parseSize(8388608)).assertEqual(8);
      expect(SizeParser.calculatePercentage(3145728, 2097152)).assertEqual('150.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0008 end');
    })
    it('StorageListPageTest_0009', 0, () => {
      logInfo('StorageListPageTest_0009 begin');
      const value: number = 1073741824;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1024.0 MB');
      expect(SizeParser.parseSize(1048576)).assertEqual(1);
      expect(SizeParser.calculatePercentage(4194304, 3145728)).assertEqual('133.3%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0009 end');
    })
    it('StorageListPageTest_0010', 0, () => {
      logInfo('StorageListPageTest_0010 begin');
      const value: number = 1073741825;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1.0 GB');
      expect(SizeParser.parseSize(2097152)).assertEqual(2);
      expect(SizeParser.calculatePercentage(5242880, 4194304)).assertEqual('125.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0010 end');
    })
    it('StorageListPageTest_0011', 0, () => {
      logInfo('StorageListPageTest_0011 begin');
      const value: number = 5368709120;
      expect(SizeParser.parseSizeToString(value)).assertEqual('5.0 GB');
      expect(SizeParser.parseSize(3145728)).assertEqual(3);
      expect(SizeParser.calculatePercentage(1048576, 5242880)).assertEqual('20.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0011 end');
    })
    it('StorageListPageTest_0012', 0, () => {
      logInfo('StorageListPageTest_0012 begin');
      const value: number = 0;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0 KB');
      expect(SizeParser.parseSize(4194304)).assertEqual(4);
      expect(SizeParser.calculatePercentage(2097152, 6291456)).assertEqual('33.3%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0012 end');
    })
    it('StorageListPageTest_0013', 0, () => {
      logInfo('StorageListPageTest_0013 begin');
      const value: number = 1;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0 KB');
      expect(SizeParser.parseSize(5242880)).assertEqual(5);
      expect(SizeParser.calculatePercentage(3145728, 7340032)).assertEqual('42.9%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0013 end');
    })
    it('StorageListPageTest_0014', 0, () => {
      logInfo('StorageListPageTest_0014 begin');
      const value: number = 102;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0 KB');
      expect(SizeParser.parseSize(6291456)).assertEqual(6);
      expect(SizeParser.calculatePercentage(4194304, 8388608)).assertEqual('50.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0014 end');
    })
    it('StorageListPageTest_0015', 0, () => {
      logInfo('StorageListPageTest_0015 begin');
      const value: number = 103;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0.1 KB');
      expect(SizeParser.parseSize(7340032)).assertEqual(7);
      expect(SizeParser.calculatePercentage(5242880, 2097152)).assertEqual('250.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0015 end');
    })
    it('StorageListPageTest_0016', 0, () => {
      logInfo('StorageListPageTest_0016 begin');
      const value: number = 1024;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1.0 KB');
      expect(SizeParser.parseSize(8388608)).assertEqual(8);
      expect(SizeParser.calculatePercentage(1048576, 3145728)).assertEqual('33.3%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0016 end');
    })
    it('StorageListPageTest_0017', 0, () => {
      logInfo('StorageListPageTest_0017 begin');
      const value: number = 1048575;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1024.0 KB');
      expect(SizeParser.parseSize(1048576)).assertEqual(1);
      expect(SizeParser.calculatePercentage(2097152, 4194304)).assertEqual('50.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0017 end');
    })
    it('StorageListPageTest_0018', 0, () => {
      logInfo('StorageListPageTest_0018 begin');
      const value: number = 1048576;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1024.0 KB');
      expect(SizeParser.parseSize(2097152)).assertEqual(2);
      expect(SizeParser.calculatePercentage(3145728, 5242880)).assertEqual('60.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0018 end');
    })
    it('StorageListPageTest_0019', 0, () => {
      logInfo('StorageListPageTest_0019 begin');
      const value: number = 1048577;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1.0 MB');
      expect(SizeParser.parseSize(3145728)).assertEqual(3);
      expect(SizeParser.calculatePercentage(4194304, 6291456)).assertEqual('66.7%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0019 end');
    })
    it('StorageListPageTest_0020', 0, () => {
      logInfo('StorageListPageTest_0020 begin');
      const value: number = 1073741824;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1024.0 MB');
      expect(SizeParser.parseSize(4194304)).assertEqual(4);
      expect(SizeParser.calculatePercentage(5242880, 7340032)).assertEqual('71.4%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0020 end');
    })
    it('StorageListPageTest_0021', 0, () => {
      logInfo('StorageListPageTest_0021 begin');
      const value: number = 1073741825;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1.0 GB');
      expect(SizeParser.parseSize(5242880)).assertEqual(5);
      expect(SizeParser.calculatePercentage(1048576, 8388608)).assertEqual('12.5%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0021 end');
    })
    it('StorageListPageTest_0022', 0, () => {
      logInfo('StorageListPageTest_0022 begin');
      const value: number = 5368709120;
      expect(SizeParser.parseSizeToString(value)).assertEqual('5.0 GB');
      expect(SizeParser.parseSize(6291456)).assertEqual(6);
      expect(SizeParser.calculatePercentage(2097152, 2097152)).assertEqual('100.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0022 end');
    })
    it('StorageListPageTest_0023', 0, () => {
      logInfo('StorageListPageTest_0023 begin');
      const value: number = 0;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0 KB');
      expect(SizeParser.parseSize(7340032)).assertEqual(7);
      expect(SizeParser.calculatePercentage(3145728, 3145728)).assertEqual('100.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0023 end');
    })
    it('StorageListPageTest_0024', 0, () => {
      logInfo('StorageListPageTest_0024 begin');
      const value: number = 1;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0 KB');
      expect(SizeParser.parseSize(8388608)).assertEqual(8);
      expect(SizeParser.calculatePercentage(4194304, 4194304)).assertEqual('100.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0024 end');
    })
    it('StorageListPageTest_0025', 0, () => {
      logInfo('StorageListPageTest_0025 begin');
      const value: number = 102;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0 KB');
      expect(SizeParser.parseSize(1048576)).assertEqual(1);
      expect(SizeParser.calculatePercentage(5242880, 5242880)).assertEqual('100.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0025 end');
    })
    it('StorageListPageTest_0026', 0, () => {
      logInfo('StorageListPageTest_0026 begin');
      const value: number = 103;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0.1 KB');
      expect(SizeParser.parseSize(2097152)).assertEqual(2);
      expect(SizeParser.calculatePercentage(1048576, 6291456)).assertEqual('16.7%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0026 end');
    })
    it('StorageListPageTest_0027', 0, () => {
      logInfo('StorageListPageTest_0027 begin');
      const value: number = 1024;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1.0 KB');
      expect(SizeParser.parseSize(3145728)).assertEqual(3);
      expect(SizeParser.calculatePercentage(2097152, 7340032)).assertEqual('28.6%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0027 end');
    })
    it('StorageListPageTest_0028', 0, () => {
      logInfo('StorageListPageTest_0028 begin');
      const value: number = 1048575;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1024.0 KB');
      expect(SizeParser.parseSize(4194304)).assertEqual(4);
      expect(SizeParser.calculatePercentage(3145728, 8388608)).assertEqual('37.5%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0028 end');
    })
    it('StorageListPageTest_0029', 0, () => {
      logInfo('StorageListPageTest_0029 begin');
      const value: number = 1048576;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1024.0 KB');
      expect(SizeParser.parseSize(5242880)).assertEqual(5);
      expect(SizeParser.calculatePercentage(4194304, 2097152)).assertEqual('200.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0029 end');
    })
    it('StorageListPageTest_0030', 0, () => {
      logInfo('StorageListPageTest_0030 begin');
      const value: number = 1048577;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1.0 MB');
      expect(SizeParser.parseSize(6291456)).assertEqual(6);
      expect(SizeParser.calculatePercentage(5242880, 3145728)).assertEqual('166.7%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0030 end');
    })
    it('StorageListPageTest_0031', 0, () => {
      logInfo('StorageListPageTest_0031 begin');
      const value: number = 1073741824;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1024.0 MB');
      expect(SizeParser.parseSize(7340032)).assertEqual(7);
      expect(SizeParser.calculatePercentage(1048576, 4194304)).assertEqual('25.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0031 end');
    })
    it('StorageListPageTest_0032', 0, () => {
      logInfo('StorageListPageTest_0032 begin');
      const value: number = 1073741825;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1.0 GB');
      expect(SizeParser.parseSize(8388608)).assertEqual(8);
      expect(SizeParser.calculatePercentage(2097152, 5242880)).assertEqual('40.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0032 end');
    })
    it('StorageListPageTest_0033', 0, () => {
      logInfo('StorageListPageTest_0033 begin');
      const value: number = 5368709120;
      expect(SizeParser.parseSizeToString(value)).assertEqual('5.0 GB');
      expect(SizeParser.parseSize(1048576)).assertEqual(1);
      expect(SizeParser.calculatePercentage(3145728, 6291456)).assertEqual('50.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0033 end');
    })
    it('StorageListPageTest_0034', 0, () => {
      logInfo('StorageListPageTest_0034 begin');
      const value: number = 0;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0 KB');
      expect(SizeParser.parseSize(2097152)).assertEqual(2);
      expect(SizeParser.calculatePercentage(4194304, 7340032)).assertEqual('57.1%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0034 end');
    })
    it('StorageListPageTest_0035', 0, () => {
      logInfo('StorageListPageTest_0035 begin');
      const value: number = 1;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0 KB');
      expect(SizeParser.parseSize(3145728)).assertEqual(3);
      expect(SizeParser.calculatePercentage(5242880, 8388608)).assertEqual('62.5%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0035 end');
    })
    it('StorageListPageTest_0036', 0, () => {
      logInfo('StorageListPageTest_0036 begin');
      const value: number = 102;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0 KB');
      expect(SizeParser.parseSize(4194304)).assertEqual(4);
      expect(SizeParser.calculatePercentage(1048576, 2097152)).assertEqual('50.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0036 end');
    })
    it('StorageListPageTest_0037', 0, () => {
      logInfo('StorageListPageTest_0037 begin');
      const value: number = 103;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0.1 KB');
      expect(SizeParser.parseSize(5242880)).assertEqual(5);
      expect(SizeParser.calculatePercentage(2097152, 3145728)).assertEqual('66.7%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0037 end');
    })
    it('StorageListPageTest_0038', 0, () => {
      logInfo('StorageListPageTest_0038 begin');
      const value: number = 1024;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1.0 KB');
      expect(SizeParser.parseSize(6291456)).assertEqual(6);
      expect(SizeParser.calculatePercentage(3145728, 4194304)).assertEqual('75.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0038 end');
    })
    it('StorageListPageTest_0039', 0, () => {
      logInfo('StorageListPageTest_0039 begin');
      const value: number = 1048575;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1024.0 KB');
      expect(SizeParser.parseSize(7340032)).assertEqual(7);
      expect(SizeParser.calculatePercentage(4194304, 5242880)).assertEqual('80.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0039 end');
    })
    it('StorageListPageTest_0040', 0, () => {
      logInfo('StorageListPageTest_0040 begin');
      const value: number = 1048576;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1024.0 KB');
      expect(SizeParser.parseSize(8388608)).assertEqual(8);
      expect(SizeParser.calculatePercentage(5242880, 6291456)).assertEqual('83.3%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0040 end');
    })
    it('StorageListPageTest_0041', 0, () => {
      logInfo('StorageListPageTest_0041 begin');
      const value: number = 1048577;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1.0 MB');
      expect(SizeParser.parseSize(1048576)).assertEqual(1);
      expect(SizeParser.calculatePercentage(1048576, 7340032)).assertEqual('14.3%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0041 end');
    })
    it('StorageListPageTest_0042', 0, () => {
      logInfo('StorageListPageTest_0042 begin');
      const value: number = 1073741824;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1024.0 MB');
      expect(SizeParser.parseSize(2097152)).assertEqual(2);
      expect(SizeParser.calculatePercentage(2097152, 8388608)).assertEqual('25.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0042 end');
    })
    it('StorageListPageTest_0043', 0, () => {
      logInfo('StorageListPageTest_0043 begin');
      const value: number = 1073741825;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1.0 GB');
      expect(SizeParser.parseSize(3145728)).assertEqual(3);
      expect(SizeParser.calculatePercentage(3145728, 2097152)).assertEqual('150.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0043 end');
    })
    it('StorageListPageTest_0044', 0, () => {
      logInfo('StorageListPageTest_0044 begin');
      const value: number = 5368709120;
      expect(SizeParser.parseSizeToString(value)).assertEqual('5.0 GB');
      expect(SizeParser.parseSize(4194304)).assertEqual(4);
      expect(SizeParser.calculatePercentage(4194304, 3145728)).assertEqual('133.3%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0044 end');
    })
    it('StorageListPageTest_0045', 0, () => {
      logInfo('StorageListPageTest_0045 begin');
      const value: number = 0;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0 KB');
      expect(SizeParser.parseSize(5242880)).assertEqual(5);
      expect(SizeParser.calculatePercentage(5242880, 4194304)).assertEqual('125.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0045 end');
    })
    it('StorageListPageTest_0046', 0, () => {
      logInfo('StorageListPageTest_0046 begin');
      const value: number = 1;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0 KB');
      expect(SizeParser.parseSize(6291456)).assertEqual(6);
      expect(SizeParser.calculatePercentage(1048576, 5242880)).assertEqual('20.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0046 end');
    })
    it('StorageListPageTest_0047', 0, () => {
      logInfo('StorageListPageTest_0047 begin');
      const value: number = 102;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0 KB');
      expect(SizeParser.parseSize(7340032)).assertEqual(7);
      expect(SizeParser.calculatePercentage(2097152, 6291456)).assertEqual('33.3%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0047 end');
    })
    it('StorageListPageTest_0048', 0, () => {
      logInfo('StorageListPageTest_0048 begin');
      const value: number = 103;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0.1 KB');
      expect(SizeParser.parseSize(8388608)).assertEqual(8);
      expect(SizeParser.calculatePercentage(3145728, 7340032)).assertEqual('42.9%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0048 end');
    })
    it('StorageListPageTest_0049', 0, () => {
      logInfo('StorageListPageTest_0049 begin');
      const value: number = 1024;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1.0 KB');
      expect(SizeParser.parseSize(1048576)).assertEqual(1);
      expect(SizeParser.calculatePercentage(4194304, 8388608)).assertEqual('50.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0049 end');
    })
    it('StorageListPageTest_0050', 0, () => {
      logInfo('StorageListPageTest_0050 begin');
      const value: number = 1048575;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1024.0 KB');
      expect(SizeParser.parseSize(2097152)).assertEqual(2);
      expect(SizeParser.calculatePercentage(5242880, 2097152)).assertEqual('250.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0050 end');
    })
    it('StorageListPageTest_0051', 0, () => {
      logInfo('StorageListPageTest_0051 begin');
      const value: number = 1048576;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1024.0 KB');
      expect(SizeParser.parseSize(3145728)).assertEqual(3);
      expect(SizeParser.calculatePercentage(1048576, 3145728)).assertEqual('33.3%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0051 end');
    })
    it('StorageListPageTest_0052', 0, () => {
      logInfo('StorageListPageTest_0052 begin');
      const value: number = 1048577;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1.0 MB');
      expect(SizeParser.parseSize(4194304)).assertEqual(4);
      expect(SizeParser.calculatePercentage(2097152, 4194304)).assertEqual('50.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0052 end');
    })
    it('StorageListPageTest_0053', 0, () => {
      logInfo('StorageListPageTest_0053 begin');
      const value: number = 1073741824;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1024.0 MB');
      expect(SizeParser.parseSize(5242880)).assertEqual(5);
      expect(SizeParser.calculatePercentage(3145728, 5242880)).assertEqual('60.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0053 end');
    })
    it('StorageListPageTest_0054', 0, () => {
      logInfo('StorageListPageTest_0054 begin');
      const value: number = 1073741825;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1.0 GB');
      expect(SizeParser.parseSize(6291456)).assertEqual(6);
      expect(SizeParser.calculatePercentage(4194304, 6291456)).assertEqual('66.7%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0054 end');
    })
    it('StorageListPageTest_0055', 0, () => {
      logInfo('StorageListPageTest_0055 begin');
      const value: number = 5368709120;
      expect(SizeParser.parseSizeToString(value)).assertEqual('5.0 GB');
      expect(SizeParser.parseSize(7340032)).assertEqual(7);
      expect(SizeParser.calculatePercentage(5242880, 7340032)).assertEqual('71.4%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0055 end');
    })
    it('StorageListPageTest_0056', 0, () => {
      logInfo('StorageListPageTest_0056 begin');
      const value: number = 0;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0 KB');
      expect(SizeParser.parseSize(8388608)).assertEqual(8);
      expect(SizeParser.calculatePercentage(1048576, 8388608)).assertEqual('12.5%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0056 end');
    })
    it('StorageListPageTest_0057', 0, () => {
      logInfo('StorageListPageTest_0057 begin');
      const value: number = 1;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0 KB');
      expect(SizeParser.parseSize(1048576)).assertEqual(1);
      expect(SizeParser.calculatePercentage(2097152, 2097152)).assertEqual('100.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0057 end');
    })
    it('StorageListPageTest_0058', 0, () => {
      logInfo('StorageListPageTest_0058 begin');
      const value: number = 102;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0 KB');
      expect(SizeParser.parseSize(2097152)).assertEqual(2);
      expect(SizeParser.calculatePercentage(3145728, 3145728)).assertEqual('100.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0058 end');
    })
    it('StorageListPageTest_0059', 0, () => {
      logInfo('StorageListPageTest_0059 begin');
      const value: number = 103;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0.1 KB');
      expect(SizeParser.parseSize(3145728)).assertEqual(3);
      expect(SizeParser.calculatePercentage(4194304, 4194304)).assertEqual('100.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0059 end');
    })
    it('StorageListPageTest_0060', 0, () => {
      logInfo('StorageListPageTest_0060 begin');
      const value: number = 1024;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1.0 KB');
      expect(SizeParser.parseSize(4194304)).assertEqual(4);
      expect(SizeParser.calculatePercentage(5242880, 5242880)).assertEqual('100.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0060 end');
    })
    it('StorageListPageTest_0061', 0, () => {
      logInfo('StorageListPageTest_0061 begin');
      const value: number = 1048575;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1024.0 KB');
      expect(SizeParser.parseSize(5242880)).assertEqual(5);
      expect(SizeParser.calculatePercentage(1048576, 6291456)).assertEqual('16.7%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0061 end');
    })
    it('StorageListPageTest_0062', 0, () => {
      logInfo('StorageListPageTest_0062 begin');
      const value: number = 1048576;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1024.0 KB');
      expect(SizeParser.parseSize(6291456)).assertEqual(6);
      expect(SizeParser.calculatePercentage(2097152, 7340032)).assertEqual('28.6%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0062 end');
    })
    it('StorageListPageTest_0063', 0, () => {
      logInfo('StorageListPageTest_0063 begin');
      const value: number = 1048577;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1.0 MB');
      expect(SizeParser.parseSize(7340032)).assertEqual(7);
      expect(SizeParser.calculatePercentage(3145728, 8388608)).assertEqual('37.5%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0063 end');
    })
    it('StorageListPageTest_0064', 0, () => {
      logInfo('StorageListPageTest_0064 begin');
      const value: number = 1073741824;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1024.0 MB');
      expect(SizeParser.parseSize(8388608)).assertEqual(8);
      expect(SizeParser.calculatePercentage(4194304, 2097152)).assertEqual('200.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0064 end');
    })
    it('StorageListPageTest_0065', 0, () => {
      logInfo('StorageListPageTest_0065 begin');
      const value: number = 1073741825;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1.0 GB');
      expect(SizeParser.parseSize(1048576)).assertEqual(1);
      expect(SizeParser.calculatePercentage(5242880, 3145728)).assertEqual('166.7%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0065 end');
    })
    it('StorageListPageTest_0066', 0, () => {
      logInfo('StorageListPageTest_0066 begin');
      const value: number = 5368709120;
      expect(SizeParser.parseSizeToString(value)).assertEqual('5.0 GB');
      expect(SizeParser.parseSize(2097152)).assertEqual(2);
      expect(SizeParser.calculatePercentage(1048576, 4194304)).assertEqual('25.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0066 end');
    })
    it('StorageListPageTest_0067', 0, () => {
      logInfo('StorageListPageTest_0067 begin');
      const value: number = 0;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0 KB');
      expect(SizeParser.parseSize(3145728)).assertEqual(3);
      expect(SizeParser.calculatePercentage(2097152, 5242880)).assertEqual('40.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0067 end');
    })
    it('StorageListPageTest_0068', 0, () => {
      logInfo('StorageListPageTest_0068 begin');
      const value: number = 1;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0 KB');
      expect(SizeParser.parseSize(4194304)).assertEqual(4);
      expect(SizeParser.calculatePercentage(3145728, 6291456)).assertEqual('50.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0068 end');
    })
    it('StorageListPageTest_0069', 0, () => {
      logInfo('StorageListPageTest_0069 begin');
      const value: number = 102;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0 KB');
      expect(SizeParser.parseSize(5242880)).assertEqual(5);
      expect(SizeParser.calculatePercentage(4194304, 7340032)).assertEqual('57.1%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0069 end');
    })
    it('StorageListPageTest_0070', 0, () => {
      logInfo('StorageListPageTest_0070 begin');
      const value: number = 103;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0.1 KB');
      expect(SizeParser.parseSize(6291456)).assertEqual(6);
      expect(SizeParser.calculatePercentage(5242880, 8388608)).assertEqual('62.5%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0070 end');
    })
    it('StorageListPageTest_0071', 0, () => {
      logInfo('StorageListPageTest_0071 begin');
      const value: number = 1024;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1.0 KB');
      expect(SizeParser.parseSize(7340032)).assertEqual(7);
      expect(SizeParser.calculatePercentage(1048576, 2097152)).assertEqual('50.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0071 end');
    })
    it('StorageListPageTest_0072', 0, () => {
      logInfo('StorageListPageTest_0072 begin');
      const value: number = 1048575;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1024.0 KB');
      expect(SizeParser.parseSize(8388608)).assertEqual(8);
      expect(SizeParser.calculatePercentage(2097152, 3145728)).assertEqual('66.7%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0072 end');
    })
    it('StorageListPageTest_0073', 0, () => {
      logInfo('StorageListPageTest_0073 begin');
      const value: number = 1048576;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1024.0 KB');
      expect(SizeParser.parseSize(1048576)).assertEqual(1);
      expect(SizeParser.calculatePercentage(3145728, 4194304)).assertEqual('75.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0073 end');
    })
    it('StorageListPageTest_0074', 0, () => {
      logInfo('StorageListPageTest_0074 begin');
      const value: number = 1048577;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1.0 MB');
      expect(SizeParser.parseSize(2097152)).assertEqual(2);
      expect(SizeParser.calculatePercentage(4194304, 5242880)).assertEqual('80.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0074 end');
    })
    it('StorageListPageTest_0075', 0, () => {
      logInfo('StorageListPageTest_0075 begin');
      const value: number = 1073741824;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1024.0 MB');
      expect(SizeParser.parseSize(3145728)).assertEqual(3);
      expect(SizeParser.calculatePercentage(5242880, 6291456)).assertEqual('83.3%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0075 end');
    })
    it('StorageListPageTest_0076', 0, () => {
      logInfo('StorageListPageTest_0076 begin');
      const value: number = 1073741825;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1.0 GB');
      expect(SizeParser.parseSize(4194304)).assertEqual(4);
      expect(SizeParser.calculatePercentage(1048576, 7340032)).assertEqual('14.3%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0076 end');
    })
    it('StorageListPageTest_0077', 0, () => {
      logInfo('StorageListPageTest_0077 begin');
      const value: number = 5368709120;
      expect(SizeParser.parseSizeToString(value)).assertEqual('5.0 GB');
      expect(SizeParser.parseSize(5242880)).assertEqual(5);
      expect(SizeParser.calculatePercentage(2097152, 8388608)).assertEqual('25.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0077 end');
    })
    it('StorageListPageTest_0078', 0, () => {
      logInfo('StorageListPageTest_0078 begin');
      const value: number = 0;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0 KB');
      expect(SizeParser.parseSize(6291456)).assertEqual(6);
      expect(SizeParser.calculatePercentage(3145728, 2097152)).assertEqual('150.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0078 end');
    })
    it('StorageListPageTest_0079', 0, () => {
      logInfo('StorageListPageTest_0079 begin');
      const value: number = 1;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0 KB');
      expect(SizeParser.parseSize(7340032)).assertEqual(7);
      expect(SizeParser.calculatePercentage(4194304, 3145728)).assertEqual('133.3%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0079 end');
    })
    it('StorageListPageTest_0080', 0, () => {
      logInfo('StorageListPageTest_0080 begin');
      const value: number = 102;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0 KB');
      expect(SizeParser.parseSize(8388608)).assertEqual(8);
      expect(SizeParser.calculatePercentage(5242880, 4194304)).assertEqual('125.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0080 end');
    })
    it('StorageListPageTest_0081', 0, () => {
      logInfo('StorageListPageTest_0081 begin');
      const value: number = 103;
      expect(SizeParser.parseSizeToString(value)).assertEqual('0.1 KB');
      expect(SizeParser.parseSize(1048576)).assertEqual(1);
      expect(SizeParser.calculatePercentage(1048576, 5242880)).assertEqual('20.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0081 end');
    })
    it('StorageListPageTest_0082', 0, () => {
      logInfo('StorageListPageTest_0082 begin');
      const value: number = 1024;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1.0 KB');
      expect(SizeParser.parseSize(2097152)).assertEqual(2);
      expect(SizeParser.calculatePercentage(2097152, 6291456)).assertEqual('33.3%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0082 end');
    })
    it('StorageListPageTest_0083', 0, () => {
      logInfo('StorageListPageTest_0083 begin');
      const value: number = 1048575;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1024.0 KB');
      expect(SizeParser.parseSize(3145728)).assertEqual(3);
      expect(SizeParser.calculatePercentage(3145728, 7340032)).assertEqual('42.9%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0083 end');
    })
    it('StorageListPageTest_0084', 0, () => {
      logInfo('StorageListPageTest_0084 begin');
      const value: number = 1048576;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1024.0 KB');
      expect(SizeParser.parseSize(4194304)).assertEqual(4);
      expect(SizeParser.calculatePercentage(4194304, 8388608)).assertEqual('50.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0084 end');
    })
    it('StorageListPageTest_0085', 0, () => {
      logInfo('StorageListPageTest_0085 begin');
      const value: number = 1048577;
      expect(SizeParser.parseSizeToString(value)).assertEqual('1.0 MB');
      expect(SizeParser.parseSize(5242880)).assertEqual(5);
      expect(SizeParser.calculatePercentage(5242880, 2097152)).assertEqual('250.0%');
      const item: StorageItem = new StorageItem('Application', value, '#F9A20F');
      expect(item.isValid()).assertTrue();
      expect(item.clone().size).assertEqual(value);
      expect(item.getSizeText().length > 0).assertTrue();
      logInfo('StorageListPageTest_0085 end');
    })
  })
}
