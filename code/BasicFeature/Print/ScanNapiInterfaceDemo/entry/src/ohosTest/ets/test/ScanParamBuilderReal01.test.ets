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
import { scan } from '@kit.BasicServicesKit';
import { ScanParameterBuilder } from '../../../main/ets/scan/model/ScanParameterBuilder';
import { ScanOptionConstraint } from '../../../main/ets/scan/model/ScanOptionConstraint';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export default function scanParamBuilderRealTest() {
  describe('ScanParamBuilderReal', () => {
    /**
     * @tc.number SUB_SCAN_PARAM_04_0001
     * @tc.name testParamBuilderReal0001
     * @tc.desc patchLists mounts non-empty lists only
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testParamBuilderReal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamBuilderReal0001 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.build(0, 1);
      ScanParameterBuilder.patchLists(p, [1, 3, 5], []);
      expect(p.optionConstraintInt === undefined).assertFalse();
      expect(p.optionConstraintString === undefined).assertTrue();
      expect(ScanOptionConstraint.countOptions(p)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamBuilderReal0001 end');
    });

    /**
     * @tc.number SUB_SCAN_PARAM_04_0002
     * @tc.name testParamBuilderReal0002
     * @tc.desc patchLists skips empty lists
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testParamBuilderReal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamBuilderReal0002 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.build(0, 3);
      ScanParameterBuilder.patchLists(p, [], []);
      expect(p.optionConstraintInt === undefined).assertTrue();
      expect(p.optionConstraintString === undefined).assertTrue();
      expect(ScanOptionConstraint.countOptions(p)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamBuilderReal0002 end');
    });

    /**
     * @tc.number SUB_SCAN_PARAM_04_0003
     * @tc.name testParamBuilderReal0003
     * @tc.desc range with reversed bounds keeps the frozen min and max
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testParamBuilderReal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamBuilderReal0003 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.range(1, 1, 300, 0, 1);
      expect(ScanOptionConstraint.getMin(p)).assertEqual(300);
      expect(ScanOptionConstraint.getMax(p)).assertEqual(0);
      expect(ScanParameterBuilder.describe(p)).assertEqual('constraint=1 type=1 range=300..0/1 texts=0 ints=0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamBuilderReal0003 end');
    });

    /**
     * @tc.number SUB_SCAN_PARAM_04_0004
     * @tc.name testParamBuilderReal0004
     * @tc.desc string list describe counts the mounted texts
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testParamBuilderReal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamBuilderReal0004 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.stringList(['pdf', 'png', 'jpg']);
      expect(ScanParameterBuilder.describe(p)).assertEqual('constraint=3 type=3 range=- texts=3 ints=0');
      expect(ScanOptionConstraint.countOptions(p)).assertEqual(3);
      expect(p.optionConstraintString === undefined).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamBuilderReal0004 end');
    });

    /**
     * @tc.number SUB_SCAN_PARAM_04_0005
     * @tc.name testParamBuilderReal0005
     * @tc.desc units exposes all seven frozen enums in order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testParamBuilderReal0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamBuilderReal0005 begin');
      const units: scan.PhysicalUnit[] = ScanParameterBuilder.units();
      expect(units.length).assertEqual(7);
      expect(units[0]).assertEqual(scan.PhysicalUnit.SCAN_UNIT_NONE);
      expect(units[6]).assertEqual(scan.PhysicalUnit.SCAN_UNIT_MICROSECOND);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamBuilderReal0005 end');
    });

    /**
     * @tc.number SUB_SCAN_PARAM_04_0006
     * @tc.name testParamBuilderReal0006
     * @tc.desc sync attaches oldScannerId only for a non-empty value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testParamBuilderReal0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamBuilderReal0006 begin');
      const withOld: scan.ScannerSyncDevice = ScanParameterBuilder.sync('1', 'U1', 'TCP', 'update', 'old1');
      const withoutOld: scan.ScannerSyncDevice = ScanParameterBuilder.sync('2', 'U2', 'TCP', 'update', '');
      expect(withOld.oldScannerId).assertEqual('old1');
      expect(withoutOld.oldScannerId === undefined).assertTrue();
      expect(withOld.syncMode).assertEqual(scan.ScannerSyncMode.UPDATE_STR);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamBuilderReal0006 end');
    });

    /**
     * @tc.number SUB_SCAN_PARAM_04_0007
     * @tc.name testParamBuilderReal0007
     * @tc.desc device defaults to TCP discovery for unknown mode text
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testParamBuilderReal0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamBuilderReal0007 begin');
      const device: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', 'Acme', 'X100', 'Scanner A', 'wifi');
      expect(device.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      expect(device.scannerId).assertEqual('1');
      expect(device.uniqueId).assertEqual('U1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamBuilderReal0007 end');
    });

    /**
     * @tc.number SUB_SCAN_PARAM_04_0008
     * @tc.name testParamBuilderReal0008
     * @tc.desc sampleDevices exposes three frozen devices
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testParamBuilderReal0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamBuilderReal0008 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.sampleDevices();
      expect(devices.length).assertEqual(3);
      expect(devices[0].manufacturer).assertEqual('Acme');
      expect(devices[1].discoveryMode).assertEqual(scan.ScannerDiscoveryMode.USB_STR);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamBuilderReal0008 end');
    });

    /**
     * @tc.number SUB_SCAN_PARAM_04_0009
     * @tc.name testParamBuilderReal0009
     * @tc.desc fillDevices builds count devices with the S prefix
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testParamBuilderReal0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamBuilderReal0009 begin');
      const devices: scan.ScannerDevice[] = ScanParameterBuilder.fillDevices(5);
      expect(devices.length).assertEqual(5);
      expect(devices[0].scannerId).assertEqual('S0');
      expect(devices[4].scannerId).assertEqual('S4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamBuilderReal0009 end');
    });

    /**
     * @tc.number SUB_SCAN_PARAM_04_0010
     * @tc.name testParamBuilderReal0010
     * @tc.desc noParams returns an empty parameter list
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testParamBuilderReal0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamBuilderReal0010 begin');
      const params: scan.ScannerParameter[] = ScanParameterBuilder.noParams();
      expect(params.length).assertEqual(0);
      expect(ScanParameterBuilder.devices().length).assertEqual(0);
      expect(ScanParameterBuilder.syncList().length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamBuilderReal0010 end');
    });

    /**
     * @tc.number SUB_SCAN_PARAM_04_0011
     * @tc.name testParamBuilderReal0011
     * @tc.desc intRange and fixedRange mount the same range shape
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testParamBuilderReal0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamBuilderReal0011 begin');
      const intParam: scan.ScannerParameter = ScanParameterBuilder.intRange(10, 90, 10);
      const fixedParam: scan.ScannerParameter = ScanParameterBuilder.fixedRange(0, 1, 5);
      expect(intParam.optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_INT);
      expect(fixedParam.optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_FIXED);
      expect(ScanOptionConstraint.hasRange(fixedParam)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamBuilderReal0011 end');
    });

    /**
     * @tc.number SUB_SCAN_PARAM_04_0012
     * @tc.name testParamBuilderReal0012
     * @tc.desc build with out-of-table constraint falls back to NONE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testParamBuilderReal0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamBuilderReal0012 begin');
      const p: scan.ScannerParameter = ScanParameterBuilder.build(9, 2);
      expect(p.optionConstraintType).assertEqual(scan.ConstraintType.SCAN_CONSTRAINT_NONE);
      expect(p.optionType).assertEqual(scan.OptionValueType.SCAN_TYPE_FIXED);
      expect(ScanOptionConstraint.isEditable(p)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamBuilderReal0012 end');
    });
  });
}
