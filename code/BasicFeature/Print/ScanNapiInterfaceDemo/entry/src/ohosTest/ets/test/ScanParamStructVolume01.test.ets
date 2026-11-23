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
import { ScanOptionConstraint, ScanConstraintKind } from '../../../main/ets/scan/model/ScanOptionConstraint';
import { ScanOptionModel } from '../../../main/ets/scan/model/ScanOptionViewModel';
import { ScanOptionValueParser } from '../../../main/ets/scan/model/ScanOptionValueParser';
import { ScanDeviceFilter } from '../../../main/ets/scan/model/ScanDeviceFilter';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ScanNapiInterfaceDemo]';

export default function scanParamStructVolume01Test() {
  describe('ScanParamStruct', () => {

    /**
     * @tc.name   testParamStruct010001
     * @tc.number SUB_SCAN_PARAM_03_0001
     * @tc.desc   device echoes fields of scanner 1 with mode TCP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010001 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', 'Acme', 'X100', 'Scanner A', 'TCP');
      expect(result.scannerId).assertEqual('1');
      expect(result.uniqueId).assertEqual('U1');
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010001 end');
    });

    /**
     * @tc.name   testParamStruct010002
     * @tc.number SUB_SCAN_PARAM_03_0002
     * @tc.desc   device echoes fields of scanner 2 with mode USB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010002 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('2', 'U2', '', 'Y200', 'Scanner B', 'USB');
      expect(result.scannerId).assertEqual('2');
      expect(result.uniqueId).assertEqual('U2');
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.USB_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010002 end');
    });

    /**
     * @tc.name   testParamStruct010003
     * @tc.number SUB_SCAN_PARAM_03_0003
     * @tc.desc   device echoes fields of scanner 3 with mode TCP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010003 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('3', 'U3', 'Acme', '', '', 'TCP');
      expect(result.scannerId).assertEqual('3');
      expect(result.uniqueId).assertEqual('U3');
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010003 end');
    });

    /**
     * @tc.name   testParamStruct010004
     * @tc.number SUB_SCAN_PARAM_03_0004
     * @tc.desc   device echoes fields of scanner 4 with mode usb
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010004 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('4', 'U4', '', '', '', 'usb');
      expect(result.scannerId).assertEqual('4');
      expect(result.uniqueId).assertEqual('U4');
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010004 end');
    });

    /**
     * @tc.name   testParamStruct010005
     * @tc.number SUB_SCAN_PARAM_03_0005
     * @tc.desc   device echoes fields of scanner 5 with mode tcp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010005 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('5', 'U5', 'Vendor', 'Model', 'Scanner 5', 'tcp');
      expect(result.scannerId).assertEqual('5');
      expect(result.uniqueId).assertEqual('U5');
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010005 end');
    });

    /**
     * @tc.name   testParamStruct010006
     * @tc.number SUB_SCAN_PARAM_03_0006
     * @tc.desc   device echoes fields of scanner 6 with mode USB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010006 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('6', 'U6', 'V', 'M', 'S6', 'USB');
      expect(result.scannerId).assertEqual('6');
      expect(result.uniqueId).assertEqual('U6');
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.USB_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010006 end');
    });

    /**
     * @tc.name   testParamStruct010007
     * @tc.number SUB_SCAN_PARAM_03_0007
     * @tc.desc   device echoes fields of scanner 7 with mode TCP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010007 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('7', 'U7', '', 'M7', '', 'TCP');
      expect(result.scannerId).assertEqual('7');
      expect(result.uniqueId).assertEqual('U7');
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010007 end');
    });

    /**
     * @tc.name   testParamStruct010008
     * @tc.number SUB_SCAN_PARAM_03_0008
     * @tc.desc   device echoes fields of scanner 8 with mode USB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010008 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('8', 'U8', 'M8', '', 'S8', 'USB');
      expect(result.scannerId).assertEqual('8');
      expect(result.uniqueId).assertEqual('U8');
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.USB_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010008 end');
    });

    /**
     * @tc.name   testParamStruct010009
     * @tc.number SUB_SCAN_PARAM_03_0009
     * @tc.desc   device echoes fields of scanner 9 with mode TCP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010009 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('9', 'U9', 'M9', 'X9', 'S9', 'TCP');
      expect(result.scannerId).assertEqual('9');
      expect(result.uniqueId).assertEqual('U9');
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010009 end');
    });

    /**
     * @tc.name   testParamStruct010010
     * @tc.number SUB_SCAN_PARAM_03_0010
     * @tc.desc   device echoes fields of scanner 10 with mode usb
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010010 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('10', 'U10', '', '', 'S10', 'usb');
      expect(result.scannerId).assertEqual('10');
      expect(result.uniqueId).assertEqual('U10');
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010010 end');
    });

    /**
     * @tc.name   testParamStruct010011
     * @tc.number SUB_SCAN_PARAM_03_0011
     * @tc.desc   device echoes fields of scanner 11 with mode TCP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010011 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('11', 'U11', 'A', 'B', 'C', 'TCP');
      expect(result.scannerId).assertEqual('11');
      expect(result.uniqueId).assertEqual('U11');
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010011 end');
    });

    /**
     * @tc.name   testParamStruct010012
     * @tc.number SUB_SCAN_PARAM_03_0012
     * @tc.desc   device echoes fields of scanner 12 with mode USB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010012 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('12', 'U12', '', 'D', '', 'USB');
      expect(result.scannerId).assertEqual('12');
      expect(result.uniqueId).assertEqual('U12');
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.USB_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010012 end');
    });

    /**
     * @tc.name   testParamStruct010013
     * @tc.number SUB_SCAN_PARAM_03_0013
     * @tc.desc   device echoes fields of scanner 13 with mode TCP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010013 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('13', 'U13', 'E', '', 'F', 'TCP');
      expect(result.scannerId).assertEqual('13');
      expect(result.uniqueId).assertEqual('U13');
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010013 end');
    });

    /**
     * @tc.name   testParamStruct010014
     * @tc.number SUB_SCAN_PARAM_03_0014
     * @tc.desc   device echoes fields of scanner 14 with mode USB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010014 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('14', 'U14', 'G', 'H', 'I', 'USB');
      expect(result.scannerId).assertEqual('14');
      expect(result.uniqueId).assertEqual('U14');
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.USB_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010014 end');
    });

    /**
     * @tc.name   testParamStruct010015
     * @tc.number SUB_SCAN_PARAM_03_0015
     * @tc.desc   device echoes fields of scanner 15 with mode TCP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010015 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('15', 'U15', '', 'J', 'K', 'TCP');
      expect(result.scannerId).assertEqual('15');
      expect(result.uniqueId).assertEqual('U15');
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010015 end');
    });

    /**
     * @tc.name   testParamStruct010016
     * @tc.number SUB_SCAN_PARAM_03_0016
     * @tc.desc   device echoes fields of scanner 16 with mode usb
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010016 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('16', 'U16', 'L', 'M', 'N', 'usb');
      expect(result.scannerId).assertEqual('16');
      expect(result.uniqueId).assertEqual('U16');
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010016 end');
    });

    /**
     * @tc.name   testParamStruct010017
     * @tc.number SUB_SCAN_PARAM_03_0017
     * @tc.desc   device echoes fields of scanner 17 with mode TCP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010017 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('17', 'U17', 'O', 'P', 'Q', 'TCP');
      expect(result.scannerId).assertEqual('17');
      expect(result.uniqueId).assertEqual('U17');
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010017 end');
    });

    /**
     * @tc.name   testParamStruct010018
     * @tc.number SUB_SCAN_PARAM_03_0018
     * @tc.desc   device echoes fields of scanner 18 with mode USB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010018 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('18', 'U18', '', 'R', 'S', 'USB');
      expect(result.scannerId).assertEqual('18');
      expect(result.uniqueId).assertEqual('U18');
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.USB_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010018 end');
    });

    /**
     * @tc.name   testParamStruct010019
     * @tc.number SUB_SCAN_PARAM_03_0019
     * @tc.desc   device echoes fields of scanner 19 with mode TCP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010019 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('19', 'U19', 'T', 'U', 'V', 'TCP');
      expect(result.scannerId).assertEqual('19');
      expect(result.uniqueId).assertEqual('U19');
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010019 end');
    });

    /**
     * @tc.name   testParamStruct010020
     * @tc.number SUB_SCAN_PARAM_03_0020
     * @tc.desc   device echoes fields of scanner 20 with mode USB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010020 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('20', 'U20', 'W', 'X', 'Y', 'USB');
      expect(result.scannerId).assertEqual('20');
      expect(result.uniqueId).assertEqual('U20');
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.USB_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010020 end');
    });

    /**
     * @tc.name   testParamStruct010021
     * @tc.number SUB_SCAN_PARAM_03_0021
     * @tc.desc   sync event for scanner 1 with mode update oldScannerId ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010021 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(
        ScanParameterBuilder.sync('1', 'U1', 'TCP', 'update', '').syncMode
      ).assertEqual(scan.ScannerSyncMode.UPDATE_STR);
      expect(ScanParameterBuilder.sync('1', 'U1', 'TCP', 'update', '').oldScannerId === undefined).assertEqual(true);
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010021 end');
    });

    /**
     * @tc.name   testParamStruct010022
     * @tc.number SUB_SCAN_PARAM_03_0022
     * @tc.desc   sync event for scanner 2 with mode delete oldScannerId ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010022 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('2', 'U2', '', '', '', 'USB');
      expect(
        ScanParameterBuilder.sync('2', 'U2', 'USB', 'delete', '').syncMode
      ).assertEqual(scan.ScannerSyncMode.DELETE_STR);
      expect(ScanParameterBuilder.sync('2', 'U2', 'USB', 'delete', '').oldScannerId === undefined).assertEqual(true);
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.USB_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010022 end');
    });

    /**
     * @tc.name   testParamStruct010023
     * @tc.number SUB_SCAN_PARAM_03_0023
     * @tc.desc   sync event for scanner 3 with mode update oldScannerId 'old3'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010023 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('3', 'U3', '', '', '', 'TCP');
      expect(
        ScanParameterBuilder.sync('3', 'U3', 'TCP', 'update', 'old3').syncMode
      ).assertEqual(scan.ScannerSyncMode.UPDATE_STR);
      expect(
        ScanParameterBuilder.sync('3', 'U3', 'TCP', 'update', 'old3').oldScannerId === undefined
      ).assertEqual(false);
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010023 end');
    });

    /**
     * @tc.name   testParamStruct010024
     * @tc.number SUB_SCAN_PARAM_03_0024
     * @tc.desc   sync event for scanner 4 with mode delete oldScannerId 'old4'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010024 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('4', 'U4', '', '', '', 'USB');
      expect(
        ScanParameterBuilder.sync('4', 'U4', 'USB', 'delete', 'old4').syncMode
      ).assertEqual(scan.ScannerSyncMode.DELETE_STR);
      expect(
        ScanParameterBuilder.sync('4', 'U4', 'USB', 'delete', 'old4').oldScannerId === undefined
      ).assertEqual(false);
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.USB_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010024 end');
    });

    /**
     * @tc.name   testParamStruct010025
     * @tc.number SUB_SCAN_PARAM_03_0025
     * @tc.desc   sync event for scanner 5 with mode Update oldScannerId ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010025 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('5', 'U5', '', '', '', 'tcp');
      expect(
        ScanParameterBuilder.sync('5', 'U5', 'tcp', 'Update', '').syncMode
      ).assertEqual(scan.ScannerSyncMode.UPDATE_STR);
      expect(ScanParameterBuilder.sync('5', 'U5', 'tcp', 'Update', '').oldScannerId === undefined).assertEqual(true);
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010025 end');
    });

    /**
     * @tc.name   testParamStruct010026
     * @tc.number SUB_SCAN_PARAM_03_0026
     * @tc.desc   sync event for scanner 6 with mode Delete oldScannerId 'old6'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010026 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('6', 'U6', '', '', '', 'usb');
      expect(
        ScanParameterBuilder.sync('6', 'U6', 'usb', 'Delete', 'old6').syncMode
      ).assertEqual(scan.ScannerSyncMode.UPDATE_STR);
      expect(
        ScanParameterBuilder.sync('6', 'U6', 'usb', 'Delete', 'old6').oldScannerId === undefined
      ).assertEqual(false);
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010026 end');
    });

    /**
     * @tc.name   testParamStruct010027
     * @tc.number SUB_SCAN_PARAM_03_0027
     * @tc.desc   sync event for scanner 7 with mode update oldScannerId 'old7'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010027 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('7', 'U7', '', '', '', 'TCP');
      expect(
        ScanParameterBuilder.sync('7', 'U7', 'TCP', 'update', 'old7').syncMode
      ).assertEqual(scan.ScannerSyncMode.UPDATE_STR);
      expect(
        ScanParameterBuilder.sync('7', 'U7', 'TCP', 'update', 'old7').oldScannerId === undefined
      ).assertEqual(false);
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010027 end');
    });

    /**
     * @tc.name   testParamStruct010028
     * @tc.number SUB_SCAN_PARAM_03_0028
     * @tc.desc   sync event for scanner 8 with mode delete oldScannerId 'old8'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010028 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('8', 'U8', '', '', '', 'USB');
      expect(
        ScanParameterBuilder.sync('8', 'U8', 'USB', 'delete', 'old8').syncMode
      ).assertEqual(scan.ScannerSyncMode.DELETE_STR);
      expect(
        ScanParameterBuilder.sync('8', 'U8', 'USB', 'delete', 'old8').oldScannerId === undefined
      ).assertEqual(false);
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.USB_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010028 end');
    });

    /**
     * @tc.name   testParamStruct010029
     * @tc.number SUB_SCAN_PARAM_03_0029
     * @tc.desc   sync event for scanner 9 with mode update oldScannerId ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010029 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('9', 'U9', '', '', '', 'TCP');
      expect(
        ScanParameterBuilder.sync('9', 'U9', 'TCP', 'update', '').syncMode
      ).assertEqual(scan.ScannerSyncMode.UPDATE_STR);
      expect(ScanParameterBuilder.sync('9', 'U9', 'TCP', 'update', '').oldScannerId === undefined).assertEqual(true);
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010029 end');
    });

    /**
     * @tc.name   testParamStruct010030
     * @tc.number SUB_SCAN_PARAM_03_0030
     * @tc.desc   sync event for scanner 10 with mode delete oldScannerId 'old10'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010030 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('10', 'U10', '', '', '', 'USB');
      expect(
        ScanParameterBuilder.sync('10', 'U10', 'USB', 'delete', 'old10').syncMode
      ).assertEqual(scan.ScannerSyncMode.DELETE_STR);
      expect(
        ScanParameterBuilder.sync('10', 'U10', 'USB', 'delete', 'old10').oldScannerId === undefined
      ).assertEqual(false);
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.USB_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010030 end');
    });

    /**
     * @tc.name   testParamStruct010031
     * @tc.number SUB_SCAN_PARAM_03_0031
     * @tc.desc   sync event for scanner 11 with mode update oldScannerId 'old11'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010031 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('11', 'U11', '', '', '', 'TCP');
      expect(
        ScanParameterBuilder.sync('11', 'U11', 'TCP', 'update', 'old11').syncMode
      ).assertEqual(scan.ScannerSyncMode.UPDATE_STR);
      expect(
        ScanParameterBuilder.sync('11', 'U11', 'TCP', 'update', 'old11').oldScannerId === undefined
      ).assertEqual(false);
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010031 end');
    });

    /**
     * @tc.name   testParamStruct010032
     * @tc.number SUB_SCAN_PARAM_03_0032
     * @tc.desc   sync event for scanner 12 with mode delete oldScannerId 'old12'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010032 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('12', 'U12', '', '', '', 'USB');
      expect(
        ScanParameterBuilder.sync('12', 'U12', 'USB', 'delete', 'old12').syncMode
      ).assertEqual(scan.ScannerSyncMode.DELETE_STR);
      expect(
        ScanParameterBuilder.sync('12', 'U12', 'USB', 'delete', 'old12').oldScannerId === undefined
      ).assertEqual(false);
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.USB_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010032 end');
    });

    /**
     * @tc.name   testParamStruct010033
     * @tc.number SUB_SCAN_PARAM_03_0033
     * @tc.desc   sync event for scanner 13 with mode update oldScannerId ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010033 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('13', 'U13', '', '', '', 'TCP');
      expect(
        ScanParameterBuilder.sync('13', 'U13', 'TCP', 'update', '').syncMode
      ).assertEqual(scan.ScannerSyncMode.UPDATE_STR);
      expect(ScanParameterBuilder.sync('13', 'U13', 'TCP', 'update', '').oldScannerId === undefined).assertEqual(true);
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010033 end');
    });

    /**
     * @tc.name   testParamStruct010034
     * @tc.number SUB_SCAN_PARAM_03_0034
     * @tc.desc   sync event for scanner 14 with mode delete oldScannerId 'old14'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010034 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('14', 'U14', '', '', '', 'USB');
      expect(
        ScanParameterBuilder.sync('14', 'U14', 'USB', 'delete', 'old14').syncMode
      ).assertEqual(scan.ScannerSyncMode.DELETE_STR);
      expect(
        ScanParameterBuilder.sync('14', 'U14', 'USB', 'delete', 'old14').oldScannerId === undefined
      ).assertEqual(false);
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.USB_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010034 end');
    });

    /**
     * @tc.name   testParamStruct010035
     * @tc.number SUB_SCAN_PARAM_03_0035
     * @tc.desc   sync event for scanner 15 with mode update oldScannerId 'old15'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010035 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('15', 'U15', '', '', '', 'TCP');
      expect(
        ScanParameterBuilder.sync('15', 'U15', 'TCP', 'update', 'old15').syncMode
      ).assertEqual(scan.ScannerSyncMode.UPDATE_STR);
      expect(
        ScanParameterBuilder.sync('15', 'U15', 'TCP', 'update', 'old15').oldScannerId === undefined
      ).assertEqual(false);
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010035 end');
    });

    /**
     * @tc.name   testParamStruct010036
     * @tc.number SUB_SCAN_PARAM_03_0036
     * @tc.desc   sync event for scanner 16 with mode delete oldScannerId 'old16'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010036 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('16', 'U16', '', '', '', 'USB');
      expect(
        ScanParameterBuilder.sync('16', 'U16', 'USB', 'delete', 'old16').syncMode
      ).assertEqual(scan.ScannerSyncMode.DELETE_STR);
      expect(
        ScanParameterBuilder.sync('16', 'U16', 'USB', 'delete', 'old16').oldScannerId === undefined
      ).assertEqual(false);
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.USB_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010036 end');
    });

    /**
     * @tc.name   testParamStruct010037
     * @tc.number SUB_SCAN_PARAM_03_0037
     * @tc.desc   sync event for scanner 17 with mode update oldScannerId 'old17'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010037 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('17', 'U17', '', '', '', 'TCP');
      expect(
        ScanParameterBuilder.sync('17', 'U17', 'TCP', 'update', 'old17').syncMode
      ).assertEqual(scan.ScannerSyncMode.UPDATE_STR);
      expect(
        ScanParameterBuilder.sync('17', 'U17', 'TCP', 'update', 'old17').oldScannerId === undefined
      ).assertEqual(false);
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010037 end');
    });

    /**
     * @tc.name   testParamStruct010038
     * @tc.number SUB_SCAN_PARAM_03_0038
     * @tc.desc   sync event for scanner 18 with mode delete oldScannerId 'old18'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010038 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('18', 'U18', '', '', '', 'USB');
      expect(
        ScanParameterBuilder.sync('18', 'U18', 'USB', 'delete', 'old18').syncMode
      ).assertEqual(scan.ScannerSyncMode.DELETE_STR);
      expect(
        ScanParameterBuilder.sync('18', 'U18', 'USB', 'delete', 'old18').oldScannerId === undefined
      ).assertEqual(false);
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.USB_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010038 end');
    });

    /**
     * @tc.name   testParamStruct010039
     * @tc.number SUB_SCAN_PARAM_03_0039
     * @tc.desc   sync event for scanner 19 with mode update oldScannerId 'old19'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010039 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('19', 'U19', '', '', '', 'TCP');
      expect(
        ScanParameterBuilder.sync('19', 'U19', 'TCP', 'update', 'old19').syncMode
      ).assertEqual(scan.ScannerSyncMode.UPDATE_STR);
      expect(
        ScanParameterBuilder.sync('19', 'U19', 'TCP', 'update', 'old19').oldScannerId === undefined
      ).assertEqual(false);
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.TCP_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010039 end');
    });

    /**
     * @tc.name   testParamStruct010040
     * @tc.number SUB_SCAN_PARAM_03_0040
     * @tc.desc   sync event for scanner 20 with mode delete oldScannerId 'old20'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010040 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('20', 'U20', '', '', '', 'USB');
      expect(
        ScanParameterBuilder.sync('20', 'U20', 'USB', 'delete', 'old20').syncMode
      ).assertEqual(scan.ScannerSyncMode.DELETE_STR);
      expect(
        ScanParameterBuilder.sync('20', 'U20', 'USB', 'delete', 'old20').oldScannerId === undefined
      ).assertEqual(false);
      expect(result.discoveryMode).assertEqual(scan.ScannerDiscoveryMode.USB_STR);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010040 end');
    });

    /**
     * @tc.name   testParamStruct010041
     * @tc.number SUB_SCAN_PARAM_03_0041
     * @tc.desc   fillDevices(0) produces 0 placeholder devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010041 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(ScanParameterBuilder.fillDevices(0).length).assertEqual(0);
      expect(ScanParameterBuilder.fillDevices(0)[0] === undefined).assertEqual(true);
      expect(ScanDeviceFilter.lastId(ScanParameterBuilder.fillDevices(0))).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010041 end');
    });

    /**
     * @tc.name   testParamStruct010042
     * @tc.number SUB_SCAN_PARAM_03_0042
     * @tc.desc   fillDevices(1) produces 1 placeholder devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010042 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(ScanParameterBuilder.fillDevices(1).length).assertEqual(1);
      expect(ScanParameterBuilder.fillDevices(1)[0] === undefined).assertEqual(false);
      expect(ScanDeviceFilter.lastId(ScanParameterBuilder.fillDevices(1))).assertEqual('S0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010042 end');
    });

    /**
     * @tc.name   testParamStruct010043
     * @tc.number SUB_SCAN_PARAM_03_0043
     * @tc.desc   fillDevices(2) produces 2 placeholder devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010043 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(ScanParameterBuilder.fillDevices(2).length).assertEqual(2);
      expect(ScanParameterBuilder.fillDevices(2)[0] === undefined).assertEqual(false);
      expect(ScanDeviceFilter.lastId(ScanParameterBuilder.fillDevices(2))).assertEqual('S1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010043 end');
    });

    /**
     * @tc.name   testParamStruct010044
     * @tc.number SUB_SCAN_PARAM_03_0044
     * @tc.desc   fillDevices(5) produces 5 placeholder devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010044 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(ScanParameterBuilder.fillDevices(5).length).assertEqual(5);
      expect(ScanParameterBuilder.fillDevices(5)[0] === undefined).assertEqual(false);
      expect(ScanDeviceFilter.lastId(ScanParameterBuilder.fillDevices(5))).assertEqual('S4');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010044 end');
    });

    /**
     * @tc.name   testParamStruct010045
     * @tc.number SUB_SCAN_PARAM_03_0045
     * @tc.desc   fillDevices(10) produces 10 placeholder devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010045 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(ScanParameterBuilder.fillDevices(10).length).assertEqual(10);
      expect(ScanParameterBuilder.fillDevices(10)[0] === undefined).assertEqual(false);
      expect(ScanDeviceFilter.lastId(ScanParameterBuilder.fillDevices(10))).assertEqual('S9');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010045 end');
    });

    /**
     * @tc.name   testParamStruct010046
     * @tc.number SUB_SCAN_PARAM_03_0046
     * @tc.desc   fillDevices(50) produces 50 placeholder devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010046 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(ScanParameterBuilder.fillDevices(50).length).assertEqual(50);
      expect(ScanParameterBuilder.fillDevices(50)[0] === undefined).assertEqual(false);
      expect(ScanDeviceFilter.lastId(ScanParameterBuilder.fillDevices(50))).assertEqual('S49');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010046 end');
    });

    /**
     * @tc.name   testParamStruct010047
     * @tc.number SUB_SCAN_PARAM_03_0047
     * @tc.desc   fillDevices(100) produces 100 placeholder devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010047 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(ScanParameterBuilder.fillDevices(100).length).assertEqual(100);
      expect(ScanParameterBuilder.fillDevices(100)[0] === undefined).assertEqual(false);
      expect(ScanDeviceFilter.lastId(ScanParameterBuilder.fillDevices(100))).assertEqual('S99');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010047 end');
    });

    /**
     * @tc.name   testParamStruct010048
     * @tc.number SUB_SCAN_PARAM_03_0048
     * @tc.desc   fillDevices(150) produces 150 placeholder devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010048 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(ScanParameterBuilder.fillDevices(150).length).assertEqual(150);
      expect(ScanParameterBuilder.fillDevices(150)[0] === undefined).assertEqual(false);
      expect(ScanDeviceFilter.lastId(ScanParameterBuilder.fillDevices(150))).assertEqual('S149');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010048 end');
    });

    /**
     * @tc.name   testParamStruct010049
     * @tc.number SUB_SCAN_PARAM_03_0049
     * @tc.desc   fillDevices(3) produces 3 placeholder devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010049 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(ScanParameterBuilder.fillDevices(3).length).assertEqual(3);
      expect(ScanParameterBuilder.fillDevices(3)[0] === undefined).assertEqual(false);
      expect(ScanDeviceFilter.lastId(ScanParameterBuilder.fillDevices(3))).assertEqual('S2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010049 end');
    });

    /**
     * @tc.name   testParamStruct010050
     * @tc.number SUB_SCAN_PARAM_03_0050
     * @tc.desc   fillDevices(20) produces 20 placeholder devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010050 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(ScanParameterBuilder.fillDevices(20).length).assertEqual(20);
      expect(ScanParameterBuilder.fillDevices(20)[0] === undefined).assertEqual(false);
      expect(ScanDeviceFilter.lastId(ScanParameterBuilder.fillDevices(20))).assertEqual('S19');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010050 end');
    });

    /**
     * @tc.name   testParamStruct010051
     * @tc.number SUB_SCAN_PARAM_03_0051
     * @tc.desc   fillDevices(99) produces 99 placeholder devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010051 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(ScanParameterBuilder.fillDevices(99).length).assertEqual(99);
      expect(ScanParameterBuilder.fillDevices(99)[0] === undefined).assertEqual(false);
      expect(ScanDeviceFilter.lastId(ScanParameterBuilder.fillDevices(99))).assertEqual('S98');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010051 end');
    });

    /**
     * @tc.name   testParamStruct010052
     * @tc.number SUB_SCAN_PARAM_03_0052
     * @tc.desc   fillDevices(101) produces 101 placeholder devices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010052 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(ScanParameterBuilder.fillDevices(101).length).assertEqual(101);
      expect(ScanParameterBuilder.fillDevices(101)[0] === undefined).assertEqual(false);
      expect(ScanDeviceFilter.lastId(ScanParameterBuilder.fillDevices(101))).assertEqual('S100');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010052 end');
    });

    /**
     * @tc.name   testParamStruct010053
     * @tc.number SUB_SCAN_PARAM_03_0053
     * @tc.desc   sampleDevices length matches the frozen sample directory
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010053 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(ScanParameterBuilder.sampleDevices().length).assertEqual(3);
      expect(ScanParameterBuilder.sampleDevices().length === 3).assertEqual(true);
      expect(result.scannerId).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010053 end');
    });

    /**
     * @tc.name   testParamStruct010054
     * @tc.number SUB_SCAN_PARAM_03_0054
     * @tc.desc   sampleDevices first matches the frozen sample directory
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010054 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(ScanParameterBuilder.sampleDevices()[0].scannerId).assertEqual('1');
      expect(ScanParameterBuilder.sampleDevices().length === 3).assertEqual(true);
      expect(result.scannerId).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010054 end');
    });

    /**
     * @tc.name   testParamStruct010055
     * @tc.number SUB_SCAN_PARAM_03_0055
     * @tc.desc   sampleDevices second matches the frozen sample directory
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010055 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(ScanParameterBuilder.sampleDevices()[1].manufacturer).assertEqual('');
      expect(ScanParameterBuilder.sampleDevices().length === 3).assertEqual(true);
      expect(result.scannerId).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010055 end');
    });

    /**
     * @tc.name   testParamStruct010056
     * @tc.number SUB_SCAN_PARAM_03_0056
     * @tc.desc   sampleDevices third matches the frozen sample directory
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010056 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(ScanParameterBuilder.sampleDevices()[2].model).assertEqual('');
      expect(ScanParameterBuilder.sampleDevices().length === 3).assertEqual(true);
      expect(result.scannerId).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010056 end');
    });

    /**
     * @tc.name   testParamStruct010057
     * @tc.number SUB_SCAN_PARAM_03_0057
     * @tc.desc   sampleDevices summary matches the frozen sample directory
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010057 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(ScanDeviceFilter.summary(ScanParameterBuilder.sampleDevices())).assertEqual('count=3 first=1 last=3');
      expect(ScanParameterBuilder.sampleDevices().length === 3).assertEqual(true);
      expect(result.scannerId).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010057 end');
    });

    /**
     * @tc.name   testParamStruct010058
     * @tc.number SUB_SCAN_PARAM_03_0058
     * @tc.desc   sampleDevices unique matches the frozen sample directory
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010058 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(ScanDeviceFilter.uniqueIds(ScanParameterBuilder.sampleDevices()).length).assertEqual(3);
      expect(ScanParameterBuilder.sampleDevices().length === 3).assertEqual(true);
      expect(result.scannerId).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010058 end');
    });

    /**
     * @tc.name   testParamStruct010059
     * @tc.number SUB_SCAN_PARAM_03_0059
     * @tc.desc   describe prints the frozen summary of ScanParameterBuilder.range(1, 1, 10, 90, 10)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010059 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(1, 1, 10, 90, 10))
      ).assertEqual('constraint=1 type=1 range=10..90/10 texts=0 ints=0');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(1, 1, 10, 90, 10)).indexOf('range=- ') >= 0
      ).assertEqual(false);
      expect(result.uniqueId).assertEqual('U1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010059 end');
    });

    /**
     * @tc.name   testParamStruct010060
     * @tc.number SUB_SCAN_PARAM_03_0060
     * @tc.desc   describe prints the frozen summary of ScanParameterBuilder.range(1, 2, 0, 1, 0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010060 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(1, 2, 0, 1, 0))
      ).assertEqual('constraint=1 type=2 range=0..1/0 texts=0 ints=0');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(1, 2, 0, 1, 0)).indexOf('range=- ') >= 0
      ).assertEqual(false);
      expect(result.uniqueId).assertEqual('U1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010060 end');
    });

    /**
     * @tc.name   testParamStruct010061
     * @tc.number SUB_SCAN_PARAM_03_0061
     * @tc.desc   describe prints the frozen summary of ScanParameterBuilder.range(0, 0, 5, 6, 7)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010061 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(0, 0, 5, 6, 7))
      ).assertEqual('constraint=0 type=0 range=- texts=0 ints=0');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(0, 0, 5, 6, 7)).indexOf('range=- ') >= 0
      ).assertEqual(true);
      expect(result.uniqueId).assertEqual('U1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010061 end');
    });

    /**
     * @tc.name   testParamStruct010062
     * @tc.number SUB_SCAN_PARAM_03_0062
     * @tc.desc   describe prints the frozen summary of ScanParameterBuilder.numberList([8, 9])
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010062 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.numberList([8, 9]))
      ).assertEqual('constraint=2 type=1 range=- texts=0 ints=2');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.numberList([8, 9])).indexOf('range=- ') >= 0
      ).assertEqual(true);
      expect(result.uniqueId).assertEqual('U1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010062 end');
    });

    /**
     * @tc.name   testParamStruct010063
     * @tc.number SUB_SCAN_PARAM_03_0063
     * @tc.desc   describe prints the frozen summary of ScanParameterBuilder.numberList([])
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010063 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.numberList([]))
      ).assertEqual('constraint=2 type=1 range=- texts=0 ints=0');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.numberList([])).indexOf('range=- ') >= 0
      ).assertEqual(true);
      expect(result.uniqueId).assertEqual('U1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010063 end');
    });

    /**
     * @tc.name   testParamStruct010064
     * @tc.number SUB_SCAN_PARAM_03_0064
     * @tc.desc   describe prints the frozen summary of ScanParameterBuilder.stringList([])
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010064 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.stringList([]))
      ).assertEqual('constraint=3 type=3 range=- texts=0 ints=0');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.stringList([])).indexOf('range=- ') >= 0
      ).assertEqual(true);
      expect(result.uniqueId).assertEqual('U1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010064 end');
    });

    /**
     * @tc.name   testParamStruct010065
     * @tc.number SUB_SCAN_PARAM_03_0065
     * @tc.desc   describe prints the frozen summary of ScanParameterBuilder.stringList(['only'])
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010065 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.stringList(['only']))
      ).assertEqual('constraint=3 type=3 range=- texts=1 ints=0');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.stringList(['only'])).indexOf('range=- ') >= 0
      ).assertEqual(true);
      expect(result.uniqueId).assertEqual('U1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010065 end');
    });

    /**
     * @tc.name   testParamStruct010066
     * @tc.number SUB_SCAN_PARAM_03_0066
     * @tc.desc   describe prints the frozen summary of ScanParameterBuilder.free(3)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010066 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.free(3))
      ).assertEqual('constraint=0 type=3 range=- texts=0 ints=0');
      expect(ScanParameterBuilder.describe(ScanParameterBuilder.free(3)).indexOf('range=- ') >= 0).assertEqual(true);
      expect(result.uniqueId).assertEqual('U1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010066 end');
    });

    /**
     * @tc.name   testParamStruct010067
     * @tc.number SUB_SCAN_PARAM_03_0067
     * @tc.desc   describe prints the frozen summary of ScanParameterBuilder.build(1, 0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010067 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.build(1, 0))
      ).assertEqual('constraint=1 type=0 range=- texts=0 ints=0');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.build(1, 0)).indexOf('range=- ') >= 0
      ).assertEqual(true);
      expect(result.uniqueId).assertEqual('U1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010067 end');
    });

    /**
     * @tc.name   testParamStruct010068
     * @tc.number SUB_SCAN_PARAM_03_0068
     * @tc.desc   describe prints the frozen summary of ScanParameterBuilder.intRange(0, 300, 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010068 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.intRange(0, 300, 1))
      ).assertEqual('constraint=1 type=1 range=0..300/1 texts=0 ints=0');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.intRange(0, 300, 1)).indexOf('range=- ') >= 0
      ).assertEqual(false);
      expect(result.uniqueId).assertEqual('U1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010068 end');
    });

    /**
     * @tc.name   testParamStruct010069
     * @tc.number SUB_SCAN_PARAM_03_0069
     * @tc.desc   describe prints the frozen summary of ScanParameterBuilder.fixedRange(-50, 50, 5)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010069 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.fixedRange(-50, 50, 5))
      ).assertEqual('constraint=1 type=2 range=-50..50/5 texts=0 ints=0');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.fixedRange(-50, 50, 5)).indexOf('range=- ') >= 0
      ).assertEqual(false);
      expect(result.uniqueId).assertEqual('U1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010069 end');
    });

    /**
     * @tc.name   testParamStruct010070
     * @tc.number SUB_SCAN_PARAM_03_0070
     * @tc.desc   describe prints the frozen summary of ScanParameterBuilder.range(3, 3, 0, 0, 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010070 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(3, 3, 0, 0, 1))
      ).assertEqual('constraint=3 type=3 range=- texts=0 ints=0');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(3, 3, 0, 0, 1)).indexOf('range=- ') >= 0
      ).assertEqual(true);
      expect(result.uniqueId).assertEqual('U1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010070 end');
    });

    /**
     * @tc.name   testParamStruct010071
     * @tc.number SUB_SCAN_PARAM_03_0071
     * @tc.desc   describe prints the frozen summary of ScanParameterBuilder.range(2, 1, 1, 2, 3)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010071 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(2, 1, 1, 2, 3))
      ).assertEqual('constraint=2 type=1 range=- texts=0 ints=0');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(2, 1, 1, 2, 3)).indexOf('range=- ') >= 0
      ).assertEqual(true);
      expect(result.uniqueId).assertEqual('U1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010071 end');
    });

    /**
     * @tc.name   testParamStruct010072
     * @tc.number SUB_SCAN_PARAM_03_0072
     * @tc.desc   describe prints the frozen summary of ScanParameterBuilder.param(7, "k", "t", "d", 2, 1, 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010072 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.param(7, "k", "t", "d", 2, 1, 1))
      ).assertEqual('constraint=1 type=1 range=- texts=0 ints=0');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.param(7, "k", "t", "d", 2, 1, 1)).indexOf('range=- ') >= 0
      ).assertEqual(true);
      expect(result.uniqueId).assertEqual('U1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010072 end');
    });

    /**
     * @tc.name   testParamStruct010073
     * @tc.number SUB_SCAN_PARAM_03_0073
     * @tc.desc   describe prints the frozen summary of ScanParameterBuilder.param(7, "k", "t", "d", 2, 0, 2)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010073 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.param(7, "k", "t", "d", 2, 0, 2))
      ).assertEqual('constraint=0 type=2 range=- texts=0 ints=0');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.param(7, "k", "t", "d", 2, 0, 2)).indexOf('range=- ') >= 0
      ).assertEqual(true);
      expect(result.uniqueId).assertEqual('U1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010073 end');
    });

    /**
     * @tc.name   testParamStruct010074
     * @tc.number SUB_SCAN_PARAM_03_0074
     * @tc.desc   describe prints the frozen summary of ScanParameterBuilder.param(7, "k", "t", "d", 5, 2, 3)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010074 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.param(7, "k", "t", "d", 5, 2, 3))
      ).assertEqual('constraint=2 type=3 range=- texts=0 ints=0');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.param(7, "k", "t", "d", 5, 2, 3)).indexOf('range=- ') >= 0
      ).assertEqual(true);
      expect(result.uniqueId).assertEqual('U1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010074 end');
    });

    /**
     * @tc.name   testParamStruct010075
     * @tc.number SUB_SCAN_PARAM_03_0075
     * @tc.desc   describe prints the frozen summary of ScanParameterBuilder.range(1, 0, 300, 0, 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010075 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(1, 0, 300, 0, 1))
      ).assertEqual('constraint=1 type=0 range=300..0/1 texts=0 ints=0');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(1, 0, 300, 0, 1)).indexOf('range=- ') >= 0
      ).assertEqual(false);
      expect(result.uniqueId).assertEqual('U1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010075 end');
    });

    /**
     * @tc.name   testParamStruct010076
     * @tc.number SUB_SCAN_PARAM_03_0076
     * @tc.desc   describe prints the frozen summary of ScanParameterBuilder.range(1, 3, 0, 0, 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010076 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(1, 3, 0, 0, 1))
      ).assertEqual('constraint=1 type=3 range=0..0/1 texts=0 ints=0');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.range(1, 3, 0, 0, 1)).indexOf('range=- ') >= 0
      ).assertEqual(false);
      expect(result.uniqueId).assertEqual('U1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010076 end');
    });

    /**
     * @tc.name   testParamStruct010077
     * @tc.number SUB_SCAN_PARAM_03_0077
     * @tc.desc   describe prints the frozen summary of ScanParameterBuilder.free(1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010077 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.free(1))
      ).assertEqual('constraint=0 type=1 range=- texts=0 ints=0');
      expect(ScanParameterBuilder.describe(ScanParameterBuilder.free(1)).indexOf('range=- ') >= 0).assertEqual(true);
      expect(result.uniqueId).assertEqual('U1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010077 end');
    });

    /**
     * @tc.name   testParamStruct010078
     * @tc.number SUB_SCAN_PARAM_03_0078
     * @tc.desc   describe prints the frozen summary of ScanParameterBuilder.free(2)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010078 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(
        ScanParameterBuilder.describe(ScanParameterBuilder.free(2))
      ).assertEqual('constraint=0 type=2 range=- texts=0 ints=0');
      expect(ScanParameterBuilder.describe(ScanParameterBuilder.free(2)).indexOf('range=- ') >= 0).assertEqual(true);
      expect(result.uniqueId).assertEqual('U1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010078 end');
    });

    /**
     * @tc.name   testParamStruct010079
     * @tc.number SUB_SCAN_PARAM_03_0079
     * @tc.desc   list helpers hand out 3 entries for the frozen call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010079 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(ScanParameterBuilder.sampleDevices().length).assertEqual(3);
      expect(result.scannerId).assertEqual('1');
      expect(String(result.discoveryMode)).assertEqual('TCP');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010079 end');
    });

    /**
     * @tc.name   testParamStruct010080
     * @tc.number SUB_SCAN_PARAM_03_0080
     * @tc.desc   list helpers hand out 0 entries for the frozen call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010080 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(ScanParameterBuilder.devices().length).assertEqual(0);
      expect(result.scannerId).assertEqual('1');
      expect(String(result.discoveryMode)).assertEqual('TCP');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010080 end');
    });

    /**
     * @tc.name   testParamStruct010081
     * @tc.number SUB_SCAN_PARAM_03_0081
     * @tc.desc   list helpers hand out 1 entries for the frozen call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010081 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(
        ScanParameterBuilder.devices(ScanParameterBuilder.device('1', 'u', '', '', '', 'TCP')).length
      ).assertEqual(1);
      expect(result.scannerId).assertEqual('1');
      expect(String(result.discoveryMode)).assertEqual('TCP');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010081 end');
    });

    /**
     * @tc.name   testParamStruct010082
     * @tc.number SUB_SCAN_PARAM_03_0082
     * @tc.desc   list helpers hand out 0 entries for the frozen call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010082 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(ScanParameterBuilder.syncList().length).assertEqual(0);
      expect(result.scannerId).assertEqual('1');
      expect(String(result.discoveryMode)).assertEqual('TCP');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010082 end');
    });

    /**
     * @tc.name   testParamStruct010083
     * @tc.number SUB_SCAN_PARAM_03_0083
     * @tc.desc   list helpers hand out 1 entries for the frozen call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010083 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(
        ScanParameterBuilder.syncList(ScanParameterBuilder.sync('1', 'u', 'TCP', 'update', '')).length
      ).assertEqual(1);
      expect(result.scannerId).assertEqual('1');
      expect(String(result.discoveryMode)).assertEqual('TCP');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010083 end');
    });

    /**
     * @tc.name   testParamStruct010084
     * @tc.number SUB_SCAN_PARAM_03_0084
     * @tc.desc   list helpers hand out 0 entries for the frozen call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010084 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(ScanParameterBuilder.noParams().length).assertEqual(0);
      expect(result.scannerId).assertEqual('1');
      expect(String(result.discoveryMode)).assertEqual('TCP');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010084 end');
    });

    /**
     * @tc.name   testParamStruct010085
     * @tc.number SUB_SCAN_PARAM_03_0085
     * @tc.desc   list helpers hand out 3 entries for the frozen call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010085 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(ScanParameterBuilder.sampleDevices().length).assertEqual(3);
      expect(result.scannerId).assertEqual('1');
      expect(String(result.discoveryMode)).assertEqual('TCP');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010085 end');
    });

    /**
     * @tc.name   testParamStruct010086
     * @tc.number SUB_SCAN_PARAM_03_0086
     * @tc.desc   list helpers hand out 0 entries for the frozen call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010086 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(ScanParameterBuilder.devices().length).assertEqual(0);
      expect(result.scannerId).assertEqual('1');
      expect(String(result.discoveryMode)).assertEqual('TCP');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010086 end');
    });

    /**
     * @tc.name   testParamStruct010087
     * @tc.number SUB_SCAN_PARAM_03_0087
     * @tc.desc   list helpers hand out 0 entries for the frozen call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010087 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(ScanParameterBuilder.syncList().length).assertEqual(0);
      expect(result.scannerId).assertEqual('1');
      expect(String(result.discoveryMode)).assertEqual('TCP');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010087 end');
    });

    /**
     * @tc.name   testParamStruct010088
     * @tc.number SUB_SCAN_PARAM_03_0088
     * @tc.desc   list helpers hand out 0 entries for the frozen call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010088 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(ScanParameterBuilder.noParams().length).assertEqual(0);
      expect(result.scannerId).assertEqual('1');
      expect(String(result.discoveryMode)).assertEqual('TCP');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010088 end');
    });

    /**
     * @tc.name   testParamStruct010089
     * @tc.number SUB_SCAN_PARAM_03_0089
     * @tc.desc   list helpers hand out 1 entries for the frozen call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010089 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(
        ScanParameterBuilder.devices(ScanParameterBuilder.device('9', 'u', '', '', '', 'TCP')).length
      ).assertEqual(1);
      expect(result.scannerId).assertEqual('1');
      expect(String(result.discoveryMode)).assertEqual('TCP');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010089 end');
    });

    /**
     * @tc.name   testParamStruct010090
     * @tc.number SUB_SCAN_PARAM_03_0090
     * @tc.desc   list helpers hand out 1 entries for the frozen call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParamStruct010090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010090 begin');
      const result: scan.ScannerDevice = ScanParameterBuilder.device('1', 'U1', '', '', '', 'TCP');
      expect(
        ScanParameterBuilder.syncList(ScanParameterBuilder.sync('3', 'w', 'TCP', 'update', '')).length
      ).assertEqual(1);
      expect(result.scannerId).assertEqual('1');
      expect(String(result.discoveryMode)).assertEqual('TCP');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParamStruct010090 end');
    });

  });
}
