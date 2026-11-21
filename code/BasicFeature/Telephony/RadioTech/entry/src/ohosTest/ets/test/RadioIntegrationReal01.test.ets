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
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function radioIntegrationReal01Test() {
  describe('RadioIntegrationReal01Test', () => {

    /**
     * @tc.name   testIntegReal0001
     * @tc.number SUB_RADIO_INTEG_0001
     * @tc.desc   cross-model consistency probe 1 keeps shared enum mappings aligned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIntegReal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0001 begin');
      const result: string = RadioTechFormatter.formatPair(12, 12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(RadioTechFormatter.isNr(12)));
      expect(RadioTechFormatter.isNr(12)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.typeName(6)));
      expect(SignalFormatter.typeName(6)).assertEqual('nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.formatPair(12, 12).includes('ps:nr')));
      expect(RadioTechFormatter.formatPair(12, 12).includes('ps:nr')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0001 end');
    })

    /**
     * @tc.name   testIntegReal0002
     * @tc.number SUB_RADIO_INTEG_0002
     * @tc.desc   cross-model consistency probe 2 keeps shared enum mappings aligned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIntegReal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0002 begin');
      const result: string = SlotModel.formatTitle(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.slotIndexFromTitle(SlotModel.formatTitle(1))));
      expect(SlotModel.slotIndexFromTitle(SlotModel.formatTitle(1))).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(1)));
      expect(SlotModel.formatTitle(1)).assertEqual('SIM2 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(SlotModel.isValidSlotId(1)));
      expect(SlotModel.isValidSlotId(1)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0002 end');
    })

    /**
     * @tc.name   testIntegReal0003
     * @tc.number SUB_RADIO_INTEG_0003
     * @tc.desc   cross-model consistency probe 3 keeps shared enum mappings aligned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIntegReal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0003 begin');
      const result: string = NetworkStateFormatter.formatNsaState(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(NetworkStateFormatter.formatRegState(2)));
      expect(NetworkStateFormatter.formatRegState(2)).assertEqual('emergency call only');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(NetworkStateFormatter.formatNsaState(2)));
      expect(NetworkStateFormatter.formatNsaState(2)).assertEqual('no detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(NetworkStateFormatter.formatRegState(99) === 'unknown'));
      expect(NetworkStateFormatter.formatRegState(99) === 'unknown').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0003 end');
    })

    /**
     * @tc.name   testIntegReal0004
     * @tc.number SUB_RADIO_INTEG_0004
     * @tc.desc   cross-model consistency probe 4 keeps shared enum mappings aligned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIntegReal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0004 begin');
      const result: string = SignalFormatter.levelName(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.levelName(3)));
      expect(SignalFormatter.levelName(3)).assertEqual('good');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel([{ signalType: 5, signalLevel: 3, dBm: -80 }])));
      expect(SignalFormatter.bestLevel([{ signalType: 5, signalLevel: 3, dBm: -80 }])).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.formatSignal({ signalType: 5, signalLevel: 3, dBm: -80 }).includes('/')));
      expect(SignalFormatter.formatSignal({ signalType: 5, signalLevel: 3, dBm: -80 }).includes('/')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0004 end');
    })

    /**
     * @tc.name   testIntegReal0005
     * @tc.number SUB_RADIO_INTEG_0005
     * @tc.desc   cross-model consistency probe 5 keeps shared enum mappings aligned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIntegReal0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0005 begin');
      const result: string = RadioTechFormatter.techName(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.techName(99)));
      expect(RadioTechFormatter.techName(99)).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(NetworkStateFormatter.formatRegState(9)));
      expect(NetworkStateFormatter.formatRegState(9)).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(NetworkStateFormatter.formatNsaState(9)));
      expect(NetworkStateFormatter.formatNsaState(9)).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0005 end');
    })

    /**
     * @tc.name   testIntegReal0006
     * @tc.number SUB_RADIO_INTEG_0006
     * @tc.desc   cross-model consistency probe 6 keeps shared enum mappings aligned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIntegReal0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0006 begin');
      const result: string = RadioTechFormatter.formatPair(12, 12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(RadioTechFormatter.isNr(12)));
      expect(RadioTechFormatter.isNr(12)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.typeName(6)));
      expect(SignalFormatter.typeName(6)).assertEqual('nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.formatPair(12, 12).includes('ps:nr')));
      expect(RadioTechFormatter.formatPair(12, 12).includes('ps:nr')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0006 end');
    })

    /**
     * @tc.name   testIntegReal0007
     * @tc.number SUB_RADIO_INTEG_0007
     * @tc.desc   cross-model consistency probe 7 keeps shared enum mappings aligned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIntegReal0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0007 begin');
      const result: string = SlotModel.formatTitle(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.slotIndexFromTitle(SlotModel.formatTitle(2))));
      expect(SlotModel.slotIndexFromTitle(SlotModel.formatTitle(2))).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(2)));
      expect(SlotModel.formatTitle(2)).assertEqual('SIM3 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(SlotModel.isValidSlotId(2)));
      expect(SlotModel.isValidSlotId(2)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0007 end');
    })

    /**
     * @tc.name   testIntegReal0008
     * @tc.number SUB_RADIO_INTEG_0008
     * @tc.desc   cross-model consistency probe 8 keeps shared enum mappings aligned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIntegReal0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0008 begin');
      const result: string = NetworkStateFormatter.formatNsaState(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(NetworkStateFormatter.formatRegState(3)));
      expect(NetworkStateFormatter.formatRegState(3)).assertEqual('power off');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(NetworkStateFormatter.formatNsaState(0)));
      expect(NetworkStateFormatter.formatNsaState(0)).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(NetworkStateFormatter.formatRegState(99) === 'unknown'));
      expect(NetworkStateFormatter.formatRegState(99) === 'unknown').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0008 end');
    })

    /**
     * @tc.name   testIntegReal0009
     * @tc.number SUB_RADIO_INTEG_0009
     * @tc.desc   cross-model consistency probe 9 keeps shared enum mappings aligned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIntegReal0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0009 begin');
      const result: string = SignalFormatter.levelName(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.levelName(3)));
      expect(SignalFormatter.levelName(3)).assertEqual('good');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel([{ signalType: 5, signalLevel: 3, dBm: -80 }])));
      expect(SignalFormatter.bestLevel([{ signalType: 5, signalLevel: 3, dBm: -80 }])).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.formatSignal({ signalType: 5, signalLevel: 3, dBm: -80 }).includes('/')));
      expect(SignalFormatter.formatSignal({ signalType: 5, signalLevel: 3, dBm: -80 }).includes('/')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0009 end');
    })

    /**
     * @tc.name   testIntegReal0010
     * @tc.number SUB_RADIO_INTEG_0010
     * @tc.desc   cross-model consistency probe 10 keeps shared enum mappings aligned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIntegReal0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0010 begin');
      const result: string = RadioTechFormatter.techName(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.techName(99)));
      expect(RadioTechFormatter.techName(99)).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(NetworkStateFormatter.formatRegState(9)));
      expect(NetworkStateFormatter.formatRegState(9)).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(NetworkStateFormatter.formatNsaState(9)));
      expect(NetworkStateFormatter.formatNsaState(9)).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0010 end');
    })

    /**
     * @tc.name   testIntegReal0011
     * @tc.number SUB_RADIO_INTEG_0011
     * @tc.desc   cross-model consistency probe 11 keeps shared enum mappings aligned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIntegReal0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0011 begin');
      const result: string = RadioTechFormatter.formatPair(12, 12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(RadioTechFormatter.isNr(12)));
      expect(RadioTechFormatter.isNr(12)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.typeName(6)));
      expect(SignalFormatter.typeName(6)).assertEqual('nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.formatPair(12, 12).includes('ps:nr')));
      expect(RadioTechFormatter.formatPair(12, 12).includes('ps:nr')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0011 end');
    })

    /**
     * @tc.name   testIntegReal0012
     * @tc.number SUB_RADIO_INTEG_0012
     * @tc.desc   cross-model consistency probe 12 keeps shared enum mappings aligned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIntegReal0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0012 begin');
      const result: string = SlotModel.formatTitle(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.slotIndexFromTitle(SlotModel.formatTitle(3))));
      expect(SlotModel.slotIndexFromTitle(SlotModel.formatTitle(3))).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(3)));
      expect(SlotModel.formatTitle(3)).assertEqual('SIM4 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(SlotModel.isValidSlotId(3)));
      expect(SlotModel.isValidSlotId(3)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0012 end');
    })

    /**
     * @tc.name   testIntegReal0013
     * @tc.number SUB_RADIO_INTEG_0013
     * @tc.desc   cross-model consistency probe 13 keeps shared enum mappings aligned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIntegReal0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0013 begin');
      const result: string = NetworkStateFormatter.formatNsaState(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(NetworkStateFormatter.formatRegState(0)));
      expect(NetworkStateFormatter.formatRegState(0)).assertEqual('no service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(NetworkStateFormatter.formatNsaState(5)));
      expect(NetworkStateFormatter.formatNsaState(5)).assertEqual('dual connected');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(NetworkStateFormatter.formatRegState(99) === 'unknown'));
      expect(NetworkStateFormatter.formatRegState(99) === 'unknown').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0013 end');
    })

    /**
     * @tc.name   testIntegReal0014
     * @tc.number SUB_RADIO_INTEG_0014
     * @tc.desc   cross-model consistency probe 14 keeps shared enum mappings aligned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIntegReal0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0014 begin');
      const result: string = SignalFormatter.levelName(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.levelName(3)));
      expect(SignalFormatter.levelName(3)).assertEqual('good');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel([{ signalType: 5, signalLevel: 3, dBm: -80 }])));
      expect(SignalFormatter.bestLevel([{ signalType: 5, signalLevel: 3, dBm: -80 }])).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.formatSignal({ signalType: 5, signalLevel: 3, dBm: -80 }).includes('/')));
      expect(SignalFormatter.formatSignal({ signalType: 5, signalLevel: 3, dBm: -80 }).includes('/')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0014 end');
    })

    /**
     * @tc.name   testIntegReal0015
     * @tc.number SUB_RADIO_INTEG_0015
     * @tc.desc   cross-model consistency probe 15 keeps shared enum mappings aligned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIntegReal0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0015 begin');
      const result: string = RadioTechFormatter.techName(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.techName(99)));
      expect(RadioTechFormatter.techName(99)).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(NetworkStateFormatter.formatRegState(9)));
      expect(NetworkStateFormatter.formatRegState(9)).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(NetworkStateFormatter.formatNsaState(9)));
      expect(NetworkStateFormatter.formatNsaState(9)).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0015 end');
    })

    /**
     * @tc.name   testIntegReal0016
     * @tc.number SUB_RADIO_INTEG_0016
     * @tc.desc   cross-model consistency probe 16 keeps shared enum mappings aligned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIntegReal0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0016 begin');
      const result: string = RadioTechFormatter.formatPair(12, 12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(RadioTechFormatter.isNr(12)));
      expect(RadioTechFormatter.isNr(12)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.typeName(6)));
      expect(SignalFormatter.typeName(6)).assertEqual('nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.formatPair(12, 12).includes('ps:nr')));
      expect(RadioTechFormatter.formatPair(12, 12).includes('ps:nr')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0016 end');
    })

    /**
     * @tc.name   testIntegReal0017
     * @tc.number SUB_RADIO_INTEG_0017
     * @tc.desc   cross-model consistency probe 17 keeps shared enum mappings aligned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIntegReal0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0017 begin');
      const result: string = SlotModel.formatTitle(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.slotIndexFromTitle(SlotModel.formatTitle(0))));
      expect(SlotModel.slotIndexFromTitle(SlotModel.formatTitle(0))).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(0)));
      expect(SlotModel.formatTitle(0)).assertEqual('SIM1 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(SlotModel.isValidSlotId(0)));
      expect(SlotModel.isValidSlotId(0)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0017 end');
    })

    /**
     * @tc.name   testIntegReal0018
     * @tc.number SUB_RADIO_INTEG_0018
     * @tc.desc   cross-model consistency probe 18 keeps shared enum mappings aligned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIntegReal0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0018 begin');
      const result: string = NetworkStateFormatter.formatNsaState(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(NetworkStateFormatter.formatRegState(1)));
      expect(NetworkStateFormatter.formatRegState(1)).assertEqual('in service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(NetworkStateFormatter.formatNsaState(3)));
      expect(NetworkStateFormatter.formatNsaState(3)).assertEqual('connected detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(NetworkStateFormatter.formatRegState(99) === 'unknown'));
      expect(NetworkStateFormatter.formatRegState(99) === 'unknown').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0018 end');
    })

    /**
     * @tc.name   testIntegReal0019
     * @tc.number SUB_RADIO_INTEG_0019
     * @tc.desc   cross-model consistency probe 19 keeps shared enum mappings aligned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIntegReal0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0019 begin');
      const result: string = SignalFormatter.levelName(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.levelName(3)));
      expect(SignalFormatter.levelName(3)).assertEqual('good');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel([{ signalType: 5, signalLevel: 3, dBm: -80 }])));
      expect(SignalFormatter.bestLevel([{ signalType: 5, signalLevel: 3, dBm: -80 }])).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.formatSignal({ signalType: 5, signalLevel: 3, dBm: -80 }).includes('/')));
      expect(SignalFormatter.formatSignal({ signalType: 5, signalLevel: 3, dBm: -80 }).includes('/')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0019 end');
    })

    /**
     * @tc.name   testIntegReal0020
     * @tc.number SUB_RADIO_INTEG_0020
     * @tc.desc   cross-model consistency probe 20 keeps shared enum mappings aligned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIntegReal0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0020 begin');
      const result: string = RadioTechFormatter.techName(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.techName(99)));
      expect(RadioTechFormatter.techName(99)).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(NetworkStateFormatter.formatRegState(9)));
      expect(NetworkStateFormatter.formatRegState(9)).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(NetworkStateFormatter.formatNsaState(9)));
      expect(NetworkStateFormatter.formatNsaState(9)).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0020 end');
    })

    /**
     * @tc.name   testIntegReal0021
     * @tc.number SUB_RADIO_INTEG_0021
     * @tc.desc   cross-model consistency probe 21 keeps shared enum mappings aligned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIntegReal0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0021 begin');
      const result: string = RadioTechFormatter.formatPair(12, 12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(RadioTechFormatter.isNr(12)));
      expect(RadioTechFormatter.isNr(12)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.typeName(6)));
      expect(SignalFormatter.typeName(6)).assertEqual('nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.formatPair(12, 12).includes('ps:nr')));
      expect(RadioTechFormatter.formatPair(12, 12).includes('ps:nr')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0021 end');
    })

    /**
     * @tc.name   testIntegReal0022
     * @tc.number SUB_RADIO_INTEG_0022
     * @tc.desc   cross-model consistency probe 22 keeps shared enum mappings aligned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIntegReal0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0022 begin');
      const result: string = SlotModel.formatTitle(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.slotIndexFromTitle(SlotModel.formatTitle(1))));
      expect(SlotModel.slotIndexFromTitle(SlotModel.formatTitle(1))).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(1)));
      expect(SlotModel.formatTitle(1)).assertEqual('SIM2 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(SlotModel.isValidSlotId(1)));
      expect(SlotModel.isValidSlotId(1)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0022 end');
    })

    /**
     * @tc.name   testIntegReal0023
     * @tc.number SUB_RADIO_INTEG_0023
     * @tc.desc   cross-model consistency probe 23 keeps shared enum mappings aligned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIntegReal0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0023 begin');
      const result: string = NetworkStateFormatter.formatNsaState(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(NetworkStateFormatter.formatRegState(2)));
      expect(NetworkStateFormatter.formatRegState(2)).assertEqual('emergency call only');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(NetworkStateFormatter.formatNsaState(1)));
      expect(NetworkStateFormatter.formatNsaState(1)).assertEqual('not support');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(NetworkStateFormatter.formatRegState(99) === 'unknown'));
      expect(NetworkStateFormatter.formatRegState(99) === 'unknown').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0023 end');
    })

    /**
     * @tc.name   testIntegReal0024
     * @tc.number SUB_RADIO_INTEG_0024
     * @tc.desc   cross-model consistency probe 24 keeps shared enum mappings aligned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIntegReal0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0024 begin');
      const result: string = SignalFormatter.levelName(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.levelName(3)));
      expect(SignalFormatter.levelName(3)).assertEqual('good');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel([{ signalType: 5, signalLevel: 3, dBm: -80 }])));
      expect(SignalFormatter.bestLevel([{ signalType: 5, signalLevel: 3, dBm: -80 }])).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.formatSignal({ signalType: 5, signalLevel: 3, dBm: -80 }).includes('/')));
      expect(SignalFormatter.formatSignal({ signalType: 5, signalLevel: 3, dBm: -80 }).includes('/')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0024 end');
    })

    /**
     * @tc.name   testIntegReal0025
     * @tc.number SUB_RADIO_INTEG_0025
     * @tc.desc   cross-model consistency probe 25 keeps shared enum mappings aligned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIntegReal0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0025 begin');
      const result: string = RadioTechFormatter.techName(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.techName(99)));
      expect(RadioTechFormatter.techName(99)).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(NetworkStateFormatter.formatRegState(9)));
      expect(NetworkStateFormatter.formatRegState(9)).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(NetworkStateFormatter.formatNsaState(9)));
      expect(NetworkStateFormatter.formatNsaState(9)).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0025 end');
    })

    /**
     * @tc.name   testIntegReal0026
     * @tc.number SUB_RADIO_INTEG_0026
     * @tc.desc   cross-model consistency probe 26 keeps shared enum mappings aligned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIntegReal0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0026 begin');
      const result: string = RadioTechFormatter.formatPair(12, 12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(RadioTechFormatter.isNr(12)));
      expect(RadioTechFormatter.isNr(12)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.typeName(6)));
      expect(SignalFormatter.typeName(6)).assertEqual('nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.formatPair(12, 12).includes('ps:nr')));
      expect(RadioTechFormatter.formatPair(12, 12).includes('ps:nr')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0026 end');
    })

    /**
     * @tc.name   testIntegReal0027
     * @tc.number SUB_RADIO_INTEG_0027
     * @tc.desc   cross-model consistency probe 27 keeps shared enum mappings aligned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIntegReal0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0027 begin');
      const result: string = SlotModel.formatTitle(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.slotIndexFromTitle(SlotModel.formatTitle(2))));
      expect(SlotModel.slotIndexFromTitle(SlotModel.formatTitle(2))).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(2)));
      expect(SlotModel.formatTitle(2)).assertEqual('SIM3 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(SlotModel.isValidSlotId(2)));
      expect(SlotModel.isValidSlotId(2)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0027 end');
    })

    /**
     * @tc.name   testIntegReal0028
     * @tc.number SUB_RADIO_INTEG_0028
     * @tc.desc   cross-model consistency probe 28 keeps shared enum mappings aligned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIntegReal0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0028 begin');
      const result: string = NetworkStateFormatter.formatNsaState(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(NetworkStateFormatter.formatRegState(3)));
      expect(NetworkStateFormatter.formatRegState(3)).assertEqual('power off');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(NetworkStateFormatter.formatNsaState(6)));
      expect(NetworkStateFormatter.formatNsaState(6)).assertEqual('sa attached');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(NetworkStateFormatter.formatRegState(99) === 'unknown'));
      expect(NetworkStateFormatter.formatRegState(99) === 'unknown').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0028 end');
    })

    /**
     * @tc.name   testIntegReal0029
     * @tc.number SUB_RADIO_INTEG_0029
     * @tc.desc   cross-model consistency probe 29 keeps shared enum mappings aligned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIntegReal0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0029 begin');
      const result: string = SignalFormatter.levelName(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.levelName(3)));
      expect(SignalFormatter.levelName(3)).assertEqual('good');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel([{ signalType: 5, signalLevel: 3, dBm: -80 }])));
      expect(SignalFormatter.bestLevel([{ signalType: 5, signalLevel: 3, dBm: -80 }])).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.formatSignal({ signalType: 5, signalLevel: 3, dBm: -80 }).includes('/')));
      expect(SignalFormatter.formatSignal({ signalType: 5, signalLevel: 3, dBm: -80 }).includes('/')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0029 end');
    })

    /**
     * @tc.name   testIntegReal0030
     * @tc.number SUB_RADIO_INTEG_0030
     * @tc.desc   cross-model consistency probe 30 keeps shared enum mappings aligned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIntegReal0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0030 begin');
      const result: string = RadioTechFormatter.techName(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.techName(99)));
      expect(RadioTechFormatter.techName(99)).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(NetworkStateFormatter.formatRegState(9)));
      expect(NetworkStateFormatter.formatRegState(9)).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(NetworkStateFormatter.formatNsaState(9)));
      expect(NetworkStateFormatter.formatNsaState(9)).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0030 end');
    })

    /**
     * @tc.name   testIntegReal0031
     * @tc.number SUB_RADIO_INTEG_0031
     * @tc.desc   cross-model consistency probe 31 keeps shared enum mappings aligned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIntegReal0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0031 begin');
      const result: string = RadioTechFormatter.formatPair(12, 12);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(RadioTechFormatter.isNr(12)));
      expect(RadioTechFormatter.isNr(12)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.typeName(6)));
      expect(SignalFormatter.typeName(6)).assertEqual('nr');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.formatPair(12, 12).includes('ps:nr')));
      expect(RadioTechFormatter.formatPair(12, 12).includes('ps:nr')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0031 end');
    })

    /**
     * @tc.name   testIntegReal0032
     * @tc.number SUB_RADIO_INTEG_0032
     * @tc.desc   cross-model consistency probe 32 keeps shared enum mappings aligned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIntegReal0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0032 begin');
      const result: string = SlotModel.formatTitle(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.slotIndexFromTitle(SlotModel.formatTitle(3))));
      expect(SlotModel.slotIndexFromTitle(SlotModel.formatTitle(3))).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SlotModel.formatTitle(3)));
      expect(SlotModel.formatTitle(3)).assertEqual('SIM4 status');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(SlotModel.isValidSlotId(3)));
      expect(SlotModel.isValidSlotId(3)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0032 end');
    })

    /**
     * @tc.name   testIntegReal0033
     * @tc.number SUB_RADIO_INTEG_0033
     * @tc.desc   cross-model consistency probe 33 keeps shared enum mappings aligned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIntegReal0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0033 begin');
      const result: string = NetworkStateFormatter.formatNsaState(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(NetworkStateFormatter.formatRegState(0)));
      expect(NetworkStateFormatter.formatRegState(0)).assertEqual('no service');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(NetworkStateFormatter.formatNsaState(4)));
      expect(NetworkStateFormatter.formatNsaState(4)).assertEqual('idle detect');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(NetworkStateFormatter.formatRegState(99) === 'unknown'));
      expect(NetworkStateFormatter.formatRegState(99) === 'unknown').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0033 end');
    })

    /**
     * @tc.name   testIntegReal0034
     * @tc.number SUB_RADIO_INTEG_0034
     * @tc.desc   cross-model consistency probe 34 keeps shared enum mappings aligned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIntegReal0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0034 begin');
      const result: string = SignalFormatter.levelName(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.levelName(3)));
      expect(SignalFormatter.levelName(3)).assertEqual('good');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.bestLevel([{ signalType: 5, signalLevel: 3, dBm: -80 }])));
      expect(SignalFormatter.bestLevel([{ signalType: 5, signalLevel: 3, dBm: -80 }])).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(SignalFormatter.formatSignal({ signalType: 5, signalLevel: 3, dBm: -80 }).includes('/')));
      expect(SignalFormatter.formatSignal({ signalType: 5, signalLevel: 3, dBm: -80 }).includes('/')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0034 end');
    })

    /**
     * @tc.name   testIntegReal0035
     * @tc.number SUB_RADIO_INTEG_0035
     * @tc.desc   cross-model consistency probe 35 keeps shared enum mappings aligned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIntegReal0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0035 begin');
      const result: string = RadioTechFormatter.techName(99);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(RadioTechFormatter.techName(99)));
      expect(RadioTechFormatter.techName(99)).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(NetworkStateFormatter.formatRegState(9)));
      expect(NetworkStateFormatter.formatRegState(9)).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s',
        String(NetworkStateFormatter.formatNsaState(9)));
      expect(NetworkStateFormatter.formatNsaState(9)).assertEqual('unknown');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testIntegReal0035 end');
    })

  })
}
