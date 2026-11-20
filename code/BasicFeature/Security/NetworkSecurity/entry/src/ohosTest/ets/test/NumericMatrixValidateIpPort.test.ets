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
import { ValidateUtils } from 'library';

const DOMAIN: number = 0xF811;

// Registers the numeric matrix test suite for the ip and port validation helpers.
export default function numericMatrixValidateIpPortTest() {
  describe('NumericMatrixValidateIpPortSuite', () => {
    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_0100
     * @tc.name      testNumValIpPort0001
     * @tc.desc      Verify isValidIPv4 accepts the all-zero unspecified dotted quad.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // 0.0.0.0 pins every octet at the numeric lower bound zero.
      expect(ValidateUtils.isValidIPv4('0.0.0.0')).assertTrue();
      // Keeping the first three octets at zero and moving the last to 1 stays inside 0 to 255.
      expect(ValidateUtils.isValidIPv4('0.0.0.1')).assertTrue();
      // The dotted quad text is rejected by the IPv6 checker because dots are not hex groups.
      expect(ValidateUtils.isValidIPv6('0.0.0.0')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_0200
     * @tc.name      testNumValIpPort0002
     * @tc.desc      Verify isValidIPv4 accepts the all-ones broadcast quad at the octet ceiling.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // 255.255.255.255 pins every octet exactly on the numeric upper bound 255.
      expect(ValidateUtils.isValidIPv4('255.255.255.255')).assertTrue();
      // Lowering the last octet from 255 to 254 stays inside the accepted range.
      expect(ValidateUtils.isValidIPv4('255.255.255.254')).assertTrue();
      // Raising one octet to 256 breaks the 0 to 255 numeric range.
      expect(ValidateUtils.isValidIPv4('256.255.255.255')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_0300
     * @tc.name      testNumValIpPort0003
     * @tc.desc      Verify isValidIPv4 accepts the IPv4 loopback address 127.0.0.1.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // 127.0.0.1 mixes boundary octets 127, 0, 0 and 1 inside the valid range.
      expect(ValidateUtils.isValidIPv4('127.0.0.1')).assertTrue();
      // Incrementing the last octet to 2 keeps the loopback-shaped quad valid.
      expect(ValidateUtils.isValidIPv4('127.0.0.2')).assertTrue();
      // Two octets are not a dotted quad, so 127.1 is rejected.
      expect(ValidateUtils.isValidIPv4('127.1')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_0400
     * @tc.name      testNumValIpPort0004
     * @tc.desc      Verify isValidIPv4 accepts the public resolver quad 8.8.8.8 and neighbours.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // 8.8.8.8 repeats a small single-digit octet four times.
      expect(ValidateUtils.isValidIPv4('8.8.8.8')).assertTrue();
      // 8.8.4.4 mixes the repeated 8 and 4 octets into one valid quad.
      expect(ValidateUtils.isValidIPv4('8.8.4.4')).assertTrue();
      // A neighbour quad 8.8.8.9 with the last octet incremented is still valid.
      expect(ValidateUtils.isValidIPv4('8.8.8.9')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_0500
     * @tc.name      testNumValIpPort0005
     * @tc.desc      Verify isValidIPv4 accepts a typical private LAN quad 192.168.1.100.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // 192.168.1.100 is a common home network host address.
      expect(ValidateUtils.isValidIPv4('192.168.1.100')).assertTrue();
      // 192.168.0.0 keeps the network base with zero host octets.
      expect(ValidateUtils.isValidIPv4('192.168.0.0')).assertTrue();
      // Three octets are one short of a quad, so 192.168.1 fails.
      expect(ValidateUtils.isValidIPv4('192.168.1')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_0600
     * @tc.name      testNumValIpPort0006
     * @tc.desc      Verify isValidIPv4 accepts 10.x private quads near the octet ceiling.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // 10.0.0.1 mixes small octets with two boundary-zero octets.
      expect(ValidateUtils.isValidIPv4('10.0.0.1')).assertTrue();
      // 10.255.255.254 mixes zero, ceiling and near-ceiling octets.
      expect(ValidateUtils.isValidIPv4('10.255.255.254')).assertTrue();
      // An octet of 256 exceeds the 0 to 255 numeric limit.
      expect(ValidateUtils.isValidIPv4('10.0.0.256')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_0700
     * @tc.name      testNumValIpPort0007
     * @tc.desc      Verify isValidIPv4 accepts 172.16 and 172.32 style private quads.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // 172.16.254.1 combines a mid octet with a near-ceiling octet.
      expect(ValidateUtils.isValidIPv4('172.16.254.1')).assertTrue();
      // 172.31.255.255 pushes two octets to the exact ceiling 255.
      expect(ValidateUtils.isValidIPv4('172.31.255.255')).assertTrue();
      // 172.32.0.0 steps the second octet just past 31 with no numeric issue.
      expect(ValidateUtils.isValidIPv4('172.32.0.0')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_0800
     * @tc.name      testNumValIpPort0008
     * @tc.desc      Verify isValidIPv4 accepts link-local 169.254.x.x style quads.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // 169.254.1.1 is a minimal link-local style quad.
      expect(ValidateUtils.isValidIPv4('169.254.1.1')).assertTrue();
      // 169.254.169.254 repeats the famous metadata endpoint digits.
      expect(ValidateUtils.isValidIPv4('169.254.169.254')).assertTrue();
      // 169.255.0.0 steps the second octet to 255 and keeps two zeros.
      expect(ValidateUtils.isValidIPv4('169.255.0.0')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_0900
     * @tc.name      testNumValIpPort0009
     * @tc.desc      Verify isValidIPv4 accepts multicast 224 to 239 and 240 style quads.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // 224.0.0.1 is the first multicast group number with zero octets.
      expect(ValidateUtils.isValidIPv4('224.0.0.1')).assertTrue();
      // 239.255.255.255 tops the multicast block with three ceiling octets.
      expect(ValidateUtils.isValidIPv4('239.255.255.255')).assertTrue();
      // 240.0.0.1 sits just past the multicast range and stays numerically valid.
      expect(ValidateUtils.isValidIPv4('240.0.0.1')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_1000
     * @tc.name      testNumValIpPort0010
     * @tc.desc      Verify isValidIPv4 accepts carrier grade NAT 100.64.0.0/10 style quads.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // 100.64.7.9 is a carrier grade NAT host address.
      expect(ValidateUtils.isValidIPv4('100.64.7.9')).assertTrue();
      // 100.63.255.255 sits one step below the CGNAT block start.
      expect(ValidateUtils.isValidIPv4('100.63.255.255')).assertTrue();
      // 100.65.0.0 sits one step above the CGNAT block start.
      expect(ValidateUtils.isValidIPv4('100.65.0.0')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_1100
     * @tc.name      testNumValIpPort0011
     * @tc.desc      Verify isValidIPv4 accepts documentation TEST-NET quads.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // 198.51.100.7 is a TEST-NET-2 documentation address.
      expect(ValidateUtils.isValidIPv4('198.51.100.7')).assertTrue();
      // 203.0.113.9 is a TEST-NET-3 documentation address.
      expect(ValidateUtils.isValidIPv4('203.0.113.9')).assertTrue();
      // 192.0.2.55 is a TEST-NET-1 documentation address.
      expect(ValidateUtils.isValidIPv4('192.0.2.55')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_1200
     * @tc.name      testNumValIpPort0012
     * @tc.desc      Verify isValidIPv4 accepts descending near-ceiling octets and mixed quads.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // 254.253.252.251 walks four octets down from the ceiling.
      expect(ValidateUtils.isValidIPv4('254.253.252.251')).assertTrue();
      // 250.251.252.253 walks four octets up towards the ceiling.
      expect(ValidateUtils.isValidIPv4('250.251.252.253')).assertTrue();
      // 255.0.0.0 alternates the ceiling octet with three zero octets.
      expect(ValidateUtils.isValidIPv4('255.0.0.0')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_1300
     * @tc.name      testNumValIpPort0013
     * @tc.desc      Verify isValidIPv4 accepts quads built around the 128 boundary.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // 128.0.0.1 starts at the half-range octet and ends at one.
      expect(ValidateUtils.isValidIPv4('128.0.0.1')).assertTrue();
      // 128.128.128.128 repeats the half-range octet in every position.
      expect(ValidateUtils.isValidIPv4('128.128.128.128')).assertTrue();
      // 127.255.255.255 ends the 127 block with three ceiling octets.
      expect(ValidateUtils.isValidIPv4('127.255.255.255')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_1400
     * @tc.name      testNumValIpPort0014
     * @tc.desc      Verify isValidIPv4 accepts ascending digit and repeated digit quads.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // 12.34.56.78 uses four different two-digit octets in ascending order.
      expect(ValidateUtils.isValidIPv4('12.34.56.78')).assertTrue();
      // 199.199.199.199 repeats a near-ceiling two-digit octet four times.
      expect(ValidateUtils.isValidIPv4('199.199.199.199')).assertTrue();
      // 111.222.33.44 alternates repeated one and two digit octets.
      expect(ValidateUtils.isValidIPv4('111.222.33.44')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_1500
     * @tc.name      testNumValIpPort0015
     * @tc.desc      Verify isValidIPv4 accepts three digit octets with leading zeros.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // 001.002.003.004 parses as 1.2.3.4 once leading zeros are dropped.
      expect(ValidateUtils.isValidIPv4('001.002.003.004')).assertTrue();
      // 000.000.000.000 parses every octet down to numeric zero.
      expect(ValidateUtils.isValidIPv4('000.000.000.000')).assertTrue();
      // 010.020.030.040 parses as 10.20.30.40 with single leading zeros.
      expect(ValidateUtils.isValidIPv4('010.020.030.040')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_1600
     * @tc.name      testNumValIpPort0016
     * @tc.desc      Verify isValidIPv4 accepts descending zero padded octet quads.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // 099.100.101.102 walks up from the padded 99 octet.
      expect(ValidateUtils.isValidIPv4('099.100.101.102')).assertTrue();
      // 099.010.001.000 walks down to the padded zero octet.
      expect(ValidateUtils.isValidIPv4('099.010.001.000')).assertTrue();
      // 007.008.009.010 keeps every octet below ten with padding.
      expect(ValidateUtils.isValidIPv4('007.008.009.010')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_1700
     * @tc.name      testNumValIpPort0017
     * @tc.desc      Verify isValidIPv4 accepts quads whose last octets carry leading zeros.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // 1.2.3.04 pads only the final octet with one zero digit.
      expect(ValidateUtils.isValidIPv4('1.2.3.04')).assertTrue();
      // 1.02.3.4 pads the second octet with one zero digit.
      expect(ValidateUtils.isValidIPv4('1.02.3.4')).assertTrue();
      // 1.2.3.000 pads the final octet down to numeric zero.
      expect(ValidateUtils.isValidIPv4('1.2.3.000')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_1800
     * @tc.name      testNumValIpPort0018
     * @tc.desc      Verify isValidIPv4 accepts mixed padding inside a private quad.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // 192.168.001.001 pads the last two octets to three digits.
      expect(ValidateUtils.isValidIPv4('192.168.001.001')).assertTrue();
      // 192.168.01.1 pads only the third octet to two digits.
      expect(ValidateUtils.isValidIPv4('192.168.01.1')).assertTrue();
      // The unpadded base form 192.168.1.1 stays valid for comparison.
      expect(ValidateUtils.isValidIPv4('192.168.1.1')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_1900
     * @tc.name      testNumValIpPort0019
     * @tc.desc      Verify isValidIPv4 accepts quads alternating zero and ceiling octets.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // 0.0.0.255 keeps three zero octets and one ceiling octet.
      expect(ValidateUtils.isValidIPv4('0.0.0.255')).assertTrue();
      // 255.255.0.0 keeps two ceiling octets and two zero octets.
      expect(ValidateUtils.isValidIPv4('255.255.0.0')).assertTrue();
      // 0.255.0.255 alternates zero and ceiling octets in every slot.
      expect(ValidateUtils.isValidIPv4('0.255.0.255')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_2000
     * @tc.name      testNumValIpPort0020
     * @tc.desc      Verify isValidIPv4 accepts the highest last octet and single digit quads.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // 1.2.3.255 puts the numeric ceiling in the final octet slot.
      expect(ValidateUtils.isValidIPv4('1.2.3.255')).assertTrue();
      // 254.0.0.1 puts a near-ceiling first octet with a one octet last.
      expect(ValidateUtils.isValidIPv4('254.0.0.1')).assertTrue();
      // 9.9.9.9 repeats the largest single digit octet four times.
      expect(ValidateUtils.isValidIPv4('9.9.9.9')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_2100
     * @tc.name      testNumValIpPort0021
     * @tc.desc      Verify isValidIPv4 rejects quads with octet 256 in early positions.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The first octet one above the ceiling breaks the 0 to 255 range.
      expect(ValidateUtils.isValidIPv4('256.1.1.1')).assertFalse();
      // The second octet one above the ceiling is also rejected.
      expect(ValidateUtils.isValidIPv4('1.256.1.1')).assertFalse();
      // The third octet one above the ceiling is likewise rejected.
      expect(ValidateUtils.isValidIPv4('1.1.256.1')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_2200
     * @tc.name      testNumValIpPort0022
     * @tc.desc      Verify isValidIPv4 rejects quads with octet 256 in later positions.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The final octet one above the ceiling breaks the numeric range.
      expect(ValidateUtils.isValidIPv4('1.1.1.256')).assertFalse();
      // A single 256 octet after three ceiling octets is still rejected.
      expect(ValidateUtils.isValidIPv4('255.255.255.256')).assertFalse();
      // Four 256 octets fail together as every slot is out of range.
      expect(ValidateUtils.isValidIPv4('256.256.256.256')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_2300
     * @tc.name      testNumValIpPort0023
     * @tc.desc      Verify isValidIPv4 rejects three digit octets above 255.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // 999 matches the three digit shape but is far above 255.
      expect(ValidateUtils.isValidIPv4('999.1.1.1')).assertFalse();
      // 1.999.1.1 hides the out of range octet in the second slot.
      expect(ValidateUtils.isValidIPv4('1.999.1.1')).assertFalse();
      // 300.1.1.1 is just above the ceiling and must be rejected.
      expect(ValidateUtils.isValidIPv4('300.1.1.1')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_2400
     * @tc.name      testNumValIpPort0024
     * @tc.desc      Verify isValidIPv4 rejects four digit octets that exceed the digit budget.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0024';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // 1234 has four digits, one more than the 1 to 3 digit octet rule.
      expect(ValidateUtils.isValidIPv4('1234.1.1.1')).assertFalse();
      // A four digit octet in the second slot also fails the shape rule.
      expect(ValidateUtils.isValidIPv4('1.1234.1.1')).assertFalse();
      // A four digit octet in the final slot is rejected the same way.
      expect(ValidateUtils.isValidIPv4('1.1.1.1234')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_2500
     * @tc.name      testNumValIpPort0025
     * @tc.desc      Verify isValidIPv4 rejects texts with fewer than four octets.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0025';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Three octets are one dot short of a full quad.
      expect(ValidateUtils.isValidIPv4('1.2.3')).assertFalse();
      // Two octets leave two numeric slots missing.
      expect(ValidateUtils.isValidIPv4('1.2')).assertFalse();
      // A single octet is nowhere near a dotted quad.
      expect(ValidateUtils.isValidIPv4('1')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_2600
     * @tc.name      testNumValIpPort0026
     * @tc.desc      Verify isValidIPv4 rejects texts with more than four octets.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0026';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Five octets carry one slot more than the quad shape allows.
      expect(ValidateUtils.isValidIPv4('1.2.3.4.5')).assertFalse();
      // Six octets are two slots over the quad shape.
      expect(ValidateUtils.isValidIPv4('1.2.3.4.5.6')).assertFalse();
      // Five zero octets fail even though every value is in range.
      expect(ValidateUtils.isValidIPv4('0.0.0.0.0')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_2700
     * @tc.name      testNumValIpPort0027
     * @tc.desc      Verify isValidIPv4 rejects empty, blank and dot only texts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0027';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The empty string carries no octets at all.
      expect(ValidateUtils.isValidIPv4('')).assertFalse();
      // A single space is not a numeric octet.
      expect(ValidateUtils.isValidIPv4(' ')).assertFalse();
      // A lone dot is just a separator without any octet.
      expect(ValidateUtils.isValidIPv4('.')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_2800
     * @tc.name      testNumValIpPort0028
     * @tc.desc      Verify isValidIPv4 rejects quads with empty octets between dots.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0028';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two dots in a row leave the second octet empty.
      expect(ValidateUtils.isValidIPv4('1..2.3')).assertFalse();
      // Empty third octet fails the same way.
      expect(ValidateUtils.isValidIPv4('1.2..3')).assertFalse();
      // Two empty octets break the shape twice over.
      expect(ValidateUtils.isValidIPv4('1..2..3')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_2900
     * @tc.name      testNumValIpPort0029
     * @tc.desc      Verify isValidIPv4 rejects quads with leading or trailing dots.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0029';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A leading dot leaves the first octet empty.
      expect(ValidateUtils.isValidIPv4('.1.2.3')).assertFalse();
      // A trailing dot leaves the fourth octet empty.
      expect(ValidateUtils.isValidIPv4('1.2.3.')).assertFalse();
      // Dots on both ends leave two octets empty.
      expect(ValidateUtils.isValidIPv4('.1.2.3.')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_3000
     * @tc.name      testNumValIpPort0030
     * @tc.desc      Verify isValidIPv4 rejects quads built from letters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0030';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Four letter labels carry no numeric octets at all.
      expect(ValidateUtils.isValidIPv4('a.b.c.d')).assertFalse();
      // One letter octet among digits breaks the digit only rule.
      expect(ValidateUtils.isValidIPv4('1.a.2.3')).assertFalse();
      // Alternating letters and digits still fails on the letter slots.
      expect(ValidateUtils.isValidIPv4('a.1.b.2')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_3100
     * @tc.name      testNumValIpPort0031
     * @tc.desc      Verify isValidIPv4 rejects octets with a leading minus sign.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0031';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A minus sign in the first octet is not a digit.
      expect(ValidateUtils.isValidIPv4('-1.2.3.4')).assertFalse();
      // A minus sign in the second octet breaks the digit only shape.
      expect(ValidateUtils.isValidIPv4('1.-2.3.4')).assertFalse();
      // A minus sign in the final octet fails the same way.
      expect(ValidateUtils.isValidIPv4('1.2.3.-4')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_3200
     * @tc.name      testNumValIpPort0032
     * @tc.desc      Verify isValidIPv4 rejects octets with a leading plus sign.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0032';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A plus sign in the first octet is outside the digit alphabet.
      expect(ValidateUtils.isValidIPv4('+1.2.3.4')).assertFalse();
      // A plus sign in the second octet is rejected as well.
      expect(ValidateUtils.isValidIPv4('1.+2.3.4')).assertFalse();
      // A plus sign in the third octet breaks the octet shape.
      expect(ValidateUtils.isValidIPv4('1.2.+3.4')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_3300
     * @tc.name      testNumValIpPort0033
     * @tc.desc      Verify isValidIPv4 rejects quads surrounded or broken by spaces.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0033';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One trailing space after the last octet breaks the anchored match.
      expect(ValidateUtils.isValidIPv4('1.2.3.4' + ' ')).assertFalse();
      // One leading space before the first octet breaks the anchored match.
      expect(ValidateUtils.isValidIPv4(' ' + '1.2.3.4')).assertFalse();
      // A space inside the octet list breaks the digit sequence.
      expect(ValidateUtils.isValidIPv4('1. 2.3.4')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_3400
     * @tc.name      testNumValIpPort0034
     * @tc.desc      Verify isValidIPv4 rejects comma, semicolon and letter suffix forms.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0034';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Commas replace the required dot separators.
      expect(ValidateUtils.isValidIPv4('1,2,3,4')).assertFalse();
      // A semicolon breaks the third octet slot.
      expect(ValidateUtils.isValidIPv4('1;2.3.4')).assertFalse();
      // A letter after the final octet breaks the anchored end.
      expect(ValidateUtils.isValidIPv4('1.2.3.4x')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_3500
     * @tc.name      testNumValIpPort0035
     * @tc.desc      Verify isValidIPv4 rejects host names that look like addresses.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0035';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A host word has no dots and no numeric octets.
      expect(ValidateUtils.isValidIPv4('localhost')).assertFalse();
      // Three word labels are not four numeric octets.
      expect(ValidateUtils.isValidIPv4('ip.version.four')).assertFalse();
      // A letter octet inside a private quad defeats the numeric check.
      expect(ValidateUtils.isValidIPv4('192.168.o.1')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_3600
     * @tc.name      testNumValIpPort0036
     * @tc.desc      Verify isValidIPv4 rejects quads decorated with colons or a prefix length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0036';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A trailing colon after the final octet breaks the anchor.
      expect(ValidateUtils.isValidIPv4('1.2.3.4:')).assertFalse();
      // A leading colon before the first octet breaks the anchor.
      expect(ValidateUtils.isValidIPv4(':1.2.3.4')).assertFalse();
      // A CIDR suffix 24 is not part of a bare dotted quad.
      expect(ValidateUtils.isValidIPv4('1.2.3.4/24')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_3700
     * @tc.name      testNumValIpPort0037
     * @tc.desc      Verify isValidIPv4 rejects hexadecimal style octets.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0037';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A 0x prefix is not part of the decimal octet alphabet.
      expect(ValidateUtils.isValidIPv4('0x1.2.3.4')).assertFalse();
      // A 0x suffix inside the last octet breaks the digit run.
      expect(ValidateUtils.isValidIPv4('1.2.3.0x4')).assertFalse();
      // Hex letters ff are not decimal digits.
      expect(ValidateUtils.isValidIPv4('ff.ff.ff.ff')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_3800
     * @tc.name      testNumValIpPort0038
     * @tc.desc      Verify isValidIPv4 rejects five octet texts with zero padded digits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0038';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A fifth zero octet is one slot too many.
      expect(ValidateUtils.isValidIPv4('1.2.3.4.0')).assertFalse();
      // Five padded octets still exceed the four slot quad.
      expect(ValidateUtils.isValidIPv4('01.2.3.4.05')).assertFalse();
      // Five padded octets of other values fail the same count rule.
      expect(ValidateUtils.isValidIPv4('1.02.3.004.5')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_3900
     * @tc.name      testNumValIpPort0039
     * @tc.desc      Verify isValidIPv4 rejects truncated and trailing symbol octets.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0039';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A trailing minus sign is not a numeric octet.
      expect(ValidateUtils.isValidIPv4('2.5.6.-')).assertFalse();
      // Two octets are two slots short of a quad.
      expect(ValidateUtils.isValidIPv4('25.6')).assertFalse();
      // Seven octets are three slots over the quad shape.
      expect(ValidateUtils.isValidIPv4('2.5.6.7.8.9.10')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_4000
     * @tc.name      testNumValIpPort0040
     * @tc.desc      Verify isValidIPv4 rejects octets that are too large or too long.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0040';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // 4000 has four digits and exceeds the octet rule twice over.
      expect(ValidateUtils.isValidIPv4('1.2.3.4000')).assertFalse();
      // 300 is a three digit value above the 255 ceiling.
      expect(ValidateUtils.isValidIPv4('1.2.300.4')).assertFalse();
      // 0300 pads a value that is still above the ceiling.
      expect(ValidateUtils.isValidIPv4('1.2.3.0300')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_4100
     * @tc.name      testNumValIpPort0041
     * @tc.desc      Verify isValidIPv6 accepts the unspecified address and small loopbacks.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0041';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The bare compression '::' is the IPv6 unspecified address.
      expect(ValidateUtils.isValidIPv6('::')).assertTrue();
      // '::1' compresses the loopback address down to one group.
      expect(ValidateUtils.isValidIPv6('::1')).assertTrue();
      // '::2' keeps the same compressed shape with group two.
      expect(ValidateUtils.isValidIPv6('::2')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_4200
     * @tc.name      testNumValIpPort0042
     * @tc.desc      Verify isValidIPv6 accepts prefix forms that end with the compression.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0042';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // fe80:: compresses the link-local prefix to one group.
      expect(ValidateUtils.isValidIPv6('fe80::')).assertTrue();
      // 2001:db8:: compresses the documentation prefix to two groups.
      expect(ValidateUtils.isValidIPv6('2001:db8::')).assertTrue();
      // 1:: compresses a single one group prefix.
      expect(ValidateUtils.isValidIPv6('1::')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_4300
     * @tc.name      testNumValIpPort0043
     * @tc.desc      Verify isValidIPv6 accepts long prefixes ending with compression.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0043';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Seven explicit groups followed by '::' fill the prefix slots.
      expect(ValidateUtils.isValidIPv6('1:2:3:4:5:6:7::')).assertTrue();
      // Six explicit groups followed by '::' leave two slots compressed.
      expect(ValidateUtils.isValidIPv6('1:2:3:4:5:6::')).assertTrue();
      // Four explicit groups followed by '::' leave four slots compressed.
      expect(ValidateUtils.isValidIPv6('1:2:3:4::')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_4400
     * @tc.name      testNumValIpPort0044
     * @tc.desc      Verify isValidIPv6 accepts full eight group documentation forms.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0044';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // 2001:db8:0:0:0:0:0:1 is the uncompressed documentation loopback.
      expect(ValidateUtils.isValidIPv6('2001:db8:0:0:0:0:0:1')).assertTrue();
      // 2001:db8:0:0:1:0:0:1 moves a one group into the middle.
      expect(ValidateUtils.isValidIPv6('2001:db8:0:0:1:0:0:1')).assertTrue();
      // 0:0:0:0:0:0:0:1 is the fully spelled unspecified loopback.
      expect(ValidateUtils.isValidIPv6('0:0:0:0:0:0:0:1')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_4500
     * @tc.name      testNumValIpPort0045
     * @tc.desc      Verify isValidIPv6 accepts extreme zero and ffff full forms.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0045';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Eight zero groups form the fully spelled unspecified address.
      expect(ValidateUtils.isValidIPv6('0:0:0:0:0:0:0:0')).assertTrue();
      // Eight ffff groups pin every group at the hex ceiling.
      expect(ValidateUtils.isValidIPv6('ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff')).assertTrue();
      // Seven zero groups end with a ffff group at the ceiling.
      expect(ValidateUtils.isValidIPv6('0:0:0:0:0:0:0:ffff')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_4600
     * @tc.name      testNumValIpPort0046
     * @tc.desc      Verify isValidIPv6 accepts full forms in upper lower and mixed case.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0046';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Upper case hex digits are accepted in all eight groups.
      expect(ValidateUtils.isValidIPv6('ABCD:EF01:2345:6789:ABCD:EF01:2345:6789')).assertTrue();
      // Lower case hex digits are accepted in all eight groups.
      expect(ValidateUtils.isValidIPv6('abcd:ef01:2345:6789:abcd:ef01:2345:6789')).assertTrue();
      // Mixed case hex digits are accepted group by group.
      expect(ValidateUtils.isValidIPv6('AbCd:Ef01:2345:6789:ABcd:EF01:2345:6789')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_4700
     * @tc.name      testNumValIpPort0047
     * @tc.desc      Verify isValidIPv6 accepts the classic compressed example address.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0047';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // 2001:DB8::8:800:200C:417A compresses the middle zero groups.
      expect(ValidateUtils.isValidIPv6('2001:DB8::8:800:200C:417A')).assertTrue();
      // The lower case spelling of the same address is also valid.
      expect(ValidateUtils.isValidIPv6('2001:db8::8:800:200c:417a')).assertTrue();
      // Neighbour digits 9 and 417b keep the same compressed shape valid.
      expect(ValidateUtils.isValidIPv6('2001:db8::9:800:200c:417b')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_4800
     * @tc.name      testNumValIpPort0048
     * @tc.desc      Verify isValidIPv6 accepts short link-local compressed forms.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0048';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // fe80::1 compresses the middle of the link-local address.
      expect(ValidateUtils.isValidIPv6('fe80::1')).assertTrue();
      // fe80::a uses the single hex digit group a.
      expect(ValidateUtils.isValidIPv6('fe80::a')).assertTrue();
      // FE80::F uses upper case prefix and suffix digits.
      expect(ValidateUtils.isValidIPv6('FE80::F')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_4900
     * @tc.name      testNumValIpPort0049
     * @tc.desc      Verify isValidIPv6 accepts compression followed by seven groups.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0049';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // '::1:2:3:4:5:6:7' compresses the first group slot.
      expect(ValidateUtils.isValidIPv6('::1:2:3:4:5:6:7')).assertTrue();
      // '::0:0:0:0:0:0:0' compresses the first slot of all zero groups.
      expect(ValidateUtils.isValidIPv6('::0:0:0:0:0:0:0')).assertTrue();
      // '::ffff:0:0' compresses the leading slots of the mapped prefix.
      expect(ValidateUtils.isValidIPv6('::ffff:0:0')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_5000
     * @tc.name      testNumValIpPort0050
     * @tc.desc      Verify isValidIPv6 accepts full forms padded to four digits per group.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0050';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Every group padded to four digits stays a valid full form.
      expect(ValidateUtils.isValidIPv6('2001:0db8:0000:0000:0000:0000:0000:0001')).assertTrue();
      // Eight padded zero groups form the padded unspecified address.
      expect(ValidateUtils.isValidIPv6('0000:0000:0000:0000:0000:0000:0000:0000')).assertTrue();
      // Padded ffff and aaaa groups alternate in the full form.
      expect(ValidateUtils.isValidIPv6('ffff:0000:aaaa:1111:ffff:0000:aaaa:1111')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_5100
     * @tc.name      testNumValIpPort0051
     * @tc.desc      Verify isValidIPv6 accepts compression between long prefixes and one group.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0051';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Six groups then '::' then one group balances the eight slots.
      expect(ValidateUtils.isValidIPv6('1:2:3:4:5:6::7')).assertTrue();
      // Five groups then '::' then one group leaves two slots empty.
      expect(ValidateUtils.isValidIPv6('1:2:3:4:5::7')).assertTrue();
      // Three groups then '::' then one group leaves four slots empty.
      expect(ValidateUtils.isValidIPv6('1:2:3::7')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_5200
     * @tc.name      testNumValIpPort0052
     * @tc.desc      Verify isValidIPv6 accepts compression with two trailing groups.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0052';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two groups then '::' then two groups fill four numeric slots.
      expect(ValidateUtils.isValidIPv6('1:2::7:8')).assertTrue();
      // Three groups then '::' then two groups fill five numeric slots.
      expect(ValidateUtils.isValidIPv6('1:2:3::7:8')).assertTrue();
      // Four groups then '::' then two groups fill six numeric slots.
      expect(ValidateUtils.isValidIPv6('1:2:3:4::7:8')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_5300
     * @tc.name      testNumValIpPort0053
     * @tc.desc      Verify isValidIPv6 accepts compression with three trailing groups.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0053';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Five groups then '::' then three groups total eight slots.
      expect(ValidateUtils.isValidIPv6('1:2:3:4:5::7:8')).assertTrue();
      // Four groups then '::' then three groups total seven explicit slots.
      expect(ValidateUtils.isValidIPv6('1:2:3:4::6:7:8')).assertTrue();
      // Two groups then '::' then three groups compress four slots.
      expect(ValidateUtils.isValidIPv6('1:2::6:7:8')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_5400
     * @tc.name      testNumValIpPort0054
     * @tc.desc      Verify isValidIPv6 accepts single letter groups around compression.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0054';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // a::b compresses everything between two single digit groups.
      expect(ValidateUtils.isValidIPv6('a::b')).assertTrue();
      // a:b::c compresses the tail after two letter groups.
      expect(ValidateUtils.isValidIPv6('a:b::c')).assertTrue();
      // a:b:c::d compresses the tail after three letter groups.
      expect(ValidateUtils.isValidIPv6('a:b:c::d')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_5500
     * @tc.name      testNumValIpPort0055
     * @tc.desc      Verify isValidIPv6 accepts hex word groups in both cases.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0055';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // dead::beef spells two four digit hex groups around compression.
      expect(ValidateUtils.isValidIPv6('dead::beef')).assertTrue();
      // DEAD::BEEF uses upper case spellings of the same groups.
      expect(ValidateUtils.isValidIPv6('DEAD::BEEF')).assertTrue();
      // d::e compresses between two single hex digit groups.
      expect(ValidateUtils.isValidIPv6('d::e')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_5600
     * @tc.name      testNumValIpPort0056
     * @tc.desc      Verify isValidIPv6 rejects empty blank and lone colon texts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0056';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The empty string carries no groups at all.
      expect(ValidateUtils.isValidIPv6('')).assertFalse();
      // A blank space is not a hex group.
      expect(ValidateUtils.isValidIPv6(' ')).assertFalse();
      // A single colon is one separator short of '::'.
      expect(ValidateUtils.isValidIPv6(':')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_5700
     * @tc.name      testNumValIpPort0057
     * @tc.desc      Verify isValidIPv6 rejects nine or more uncompressed groups.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0057';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Nine groups are one slot over the eight group limit.
      expect(ValidateUtils.isValidIPv6('1:2:3:4:5:6:7:8:9')).assertFalse();
      // Ten groups are two slots over the limit.
      expect(ValidateUtils.isValidIPv6('1:2:3:4:5:6:7:8:9:10')).assertFalse();
      // Nine zero groups fail even though each value is valid.
      expect(ValidateUtils.isValidIPv6('0:0:0:0:0:0:0:0:0')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_5800
     * @tc.name      testNumValIpPort0058
     * @tc.desc      Verify isValidIPv6 rejects short uncompressed group counts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0058';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Seven groups without compression leave one slot unfilled.
      expect(ValidateUtils.isValidIPv6('1:2:3:4:5:6:7')).assertFalse();
      // Six groups without compression leave two slots unfilled.
      expect(ValidateUtils.isValidIPv6('1:2:3:4:5:6')).assertFalse();
      // Two groups without compression are far below the required eight.
      expect(ValidateUtils.isValidIPv6('1:2')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_5900
     * @tc.name      testNumValIpPort0059
     * @tc.desc      Verify isValidIPv6 rejects uncompressed forms with a trailing colon.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0059';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Eight groups plus a dangling colon overshoot the group budget.
      expect(ValidateUtils.isValidIPv6('1:2:3:4:5:6:7:8:')).assertFalse();
      // Six groups plus a dangling colon do not form a valid compression.
      expect(ValidateUtils.isValidIPv6('1:2:3:4:5:6:')).assertFalse();
      // Five groups plus a dangling colon stay invalid as well.
      expect(ValidateUtils.isValidIPv6('1:2:3:4:5:')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_6000
     * @tc.name      testNumValIpPort0060
     * @tc.desc      Verify isValidIPv6 rejects double compression markers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0060';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two '::' markers in one address are not allowed.
      expect(ValidateUtils.isValidIPv6('1::2::3')).assertFalse();
      // A trailing '::' after a compressed middle is a second compression.
      expect(ValidateUtils.isValidIPv6('1::2::')).assertFalse();
      // Three letter groups with two compressions fail the same rule.
      expect(ValidateUtils.isValidIPv6('a::b::c')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_6100
     * @tc.name      testNumValIpPort0061
     * @tc.desc      Verify isValidIPv6 rejects groups longer than four hex digits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0061';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // 12345 has five hex digits, one over the group width limit.
      expect(ValidateUtils.isValidIPv6('12345::')).assertFalse();
      // 23456 as a middle group also breaks the width limit.
      expect(ValidateUtils.isValidIPv6('1:23456::')).assertFalse();
      // A five digit group after compression is rejected too.
      expect(ValidateUtils.isValidIPv6('::12345')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_6200
     * @tc.name      testNumValIpPort0062
     * @tc.desc      Verify isValidIPv6 rejects non hexadecimal letters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0062';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The letter g is outside the hexadecimal alphabet.
      expect(ValidateUtils.isValidIPv6('g::1')).assertFalse();
      // A compressed leading group of g fails the alphabet rule.
      expect(ValidateUtils.isValidIPv6('::g')).assertFalse();
      // Eight z groups are all outside the hexadecimal alphabet.
      expect(ValidateUtils.isValidIPv6('z:z:z:z:z:z:z:z')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_6300
     * @tc.name      testNumValIpPort0063
     * @tc.desc      Verify isValidIPv6 rejects zone identifiers and padded spaces.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0063';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The zone id suffix %eth0 is not part of the plain address.
      expect(ValidateUtils.isValidIPv6('fe80::1%eth0')).assertFalse();
      // A trailing space breaks the anchored end of the address.
      expect(ValidateUtils.isValidIPv6('fe80::1' + ' ')).assertFalse();
      // A leading space breaks the anchored start of the address.
      expect(ValidateUtils.isValidIPv6(' ' + 'fe80::1')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_6400
     * @tc.name      testNumValIpPort0064
     * @tc.desc      Verify isValidIPv6 rejects dotted quad texts as IPv6 input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0064';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A bare dotted quad is IPv4 text and not an IPv6 address.
      expect(ValidateUtils.isValidIPv6('192.168.1.1')).assertFalse();
      // The IPv4 mapped dotted form is not accepted by this plain pattern.
      expect(ValidateUtils.isValidIPv6('::ffff:192.168.1.1')).assertFalse();
      // A dotted quad tail after six groups keeps the dots invalid.
      expect(ValidateUtils.isValidIPv6('1:2:3:4:5:6:192.168.1.1')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_6500
     * @tc.name      testNumValIpPort0065
     * @tc.desc      Verify isValidIPv6 rejects three or more consecutive colons at the start.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0065';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // ':::1' has one colon more than the single compression allows.
      expect(ValidateUtils.isValidIPv6(':::1')).assertFalse();
      // ':::' leaves a dangling colon after the compression.
      expect(ValidateUtils.isValidIPv6(':::')).assertFalse();
      // '::::' doubles the compression marker at the start.
      expect(ValidateUtils.isValidIPv6('::::')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_6600
     * @tc.name      testNumValIpPort0066
     * @tc.desc      Verify isValidIPv6 rejects stray leading colons before groups.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0066';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A single leading colon before seven groups is not a compression.
      expect(ValidateUtils.isValidIPv6(':1:2:3:4:5:6:7')).assertFalse();
      // A single leading colon before two groups fails the same way.
      expect(ValidateUtils.isValidIPv6(':1:2')).assertFalse();
      // A leading colon before a link-local form keeps the stray colon invalid.
      expect(ValidateUtils.isValidIPv6(':fe80::1')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_6700
     * @tc.name      testNumValIpPort0067
     * @tc.desc      Verify isValidIPv6 rejects compression followed by eight or more groups.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0067';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // '::' plus eight groups needs nine slots and exceeds the budget.
      expect(ValidateUtils.isValidIPv6('::1:2:3:4:5:6:7:8')).assertFalse();
      // '::' plus nine groups is even further over the group budget.
      expect(ValidateUtils.isValidIPv6('::1:2:3:4:5:6:7:8:9')).assertFalse();
      // '::' plus eight zero groups fails despite the repeated zeros.
      expect(ValidateUtils.isValidIPv6('::0:0:0:0:0:0:0:0')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_6800
     * @tc.name      testNumValIpPort0068
     * @tc.desc      Verify isValidIPv6 rejects trailing space letter and colon after groups.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0068';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A trailing space after the final group breaks the anchored match.
      expect(ValidateUtils.isValidIPv6('2001:db8::1' + ' ')).assertFalse();
      // A letter glued to the final group breaks the hex group.
      expect(ValidateUtils.isValidIPv6('2001:db8::1x')).assertFalse();
      // A trailing colon after the last group leaves a dangling separator.
      expect(ValidateUtils.isValidIPv6('2001:db8::1:')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_6900
     * @tc.name      testNumValIpPort0069
     * @tc.desc      Verify isValidIPv6 rejects seven nine and ten group uncompressed counts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0069';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Seven groups without compression miss one required slot.
      expect(ValidateUtils.isValidIPv6('fe80:0:0:0:0:0:0')).assertFalse();
      // Nine groups overfill the eight slot address.
      expect(ValidateUtils.isValidIPv6('fe80:0:0:0:0:0:0:1:2')).assertFalse();
      // Ten groups of ones and zeros overfill it even more.
      expect(ValidateUtils.isValidIPv6('1:2:3:4:5:6:7:8:0:0')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_7000
     * @tc.name      testNumValIpPort0070
     * @tc.desc      Verify isValidIPv6 rejects loopback forms with trailing decorations.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0070';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A trailing space after '::1' breaks the anchored match.
      expect(ValidateUtils.isValidIPv6('::1' + ' ')).assertFalse();
      // A trailing colon after '::1' leaves a dangling separator.
      expect(ValidateUtils.isValidIPv6('::1:')).assertFalse();
      // A trailing space after eight groups breaks the anchored match.
      expect(ValidateUtils.isValidIPv6('1:2:3:4:5:6:7:8' + ' ')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_7100
     * @tc.name      testNumValIpPort0071
     * @tc.desc      Verify isValidPort accepts port one and rejects reserved port zero.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0071';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Port one is the lowest allowed port above the reserved zero.
      expect(ValidateUtils.isValidPort(1)).assertTrue();
      // Port two steps one above the minimum.
      expect(ValidateUtils.isValidPort(2)).assertTrue();
      // Port zero is reserved and below the minimum of one.
      expect(ValidateUtils.isValidPort(0)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_7200
     * @tc.name      testNumValIpPort0072
     * @tc.desc      Verify isValidPort accepts the well known ports around twenty one.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0072';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Port twenty two for ssh is a classic well known value.
      expect(ValidateUtils.isValidPort(22)).assertTrue();
      // Port twenty one for ftp sits directly below it.
      expect(ValidateUtils.isValidPort(21)).assertTrue();
      // Port twenty three for telnet sits directly above it.
      expect(ValidateUtils.isValidPort(23)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_7300
     * @tc.name      testNumValIpPort0073
     * @tc.desc      Verify isValidPort accepts the classic web ports around eighty.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0073';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Port eighty is the default cleartext web port.
      expect(ValidateUtils.isValidPort(80)).assertTrue();
      // Port eighty one is a common alternative web port.
      expect(ValidateUtils.isValidPort(81)).assertTrue();
      // Port seventy nine for finger sits directly below it.
      expect(ValidateUtils.isValidPort(79)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_7400
     * @tc.name      testNumValIpPort0074
     * @tc.desc      Verify isValidPort accepts the https and alternative secure ports.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0074';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Port four hundred forty three is the default https port.
      expect(ValidateUtils.isValidPort(443)).assertTrue();
      // Port eight thousand four hundred forty three is a common https alt port.
      expect(ValidateUtils.isValidPort(8443)).assertTrue();
      // Port nine thousand four hundred forty three is another secure alt port.
      expect(ValidateUtils.isValidPort(9443)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_7500
     * @tc.name      testNumValIpPort0075
     * @tc.desc      Verify isValidPort accepts ports around the privileged boundary.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0075';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Port one thousand twenty four is the first unprivileged port.
      expect(ValidateUtils.isValidPort(1024)).assertTrue();
      // Port one thousand twenty three is the last privileged port.
      expect(ValidateUtils.isValidPort(1023)).assertTrue();
      // Port one thousand twenty five steps just past the boundary.
      expect(ValidateUtils.isValidPort(1025)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_7600
     * @tc.name      testNumValIpPort0076
     * @tc.desc      Verify isValidPort accepts common application ports near eight thousand.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0076';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Port eight thousand eighty is the classic development server port.
      expect(ValidateUtils.isValidPort(8080)).assertTrue();
      // Port eight thousand is a round alternative application port.
      expect(ValidateUtils.isValidPort(8000)).assertTrue();
      // Port eight thousand eight hundred eighty eight repeats the digit eight.
      expect(ValidateUtils.isValidPort(8888)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_7700
     * @tc.name      testNumValIpPort0077
     * @tc.desc      Verify isValidPort accepts the dynamic port range start values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0077';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Port forty nine thousand one hundred fifty two starts the dynamic range.
      expect(ValidateUtils.isValidPort(49152)).assertTrue();
      // Port forty nine thousand one hundred fifty one sits one below it.
      expect(ValidateUtils.isValidPort(49151)).assertTrue();
      // Port forty nine thousand one hundred fifty three steps one above it.
      expect(ValidateUtils.isValidPort(49153)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_7800
     * @tc.name      testNumValIpPort0078
     * @tc.desc      Verify isValidPort accepts the maximum port and rejects one above it.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0078';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Port sixty five thousand five hundred thirty five is the numeric maximum.
      expect(ValidateUtils.isValidPort(65535)).assertTrue();
      // Port sixty five thousand five hundred thirty four sits just below the maximum.
      expect(ValidateUtils.isValidPort(65534)).assertTrue();
      // Port sixty five thousand five hundred thirty six is one above the maximum.
      expect(ValidateUtils.isValidPort(65536)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_7900
     * @tc.name      testNumValIpPort0079
     * @tc.desc      Verify isValidPort rejects zero zero point zero and negative zero.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0079';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The integer zero is reserved and below the minimum port.
      expect(ValidateUtils.isValidPort(0)).assertFalse();
      // Zero written as a decimal literal keeps the same numeric value.
      expect(ValidateUtils.isValidPort(0.0)).assertFalse();
      // Negative zero equals zero numerically and stays reserved.
      expect(ValidateUtils.isValidPort(-0)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_8000
     * @tc.name      testNumValIpPort0080
     * @tc.desc      Verify isValidPort rejects negative port numbers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0080';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Port minus one is just below the minimum allowed port.
      expect(ValidateUtils.isValidPort(-1)).assertFalse();
      // Port minus twenty two mirrors a well known port with a sign.
      expect(ValidateUtils.isValidPort(-22)).assertFalse();
      // Port minus sixty five thousand five hundred thirty five mirrors the maximum.
      expect(ValidateUtils.isValidPort(-65535)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_8100
     * @tc.name      testNumValIpPort0081
     * @tc.desc      Verify isValidPort rejects integers just above the port ceiling.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0081';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Sixty five thousand five hundred thirty six is the first rejected integer.
      expect(ValidateUtils.isValidPort(65536)).assertFalse();
      // Sixty five thousand five hundred thirty seven stays above the ceiling.
      expect(ValidateUtils.isValidPort(65537)).assertFalse();
      // Sixty five thousand five hundred ninety nine is still above the ceiling.
      expect(ValidateUtils.isValidPort(65599)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_8200
     * @tc.name      testNumValIpPort0082
     * @tc.desc      Verify isValidPort rejects large six digit integers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0082';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One hundred thousand is far above the sixteen bit port range.
      expect(ValidateUtils.isValidPort(100000)).assertFalse();
      // Ninety nine thousand nine hundred ninety nine is still above the range.
      expect(ValidateUtils.isValidPort(99999)).assertFalse();
      // The largest safe integer exceeds any port value by far.
      expect(ValidateUtils.isValidPort(Number.MAX_SAFE_INTEGER)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_8300
     * @tc.name      testNumValIpPort0083
     * @tc.desc      Verify isValidPort rejects non integral fractional ports.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0083';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One and a half is not an integer even though it is in range.
      expect(ValidateUtils.isValidPort(1.5)).assertFalse();
      // Eighty and a half mirrors a valid port with a fraction.
      expect(ValidateUtils.isValidPort(80.5)).assertFalse();
      // Zero point nine nine nine is below the minimum and fractional.
      expect(ValidateUtils.isValidPort(0.999)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_8400
     * @tc.name      testNumValIpPort0084
     * @tc.desc      Verify isValidPort rejects NaN and infinite port candidates.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0084';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // NaN is not an integer and cannot name a port.
      expect(ValidateUtils.isValidPort(Number.NaN)).assertFalse();
      // Positive infinity exceeds any finite port value.
      expect(ValidateUtils.isValidPort(Number.POSITIVE_INFINITY)).assertFalse();
      // Negative infinity sits below every finite port value.
      expect(ValidateUtils.isValidPort(Number.NEGATIVE_INFINITY)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_8500
     * @tc.name      testNumValIpPort0085
     * @tc.desc      Verify isValidPort accepts whole numbers written with decimal points.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0085';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Eighty written as eighty point zero is still the integer eighty.
      expect(ValidateUtils.isValidPort(80.0)).assertTrue();
      // One written as one point zero keeps the minimum port value.
      expect(ValidateUtils.isValidPort(1.0)).assertTrue();
      // The maximum port written with a decimal point stays integral.
      expect(ValidateUtils.isValidPort(65535.0)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_8600
     * @tc.name      testNumValIpPort0086
     * @tc.desc      Verify isValidPort rejects fractional values near the port boundaries.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0086';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A tiny fraction above the maximum breaks integrality.
      expect(ValidateUtils.isValidPort(65535.0001)).assertFalse();
      // A small negative fraction is both negative and fractional.
      expect(ValidateUtils.isValidPort(-0.5)).assertFalse();
      // A small positive fraction sits below the minimum port.
      expect(ValidateUtils.isValidPort(0.5)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_8700
     * @tc.name      testNumValIpPort0087
     * @tc.desc      Verify isPositiveNumber accepts small positive integers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0087';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One is the smallest positive integer.
      expect(ValidateUtils.isPositiveNumber(1)).assertTrue();
      // Two steps one integer above the minimum.
      expect(ValidateUtils.isPositiveNumber(2)).assertTrue();
      // One hundred is a comfortably positive round number.
      expect(ValidateUtils.isPositiveNumber(100)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_8800
     * @tc.name      testNumValIpPort0088
     * @tc.desc      Verify isPositiveNumber accepts fractional positive values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0088';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One thousandth is a tiny but strictly positive fraction.
      expect(ValidateUtils.isPositiveNumber(0.001)).assertTrue();
      // One half sits between zero and one.
      expect(ValidateUtils.isPositiveNumber(0.5)).assertTrue();
      // Pi to two decimals is a positive irrational style value.
      expect(ValidateUtils.isPositiveNumber(3.14)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_8900
     * @tc.name      testNumValIpPort0089
     * @tc.desc      Verify isPositiveNumber accepts port sized and tiny positive values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0089';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The maximum port value is a large positive integer.
      expect(ValidateUtils.isPositiveNumber(65535)).assertTrue();
      // One thousand twenty four is a positive power of two.
      expect(ValidateUtils.isPositiveNumber(1024)).assertTrue();
      // One ten millionth is positive but very close to zero.
      expect(ValidateUtils.isPositiveNumber(0.0000001)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_9000
     * @tc.name      testNumValIpPort0090
     * @tc.desc      Verify isPositiveNumber accepts large decimals and epsilon.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0090';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A six digit decimal value is a large positive number.
      expect(ValidateUtils.isPositiveNumber(123456.789)).assertTrue();
      // e to two decimals is a small positive irrational style value.
      expect(ValidateUtils.isPositiveNumber(2.718)).assertTrue();
      // The machine epsilon is the smallest positive fractional gap.
      expect(ValidateUtils.isPositiveNumber(Number.EPSILON)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_9100
     * @tc.name      testNumValIpPort0091
     * @tc.desc      Verify isPositiveNumber rejects zero in all spellings.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0091';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The integer zero is not strictly greater than zero.
      expect(ValidateUtils.isPositiveNumber(0)).assertFalse();
      // Zero written as a decimal literal keeps the same value.
      expect(ValidateUtils.isPositiveNumber(0.0)).assertFalse();
      // Negative zero equals zero and is not strictly positive.
      expect(ValidateUtils.isPositiveNumber(-0)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_9200
     * @tc.name      testNumValIpPort0092
     * @tc.desc      Verify isPositiveNumber rejects negative integers and fractions.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0092';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Minus one is the closest negative integer to zero.
      expect(ValidateUtils.isPositiveNumber(-1)).assertFalse();
      // Minus one thousandth is negative but very close to zero.
      expect(ValidateUtils.isPositiveNumber(-0.001)).assertFalse();
      // Minus one hundred is a clearly negative round number.
      expect(ValidateUtils.isPositiveNumber(-100)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_9300
     * @tc.name      testNumValIpPort0093
     * @tc.desc      Verify isPositiveNumber rejects NaN values across helpers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0093';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The global NaN constant is not a finite positive number.
      expect(ValidateUtils.isPositiveNumber(NaN)).assertFalse();
      // The Number wrapper NaN behaves identically.
      expect(ValidateUtils.isPositiveNumber(Number.NaN)).assertFalse();
      // The port helper rejects NaN for the same finite test reason.
      expect(ValidateUtils.isValidPort(Number.NaN)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_9400
     * @tc.name      testNumValIpPort0094
     * @tc.desc      Verify isPositiveNumber rejects infinities and accepts max value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0094';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Positive infinity fails the finite requirement.
      expect(ValidateUtils.isPositiveNumber(Number.POSITIVE_INFINITY)).assertFalse();
      // Negative infinity fails both the finite and positive tests.
      expect(ValidateUtils.isPositiveNumber(Number.NEGATIVE_INFINITY)).assertFalse();
      // The largest finite double value is strictly positive.
      expect(ValidateUtils.isPositiveNumber(Number.MAX_VALUE)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_9500
     * @tc.name      testNumValIpPort0095
     * @tc.desc      Verify isPositiveNumber rejects small negative fractions.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValIpPort0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0095';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Minus one half is a plain negative fraction.
      expect(ValidateUtils.isPositiveNumber(-0.5)).assertFalse();
      // Minus one ten millionth sits just below zero.
      expect(ValidateUtils.isPositiveNumber(-0.0000001)).assertFalse();
      // Minus pi to two decimals is negative and irrational style.
      expect(ValidateUtils.isPositiveNumber(-3.14)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALIPPORT_9600
     * @tc.name      testNumValIpPort0096
     * @tc.desc      Verify isPositiveNumber accepts the smallest positive subnormal.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValIpPort0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValIpPort0096';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The minimum positive double is a tiny subnormal above zero.
      expect(ValidateUtils.isPositiveNumber(Number.MIN_VALUE)).assertTrue();
      // Its negation sits just below zero and is not positive.
      expect(ValidateUtils.isPositiveNumber(-Number.MIN_VALUE)).assertFalse();
      // Zero stays the strict boundary of the positive range.
      expect(ValidateUtils.isPositiveNumber(0)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
