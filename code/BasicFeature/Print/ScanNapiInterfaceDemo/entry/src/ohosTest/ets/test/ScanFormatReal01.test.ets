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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ScanFormatTable } from '../../../main/ets/scan/model/ScanFormatTable';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export default function scanFormatRealTest() {
  describe('ScanFormatReal', () => {
    /**
     * @tc.number SUB_SCAN_FORMAT_02_0001
     * @tc.name testFormatReal0001
     * @tc.desc dotsFor A4 returns the frozen 300dpi pair
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testFormatReal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatReal0001 begin');
      const dots: number[] = ScanFormatTable.dotsFor('A4');
      expect(dots.length).assertEqual(2);
      expect(dots[0]).assertEqual(2480);
      expect(dots[1]).assertEqual(3508);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatReal0001 end');
    });

    /**
     * @tc.number SUB_SCAN_FORMAT_02_0002
     * @tc.name testFormatReal0002
     * @tc.desc unknown page key falls back to the A4 dots
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testFormatReal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatReal0002 begin');
      expect(ScanFormatTable.pageSizeIndex('A9')).assertEqual(-1);
      expect(ScanFormatTable.dotsText('A9')).assertEqual('2480x3508');
      expect(ScanFormatTable.totalPixels('A9')).assertEqual(8699840);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatReal0002 end');
    });

    /**
     * @tc.number SUB_SCAN_FORMAT_02_0003
     * @tc.name testFormatReal0003
     * @tc.desc mimeType pdf returns the application/pdf constant
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testFormatReal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatReal0003 begin');
      expect(ScanFormatTable.mimeType('pdf')).assertEqual('application/pdf');
      expect(ScanFormatTable.mimeType('gif')).assertEqual('application/octet-stream');
      expect(ScanFormatTable.extension('pdf')).assertEqual('pdf');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatReal0003 end');
    });

    /**
     * @tc.number SUB_SCAN_FORMAT_02_0004
     * @tc.name testFormatReal0004
     * @tc.desc isMultiPage is true for pdf and tiff only
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testFormatReal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatReal0004 begin');
      expect(ScanFormatTable.isMultiPage('pdf')).assertTrue();
      expect(ScanFormatTable.isMultiPage('tiff')).assertTrue();
      expect(ScanFormatTable.isMultiPage('jpg')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatReal0004 end');
    });

    /**
     * @tc.number SUB_SCAN_FORMAT_02_0005
     * @tc.name testFormatReal0005
     * @tc.desc colorDepth gives pdf 32 and bitmap formats 24
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testFormatReal0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatReal0005 begin');
      expect(ScanFormatTable.colorDepth('pdf')).assertEqual(32);
      expect(ScanFormatTable.colorDepth('bmp')).assertEqual(24);
      expect(ScanFormatTable.colorDepth('gif')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatReal0005 end');
    });

    /**
     * @tc.number SUB_SCAN_FORMAT_02_0006
     * @tc.name testFormatReal0006
     * @tc.desc describe combines format and page into a snapshot
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testFormatReal0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatReal0006 begin');
      expect(ScanFormatTable.describe('pdf', 'A4')).assertEqual('format=pdf page=A4 pixels=2480x3508 multi=true');
      expect(ScanFormatTable.describe('jpg', 'A4')).assertEqual('format=jpg page=A4 pixels=2480x3508 multi=false');
      expect(ScanFormatTable.formatKeys().length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatReal0006 end');
    });
  });
}
