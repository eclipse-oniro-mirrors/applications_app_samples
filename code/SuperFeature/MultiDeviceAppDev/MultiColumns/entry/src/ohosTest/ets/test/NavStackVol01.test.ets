/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

// @volume rule=NavPathStack.pushN(depth)->size+topName+paramRoundTrip+pop basis=spec cases=75
// Volume cases are driven by a frozen data table; the first rows are hand-tuned Anchor boundary cases.
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[MultiColumns_NAV1]';

export default function navStackVol01Test() {
  describe('MultiColumnsNavStackVol01', () => {

    /**
     * @tc.name   testNavVol4001
     * @tc.number SUB_MC_NAVG_4001
     * @tc.desc   Anchor: NavPathStack pop of a single entry returns that page and empties the stack
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4001 begin');
      const st: NavPathStack = new NavPathStack();
      st.pushPathByName('p4001', 99, false);
      const popped: NavPathInfo | undefined = st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(popped?.name), 'p4001');
      expect(popped?.name).assertEqual('p4001');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(0));
      expect(st.size()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName().length), String(0));
      expect(st.getAllPathName().length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4001 end');
    });

    /**
     * @tc.name   testNavVol4002
     * @tc.number SUB_MC_NAVG_4002
     * @tc.desc   Anchor: NavPathStack keeps duplicate names addressable and shrinks index list after pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4002 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 10; i++) { st.pushPath({ name: 'dup' }); }
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=9', String(st.size()));
      expect(st.size()).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getIndexByName('dup').length), String(9));
      expect(st.getIndexByName('dup').length).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName()[0]), String('dup'));
      expect(st.getAllPathName()[0]).assertEqual('dup');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4002 end');
    });

    /**
     * @tc.name   testNavVol4003
     * @tc.number SUB_MC_NAVG_4003
     * @tc.desc   NavPathStack push depth 4 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4003 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 4; i++) { st.pushPathByName('p4003_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=4', String(st.size()));
      expect(st.size()).assertEqual(4);
      const last: string = st.getAllPathName()[3];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4003_3'));
      expect(last).assertEqual('p4003_3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(3) as number), String(3));
      expect(st.getParamByIndex(3) as number).assertEqual(3);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(3));
      expect(st.size()).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4003 end');
    });

    /**
     * @tc.name   testNavVol4004
     * @tc.number SUB_MC_NAVG_4004
     * @tc.desc   NavPathStack push depth 5 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4004 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 5; i++) { st.pushPathByName('p4004_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=5', String(st.size()));
      expect(st.size()).assertEqual(5);
      const last: string = st.getAllPathName()[4];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4004_4'));
      expect(last).assertEqual('p4004_4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(4) as number), String(4));
      expect(st.getParamByIndex(4) as number).assertEqual(4);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(4));
      expect(st.size()).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4004 end');
    });

    /**
     * @tc.name   testNavVol4005
     * @tc.number SUB_MC_NAVG_4005
     * @tc.desc   NavPathStack push depth 6 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4005 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 6; i++) { st.pushPathByName('p4005_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=6', String(st.size()));
      expect(st.size()).assertEqual(6);
      const last: string = st.getAllPathName()[5];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4005_5'));
      expect(last).assertEqual('p4005_5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(5) as number), String(5));
      expect(st.getParamByIndex(5) as number).assertEqual(5);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(5));
      expect(st.size()).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4005 end');
    });

    /**
     * @tc.name   testNavVol4006
     * @tc.number SUB_MC_NAVG_4006
     * @tc.desc   NavPathStack push depth 7 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4006 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 7; i++) { st.pushPathByName('p4006_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=7', String(st.size()));
      expect(st.size()).assertEqual(7);
      const last: string = st.getAllPathName()[6];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4006_6'));
      expect(last).assertEqual('p4006_6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(6) as number), String(6));
      expect(st.getParamByIndex(6) as number).assertEqual(6);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(6));
      expect(st.size()).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4006 end');
    });

    /**
     * @tc.name   testNavVol4007
     * @tc.number SUB_MC_NAVG_4007
     * @tc.desc   NavPathStack push depth 8 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4007 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 8; i++) { st.pushPathByName('p4007_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=8', String(st.size()));
      expect(st.size()).assertEqual(8);
      const last: string = st.getAllPathName()[7];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4007_7'));
      expect(last).assertEqual('p4007_7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(7) as number), String(7));
      expect(st.getParamByIndex(7) as number).assertEqual(7);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(7));
      expect(st.size()).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4007 end');
    });

    /**
     * @tc.name   testNavVol4008
     * @tc.number SUB_MC_NAVG_4008
     * @tc.desc   NavPathStack push depth 9 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4008 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 9; i++) { st.pushPathByName('p4008_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=9', String(st.size()));
      expect(st.size()).assertEqual(9);
      const last: string = st.getAllPathName()[8];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4008_8'));
      expect(last).assertEqual('p4008_8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(8) as number), String(8));
      expect(st.getParamByIndex(8) as number).assertEqual(8);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(8));
      expect(st.size()).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4008 end');
    });

    /**
     * @tc.name   testNavVol4009
     * @tc.number SUB_MC_NAVG_4009
     * @tc.desc   NavPathStack push depth 10 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4009 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 10; i++) { st.pushPathByName('p4009_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(st.size()));
      expect(st.size()).assertEqual(10);
      const last: string = st.getAllPathName()[9];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4009_9'));
      expect(last).assertEqual('p4009_9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(9) as number), String(9));
      expect(st.getParamByIndex(9) as number).assertEqual(9);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(9));
      expect(st.size()).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4009 end');
    });

    /**
     * @tc.name   testNavVol4010
     * @tc.number SUB_MC_NAVG_4010
     * @tc.desc   NavPathStack push depth 1 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4010 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 1; i++) { st.pushPathByName('p4010_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=1', String(st.size()));
      expect(st.size()).assertEqual(1);
      const last: string = st.getAllPathName()[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4010_0'));
      expect(last).assertEqual('p4010_0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(0) as number), String(0));
      expect(st.getParamByIndex(0) as number).assertEqual(0);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(0));
      expect(st.size()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4010 end');
    });

    /**
     * @tc.name   testNavVol4011
     * @tc.number SUB_MC_NAVG_4011
     * @tc.desc   NavPathStack push depth 2 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4011 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 2; i++) { st.pushPathByName('p4011_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=2', String(st.size()));
      expect(st.size()).assertEqual(2);
      const last: string = st.getAllPathName()[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4011_1'));
      expect(last).assertEqual('p4011_1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(1) as number), String(1));
      expect(st.getParamByIndex(1) as number).assertEqual(1);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(1));
      expect(st.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4011 end');
    });

    /**
     * @tc.name   testNavVol4012
     * @tc.number SUB_MC_NAVG_4012
     * @tc.desc   NavPathStack push depth 3 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4012 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 3; i++) { st.pushPathByName('p4012_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=3', String(st.size()));
      expect(st.size()).assertEqual(3);
      const last: string = st.getAllPathName()[2];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4012_2'));
      expect(last).assertEqual('p4012_2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(2) as number), String(2));
      expect(st.getParamByIndex(2) as number).assertEqual(2);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(2));
      expect(st.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4012 end');
    });

    /**
     * @tc.name   testNavVol4013
     * @tc.number SUB_MC_NAVG_4013
     * @tc.desc   NavPathStack push depth 4 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4013 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 4; i++) { st.pushPathByName('p4013_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=4', String(st.size()));
      expect(st.size()).assertEqual(4);
      const last: string = st.getAllPathName()[3];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4013_3'));
      expect(last).assertEqual('p4013_3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(3) as number), String(3));
      expect(st.getParamByIndex(3) as number).assertEqual(3);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(3));
      expect(st.size()).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4013 end');
    });

    /**
     * @tc.name   testNavVol4014
     * @tc.number SUB_MC_NAVG_4014
     * @tc.desc   NavPathStack push depth 5 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4014 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 5; i++) { st.pushPathByName('p4014_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=5', String(st.size()));
      expect(st.size()).assertEqual(5);
      const last: string = st.getAllPathName()[4];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4014_4'));
      expect(last).assertEqual('p4014_4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(4) as number), String(4));
      expect(st.getParamByIndex(4) as number).assertEqual(4);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(4));
      expect(st.size()).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4014 end');
    });

    /**
     * @tc.name   testNavVol4015
     * @tc.number SUB_MC_NAVG_4015
     * @tc.desc   NavPathStack push depth 6 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4015 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 6; i++) { st.pushPathByName('p4015_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=6', String(st.size()));
      expect(st.size()).assertEqual(6);
      const last: string = st.getAllPathName()[5];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4015_5'));
      expect(last).assertEqual('p4015_5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(5) as number), String(5));
      expect(st.getParamByIndex(5) as number).assertEqual(5);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(5));
      expect(st.size()).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4015 end');
    });

    /**
     * @tc.name   testNavVol4016
     * @tc.number SUB_MC_NAVG_4016
     * @tc.desc   NavPathStack push depth 7 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4016 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 7; i++) { st.pushPathByName('p4016_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=7', String(st.size()));
      expect(st.size()).assertEqual(7);
      const last: string = st.getAllPathName()[6];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4016_6'));
      expect(last).assertEqual('p4016_6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(6) as number), String(6));
      expect(st.getParamByIndex(6) as number).assertEqual(6);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(6));
      expect(st.size()).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4016 end');
    });

    /**
     * @tc.name   testNavVol4017
     * @tc.number SUB_MC_NAVG_4017
     * @tc.desc   NavPathStack push depth 8 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4017 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 8; i++) { st.pushPathByName('p4017_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=8', String(st.size()));
      expect(st.size()).assertEqual(8);
      const last: string = st.getAllPathName()[7];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4017_7'));
      expect(last).assertEqual('p4017_7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(7) as number), String(7));
      expect(st.getParamByIndex(7) as number).assertEqual(7);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(7));
      expect(st.size()).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4017 end');
    });

    /**
     * @tc.name   testNavVol4018
     * @tc.number SUB_MC_NAVG_4018
     * @tc.desc   NavPathStack push depth 9 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4018 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 9; i++) { st.pushPathByName('p4018_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=9', String(st.size()));
      expect(st.size()).assertEqual(9);
      const last: string = st.getAllPathName()[8];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4018_8'));
      expect(last).assertEqual('p4018_8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(8) as number), String(8));
      expect(st.getParamByIndex(8) as number).assertEqual(8);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(8));
      expect(st.size()).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4018 end');
    });

    /**
     * @tc.name   testNavVol4019
     * @tc.number SUB_MC_NAVG_4019
     * @tc.desc   NavPathStack push depth 10 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4019 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 10; i++) { st.pushPathByName('p4019_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(st.size()));
      expect(st.size()).assertEqual(10);
      const last: string = st.getAllPathName()[9];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4019_9'));
      expect(last).assertEqual('p4019_9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(9) as number), String(9));
      expect(st.getParamByIndex(9) as number).assertEqual(9);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(9));
      expect(st.size()).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4019 end');
    });

    /**
     * @tc.name   testNavVol4020
     * @tc.number SUB_MC_NAVG_4020
     * @tc.desc   NavPathStack push depth 1 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4020 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 1; i++) { st.pushPathByName('p4020_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=1', String(st.size()));
      expect(st.size()).assertEqual(1);
      const last: string = st.getAllPathName()[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4020_0'));
      expect(last).assertEqual('p4020_0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(0) as number), String(0));
      expect(st.getParamByIndex(0) as number).assertEqual(0);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(0));
      expect(st.size()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4020 end');
    });

    /**
     * @tc.name   testNavVol4021
     * @tc.number SUB_MC_NAVG_4021
     * @tc.desc   NavPathStack push depth 2 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4021 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 2; i++) { st.pushPathByName('p4021_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=2', String(st.size()));
      expect(st.size()).assertEqual(2);
      const last: string = st.getAllPathName()[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4021_1'));
      expect(last).assertEqual('p4021_1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(1) as number), String(1));
      expect(st.getParamByIndex(1) as number).assertEqual(1);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(1));
      expect(st.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4021 end');
    });

    /**
     * @tc.name   testNavVol4022
     * @tc.number SUB_MC_NAVG_4022
     * @tc.desc   NavPathStack push depth 3 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4022 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 3; i++) { st.pushPathByName('p4022_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=3', String(st.size()));
      expect(st.size()).assertEqual(3);
      const last: string = st.getAllPathName()[2];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4022_2'));
      expect(last).assertEqual('p4022_2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(2) as number), String(2));
      expect(st.getParamByIndex(2) as number).assertEqual(2);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(2));
      expect(st.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4022 end');
    });

    /**
     * @tc.name   testNavVol4023
     * @tc.number SUB_MC_NAVG_4023
     * @tc.desc   NavPathStack push depth 4 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4023 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 4; i++) { st.pushPathByName('p4023_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=4', String(st.size()));
      expect(st.size()).assertEqual(4);
      const last: string = st.getAllPathName()[3];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4023_3'));
      expect(last).assertEqual('p4023_3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(3) as number), String(3));
      expect(st.getParamByIndex(3) as number).assertEqual(3);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(3));
      expect(st.size()).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4023 end');
    });

    /**
     * @tc.name   testNavVol4024
     * @tc.number SUB_MC_NAVG_4024
     * @tc.desc   NavPathStack push depth 5 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4024 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 5; i++) { st.pushPathByName('p4024_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=5', String(st.size()));
      expect(st.size()).assertEqual(5);
      const last: string = st.getAllPathName()[4];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4024_4'));
      expect(last).assertEqual('p4024_4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(4) as number), String(4));
      expect(st.getParamByIndex(4) as number).assertEqual(4);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(4));
      expect(st.size()).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4024 end');
    });

    /**
     * @tc.name   testNavVol4025
     * @tc.number SUB_MC_NAVG_4025
     * @tc.desc   NavPathStack push depth 6 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4025 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 6; i++) { st.pushPathByName('p4025_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=6', String(st.size()));
      expect(st.size()).assertEqual(6);
      const last: string = st.getAllPathName()[5];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4025_5'));
      expect(last).assertEqual('p4025_5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(5) as number), String(5));
      expect(st.getParamByIndex(5) as number).assertEqual(5);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(5));
      expect(st.size()).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4025 end');
    });

    /**
     * @tc.name   testNavVol4026
     * @tc.number SUB_MC_NAVG_4026
     * @tc.desc   NavPathStack push depth 7 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4026 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 7; i++) { st.pushPathByName('p4026_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=7', String(st.size()));
      expect(st.size()).assertEqual(7);
      const last: string = st.getAllPathName()[6];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4026_6'));
      expect(last).assertEqual('p4026_6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(6) as number), String(6));
      expect(st.getParamByIndex(6) as number).assertEqual(6);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(6));
      expect(st.size()).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4026 end');
    });

    /**
     * @tc.name   testNavVol4027
     * @tc.number SUB_MC_NAVG_4027
     * @tc.desc   NavPathStack push depth 8 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4027 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 8; i++) { st.pushPathByName('p4027_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=8', String(st.size()));
      expect(st.size()).assertEqual(8);
      const last: string = st.getAllPathName()[7];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4027_7'));
      expect(last).assertEqual('p4027_7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(7) as number), String(7));
      expect(st.getParamByIndex(7) as number).assertEqual(7);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(7));
      expect(st.size()).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4027 end');
    });

    /**
     * @tc.name   testNavVol4028
     * @tc.number SUB_MC_NAVG_4028
     * @tc.desc   NavPathStack push depth 9 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4028 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 9; i++) { st.pushPathByName('p4028_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=9', String(st.size()));
      expect(st.size()).assertEqual(9);
      const last: string = st.getAllPathName()[8];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4028_8'));
      expect(last).assertEqual('p4028_8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(8) as number), String(8));
      expect(st.getParamByIndex(8) as number).assertEqual(8);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(8));
      expect(st.size()).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4028 end');
    });

    /**
     * @tc.name   testNavVol4029
     * @tc.number SUB_MC_NAVG_4029
     * @tc.desc   NavPathStack push depth 10 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4029 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 10; i++) { st.pushPathByName('p4029_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(st.size()));
      expect(st.size()).assertEqual(10);
      const last: string = st.getAllPathName()[9];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4029_9'));
      expect(last).assertEqual('p4029_9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(9) as number), String(9));
      expect(st.getParamByIndex(9) as number).assertEqual(9);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(9));
      expect(st.size()).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4029 end');
    });

    /**
     * @tc.name   testNavVol4030
     * @tc.number SUB_MC_NAVG_4030
     * @tc.desc   NavPathStack push depth 1 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4030 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 1; i++) { st.pushPathByName('p4030_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=1', String(st.size()));
      expect(st.size()).assertEqual(1);
      const last: string = st.getAllPathName()[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4030_0'));
      expect(last).assertEqual('p4030_0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(0) as number), String(0));
      expect(st.getParamByIndex(0) as number).assertEqual(0);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(0));
      expect(st.size()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4030 end');
    });

    /**
     * @tc.name   testNavVol4031
     * @tc.number SUB_MC_NAVG_4031
     * @tc.desc   NavPathStack push depth 2 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4031 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 2; i++) { st.pushPathByName('p4031_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=2', String(st.size()));
      expect(st.size()).assertEqual(2);
      const last: string = st.getAllPathName()[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4031_1'));
      expect(last).assertEqual('p4031_1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(1) as number), String(1));
      expect(st.getParamByIndex(1) as number).assertEqual(1);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(1));
      expect(st.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4031 end');
    });

    /**
     * @tc.name   testNavVol4032
     * @tc.number SUB_MC_NAVG_4032
     * @tc.desc   NavPathStack push depth 3 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4032 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 3; i++) { st.pushPathByName('p4032_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=3', String(st.size()));
      expect(st.size()).assertEqual(3);
      const last: string = st.getAllPathName()[2];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4032_2'));
      expect(last).assertEqual('p4032_2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(2) as number), String(2));
      expect(st.getParamByIndex(2) as number).assertEqual(2);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(2));
      expect(st.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4032 end');
    });

    /**
     * @tc.name   testNavVol4033
     * @tc.number SUB_MC_NAVG_4033
     * @tc.desc   NavPathStack push depth 4 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4033 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 4; i++) { st.pushPathByName('p4033_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=4', String(st.size()));
      expect(st.size()).assertEqual(4);
      const last: string = st.getAllPathName()[3];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4033_3'));
      expect(last).assertEqual('p4033_3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(3) as number), String(3));
      expect(st.getParamByIndex(3) as number).assertEqual(3);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(3));
      expect(st.size()).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4033 end');
    });

    /**
     * @tc.name   testNavVol4034
     * @tc.number SUB_MC_NAVG_4034
     * @tc.desc   NavPathStack push depth 5 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4034 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 5; i++) { st.pushPathByName('p4034_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=5', String(st.size()));
      expect(st.size()).assertEqual(5);
      const last: string = st.getAllPathName()[4];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4034_4'));
      expect(last).assertEqual('p4034_4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(4) as number), String(4));
      expect(st.getParamByIndex(4) as number).assertEqual(4);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(4));
      expect(st.size()).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4034 end');
    });

    /**
     * @tc.name   testNavVol4035
     * @tc.number SUB_MC_NAVG_4035
     * @tc.desc   NavPathStack push depth 6 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4035 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 6; i++) { st.pushPathByName('p4035_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=6', String(st.size()));
      expect(st.size()).assertEqual(6);
      const last: string = st.getAllPathName()[5];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4035_5'));
      expect(last).assertEqual('p4035_5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(5) as number), String(5));
      expect(st.getParamByIndex(5) as number).assertEqual(5);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(5));
      expect(st.size()).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4035 end');
    });

    /**
     * @tc.name   testNavVol4036
     * @tc.number SUB_MC_NAVG_4036
     * @tc.desc   NavPathStack push depth 7 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4036 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 7; i++) { st.pushPathByName('p4036_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=7', String(st.size()));
      expect(st.size()).assertEqual(7);
      const last: string = st.getAllPathName()[6];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4036_6'));
      expect(last).assertEqual('p4036_6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(6) as number), String(6));
      expect(st.getParamByIndex(6) as number).assertEqual(6);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(6));
      expect(st.size()).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4036 end');
    });

    /**
     * @tc.name   testNavVol4037
     * @tc.number SUB_MC_NAVG_4037
     * @tc.desc   NavPathStack push depth 8 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4037 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 8; i++) { st.pushPathByName('p4037_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=8', String(st.size()));
      expect(st.size()).assertEqual(8);
      const last: string = st.getAllPathName()[7];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4037_7'));
      expect(last).assertEqual('p4037_7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(7) as number), String(7));
      expect(st.getParamByIndex(7) as number).assertEqual(7);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(7));
      expect(st.size()).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4037 end');
    });

    /**
     * @tc.name   testNavVol4038
     * @tc.number SUB_MC_NAVG_4038
     * @tc.desc   NavPathStack push depth 9 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4038 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 9; i++) { st.pushPathByName('p4038_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=9', String(st.size()));
      expect(st.size()).assertEqual(9);
      const last: string = st.getAllPathName()[8];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4038_8'));
      expect(last).assertEqual('p4038_8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(8) as number), String(8));
      expect(st.getParamByIndex(8) as number).assertEqual(8);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(8));
      expect(st.size()).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4038 end');
    });

    /**
     * @tc.name   testNavVol4039
     * @tc.number SUB_MC_NAVG_4039
     * @tc.desc   NavPathStack push depth 10 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4039 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 10; i++) { st.pushPathByName('p4039_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(st.size()));
      expect(st.size()).assertEqual(10);
      const last: string = st.getAllPathName()[9];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4039_9'));
      expect(last).assertEqual('p4039_9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(9) as number), String(9));
      expect(st.getParamByIndex(9) as number).assertEqual(9);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(9));
      expect(st.size()).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4039 end');
    });

    /**
     * @tc.name   testNavVol4040
     * @tc.number SUB_MC_NAVG_4040
     * @tc.desc   NavPathStack push depth 1 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4040 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 1; i++) { st.pushPathByName('p4040_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=1', String(st.size()));
      expect(st.size()).assertEqual(1);
      const last: string = st.getAllPathName()[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4040_0'));
      expect(last).assertEqual('p4040_0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(0) as number), String(0));
      expect(st.getParamByIndex(0) as number).assertEqual(0);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(0));
      expect(st.size()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4040 end');
    });

    /**
     * @tc.name   testNavVol4041
     * @tc.number SUB_MC_NAVG_4041
     * @tc.desc   NavPathStack push depth 2 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4041 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 2; i++) { st.pushPathByName('p4041_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=2', String(st.size()));
      expect(st.size()).assertEqual(2);
      const last: string = st.getAllPathName()[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4041_1'));
      expect(last).assertEqual('p4041_1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(1) as number), String(1));
      expect(st.getParamByIndex(1) as number).assertEqual(1);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(1));
      expect(st.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4041 end');
    });

    /**
     * @tc.name   testNavVol4042
     * @tc.number SUB_MC_NAVG_4042
     * @tc.desc   NavPathStack push depth 3 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4042 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 3; i++) { st.pushPathByName('p4042_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=3', String(st.size()));
      expect(st.size()).assertEqual(3);
      const last: string = st.getAllPathName()[2];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4042_2'));
      expect(last).assertEqual('p4042_2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(2) as number), String(2));
      expect(st.getParamByIndex(2) as number).assertEqual(2);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(2));
      expect(st.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4042 end');
    });

    /**
     * @tc.name   testNavVol4043
     * @tc.number SUB_MC_NAVG_4043
     * @tc.desc   NavPathStack push depth 4 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4043 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 4; i++) { st.pushPathByName('p4043_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=4', String(st.size()));
      expect(st.size()).assertEqual(4);
      const last: string = st.getAllPathName()[3];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4043_3'));
      expect(last).assertEqual('p4043_3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(3) as number), String(3));
      expect(st.getParamByIndex(3) as number).assertEqual(3);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(3));
      expect(st.size()).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4043 end');
    });

    /**
     * @tc.name   testNavVol4044
     * @tc.number SUB_MC_NAVG_4044
     * @tc.desc   NavPathStack push depth 5 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4044 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 5; i++) { st.pushPathByName('p4044_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=5', String(st.size()));
      expect(st.size()).assertEqual(5);
      const last: string = st.getAllPathName()[4];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4044_4'));
      expect(last).assertEqual('p4044_4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(4) as number), String(4));
      expect(st.getParamByIndex(4) as number).assertEqual(4);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(4));
      expect(st.size()).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4044 end');
    });

    /**
     * @tc.name   testNavVol4045
     * @tc.number SUB_MC_NAVG_4045
     * @tc.desc   NavPathStack push depth 6 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4045 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 6; i++) { st.pushPathByName('p4045_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=6', String(st.size()));
      expect(st.size()).assertEqual(6);
      const last: string = st.getAllPathName()[5];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4045_5'));
      expect(last).assertEqual('p4045_5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(5) as number), String(5));
      expect(st.getParamByIndex(5) as number).assertEqual(5);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(5));
      expect(st.size()).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4045 end');
    });

    /**
     * @tc.name   testNavVol4046
     * @tc.number SUB_MC_NAVG_4046
     * @tc.desc   NavPathStack push depth 7 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4046 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 7; i++) { st.pushPathByName('p4046_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=7', String(st.size()));
      expect(st.size()).assertEqual(7);
      const last: string = st.getAllPathName()[6];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4046_6'));
      expect(last).assertEqual('p4046_6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(6) as number), String(6));
      expect(st.getParamByIndex(6) as number).assertEqual(6);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(6));
      expect(st.size()).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4046 end');
    });

    /**
     * @tc.name   testNavVol4047
     * @tc.number SUB_MC_NAVG_4047
     * @tc.desc   NavPathStack push depth 8 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4047 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 8; i++) { st.pushPathByName('p4047_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=8', String(st.size()));
      expect(st.size()).assertEqual(8);
      const last: string = st.getAllPathName()[7];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4047_7'));
      expect(last).assertEqual('p4047_7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(7) as number), String(7));
      expect(st.getParamByIndex(7) as number).assertEqual(7);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(7));
      expect(st.size()).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4047 end');
    });

    /**
     * @tc.name   testNavVol4048
     * @tc.number SUB_MC_NAVG_4048
     * @tc.desc   NavPathStack push depth 9 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4048 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 9; i++) { st.pushPathByName('p4048_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=9', String(st.size()));
      expect(st.size()).assertEqual(9);
      const last: string = st.getAllPathName()[8];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4048_8'));
      expect(last).assertEqual('p4048_8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(8) as number), String(8));
      expect(st.getParamByIndex(8) as number).assertEqual(8);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(8));
      expect(st.size()).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4048 end');
    });

    /**
     * @tc.name   testNavVol4049
     * @tc.number SUB_MC_NAVG_4049
     * @tc.desc   NavPathStack push depth 10 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4049 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 10; i++) { st.pushPathByName('p4049_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(st.size()));
      expect(st.size()).assertEqual(10);
      const last: string = st.getAllPathName()[9];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4049_9'));
      expect(last).assertEqual('p4049_9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(9) as number), String(9));
      expect(st.getParamByIndex(9) as number).assertEqual(9);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(9));
      expect(st.size()).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4049 end');
    });

    /**
     * @tc.name   testNavVol4050
     * @tc.number SUB_MC_NAVG_4050
     * @tc.desc   NavPathStack push depth 1 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4050 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 1; i++) { st.pushPathByName('p4050_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=1', String(st.size()));
      expect(st.size()).assertEqual(1);
      const last: string = st.getAllPathName()[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4050_0'));
      expect(last).assertEqual('p4050_0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(0) as number), String(0));
      expect(st.getParamByIndex(0) as number).assertEqual(0);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(0));
      expect(st.size()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4050 end');
    });

    /**
     * @tc.name   testNavVol4051
     * @tc.number SUB_MC_NAVG_4051
     * @tc.desc   NavPathStack push depth 2 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4051 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 2; i++) { st.pushPathByName('p4051_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=2', String(st.size()));
      expect(st.size()).assertEqual(2);
      const last: string = st.getAllPathName()[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4051_1'));
      expect(last).assertEqual('p4051_1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(1) as number), String(1));
      expect(st.getParamByIndex(1) as number).assertEqual(1);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(1));
      expect(st.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4051 end');
    });

    /**
     * @tc.name   testNavVol4052
     * @tc.number SUB_MC_NAVG_4052
     * @tc.desc   NavPathStack push depth 3 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4052 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 3; i++) { st.pushPathByName('p4052_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=3', String(st.size()));
      expect(st.size()).assertEqual(3);
      const last: string = st.getAllPathName()[2];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4052_2'));
      expect(last).assertEqual('p4052_2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(2) as number), String(2));
      expect(st.getParamByIndex(2) as number).assertEqual(2);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(2));
      expect(st.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4052 end');
    });

    /**
     * @tc.name   testNavVol4053
     * @tc.number SUB_MC_NAVG_4053
     * @tc.desc   NavPathStack push depth 4 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4053 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 4; i++) { st.pushPathByName('p4053_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=4', String(st.size()));
      expect(st.size()).assertEqual(4);
      const last: string = st.getAllPathName()[3];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4053_3'));
      expect(last).assertEqual('p4053_3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(3) as number), String(3));
      expect(st.getParamByIndex(3) as number).assertEqual(3);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(3));
      expect(st.size()).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4053 end');
    });

    /**
     * @tc.name   testNavVol4054
     * @tc.number SUB_MC_NAVG_4054
     * @tc.desc   NavPathStack push depth 5 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4054 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 5; i++) { st.pushPathByName('p4054_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=5', String(st.size()));
      expect(st.size()).assertEqual(5);
      const last: string = st.getAllPathName()[4];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4054_4'));
      expect(last).assertEqual('p4054_4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(4) as number), String(4));
      expect(st.getParamByIndex(4) as number).assertEqual(4);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(4));
      expect(st.size()).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4054 end');
    });

    /**
     * @tc.name   testNavVol4055
     * @tc.number SUB_MC_NAVG_4055
     * @tc.desc   NavPathStack push depth 6 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4055 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 6; i++) { st.pushPathByName('p4055_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=6', String(st.size()));
      expect(st.size()).assertEqual(6);
      const last: string = st.getAllPathName()[5];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4055_5'));
      expect(last).assertEqual('p4055_5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(5) as number), String(5));
      expect(st.getParamByIndex(5) as number).assertEqual(5);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(5));
      expect(st.size()).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4055 end');
    });

    /**
     * @tc.name   testNavVol4056
     * @tc.number SUB_MC_NAVG_4056
     * @tc.desc   NavPathStack push depth 7 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4056 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 7; i++) { st.pushPathByName('p4056_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=7', String(st.size()));
      expect(st.size()).assertEqual(7);
      const last: string = st.getAllPathName()[6];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4056_6'));
      expect(last).assertEqual('p4056_6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(6) as number), String(6));
      expect(st.getParamByIndex(6) as number).assertEqual(6);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(6));
      expect(st.size()).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4056 end');
    });

    /**
     * @tc.name   testNavVol4057
     * @tc.number SUB_MC_NAVG_4057
     * @tc.desc   NavPathStack push depth 8 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4057 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 8; i++) { st.pushPathByName('p4057_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=8', String(st.size()));
      expect(st.size()).assertEqual(8);
      const last: string = st.getAllPathName()[7];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4057_7'));
      expect(last).assertEqual('p4057_7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(7) as number), String(7));
      expect(st.getParamByIndex(7) as number).assertEqual(7);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(7));
      expect(st.size()).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4057 end');
    });

    /**
     * @tc.name   testNavVol4058
     * @tc.number SUB_MC_NAVG_4058
     * @tc.desc   NavPathStack push depth 9 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4058 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 9; i++) { st.pushPathByName('p4058_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=9', String(st.size()));
      expect(st.size()).assertEqual(9);
      const last: string = st.getAllPathName()[8];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4058_8'));
      expect(last).assertEqual('p4058_8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(8) as number), String(8));
      expect(st.getParamByIndex(8) as number).assertEqual(8);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(8));
      expect(st.size()).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4058 end');
    });

    /**
     * @tc.name   testNavVol4059
     * @tc.number SUB_MC_NAVG_4059
     * @tc.desc   NavPathStack push depth 10 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4059 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 10; i++) { st.pushPathByName('p4059_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(st.size()));
      expect(st.size()).assertEqual(10);
      const last: string = st.getAllPathName()[9];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4059_9'));
      expect(last).assertEqual('p4059_9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(9) as number), String(9));
      expect(st.getParamByIndex(9) as number).assertEqual(9);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(9));
      expect(st.size()).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4059 end');
    });

    /**
     * @tc.name   testNavVol4060
     * @tc.number SUB_MC_NAVG_4060
     * @tc.desc   NavPathStack push depth 1 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4060 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 1; i++) { st.pushPathByName('p4060_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=1', String(st.size()));
      expect(st.size()).assertEqual(1);
      const last: string = st.getAllPathName()[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4060_0'));
      expect(last).assertEqual('p4060_0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(0) as number), String(0));
      expect(st.getParamByIndex(0) as number).assertEqual(0);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(0));
      expect(st.size()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4060 end');
    });

    /**
     * @tc.name   testNavVol4061
     * @tc.number SUB_MC_NAVG_4061
     * @tc.desc   NavPathStack push depth 2 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4061 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 2; i++) { st.pushPathByName('p4061_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=2', String(st.size()));
      expect(st.size()).assertEqual(2);
      const last: string = st.getAllPathName()[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4061_1'));
      expect(last).assertEqual('p4061_1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(1) as number), String(1));
      expect(st.getParamByIndex(1) as number).assertEqual(1);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(1));
      expect(st.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4061 end');
    });

    /**
     * @tc.name   testNavVol4062
     * @tc.number SUB_MC_NAVG_4062
     * @tc.desc   NavPathStack push depth 3 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4062 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 3; i++) { st.pushPathByName('p4062_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=3', String(st.size()));
      expect(st.size()).assertEqual(3);
      const last: string = st.getAllPathName()[2];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4062_2'));
      expect(last).assertEqual('p4062_2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(2) as number), String(2));
      expect(st.getParamByIndex(2) as number).assertEqual(2);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(2));
      expect(st.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4062 end');
    });

    /**
     * @tc.name   testNavVol4063
     * @tc.number SUB_MC_NAVG_4063
     * @tc.desc   NavPathStack push depth 4 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4063 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 4; i++) { st.pushPathByName('p4063_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=4', String(st.size()));
      expect(st.size()).assertEqual(4);
      const last: string = st.getAllPathName()[3];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4063_3'));
      expect(last).assertEqual('p4063_3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(3) as number), String(3));
      expect(st.getParamByIndex(3) as number).assertEqual(3);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(3));
      expect(st.size()).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4063 end');
    });

    /**
     * @tc.name   testNavVol4064
     * @tc.number SUB_MC_NAVG_4064
     * @tc.desc   NavPathStack push depth 5 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4064 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 5; i++) { st.pushPathByName('p4064_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=5', String(st.size()));
      expect(st.size()).assertEqual(5);
      const last: string = st.getAllPathName()[4];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4064_4'));
      expect(last).assertEqual('p4064_4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(4) as number), String(4));
      expect(st.getParamByIndex(4) as number).assertEqual(4);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(4));
      expect(st.size()).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4064 end');
    });

    /**
     * @tc.name   testNavVol4065
     * @tc.number SUB_MC_NAVG_4065
     * @tc.desc   NavPathStack push depth 6 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4065 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 6; i++) { st.pushPathByName('p4065_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=6', String(st.size()));
      expect(st.size()).assertEqual(6);
      const last: string = st.getAllPathName()[5];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4065_5'));
      expect(last).assertEqual('p4065_5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(5) as number), String(5));
      expect(st.getParamByIndex(5) as number).assertEqual(5);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(5));
      expect(st.size()).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4065 end');
    });

    /**
     * @tc.name   testNavVol4066
     * @tc.number SUB_MC_NAVG_4066
     * @tc.desc   NavPathStack push depth 7 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4066 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 7; i++) { st.pushPathByName('p4066_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=7', String(st.size()));
      expect(st.size()).assertEqual(7);
      const last: string = st.getAllPathName()[6];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4066_6'));
      expect(last).assertEqual('p4066_6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(6) as number), String(6));
      expect(st.getParamByIndex(6) as number).assertEqual(6);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(6));
      expect(st.size()).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4066 end');
    });

    /**
     * @tc.name   testNavVol4067
     * @tc.number SUB_MC_NAVG_4067
     * @tc.desc   NavPathStack push depth 8 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4067 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 8; i++) { st.pushPathByName('p4067_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=8', String(st.size()));
      expect(st.size()).assertEqual(8);
      const last: string = st.getAllPathName()[7];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4067_7'));
      expect(last).assertEqual('p4067_7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(7) as number), String(7));
      expect(st.getParamByIndex(7) as number).assertEqual(7);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(7));
      expect(st.size()).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4067 end');
    });

    /**
     * @tc.name   testNavVol4068
     * @tc.number SUB_MC_NAVG_4068
     * @tc.desc   NavPathStack push depth 9 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4068 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 9; i++) { st.pushPathByName('p4068_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=9', String(st.size()));
      expect(st.size()).assertEqual(9);
      const last: string = st.getAllPathName()[8];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4068_8'));
      expect(last).assertEqual('p4068_8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(8) as number), String(8));
      expect(st.getParamByIndex(8) as number).assertEqual(8);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(8));
      expect(st.size()).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4068 end');
    });

    /**
     * @tc.name   testNavVol4069
     * @tc.number SUB_MC_NAVG_4069
     * @tc.desc   NavPathStack push depth 10 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4069 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 10; i++) { st.pushPathByName('p4069_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(st.size()));
      expect(st.size()).assertEqual(10);
      const last: string = st.getAllPathName()[9];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4069_9'));
      expect(last).assertEqual('p4069_9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(9) as number), String(9));
      expect(st.getParamByIndex(9) as number).assertEqual(9);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(9));
      expect(st.size()).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4069 end');
    });

    /**
     * @tc.name   testNavVol4070
     * @tc.number SUB_MC_NAVG_4070
     * @tc.desc   NavPathStack push depth 1 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4070 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 1; i++) { st.pushPathByName('p4070_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=1', String(st.size()));
      expect(st.size()).assertEqual(1);
      const last: string = st.getAllPathName()[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4070_0'));
      expect(last).assertEqual('p4070_0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(0) as number), String(0));
      expect(st.getParamByIndex(0) as number).assertEqual(0);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(0));
      expect(st.size()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4070 end');
    });

    /**
     * @tc.name   testNavVol4071
     * @tc.number SUB_MC_NAVG_4071
     * @tc.desc   NavPathStack push depth 2 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4071 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 2; i++) { st.pushPathByName('p4071_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=2', String(st.size()));
      expect(st.size()).assertEqual(2);
      const last: string = st.getAllPathName()[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4071_1'));
      expect(last).assertEqual('p4071_1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(1) as number), String(1));
      expect(st.getParamByIndex(1) as number).assertEqual(1);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(1));
      expect(st.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4071 end');
    });

    /**
     * @tc.name   testNavVol4072
     * @tc.number SUB_MC_NAVG_4072
     * @tc.desc   NavPathStack push depth 3 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4072 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 3; i++) { st.pushPathByName('p4072_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=3', String(st.size()));
      expect(st.size()).assertEqual(3);
      const last: string = st.getAllPathName()[2];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4072_2'));
      expect(last).assertEqual('p4072_2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(2) as number), String(2));
      expect(st.getParamByIndex(2) as number).assertEqual(2);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(2));
      expect(st.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4072 end');
    });

    /**
     * @tc.name   testNavVol4073
     * @tc.number SUB_MC_NAVG_4073
     * @tc.desc   NavPathStack push depth 4 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4073 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 4; i++) { st.pushPathByName('p4073_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=4', String(st.size()));
      expect(st.size()).assertEqual(4);
      const last: string = st.getAllPathName()[3];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4073_3'));
      expect(last).assertEqual('p4073_3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(3) as number), String(3));
      expect(st.getParamByIndex(3) as number).assertEqual(3);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(3));
      expect(st.size()).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4073 end');
    });

    /**
     * @tc.name   testNavVol4074
     * @tc.number SUB_MC_NAVG_4074
     * @tc.desc   NavPathStack push depth 5 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4074 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 5; i++) { st.pushPathByName('p4074_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=5', String(st.size()));
      expect(st.size()).assertEqual(5);
      const last: string = st.getAllPathName()[4];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4074_4'));
      expect(last).assertEqual('p4074_4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(4) as number), String(4));
      expect(st.getParamByIndex(4) as number).assertEqual(4);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(4));
      expect(st.size()).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4074 end');
    });

    /**
     * @tc.name   testNavVol4075
     * @tc.number SUB_MC_NAVG_4075
     * @tc.desc   NavPathStack push depth 6 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4075 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 6; i++) { st.pushPathByName('p4075_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=6', String(st.size()));
      expect(st.size()).assertEqual(6);
      const last: string = st.getAllPathName()[5];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4075_5'));
      expect(last).assertEqual('p4075_5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(5) as number), String(5));
      expect(st.getParamByIndex(5) as number).assertEqual(5);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(5));
      expect(st.size()).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4075 end');
    });

  });
}
