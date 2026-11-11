/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect } from '@ohos/hypium';
import { RandomUtils, TypeUtils, ValidationUtils } from 'library';

/**
 * Test suite for RandomUtils.
 * @since 26.0.0
 */
export default function randomUtilsTest(): void {
  describe('RandomUtilsTest', () => {
    // ==================== 随机 MAC 与 UUID（4 条） ====================

    /*
     * @tc.number: SUB_RANDOM_UTILS_0100
     * @tc.name: testRandomUtils0001
     * @tc.desc: Draw MAC addresses that satisfy the MAC format validator.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testRandomUtils0001', 0, () => {
      let lengthHits: number = 0;
      let groupHits: number = 0;
      let validHits: number = 0;
      for (let i: number = 0; i < 30; i++) {
        const mac: string = RandomUtils.randomMacAddress();
        if (mac.length === 17) {
          lengthHits = lengthHits + 1;
        }
        if (mac.split(':').length === 6) {
          groupHits = groupHits + 1;
        }
        if (ValidationUtils.validateMacAddress(mac).isValid) {
          validHits = validHits + 1;
        }
      }
      expect(lengthHits).assertEqual(30);
      expect(groupHits).assertEqual(30);
      expect(validHits).assertEqual(30);
      expect(RandomUtils.randomMacAddress().indexOf(':') > 0).assertTrue();
    });

    /*
     * @tc.number: SUB_RANDOM_UTILS_0200
     * @tc.name: testRandomUtils0002
     * @tc.desc: Spread drawn MAC addresses over distinct values.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testRandomUtils0002', 0, () => {
      const seen: string[] = [];
      let upperHits: number = 0;
      for (let i: number = 0; i < 40; i++) {
        const mac: string = RandomUtils.randomMacAddress();
        if (mac === mac.toUpperCase()) {
          upperHits = upperHits + 1;
        }
        if (seen.indexOf(mac) === -1) {
          seen.push(mac);
        }
      }
      expect(upperHits).assertEqual(40);
      expect(seen.length > 1).assertTrue();
      expect(seen.length <= 40).assertTrue();
      expect(seen[0].length).assertEqual(17);
    });

    /*
     * @tc.number: SUB_RANDOM_UTILS_0300
     * @tc.name: testRandomUtils0003
     * @tc.desc: Draw UUIDs with the canonical grouping and hex characters.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testRandomUtils0003', 0, () => {
      let lengthHits: number = 0;
      let groupHits: number = 0;
      let validHits: number = 0;
      for (let i: number = 0; i < 30; i++) {
        const uuid: string = RandomUtils.randomUuid();
        if (uuid.length === 36) {
          lengthHits = lengthHits + 1;
        }
        if (uuid.split('-').length === 5) {
          groupHits = groupHits + 1;
        }
        if (ValidationUtils.validateUuid(uuid).isValid) {
          validHits = validHits + 1;
        }
      }
      expect(lengthHits).assertEqual(30);
      expect(groupHits).assertEqual(30);
      expect(validHits).assertEqual(30);
      const single: string = RandomUtils.randomUuid();
      expect(single).assertEqual(single.toLowerCase());
    });

    /*
     * @tc.number: SUB_RANDOM_UTILS_0400
     * @tc.name: testRandomUtils0004
     * @tc.desc: Keep drawn UUIDs distinct across repeated generator calls.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testRandomUtils0004', 0, () => {
      const seen: string[] = [];
      let dashHits: number = 0;
      for (let i: number = 0; i < 30; i++) {
        const uuid: string = RandomUtils.randomUuid();
        if (uuid.charAt(8) === '-' && uuid.charAt(13) === '-' &&
          uuid.charAt(18) === '-' && uuid.charAt(23) === '-') {
          dashHits = dashHits + 1;
        }
        if (seen.indexOf(uuid) === -1) {
          seen.push(uuid);
        }
      }
      expect(dashHits).assertEqual(30);
      expect(seen.length).assertEqual(30);
      expect(seen[0].substring(12, 16).length).assertEqual(4);
      expect(seen[0].length).assertEqual(36);
    });

    // ==================== 设备名与制造商（3 条） ====================

    /*
     * @tc.number: SUB_RANDOM_UTILS_0500
     * @tc.name: testRandomUtils0005
     * @tc.desc: Prefix drawn device names and finish them with a digit block.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testRandomUtils0005', 0, () => {
      let headHits: number = 0;
      let tailHits: number = 0;
      let validHits: number = 0;
      for (let i: number = 0; i < 40; i++) {
        const name: string = RandomUtils.randomDeviceName();
        if (name.indexOf('BT-') === 0) {
          headHits = headHits + 1;
        }
        const tail: string = name.split('-')[2];
        const num: number = Number.parseInt(tail, 10);
        if (tail.length === 4 && !Number.isNaN(num) && num >= 1000 && num <= 9999) {
          tailHits = tailHits + 1;
        }
        if (ValidationUtils.validateDeviceName(name).isValid) {
          validHits = validHits + 1;
        }
      }
      expect(headHits).assertEqual(40);
      expect(tailHits).assertEqual(40);
      expect(validHits).assertEqual(40);
    });

    /*
     * @tc.number: SUB_RANDOM_UTILS_0600
     * @tc.name: testRandomUtils0006
     * @tc.desc: Draw device names from a bounded pool of category prefixes.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testRandomUtils0006', 0, () => {
      const heads: string[] = [];
      let reuse: number = 0;
      for (let i: number = 0; i < 60; i++) {
        const name: string = RandomUtils.randomDeviceName();
        const head: string = name.substring(0, name.lastIndexOf('-'));
        if (heads.indexOf(head) === -1) {
          heads.push(head);
        } else {
          reuse = reuse + 1;
        }
      }
      expect(heads.length > 1).assertTrue();
      expect(heads.length <= 10).assertTrue();
      expect(reuse >= 50).assertTrue();
      expect(RandomUtils.randomDeviceName().substring(0, 3)).assertEqual('BT-');
    });

    /*
     * @tc.number: SUB_RANDOM_UTILS_0700
     * @tc.name: testRandomUtils0007
     * @tc.desc: Reuse manufacturers from a small fixed catalogue.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testRandomUtils0007', 0, () => {
      const seen: string[] = [];
      let reuse: number = 0;
      let cleanHits: number = 0;
      for (let i: number = 0; i < 40; i++) {
        const maker: string = RandomUtils.randomManufacturer();
        if (maker.length > 0 && maker === maker.trim()) {
          cleanHits = cleanHits + 1;
        }
        if (seen.indexOf(maker) === -1) {
          seen.push(maker);
        } else {
          reuse = reuse + 1;
        }
      }
      expect(cleanHits).assertEqual(40);
      expect(seen.length <= 10).assertTrue();
      expect(reuse >= 30).assertTrue();
      expect(ValidationUtils.validateDeviceName(seen[0]).isValid).assertTrue();
    });

    // ==================== 信号与设备标识（5 条） ====================

    /*
     * @tc.number: SUB_RANDOM_UTILS_0800
     * @tc.name: testRandomUtils0008
     * @tc.desc: Draw integer RSSI readings inside the default signal window.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testRandomUtils0008', 0, () => {
      let windowHits: number = 0;
      let integerHits: number = 0;
      let validHits: number = 0;
      for (let i: number = 0; i < 40; i++) {
        const rssi: number = RandomUtils.randomRssi();
        if (rssi >= -100 && rssi <= -30) {
          windowHits = windowHits + 1;
        }
        if (Number.isInteger(rssi)) {
          integerHits = integerHits + 1;
        }
        if (ValidationUtils.validateRssi(rssi).isValid) {
          validHits = validHits + 1;
        }
      }
      expect(windowHits).assertEqual(40);
      expect(integerHits).assertEqual(40);
      expect(validHits).assertEqual(40);
      expect(RandomUtils.randomRssi() <= -30).assertTrue();
    });

    /*
     * @tc.number: SUB_RANDOM_UTILS_0900
     * @tc.name: testRandomUtils0009
     * @tc.desc: Respect explicit bounds and collapse a zero width interval.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testRandomUtils0009', 0, () => {
      let rangeHits: number = 0;
      let integerHits: number = 0;
      for (let i: number = 0; i < 40; i++) {
        const value: number = RandomUtils.randomRssi(10, 20);
        if (value >= 10 && value <= 20) {
          rangeHits = rangeHits + 1;
        }
        if (Number.isInteger(value)) {
          integerHits = integerHits + 1;
        }
      }
      expect(rangeHits).assertEqual(40);
      expect(integerHits).assertEqual(40);
      expect(RandomUtils.randomRssi(5, 5)).assertEqual(5);
      expect(RandomUtils.randomRssi(-40, -40)).assertEqual(-40);
    });

    /*
     * @tc.number: SUB_RANDOM_UTILS_1000
     * @tc.name: testRandomUtils0010
     * @tc.desc: Stay within the accepted signal range for an inverted interval.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testRandomUtils0010', 0, () => {
      let upperHits: number = 0;
      let lowerHits: number = 0;
      let integerHits: number = 0;
      for (let i: number = 0; i < 30; i++) {
        const value: number = RandomUtils.randomRssi(-30, -100);
        if (value <= -30) {
          upperHits = upperHits + 1;
        }
        if (value >= -99) {
          lowerHits = lowerHits + 1;
        }
        if (Number.isInteger(value)) {
          integerHits = integerHits + 1;
        }
      }
      expect(upperHits).assertEqual(30);
      expect(lowerHits).assertEqual(30);
      expect(integerHits).assertEqual(30);
      expect(ValidationUtils.validateRssi(RandomUtils.randomRssi(-30, -100)).isValid).assertTrue();
    });

    /*
     * @tc.number: SUB_RANDOM_UTILS_1100
     * @tc.name: testRandomUtils0011
     * @tc.desc: Build device identifiers from a fixed head and two tokens.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testRandomUtils0011', 0, () => {
      const id: string = RandomUtils.randomDeviceId();
      const parts: string[] = id.split('_');
      expect(parts[0]).assertEqual('dev');
      expect(parts.length).assertEqual(3);
      expect(id.indexOf(' ') === -1).assertTrue();
      expect(parts[1].length > 0).assertTrue();
      expect(parts[2].length > 0).assertTrue();
    });

    /*
     * @tc.number: SUB_RANDOM_UTILS_1200
     * @tc.name: testRandomUtils0012
     * @tc.desc: Grow the timestamp token so identifiers never collide.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testRandomUtils0012', 0, () => {
      const first: string = RandomUtils.randomDeviceId();
      const second: string = RandomUtils.randomDeviceId();
      expect(first === second).assertFalse();
      expect(first.length > 8).assertTrue();
      expect(second.split('_').length).assertEqual(3);
      expect(Number.isNaN(Number.parseInt(second.split('_')[1], 36))).assertFalse();
    });

    // ==================== 号码与联系人（2 条） ====================

    /*
     * @tc.number: SUB_RANDOM_UTILS_1300
     * @tc.name: testRandomUtils0013
     * @tc.desc: Draw eleven digit phone numbers that pass the phone validator.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testRandomUtils0013', 0, () => {
      let lengthHits: number = 0;
      let digitHits: number = 0;
      let validHits: number = 0;
      let prefixHits: number = 0;
      for (let i: number = 0; i < 40; i++) {
        const phone: string = RandomUtils.randomPhoneNumber();
        if (phone.length === 11) {
          lengthHits = lengthHits + 1;
        }
        if (!Number.isNaN(Number.parseInt(phone, 10))) {
          digitHits = digitHits + 1;
        }
        if (ValidationUtils.validatePhoneNumber(phone).isValid) {
          validHits = validHits + 1;
        }
        const head: number = Number.parseInt(phone.substring(0, 3), 10);
        if (head >= 135 && head <= 187) {
          prefixHits = prefixHits + 1;
        }
      }
      expect(lengthHits).assertEqual(40);
      expect(digitHits).assertEqual(40);
      expect(validHits).assertEqual(40);
      expect(prefixHits).assertEqual(40);
    });

    /*
     * @tc.number: SUB_RANDOM_UTILS_1400
     * @tc.name: testRandomUtils0014
     * @tc.desc: Join a first and a last name with exactly one separator space.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testRandomUtils0014', 0, () => {
      let pairHits: number = 0;
      let capitalHits: number = 0;
      let trimHits: number = 0;
      for (let i: number = 0; i < 30; i++) {
        const name: string = RandomUtils.randomContactName();
        const parts: string[] = name.split(' ');
        if (parts.length === 2 && parts[0].length > 0 && parts[1].length > 0) {
          pairHits = pairHits + 1;
        }
        if (parts[0].charAt(0) === parts[0].charAt(0).toUpperCase()) {
          capitalHits = capitalHits + 1;
        }
        if (name === name.trim()) {
          trimHits = trimHits + 1;
        }
      }
      expect(pairHits).assertEqual(30);
      expect(capitalHits).assertEqual(30);
      expect(trimHits).assertEqual(30);
      expect(RandomUtils.randomContactName().indexOf(' ') > 0).assertTrue();
    });

    // ==================== 健康数值（3 条） ====================

    /*
     * @tc.number: SUB_RANDOM_UTILS_1500
     * @tc.name: testRandomUtils0015
     * @tc.desc: Keep heart rate and blood oxygen inside their clinical bands.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testRandomUtils0015', 0, () => {
      let heartHits: number = 0;
      let oxygenHits: number = 0;
      let integerHits: number = 0;
      for (let i: number = 0; i < 40; i++) {
        const heart: number = RandomUtils.randomHeartRate();
        const oxygen: number = RandomUtils.randomBloodOxygen();
        if (heart >= 60 && heart <= 119) {
          heartHits = heartHits + 1;
        }
        if (oxygen >= 92 && oxygen <= 99) {
          oxygenHits = oxygenHits + 1;
        }
        if (Number.isInteger(heart) && Number.isInteger(oxygen)) {
          integerHits = integerHits + 1;
        }
      }
      expect(heartHits).assertEqual(40);
      expect(oxygenHits).assertEqual(40);
      expect(integerHits).assertEqual(40);
    });

    /*
     * @tc.number: SUB_RANDOM_UTILS_1600
     * @tc.name: testRandomUtils0016
     * @tc.desc: Draw blood pressure pairs with the systolic value on top.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testRandomUtils0016', 0, () => {
      let systolicHits: number = 0;
      let diastolicHits: number = 0;
      let orderHits: number = 0;
      for (let i: number = 0; i < 40; i++) {
        const pressure: ESObject = RandomUtils.randomBloodPressure();
        if (pressure.systolic >= 100 && pressure.systolic <= 139) {
          systolicHits = systolicHits + 1;
        }
        if (pressure.diastolic >= 60 && pressure.diastolic <= 79) {
          diastolicHits = diastolicHits + 1;
        }
        if (Number.isInteger(pressure.systolic) && Number.isInteger(pressure.diastolic) &&
          pressure.systolic > pressure.diastolic) {
          orderHits = orderHits + 1;
        }
      }
      expect(systolicHits).assertEqual(40);
      expect(diastolicHits).assertEqual(40);
      expect(orderHits).assertEqual(40);
    });

    /*
     * @tc.number: SUB_RANDOM_UTILS_1700
     * @tc.name: testRandomUtils0017
     * @tc.desc: Round temperature and weight samples to one decimal place.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testRandomUtils0017', 0, () => {
      let temperatureHits: number = 0;
      let weightHits: number = 0;
      let decimalHits: number = 0;
      for (let i: number = 0; i < 40; i++) {
        const temperature: number = RandomUtils.randomTemperature();
        const weight: number = RandomUtils.randomWeight();
        if (temperature >= 36 && temperature <= 38) {
          temperatureHits = temperatureHits + 1;
        }
        if (weight >= 40 && weight <= 90) {
          weightHits = weightHits + 1;
        }
        if (Math.round(temperature * 10) / 10 === temperature && Math.round(weight * 10) / 10 === weight) {
          decimalHits = decimalHits + 1;
        }
      }
      expect(temperatureHits).assertEqual(40);
      expect(weightHits).assertEqual(40);
      expect(decimalHits).assertEqual(40);
      expect(RandomUtils.randomTemperature() >= 36).assertTrue();
    });

    // ==================== 通用抽取（5 条） ====================

    /*
     * @tc.number: SUB_RANDOM_UTILS_1800
     * @tc.name: testRandomUtils0018
     * @tc.desc: Choose only members of the supplied pool of profile names.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testRandomUtils0018', 0, () => {
      const pool: string[] = ['A2DP', 'HFP', 'HID', 'PAN'];
      let inPoolHits: number = 0;
      for (let i: number = 0; i < 40; i++) {
        if (pool.indexOf(RandomUtils.randomChoice<string>(pool)) !== -1) {
          inPoolHits = inPoolHits + 1;
        }
      }
      expect(inPoolHits).assertEqual(40);
      const numbers: number[] = [7];
      expect(RandomUtils.randomChoice<number>(numbers)).assertEqual(7);
      expect(pool.length).assertEqual(4);
      expect(pool.indexOf(RandomUtils.randomChoice<string>(pool)) !== -1).assertTrue();
    });

    /*
     * @tc.number: SUB_RANDOM_UTILS_1900
     * @tc.name: testRandomUtils0019
     * @tc.desc: Return an absent element when the choice pool holds nothing.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testRandomUtils0019', 0, () => {
      const emptyText: string[] = [];
      const emptyNumber: number[] = [];
      expect(TypeUtils.isNullOrUndefined(RandomUtils.randomChoice<string>(emptyText))).assertTrue();
      expect(TypeUtils.isEmpty(RandomUtils.randomChoice<string>(emptyText))).assertTrue();
      expect(TypeUtils.isNullOrUndefined(RandomUtils.randomChoice<number>(emptyNumber))).assertTrue();
      expect(TypeUtils.getTypeName(RandomUtils.randomChoice<string>(emptyText))).assertEqual('undefined');
    });

    /*
     * @tc.number: SUB_RANDOM_UTILS_2000
     * @tc.name: testRandomUtils0020
     * @tc.desc: Force the boolean outcome with zero and one probabilities.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testRandomUtils0020', 0, () => {
      let booleanHits: number = 0;
      let trueHits: number = 0;
      for (let i: number = 0; i < 50; i++) {
        if (TypeUtils.isBoolean(RandomUtils.randomBoolean(0.5))) {
          booleanHits = booleanHits + 1;
        }
        if (RandomUtils.randomBoolean(1)) {
          trueHits = trueHits + 1;
        }
      }
      expect(booleanHits).assertEqual(50);
      expect(trueHits).assertEqual(50);
      expect(RandomUtils.randomBoolean(0)).assertFalse();
      expect(TypeUtils.isBoolean(RandomUtils.randomBoolean())).assertTrue();
    });

    /*
     * @tc.number: SUB_RANDOM_UTILS_2100
     * @tc.name: testRandomUtils0021
     * @tc.desc: Assemble four part IPv4 addresses with usable edge octets.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testRandomUtils0021', 0, () => {
      let groupHits: number = 0;
      let edgeHits: number = 0;
      let validHits: number = 0;
      for (let i: number = 0; i < 40; i++) {
        const ip: string = RandomUtils.randomIpAddress();
        const octets: string[] = ip.split('.');
        if (octets.length === 4) {
          groupHits = groupHits + 1;
        }
        const head: number = Number.parseInt(octets[0], 10);
        const tail: number = Number.parseInt(octets[3], 10);
        if (head >= 1 && head <= 254 && tail >= 1 && tail <= 254) {
          edgeHits = edgeHits + 1;
        }
        if (ValidationUtils.validateIpAddress(ip).isValid) {
          validHits = validHits + 1;
        }
      }
      expect(groupHits).assertEqual(40);
      expect(edgeHits).assertEqual(40);
      expect(validHits).assertEqual(40);
    });

    /*
     * @tc.number: SUB_RANDOM_UTILS_2200
     * @tc.name: testRandomUtils0022
     * @tc.desc: Keep middle IPv4 octets across the full byte span.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testRandomUtils0022', 0, () => {
      let spanHits: number = 0;
      let lowSeen: number = 0;
      let highSeen: number = 0;
      for (let i: number = 0; i < 250; i++) {
        const octets: string[] = RandomUtils.randomIpAddress().split('.');
        const second: number = Number.parseInt(octets[1], 10);
        const third: number = Number.parseInt(octets[2], 10);
        if (second >= 0 && second <= 255 && third >= 0 && third <= 255) {
          spanHits = spanHits + 1;
        }
        if (second < 8 || third < 8) {
          lowSeen = lowSeen + 1;
        }
        if (second > 247 || third > 247) {
          highSeen = highSeen + 1;
        }
      }
      expect(spanHits).assertEqual(250);
      expect(lowSeen > 0).assertTrue();
      expect(highSeen > 0).assertTrue();
      expect(RandomUtils.randomIpAddress().split('.').length).assertEqual(4);
    });
  });
}
