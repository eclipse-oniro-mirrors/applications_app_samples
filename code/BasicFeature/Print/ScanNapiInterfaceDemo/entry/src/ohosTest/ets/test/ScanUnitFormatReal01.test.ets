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
import { ScanUnitFormatter } from '../../../main/ets/scan/model/ScanUnitFormatter';
import { ScanParameterBuilder } from '../../../main/ets/scan/model/ScanParameterBuilder';
import { scan } from '@kit.BasicServicesKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export default function scanUnitFormatRealTest() {
  describe('ScanUnitFormatter', () => {

    /**
     * @tc.name   testUnitReal0001
     * @tc.number SUB_SCAN_UNIT_02_0001
     * @tc.desc   unit text covers all seven physical units
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitReal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0001 begin');
      const expected: string[] = ['', 'px', 'bit', 'mm', 'dpi', '%', 'us'];
      let matched: number = 0;
      for (let unit = 0; unit < expected.length; unit++) {
        if (ScanUnitFormatter.getUnitText(ScanParameterBuilder.unit(unit)) === expected[unit]) {
          matched++;
        }
      }
      expect(matched).assertEqual(7);
      expect(ScanUnitFormatter.getUnitText(ScanParameterBuilder.unit(0))).assertEqual('');
      expect(ScanUnitFormatter.getUnitText(ScanParameterBuilder.unit(6))).assertEqual('us');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0001 end');
    });

    /**
     * @tc.name   testUnitReal0002
     * @tc.number SUB_SCAN_UNIT_02_0002
     * @tc.desc   roundTo keeps the requested number of digits for positive and negative input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitReal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0002 begin');
      expect(ScanUnitFormatter.roundTo(1.234, 2)).assertEqual(1.23);
      expect(ScanUnitFormatter.roundTo(1.235, 2)).assertEqual(1.24);
      expect(ScanUnitFormatter.roundTo(-1.234, 2)).assertEqual(-1.23);
      expect(ScanUnitFormatter.roundTo(1.2345678, 4)).assertEqual(1.2346);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0002 end');
    });

    /**
     * @tc.name   testUnitReal0003
     * @tc.number SUB_SCAN_UNIT_02_0003
     * @tc.desc   roundTo with zero digits behaves like Math.round
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitReal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0003 begin');
      const down: number = ScanUnitFormatter.roundTo(2.4, 0);
      const up: number = ScanUnitFormatter.roundTo(2.5, 0);
      expect(down).assertEqual(2);
      expect(up).assertEqual(3);
      expect(up - down).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0003 end');
    });

    /**
     * @tc.name   testUnitReal0004
     * @tc.number SUB_SCAN_UNIT_02_0004
     * @tc.desc   format without a unit returns the bare number text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitReal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0004 begin');
      expect(ScanUnitFormatter.format(42, ScanParameterBuilder.unit(0))).assertEqual('42');
      expect(ScanUnitFormatter.format(7.777, ScanParameterBuilder.unit(0))).assertEqual('7.78');
      expect(ScanUnitFormatter.format(0.004, ScanParameterBuilder.unit(0))).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0004 end');
    });

    /**
     * @tc.name   testUnitReal0005
     * @tc.number SUB_SCAN_UNIT_02_0005
     * @tc.desc   format appends the unit text separated by one space
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitReal0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0005 begin');
      const dpiText: string = ScanUnitFormatter.format(300, ScanParameterBuilder.unit(4));
      const mmText: string = ScanUnitFormatter.format(25.4, ScanParameterBuilder.unit(3));
      expect(dpiText).assertEqual('300 dpi');
      expect(mmText).assertEqual('25.4 mm');
      expect(dpiText.endsWith('dpi')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0005 end');
    });

    /**
     * @tc.name   testUnitReal0006
     * @tc.number SUB_SCAN_UNIT_02_0006
     * @tc.desc   negative values keep their sign after rounding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitReal0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0006 begin');
      expect(ScanUnitFormatter.format(-12.345, ScanParameterBuilder.unit(1))).assertEqual('-12.34 px');
      expect(ScanUnitFormatter.format(-0.4, ScanParameterBuilder.unit(3))).assertEqual('-0.4 mm');
      expect(ScanUnitFormatter.format(-7.777, ScanParameterBuilder.unit(6))).assertEqual('-7.78 us');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0006 end');
    });

    /**
     * @tc.name   testUnitReal0007
     * @tc.number SUB_SCAN_UNIT_02_0007
     * @tc.desc   pixels convert to millimetres through the screen dpi constant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitReal0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0007 begin');
      expect(ScanUnitFormatter.toMillimeter(96, ScanParameterBuilder.unit(1))).assertEqual(25.4);
      expect(ScanUnitFormatter.toMillimeter(48, ScanParameterBuilder.unit(1))).assertEqual(12.7);
      expect(ScanUnitFormatter.toMillimeter(0, ScanParameterBuilder.unit(1))).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0007 end');
    });

    /**
     * @tc.name   testUnitReal0008
     * @tc.number SUB_SCAN_UNIT_02_0008
     * @tc.desc   non pixel units only get rounded, not converted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitReal0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0008 begin');
      const inMm: number = ScanUnitFormatter.toMillimeter(7.777, ScanParameterBuilder.unit(3));
      const inUs: number = ScanUnitFormatter.toMillimeter(7.777, ScanParameterBuilder.unit(6));
      expect(inMm).assertEqual(7.78);
      expect(inUs).assertEqual(inMm);
      expect(ScanUnitFormatter.toMillimeter(25.4, ScanParameterBuilder.unit(3))).assertEqual(25.4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0008 end');
    });

    /**
     * @tc.name   testUnitReal0009
     * @tc.number SUB_SCAN_UNIT_02_0009
     * @tc.desc   millimetres convert back to pixels with the same constant pair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitReal0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0009 begin');
      const atDpi96: number = ScanUnitFormatter.fromMillimeter(25.4, ScanParameterBuilder.unit(1));
      const wide: number = ScanUnitFormatter.fromMillimeter(50, ScanParameterBuilder.unit(1));
      expect(atDpi96).assertEqual(96);
      expect(wide).assertEqual(188.98);
      expect(Math.round(wide)).assertEqual(189);
      expect(ScanUnitFormatter.fromMillimeter(12.7, ScanParameterBuilder.unit(1))).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0009 end');
    });

    /**
     * @tc.name   testUnitReal0010
     * @tc.number SUB_SCAN_UNIT_02_0010
     * @tc.desc   fromMillimeter keeps other units unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitReal0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0010 begin');
      expect(ScanUnitFormatter.fromMillimeter(50, ScanParameterBuilder.unit(3))).assertEqual(50);
      expect(ScanUnitFormatter.fromMillimeter(7.777, ScanParameterBuilder.unit(3))).assertEqual(7.78);
      expect(ScanUnitFormatter.fromMillimeter(0, ScanParameterBuilder.unit(0))).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0010 end');
    });

    /**
     * @tc.name   testUnitReal0011
     * @tc.number SUB_SCAN_UNIT_02_0011
     * @tc.desc   millimeterToPixel rounds to the nearest pixel at the given dpi
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitReal0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0011 begin');
      expect(ScanUnitFormatter.millimeterToPixel(25.4, 300)).assertEqual(300);
      expect(ScanUnitFormatter.millimeterToPixel(10, 254)).assertEqual(100);
      expect(ScanUnitFormatter.millimeterToPixel(0, 96)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0011 end');
    });

    /**
     * @tc.name   testUnitReal0012
     * @tc.number SUB_SCAN_UNIT_02_0012
     * @tc.desc   a non positive dpi degrades the conversion to zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitReal0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0012 begin');
      expect(ScanUnitFormatter.millimeterToPixel(25.4, 0)).assertEqual(0);
      expect(ScanUnitFormatter.millimeterToPixel(25.4, -300)).assertEqual(0);
      expect(ScanUnitFormatter.millimeterToPixel(0, 0)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0012 end');
    });

    /**
     * @tc.name   testUnitReal0013
     * @tc.number SUB_SCAN_UNIT_02_0013
     * @tc.desc   pixelToMillimeter converts with two decimals
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitReal0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0013 begin');
      expect(ScanUnitFormatter.pixelToMillimeter(300, 300)).assertEqual(25.4);
      expect(ScanUnitFormatter.pixelToMillimeter(100, 254)).assertEqual(10);
      expect(ScanUnitFormatter.pixelToMillimeter(248, 300)).assertEqual(21);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0013 end');
    });

    /**
     * @tc.name   testUnitReal0014
     * @tc.number SUB_SCAN_UNIT_02_0014
     * @tc.desc   pixelToMillimeter also guards against a non positive dpi
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitReal0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0014 begin');
      expect(ScanUnitFormatter.pixelToMillimeter(300, 0)).assertEqual(0);
      expect(ScanUnitFormatter.pixelToMillimeter(300, -1)).assertEqual(0);
      expect(ScanUnitFormatter.pixelToMillimeter(0, 300)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0014 end');
    });

    /**
     * @tc.name   testUnitReal0015
     * @tc.number SUB_SCAN_UNIT_02_0015
     * @tc.desc   formatArea joins width and height in millimetres
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitReal0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0015 begin');
      expect(ScanUnitFormatter.formatArea(300, 600, 300)).assertEqual('25.4x50.8mm');
      expect(ScanUnitFormatter.formatArea(96, 96, 96)).assertEqual('25.4x25.4mm');
      expect(ScanUnitFormatter.formatArea(1000, 500, 254)).assertEqual('100x50mm');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0015 end');
    });

    /**
     * @tc.name   testUnitReal0016
     * @tc.number SUB_SCAN_UNIT_02_0016
     * @tc.desc   formatArea on a non positive dpi reports zero size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitReal0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0016 begin');
      const guardZero: string = ScanUnitFormatter.formatArea(100, 200, 0);
      expect(guardZero).assertEqual('0x0mm');
      expect(guardZero).assertEqual(ScanUnitFormatter.formatArea(0, 0, 300));
      expect(ScanUnitFormatter.formatArea(300, 300, 300)).assertEqual('25.4x25.4mm');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0016 end');
    });

    /**
     * @tc.name   testUnitReal0017
     * @tc.number SUB_SCAN_UNIT_02_0017
     * @tc.desc   every documented suffix parses back to its unit enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitReal0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0017 begin');
      const suffixes: string[] = ['px', 'bit', 'mm', 'dpi', '%', 'us'];
      let matched: number = 0;
      for (let unit = 1; unit <= suffixes.length; unit++) {
        if (ScanUnitFormatter.parseUnitText(suffixes[unit - 1]) === ScanParameterBuilder.unit(unit)) {
          matched++;
        }
      }
      expect(matched).assertEqual(6);
      expect(ScanUnitFormatter.parseUnitText('px') === ScanParameterBuilder.unit(1)).assertTrue();
      expect(ScanUnitFormatter.parseUnitText('us') === ScanParameterBuilder.unit(6)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0017 end');
    });

    /**
     * @tc.name   testUnitReal0018
     * @tc.number SUB_SCAN_UNIT_02_0018
     * @tc.desc   parseUnitText trims and lowercases before matching
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitReal0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0018 begin');
      expect(ScanUnitFormatter.parseUnitText(' PX ') === ScanParameterBuilder.unit(1)).assertTrue();
      expect(ScanUnitFormatter.parseUnitText('Bit') === ScanParameterBuilder.unit(2)).assertTrue();
      expect(ScanUnitFormatter.parseUnitText('DPI') === ScanParameterBuilder.unit(4)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0018 end');
    });

    /**
     * @tc.name   testUnitReal0019
     * @tc.number SUB_SCAN_UNIT_02_0019
     * @tc.desc   parseUnitText returns undefined for unknown or empty text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitReal0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0019 begin');
      expect(ScanUnitFormatter.parseUnitText('inch') === undefined).assertTrue();
      expect(ScanUnitFormatter.parseUnitText('') === undefined).assertTrue();
      expect(ScanUnitFormatter.parseUnitText('#') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0019 end');
    });

    /**
     * @tc.name   testUnitReal0020
     * @tc.number SUB_SCAN_UNIT_02_0020
     * @tc.desc   documented conversion constants stay stable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitReal0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0020 begin');
      expect(ScanUnitFormatter.MM_PER_INCH).assertEqual(25.4);
      expect(ScanUnitFormatter.SCREEN_DPI).assertEqual(96);
      expect(ScanUnitFormatter.DIGITS).assertEqual(2);
      expect(ScanUnitFormatter.roundTo(ScanUnitFormatter.MM_PER_INCH, 2)).assertEqual(25.4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0020 end');
    });

    /**
     * @tc.name   testUnitReal0021
     * @tc.number SUB_SCAN_UNIT_02_0021
     * @tc.desc   a millimetre value survives the pixel round trip
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitReal0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0021 begin');
      const pixel: number = ScanUnitFormatter.millimeterToPixel(21, 300);
      const back: number = ScanUnitFormatter.pixelToMillimeter(pixel, 300);
      expect(pixel).assertEqual(248);
      expect(back).assertEqual(21);
      expect(Math.abs(back - 21) < 0.05).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0021 end');
    });

    /**
     * @tc.name   testUnitReal0022
     * @tc.number SUB_SCAN_UNIT_02_0022
     * @tc.desc   format rounds half up at the two digit boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitReal0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0022 begin');
      const half: number = 0.005;
      expect(ScanUnitFormatter.format(half, ScanParameterBuilder.unit(3))).assertEqual('0.01 mm');
      expect(ScanUnitFormatter.format(half - 0.001, ScanParameterBuilder.unit(3))).assertEqual('0 mm');
      expect(ScanUnitFormatter.format(1000.999, ScanParameterBuilder.unit(4))).assertEqual('1001 dpi');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0022 end');
    });

    /**
     * @tc.name   testUnitReal0023
     * @tc.number SUB_SCAN_UNIT_02_0023
     * @tc.desc   a percent value keeps its suffix and two decimals
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitReal0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0023 begin');
      expect(ScanUnitFormatter.format(49.5, ScanParameterBuilder.unit(5))).assertEqual('49.5 %');
      expect(ScanUnitFormatter.format(100, ScanParameterBuilder.unit(5))).assertEqual('100 %');
      expect(ScanUnitFormatter.getUnitText(ScanParameterBuilder.unit(5))).assertEqual('%');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0023 end');
    });

    /**
     * @tc.name   testUnitReal0024
     * @tc.number SUB_SCAN_UNIT_02_0024
     * @tc.desc   unit text, label and parser stay consistent for every unit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnitReal0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0024 begin');
      let consistent: number = 0;
      for (let unit = 1; unit <= 6; unit++) {
        const text: string = ScanUnitFormatter.getUnitText(ScanParameterBuilder.unit(unit));
        const parsed: scan.PhysicalUnit | undefined = ScanUnitFormatter.parseUnitText(text);
        if (parsed === ScanParameterBuilder.unit(unit)) {
          consistent++;
        }
      }
      expect(consistent).assertEqual(6);
      expect(ScanUnitFormatter.getUnitLabel(ScanParameterBuilder.unit(7))).assertEqual('scan_unit_none');
      expect(ScanUnitFormatter.getUnitText(ScanParameterBuilder.unit(7))).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUnitReal0024 end');
    });
  });
}
