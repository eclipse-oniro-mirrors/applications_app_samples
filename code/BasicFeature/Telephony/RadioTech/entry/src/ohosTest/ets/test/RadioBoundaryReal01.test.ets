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
import { NetworkStateFormatter, NetworkStateSnapshot } from '../../../main/ets/model/NetworkStateFormatter';
import { RadioTechFormatter, RadioTechSnapshot } from '../../../main/ets/model/RadioTechFormatter';
import { SignalFormatter, SignalSnapshot } from '../../../main/ets/model/SignalFormatter';
import { SlotModel } from '../../../main/ets/model/SlotModel';
import { SimInfoFormatter } from '../../../main/ets/model/SimInfoFormatter';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function radioBoundaryReal01Test() {
  describe('RadioBoundaryReal01Test', () => {

    /**
     * @tc.name   testBoundReal0001
     * @tc.number SUB_RADIO_BOUND_0001
     * @tc.desc   reg state at maximum safe integer falls back to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBoundReal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0001 begin');
      const value: number = Number.MAX_SAFE_INTEGER;
      const result: string = NetworkStateFormatter.formatRegState(value);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(7));
      expect(result.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result === 'unknown'));
      expect(result === 'unknown').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0001 end');
    })

    /**
     * @tc.name   testBoundReal0002
     * @tc.number SUB_RADIO_BOUND_0002
     * @tc.desc   nsa state at minimum safe integer falls back to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBoundReal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0002 begin');
      const value: number = Number.MIN_SAFE_INTEGER;
      const result: string = NetworkStateFormatter.formatNsaState(value);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.indexOf('detect') < 0));
      expect(result.indexOf('detect') < 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(7));
      expect(result.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0002 end');
    })

    /**
     * @tc.name   testBoundReal0003
     * @tc.number SUB_RADIO_BOUND_0003
     * @tc.desc   negative zero reg state maps to the first name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBoundReal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0003 begin');
      const value: number = -0;
      const result: string = NetworkStateFormatter.formatRegState(value);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('no service'));
      expect(result).assertEqual('no service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes(' ')));
      expect(result.includes(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(10));
      expect(result.length).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0003 end');
    })

    /**
     * @tc.name   testBoundReal0004
     * @tc.number SUB_RADIO_BOUND_0004
     * @tc.desc   six digit zero PLMN is accepted verbatim
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBoundReal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0004 begin');
      const value: string = '000000';
      const result: string = NetworkStateFormatter.formatPlmn(value);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('000000'));
      expect(result).assertEqual('000000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(6));
      expect(result.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result === value));
      expect(result === value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0004 end');
    })

    /**
     * @tc.name   testBoundReal0005
     * @tc.number SUB_RADIO_BOUND_0005
     * @tc.desc   seven digit PLMN is rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBoundReal0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0005 begin');
      const value: string = '1234567';
      const result: string = NetworkStateFormatter.formatPlmn(value);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result === value));
      expect(result === value).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0005 end');
    })

    /**
     * @tc.name   testBoundReal0006
     * @tc.number SUB_RADIO_BOUND_0006
     * @tc.desc   padded five digit PLMN is trimmed then accepted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBoundReal0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0006 begin');
      const value: string = ' 12345 ';
      const result: string = NetworkStateFormatter.formatPlmn(value);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('12345'));
      expect(result).assertEqual('12345');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(5));
      expect(result.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(value.trim()));
      expect(result).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0006 end');
    })

    /**
     * @tc.name   testBoundReal0007
     * @tc.number SUB_RADIO_BOUND_0007
     * @tc.desc   NR is the highest known technology index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBoundReal0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0007 begin');
      const value: number = 12;
      const result: string = RadioTechFormatter.techName(value);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('nr'));
      expect(result).assertEqual('nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(RadioTechFormatter.isNr(value)));
      expect(RadioTechFormatter.isNr(value)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isKnown(13)));
      expect(RadioTechFormatter.isKnown(13)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0007 end');
    })

    /**
     * @tc.name   testBoundReal0008
     * @tc.number SUB_RADIO_BOUND_0008
     * @tc.desc   technology index one past NR is unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBoundReal0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0008 begin');
      const value: number = 13;
      const result: string = RadioTechFormatter.techName(value);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(RadioTechFormatter.isKnown(value)));
      expect(RadioTechFormatter.isKnown(value)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(RadioTechFormatter.techName(99) === result));
      expect(RadioTechFormatter.techName(99) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0008 end');
    })

    /**
     * @tc.name   testBoundReal0009
     * @tc.number SUB_RADIO_BOUND_0009
     * @tc.desc   negative zero technology index resolves to unknown slot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBoundReal0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0009 begin');
      const value: number = -0;
      const result: string = RadioTechFormatter.techName(value);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(RadioTechFormatter.isKnown(value)));
      expect(RadioTechFormatter.isKnown(value)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(7));
      expect(result.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0009 end');
    })

    /**
     * @tc.name   testBoundReal0010
     * @tc.number SUB_RADIO_BOUND_0010
     * @tc.desc   maximum safe dBm stays a raw decimal suffix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBoundReal0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0010 begin');
      const value: number = Number.MAX_SAFE_INTEGER;
      const result: string = SignalFormatter.formatSignal({ signalType: 6, signalLevel: 4, dBm: value });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('nr/great/9007199254740991');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.startsWith('nr/great/')));
      expect(result.startsWith('nr/great/')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('/').length));
      expect(result.split('/').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0010 end');
    })

    /**
     * @tc.name   testBoundReal0011
     * @tc.number SUB_RADIO_BOUND_0011
     * @tc.desc   minimum safe dBm keeps the leading minus sign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBoundReal0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0011 begin');
      const value: number = Number.MIN_SAFE_INTEGER;
      const result: string = SignalFormatter.formatSignal({ signalType: 5, signalLevel: 0, dBm: value });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('lte/none/-9007199254740991');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('none/-')));
      expect(result.includes('none/-')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.indexOf('-') > 0));
      expect(result.indexOf('-') > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0011 end');
    })

    /**
     * @tc.name   testBoundReal0012
     * @tc.number SUB_RADIO_BOUND_0012
     * @tc.desc   best level ignores out of range levels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBoundReal0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0012 begin');
      const list: SignalSnapshot[] = [
        { signalType: 5, signalLevel: 9, dBm: -10 },
        { signalType: 5, signalLevel: -2, dBm: -20 }
      ];
      const result: number = SignalFormatter.bestLevel(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.totalDbm(list)));
      expect(SignalFormatter.totalDbm(list)).assertEqual(-30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0012 end');
    })

    /**
     * @tc.name   testBoundReal0013
     * @tc.number SUB_RADIO_BOUND_0013
     * @tc.desc   has type is false for an empty list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBoundReal0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0013 begin');
      const list: SignalSnapshot[] = [];
      const result: boolean = SignalFormatter.hasType(list, 6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.formatList(list)));
      expect(SignalFormatter.formatList(list)).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0013 end');
    })

    /**
     * @tc.name   testBoundReal0014
     * @tc.number SUB_RADIO_BOUND_0014
     * @tc.desc   long SPN keeps every non control character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBoundReal0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0014 begin');
      const raw: string = 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA';
      const result: string = SimInfoFormatter.formatSpn(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(60));
      expect(result.length).assertEqual(60);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result === raw));
      expect(result === raw).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0014 end');
    })

    /**
     * @tc.name   testBoundReal0015
     * @tc.number SUB_RADIO_BOUND_0015
     * @tc.desc   SI country code stays uppercase and valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBoundReal0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0015 begin');
      const raw: string = 'si';
      const result: string = SimInfoFormatter.formatIsoCountryCode(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('SI'));
      expect(result).assertEqual('SI');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result === result.toUpperCase()));
      expect(result === result.toUpperCase()).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0015 end');
    })

    /**
     * @tc.name   testBoundReal0016
     * @tc.number SUB_RADIO_BOUND_0016
     * @tc.desc   slot 3 is the largest valid id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBoundReal0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0016 begin');
      const slotId: number = 3;
      const result: string = SlotModel.formatTitle(slotId);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('SIM4 status'));
      expect(result).assertEqual('SIM4 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(SlotModel.isValidSlotId(slotId)));
      expect(SlotModel.isValidSlotId(slotId)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.normalizeSlotId(slotId)));
      expect(SlotModel.normalizeSlotId(slotId)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0016 end');
    })

    /**
     * @tc.name   testBoundReal0017
     * @tc.number SUB_RADIO_BOUND_0017
     * @tc.desc   fractional slot id normalizes to zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBoundReal0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0017 begin');
      const slotId: number = 3.99;
      const result: number = SlotModel.normalizeSlotId(slotId);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(SlotModel.isValidSlotId(slotId)));
      expect(SlotModel.isValidSlotId(slotId)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(slotId)));
      expect(SlotModel.formatTitle(slotId)).assertEqual('SIM status');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0017 end');
    })

    /**
     * @tc.name   testBoundReal0018
     * @tc.number SUB_RADIO_BOUND_0018
     * @tc.desc   negative zero selection mode maps to unknown
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBoundReal0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0018 begin');
      const mode: number = -0;
      const result: string = SlotModel.selectionModeName(mode);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('unknown'));
      expect(result).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(7));
      expect(result.length).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(SlotModel.selectionModeName(1) !== result));
      expect(SlotModel.selectionModeName(1) !== result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0018 end');
    })

    /**
     * @tc.name   testBoundReal0019
     * @tc.number SUB_RADIO_BOUND_0019
     * @tc.desc   integer valued float signal type still resolves
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBoundReal0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0019 begin');
      const value: number = 2.0;
      const result: string = SignalFormatter.typeName(value);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('cdma'));
      expect(result).assertEqual('cdma');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(SignalFormatter.typeName(2) === result));
      expect(SignalFormatter.typeName(2) === result).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0019 end');
    })

    /**
     * @tc.name   testBoundReal0020
     * @tc.number SUB_RADIO_BOUND_0020
     * @tc.desc   NaN signal level falls back to none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBoundReal0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0020 begin');
      const value: number = Number.NaN;
      const result: string = SignalFormatter.levelName(value);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('none'));
      expect(result).assertEqual('none');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(Number.isInteger(value)));
      expect(Number.isInteger(value)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0020 end');
    })

    /**
     * @tc.name   testBoundReal0021
     * @tc.number SUB_RADIO_BOUND_0021
     * @tc.desc   infinity slot id is invalid and normalizes to zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBoundReal0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0021 begin');
      const slotId: number = Number.POSITIVE_INFINITY;
      const result: number = SlotModel.normalizeSlotId(slotId);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(SlotModel.isValidSlotId(slotId)));
      expect(SlotModel.isValidSlotId(slotId)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.isValidSlotId(0)));
      expect(SlotModel.isValidSlotId(0)).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0021 end');
    })

    /**
     * @tc.name   testBoundReal0022
     * @tc.number SUB_RADIO_BOUND_0022
     * @tc.desc   empty operator and empty short name both report not available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBoundReal0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0022 begin');
      const snap: NetworkStateSnapshot = {
        longOperatorName: '',
        shortOperatorName: '',
        plmnNumeric: '46000',
        isRoaming: false,
        regState: 1,
        nsaState: 6,
        isCaActive: false,
        isEmergency: false
      };
      const result: string = NetworkStateFormatter.format(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.startsWith('longOperatorName:not available')));
      expect(result.startsWith('longOperatorName:not available')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('shortOperatorName:not available')));
      expect(result.includes('shortOperatorName:not available')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('\n').length));
      expect(result.split('\n').length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0022 end');
    })

    /**
     * @tc.name   testBoundReal0023
     * @tc.number SUB_RADIO_BOUND_0023
     * @tc.desc   format list of five entries preserves every part
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBoundReal0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0023 begin');
      const list: SignalSnapshot[] = [
        { signalType: 1, signalLevel: 1, dBm: -101 },
        { signalType: 2, signalLevel: 2, dBm: -102 },
        { signalType: 3, signalLevel: 3, dBm: -103 },
        { signalType: 4, signalLevel: 4, dBm: -104 },
        { signalType: 5, signalLevel: 0, dBm: -105 }
      ];
      const result: string = SignalFormatter.formatList(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result.split('; ').length));
      expect(result.split('; ').length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list)));
      expect(SignalFormatter.count(list)).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel(list)));
      expect(SignalFormatter.bestLevel(list)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0023 end');
    })

    /**
     * @tc.name   testBoundReal0024
     * @tc.number SUB_RADIO_BOUND_0024
     * @tc.desc   total dBm aggregates five negative values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBoundReal0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0024 begin');
      const list: SignalSnapshot[] = [
        { signalType: 1, signalLevel: 1, dBm: -101 },
        { signalType: 2, signalLevel: 2, dBm: -102 },
        { signalType: 3, signalLevel: 3, dBm: -103 },
        { signalType: 4, signalLevel: 4, dBm: -104 },
        { signalType: 5, signalLevel: 0, dBm: -105 }
      ];
      const result: number = SignalFormatter.totalDbm(list);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-515));
      expect(result).assertEqual(-515);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result < 0), String(true));
      expect(result < 0).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.count(list) * -103));
      expect(SignalFormatter.count(list) * -103).assertEqual(-515);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0024 end');
    })

    /**
     * @tc.name   testBoundReal0025
     * @tc.number SUB_RADIO_BOUND_0025
     * @tc.desc   zero dBm prints without a sign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBoundReal0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0025 begin');
      const snap: SignalSnapshot = { signalType: 6, signalLevel: 4, dBm: 0 };
      const result: string = SignalFormatter.formatSignal(snap);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('nr/great/0'));
      expect(result).assertEqual('nr/great/0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.endsWith('/0')));
      expect(result.endsWith('/0')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('+0')));
      expect(result.includes('+0')).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0025 end');
    })

    /**
     * @tc.name   testBoundReal0026
     * @tc.number SUB_RADIO_BOUND_0026
     * @tc.desc   double negative operator name keeps inner spaces
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBoundReal0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0026 begin');
      const value: string = 'A  B';
      const result: string = NetworkStateFormatter.formatOperator(value);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('A  B'));
      expect(result).assertEqual('A  B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.indexOf('  ') === 1));
      expect(result.indexOf('  ') === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0026 end');
    })

    /**
     * @tc.name   testBoundReal0027
     * @tc.number SUB_RADIO_BOUND_0027
     * @tc.desc   single control character SPN becomes not available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBoundReal0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0027 begin');
      const raw: string = '\r';
      const result: string = SimInfoFormatter.formatSpn(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('not available'));
      expect(result).assertEqual('not available');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(13));
      expect(result.length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.includes('\r')));
      expect(result.includes('\r')).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0027 end');
    })

    /**
     * @tc.name   testBoundReal0028
     * @tc.number SUB_RADIO_BOUND_0028
     * @tc.desc   five digit minimum PLMN is accepted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBoundReal0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0028 begin');
      const value: string = '10000';
      const result: string = NetworkStateFormatter.formatPlmn(value);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('10000'));
      expect(result).assertEqual('10000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(5));
      expect(result.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result === value));
      expect(result === value).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0028 end');
    })

    /**
     * @tc.name   testBoundReal0029
     * @tc.number SUB_RADIO_BOUND_0029
     * @tc.desc   two letter lowercase ISO survives trimming
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBoundReal0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0029 begin');
      const raw: string = ' zz ';
      const result: string = SimInfoFormatter.formatIsoCountryCode(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('ZZ'));
      expect(result).assertEqual('ZZ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(result));
      expect(result).assertEqual(raw.trim().toUpperCase());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0029 end');
    })

    /**
     * @tc.name   testBoundReal0030
     * @tc.number SUB_RADIO_BOUND_0030
     * @tc.desc   hs state spaces are collapsed by sanitize and trim
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBoundReal0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0030 begin');
      const raw: string = '  A\tB  ';
      const result: string = SimInfoFormatter.formatSpn(raw);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('A B'));
      expect(result).assertEqual('A B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result.startsWith(' ')));
      expect(result.startsWith(' ')).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0030 end');
    })

    /**
     * @tc.name   testBoundReal0031
     * @tc.number SUB_RADIO_BOUND_0031
     * @tc.desc   is nr is exact for twelve and false around it
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBoundReal0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0031 begin');
      const value: number = 12;
      const result: boolean = RadioTechFormatter.isNr(value);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isNr(11)));
      expect(RadioTechFormatter.isNr(11)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.isNr(13)));
      expect(RadioTechFormatter.isNr(13)).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBoundReal0031 end');
    })

  })
}
