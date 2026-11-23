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

// @volume rule=NavPathStack.pushN(depth)->size+topName+paramRoundTrip+pop basis=spec cases=65
// Volume cases are driven by a frozen data table; the first rows are hand-tuned Anchor boundary cases.
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[MultiColumns_NAV2]';

export default function navStackVol02Test() {
  describe('MultiColumnsNavStackVol02', () => {

    /**
     * @tc.name   testNavVol4076
     * @tc.number SUB_MC_NAVG_4076
     * @tc.desc   Anchor: NavPathStack pop of a single entry returns that page and empties the stack
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4076 begin');
      const st: NavPathStack = new NavPathStack();
      st.pushPathByName('p4076', 99, false);
      const popped: NavPathInfo | undefined = st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(popped?.name), 'p4076');
      expect(popped?.name).assertEqual('p4076');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(0));
      expect(st.size()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName().length), String(0));
      expect(st.getAllPathName().length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4076 end');
    });

    /**
     * @tc.name   testNavVol4077
     * @tc.number SUB_MC_NAVG_4077
     * @tc.desc   Anchor: NavPathStack keeps duplicate names addressable and shrinks index list after pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4077 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4077 end');
    });

    /**
     * @tc.name   testNavVol4078
     * @tc.number SUB_MC_NAVG_4078
     * @tc.desc   NavPathStack push depth 9 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4078 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 9; i++) { st.pushPathByName('p4078_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=9', String(st.size()));
      expect(st.size()).assertEqual(9);
      const last: string = st.getAllPathName()[8];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4078_8'));
      expect(last).assertEqual('p4078_8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(8) as number), String(8));
      expect(st.getParamByIndex(8) as number).assertEqual(8);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(8));
      expect(st.size()).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4078 end');
    });

    /**
     * @tc.name   testNavVol4079
     * @tc.number SUB_MC_NAVG_4079
     * @tc.desc   NavPathStack push depth 10 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4079 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 10; i++) { st.pushPathByName('p4079_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(st.size()));
      expect(st.size()).assertEqual(10);
      const last: string = st.getAllPathName()[9];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4079_9'));
      expect(last).assertEqual('p4079_9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(9) as number), String(9));
      expect(st.getParamByIndex(9) as number).assertEqual(9);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(9));
      expect(st.size()).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4079 end');
    });

    /**
     * @tc.name   testNavVol4080
     * @tc.number SUB_MC_NAVG_4080
     * @tc.desc   NavPathStack push depth 1 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4080 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 1; i++) { st.pushPathByName('p4080_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=1', String(st.size()));
      expect(st.size()).assertEqual(1);
      const last: string = st.getAllPathName()[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4080_0'));
      expect(last).assertEqual('p4080_0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(0) as number), String(0));
      expect(st.getParamByIndex(0) as number).assertEqual(0);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(0));
      expect(st.size()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4080 end');
    });

    /**
     * @tc.name   testNavVol4081
     * @tc.number SUB_MC_NAVG_4081
     * @tc.desc   NavPathStack push depth 2 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4081 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 2; i++) { st.pushPathByName('p4081_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=2', String(st.size()));
      expect(st.size()).assertEqual(2);
      const last: string = st.getAllPathName()[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4081_1'));
      expect(last).assertEqual('p4081_1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(1) as number), String(1));
      expect(st.getParamByIndex(1) as number).assertEqual(1);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(1));
      expect(st.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4081 end');
    });

    /**
     * @tc.name   testNavVol4082
     * @tc.number SUB_MC_NAVG_4082
     * @tc.desc   NavPathStack push depth 3 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4082 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 3; i++) { st.pushPathByName('p4082_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=3', String(st.size()));
      expect(st.size()).assertEqual(3);
      const last: string = st.getAllPathName()[2];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4082_2'));
      expect(last).assertEqual('p4082_2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(2) as number), String(2));
      expect(st.getParamByIndex(2) as number).assertEqual(2);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(2));
      expect(st.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4082 end');
    });

    /**
     * @tc.name   testNavVol4083
     * @tc.number SUB_MC_NAVG_4083
     * @tc.desc   NavPathStack push depth 4 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4083 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 4; i++) { st.pushPathByName('p4083_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=4', String(st.size()));
      expect(st.size()).assertEqual(4);
      const last: string = st.getAllPathName()[3];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4083_3'));
      expect(last).assertEqual('p4083_3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(3) as number), String(3));
      expect(st.getParamByIndex(3) as number).assertEqual(3);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(3));
      expect(st.size()).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4083 end');
    });

    /**
     * @tc.name   testNavVol4084
     * @tc.number SUB_MC_NAVG_4084
     * @tc.desc   NavPathStack push depth 5 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4084 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 5; i++) { st.pushPathByName('p4084_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=5', String(st.size()));
      expect(st.size()).assertEqual(5);
      const last: string = st.getAllPathName()[4];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4084_4'));
      expect(last).assertEqual('p4084_4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(4) as number), String(4));
      expect(st.getParamByIndex(4) as number).assertEqual(4);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(4));
      expect(st.size()).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4084 end');
    });

    /**
     * @tc.name   testNavVol4085
     * @tc.number SUB_MC_NAVG_4085
     * @tc.desc   NavPathStack push depth 6 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4085 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 6; i++) { st.pushPathByName('p4085_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=6', String(st.size()));
      expect(st.size()).assertEqual(6);
      const last: string = st.getAllPathName()[5];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4085_5'));
      expect(last).assertEqual('p4085_5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(5) as number), String(5));
      expect(st.getParamByIndex(5) as number).assertEqual(5);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(5));
      expect(st.size()).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4085 end');
    });

    /**
     * @tc.name   testNavVol4086
     * @tc.number SUB_MC_NAVG_4086
     * @tc.desc   NavPathStack push depth 7 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4086 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 7; i++) { st.pushPathByName('p4086_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=7', String(st.size()));
      expect(st.size()).assertEqual(7);
      const last: string = st.getAllPathName()[6];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4086_6'));
      expect(last).assertEqual('p4086_6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(6) as number), String(6));
      expect(st.getParamByIndex(6) as number).assertEqual(6);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(6));
      expect(st.size()).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4086 end');
    });

    /**
     * @tc.name   testNavVol4087
     * @tc.number SUB_MC_NAVG_4087
     * @tc.desc   NavPathStack push depth 8 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4087 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 8; i++) { st.pushPathByName('p4087_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=8', String(st.size()));
      expect(st.size()).assertEqual(8);
      const last: string = st.getAllPathName()[7];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4087_7'));
      expect(last).assertEqual('p4087_7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(7) as number), String(7));
      expect(st.getParamByIndex(7) as number).assertEqual(7);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(7));
      expect(st.size()).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4087 end');
    });

    /**
     * @tc.name   testNavVol4088
     * @tc.number SUB_MC_NAVG_4088
     * @tc.desc   NavPathStack push depth 9 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4088 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 9; i++) { st.pushPathByName('p4088_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=9', String(st.size()));
      expect(st.size()).assertEqual(9);
      const last: string = st.getAllPathName()[8];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4088_8'));
      expect(last).assertEqual('p4088_8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(8) as number), String(8));
      expect(st.getParamByIndex(8) as number).assertEqual(8);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(8));
      expect(st.size()).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4088 end');
    });

    /**
     * @tc.name   testNavVol4089
     * @tc.number SUB_MC_NAVG_4089
     * @tc.desc   NavPathStack push depth 10 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4089 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 10; i++) { st.pushPathByName('p4089_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(st.size()));
      expect(st.size()).assertEqual(10);
      const last: string = st.getAllPathName()[9];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4089_9'));
      expect(last).assertEqual('p4089_9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(9) as number), String(9));
      expect(st.getParamByIndex(9) as number).assertEqual(9);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(9));
      expect(st.size()).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4089 end');
    });

    /**
     * @tc.name   testNavVol4090
     * @tc.number SUB_MC_NAVG_4090
     * @tc.desc   NavPathStack push depth 1 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4090 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 1; i++) { st.pushPathByName('p4090_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=1', String(st.size()));
      expect(st.size()).assertEqual(1);
      const last: string = st.getAllPathName()[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4090_0'));
      expect(last).assertEqual('p4090_0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(0) as number), String(0));
      expect(st.getParamByIndex(0) as number).assertEqual(0);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(0));
      expect(st.size()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4090 end');
    });

    /**
     * @tc.name   testNavVol4091
     * @tc.number SUB_MC_NAVG_4091
     * @tc.desc   NavPathStack push depth 2 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4091 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 2; i++) { st.pushPathByName('p4091_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=2', String(st.size()));
      expect(st.size()).assertEqual(2);
      const last: string = st.getAllPathName()[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4091_1'));
      expect(last).assertEqual('p4091_1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(1) as number), String(1));
      expect(st.getParamByIndex(1) as number).assertEqual(1);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(1));
      expect(st.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4091 end');
    });

    /**
     * @tc.name   testNavVol4092
     * @tc.number SUB_MC_NAVG_4092
     * @tc.desc   NavPathStack push depth 3 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4092 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 3; i++) { st.pushPathByName('p4092_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=3', String(st.size()));
      expect(st.size()).assertEqual(3);
      const last: string = st.getAllPathName()[2];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4092_2'));
      expect(last).assertEqual('p4092_2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(2) as number), String(2));
      expect(st.getParamByIndex(2) as number).assertEqual(2);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(2));
      expect(st.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4092 end');
    });

    /**
     * @tc.name   testNavVol4093
     * @tc.number SUB_MC_NAVG_4093
     * @tc.desc   NavPathStack push depth 4 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4093 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 4; i++) { st.pushPathByName('p4093_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=4', String(st.size()));
      expect(st.size()).assertEqual(4);
      const last: string = st.getAllPathName()[3];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4093_3'));
      expect(last).assertEqual('p4093_3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(3) as number), String(3));
      expect(st.getParamByIndex(3) as number).assertEqual(3);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(3));
      expect(st.size()).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4093 end');
    });

    /**
     * @tc.name   testNavVol4094
     * @tc.number SUB_MC_NAVG_4094
     * @tc.desc   NavPathStack push depth 5 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4094 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 5; i++) { st.pushPathByName('p4094_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=5', String(st.size()));
      expect(st.size()).assertEqual(5);
      const last: string = st.getAllPathName()[4];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4094_4'));
      expect(last).assertEqual('p4094_4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(4) as number), String(4));
      expect(st.getParamByIndex(4) as number).assertEqual(4);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(4));
      expect(st.size()).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4094 end');
    });

    /**
     * @tc.name   testNavVol4095
     * @tc.number SUB_MC_NAVG_4095
     * @tc.desc   NavPathStack push depth 6 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4095 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 6; i++) { st.pushPathByName('p4095_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=6', String(st.size()));
      expect(st.size()).assertEqual(6);
      const last: string = st.getAllPathName()[5];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4095_5'));
      expect(last).assertEqual('p4095_5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(5) as number), String(5));
      expect(st.getParamByIndex(5) as number).assertEqual(5);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(5));
      expect(st.size()).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4095 end');
    });

    /**
     * @tc.name   testNavVol4096
     * @tc.number SUB_MC_NAVG_4096
     * @tc.desc   NavPathStack push depth 7 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4096 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 7; i++) { st.pushPathByName('p4096_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=7', String(st.size()));
      expect(st.size()).assertEqual(7);
      const last: string = st.getAllPathName()[6];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4096_6'));
      expect(last).assertEqual('p4096_6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(6) as number), String(6));
      expect(st.getParamByIndex(6) as number).assertEqual(6);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(6));
      expect(st.size()).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4096 end');
    });

    /**
     * @tc.name   testNavVol4097
     * @tc.number SUB_MC_NAVG_4097
     * @tc.desc   NavPathStack push depth 8 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4097 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 8; i++) { st.pushPathByName('p4097_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=8', String(st.size()));
      expect(st.size()).assertEqual(8);
      const last: string = st.getAllPathName()[7];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4097_7'));
      expect(last).assertEqual('p4097_7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(7) as number), String(7));
      expect(st.getParamByIndex(7) as number).assertEqual(7);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(7));
      expect(st.size()).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4097 end');
    });

    /**
     * @tc.name   testNavVol4098
     * @tc.number SUB_MC_NAVG_4098
     * @tc.desc   NavPathStack push depth 9 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4098 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 9; i++) { st.pushPathByName('p4098_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=9', String(st.size()));
      expect(st.size()).assertEqual(9);
      const last: string = st.getAllPathName()[8];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4098_8'));
      expect(last).assertEqual('p4098_8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(8) as number), String(8));
      expect(st.getParamByIndex(8) as number).assertEqual(8);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(8));
      expect(st.size()).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4098 end');
    });

    /**
     * @tc.name   testNavVol4099
     * @tc.number SUB_MC_NAVG_4099
     * @tc.desc   NavPathStack push depth 10 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4099 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 10; i++) { st.pushPathByName('p4099_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(st.size()));
      expect(st.size()).assertEqual(10);
      const last: string = st.getAllPathName()[9];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4099_9'));
      expect(last).assertEqual('p4099_9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(9) as number), String(9));
      expect(st.getParamByIndex(9) as number).assertEqual(9);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(9));
      expect(st.size()).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4099 end');
    });

    /**
     * @tc.name   testNavVol4100
     * @tc.number SUB_MC_NAVG_4100
     * @tc.desc   NavPathStack push depth 1 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4100 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 1; i++) { st.pushPathByName('p4100_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=1', String(st.size()));
      expect(st.size()).assertEqual(1);
      const last: string = st.getAllPathName()[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4100_0'));
      expect(last).assertEqual('p4100_0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(0) as number), String(0));
      expect(st.getParamByIndex(0) as number).assertEqual(0);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(0));
      expect(st.size()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4100 end');
    });

    /**
     * @tc.name   testNavVol4101
     * @tc.number SUB_MC_NAVG_4101
     * @tc.desc   NavPathStack push depth 2 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4101 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 2; i++) { st.pushPathByName('p4101_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=2', String(st.size()));
      expect(st.size()).assertEqual(2);
      const last: string = st.getAllPathName()[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4101_1'));
      expect(last).assertEqual('p4101_1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(1) as number), String(1));
      expect(st.getParamByIndex(1) as number).assertEqual(1);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(1));
      expect(st.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4101 end');
    });

    /**
     * @tc.name   testNavVol4102
     * @tc.number SUB_MC_NAVG_4102
     * @tc.desc   NavPathStack push depth 3 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4102 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 3; i++) { st.pushPathByName('p4102_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=3', String(st.size()));
      expect(st.size()).assertEqual(3);
      const last: string = st.getAllPathName()[2];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4102_2'));
      expect(last).assertEqual('p4102_2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(2) as number), String(2));
      expect(st.getParamByIndex(2) as number).assertEqual(2);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(2));
      expect(st.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4102 end');
    });

    /**
     * @tc.name   testNavVol4103
     * @tc.number SUB_MC_NAVG_4103
     * @tc.desc   NavPathStack push depth 4 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4103 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 4; i++) { st.pushPathByName('p4103_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=4', String(st.size()));
      expect(st.size()).assertEqual(4);
      const last: string = st.getAllPathName()[3];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4103_3'));
      expect(last).assertEqual('p4103_3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(3) as number), String(3));
      expect(st.getParamByIndex(3) as number).assertEqual(3);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(3));
      expect(st.size()).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4103 end');
    });

    /**
     * @tc.name   testNavVol4104
     * @tc.number SUB_MC_NAVG_4104
     * @tc.desc   NavPathStack push depth 5 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4104 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 5; i++) { st.pushPathByName('p4104_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=5', String(st.size()));
      expect(st.size()).assertEqual(5);
      const last: string = st.getAllPathName()[4];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4104_4'));
      expect(last).assertEqual('p4104_4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(4) as number), String(4));
      expect(st.getParamByIndex(4) as number).assertEqual(4);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(4));
      expect(st.size()).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4104 end');
    });

    /**
     * @tc.name   testNavVol4105
     * @tc.number SUB_MC_NAVG_4105
     * @tc.desc   NavPathStack push depth 6 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4105 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 6; i++) { st.pushPathByName('p4105_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=6', String(st.size()));
      expect(st.size()).assertEqual(6);
      const last: string = st.getAllPathName()[5];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4105_5'));
      expect(last).assertEqual('p4105_5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(5) as number), String(5));
      expect(st.getParamByIndex(5) as number).assertEqual(5);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(5));
      expect(st.size()).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4105 end');
    });

    /**
     * @tc.name   testNavVol4106
     * @tc.number SUB_MC_NAVG_4106
     * @tc.desc   NavPathStack push depth 7 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4106 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 7; i++) { st.pushPathByName('p4106_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=7', String(st.size()));
      expect(st.size()).assertEqual(7);
      const last: string = st.getAllPathName()[6];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4106_6'));
      expect(last).assertEqual('p4106_6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(6) as number), String(6));
      expect(st.getParamByIndex(6) as number).assertEqual(6);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(6));
      expect(st.size()).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4106 end');
    });

    /**
     * @tc.name   testNavVol4107
     * @tc.number SUB_MC_NAVG_4107
     * @tc.desc   NavPathStack push depth 8 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4107 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 8; i++) { st.pushPathByName('p4107_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=8', String(st.size()));
      expect(st.size()).assertEqual(8);
      const last: string = st.getAllPathName()[7];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4107_7'));
      expect(last).assertEqual('p4107_7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(7) as number), String(7));
      expect(st.getParamByIndex(7) as number).assertEqual(7);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(7));
      expect(st.size()).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4107 end');
    });

    /**
     * @tc.name   testNavVol4108
     * @tc.number SUB_MC_NAVG_4108
     * @tc.desc   NavPathStack push depth 9 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4108 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 9; i++) { st.pushPathByName('p4108_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=9', String(st.size()));
      expect(st.size()).assertEqual(9);
      const last: string = st.getAllPathName()[8];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4108_8'));
      expect(last).assertEqual('p4108_8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(8) as number), String(8));
      expect(st.getParamByIndex(8) as number).assertEqual(8);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(8));
      expect(st.size()).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4108 end');
    });

    /**
     * @tc.name   testNavVol4109
     * @tc.number SUB_MC_NAVG_4109
     * @tc.desc   NavPathStack push depth 10 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4109 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 10; i++) { st.pushPathByName('p4109_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(st.size()));
      expect(st.size()).assertEqual(10);
      const last: string = st.getAllPathName()[9];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4109_9'));
      expect(last).assertEqual('p4109_9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(9) as number), String(9));
      expect(st.getParamByIndex(9) as number).assertEqual(9);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(9));
      expect(st.size()).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4109 end');
    });

    /**
     * @tc.name   testNavVol4110
     * @tc.number SUB_MC_NAVG_4110
     * @tc.desc   NavPathStack push depth 1 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4110 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 1; i++) { st.pushPathByName('p4110_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=1', String(st.size()));
      expect(st.size()).assertEqual(1);
      const last: string = st.getAllPathName()[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4110_0'));
      expect(last).assertEqual('p4110_0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(0) as number), String(0));
      expect(st.getParamByIndex(0) as number).assertEqual(0);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(0));
      expect(st.size()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4110 end');
    });

    /**
     * @tc.name   testNavVol4111
     * @tc.number SUB_MC_NAVG_4111
     * @tc.desc   NavPathStack push depth 2 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4111 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 2; i++) { st.pushPathByName('p4111_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=2', String(st.size()));
      expect(st.size()).assertEqual(2);
      const last: string = st.getAllPathName()[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4111_1'));
      expect(last).assertEqual('p4111_1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(1) as number), String(1));
      expect(st.getParamByIndex(1) as number).assertEqual(1);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(1));
      expect(st.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4111 end');
    });

    /**
     * @tc.name   testNavVol4112
     * @tc.number SUB_MC_NAVG_4112
     * @tc.desc   NavPathStack push depth 3 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4112 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 3; i++) { st.pushPathByName('p4112_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=3', String(st.size()));
      expect(st.size()).assertEqual(3);
      const last: string = st.getAllPathName()[2];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4112_2'));
      expect(last).assertEqual('p4112_2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(2) as number), String(2));
      expect(st.getParamByIndex(2) as number).assertEqual(2);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(2));
      expect(st.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4112 end');
    });

    /**
     * @tc.name   testNavVol4113
     * @tc.number SUB_MC_NAVG_4113
     * @tc.desc   NavPathStack push depth 4 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4113 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 4; i++) { st.pushPathByName('p4113_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=4', String(st.size()));
      expect(st.size()).assertEqual(4);
      const last: string = st.getAllPathName()[3];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4113_3'));
      expect(last).assertEqual('p4113_3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(3) as number), String(3));
      expect(st.getParamByIndex(3) as number).assertEqual(3);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(3));
      expect(st.size()).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4113 end');
    });

    /**
     * @tc.name   testNavVol4114
     * @tc.number SUB_MC_NAVG_4114
     * @tc.desc   NavPathStack push depth 5 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4114 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 5; i++) { st.pushPathByName('p4114_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=5', String(st.size()));
      expect(st.size()).assertEqual(5);
      const last: string = st.getAllPathName()[4];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4114_4'));
      expect(last).assertEqual('p4114_4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(4) as number), String(4));
      expect(st.getParamByIndex(4) as number).assertEqual(4);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(4));
      expect(st.size()).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4114 end');
    });

    /**
     * @tc.name   testNavVol4115
     * @tc.number SUB_MC_NAVG_4115
     * @tc.desc   NavPathStack push depth 6 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4115 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 6; i++) { st.pushPathByName('p4115_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=6', String(st.size()));
      expect(st.size()).assertEqual(6);
      const last: string = st.getAllPathName()[5];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4115_5'));
      expect(last).assertEqual('p4115_5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(5) as number), String(5));
      expect(st.getParamByIndex(5) as number).assertEqual(5);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(5));
      expect(st.size()).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4115 end');
    });

    /**
     * @tc.name   testNavVol4116
     * @tc.number SUB_MC_NAVG_4116
     * @tc.desc   NavPathStack push depth 7 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4116 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 7; i++) { st.pushPathByName('p4116_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=7', String(st.size()));
      expect(st.size()).assertEqual(7);
      const last: string = st.getAllPathName()[6];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4116_6'));
      expect(last).assertEqual('p4116_6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(6) as number), String(6));
      expect(st.getParamByIndex(6) as number).assertEqual(6);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(6));
      expect(st.size()).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4116 end');
    });

    /**
     * @tc.name   testNavVol4117
     * @tc.number SUB_MC_NAVG_4117
     * @tc.desc   NavPathStack push depth 8 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4117 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 8; i++) { st.pushPathByName('p4117_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=8', String(st.size()));
      expect(st.size()).assertEqual(8);
      const last: string = st.getAllPathName()[7];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4117_7'));
      expect(last).assertEqual('p4117_7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(7) as number), String(7));
      expect(st.getParamByIndex(7) as number).assertEqual(7);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(7));
      expect(st.size()).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4117 end');
    });

    /**
     * @tc.name   testNavVol4118
     * @tc.number SUB_MC_NAVG_4118
     * @tc.desc   NavPathStack push depth 9 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4118 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 9; i++) { st.pushPathByName('p4118_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=9', String(st.size()));
      expect(st.size()).assertEqual(9);
      const last: string = st.getAllPathName()[8];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4118_8'));
      expect(last).assertEqual('p4118_8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(8) as number), String(8));
      expect(st.getParamByIndex(8) as number).assertEqual(8);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(8));
      expect(st.size()).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4118 end');
    });

    /**
     * @tc.name   testNavVol4119
     * @tc.number SUB_MC_NAVG_4119
     * @tc.desc   NavPathStack push depth 10 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4119 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 10; i++) { st.pushPathByName('p4119_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(st.size()));
      expect(st.size()).assertEqual(10);
      const last: string = st.getAllPathName()[9];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4119_9'));
      expect(last).assertEqual('p4119_9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(9) as number), String(9));
      expect(st.getParamByIndex(9) as number).assertEqual(9);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(9));
      expect(st.size()).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4119 end');
    });

    /**
     * @tc.name   testNavVol4120
     * @tc.number SUB_MC_NAVG_4120
     * @tc.desc   NavPathStack push depth 1 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4120 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 1; i++) { st.pushPathByName('p4120_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=1', String(st.size()));
      expect(st.size()).assertEqual(1);
      const last: string = st.getAllPathName()[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4120_0'));
      expect(last).assertEqual('p4120_0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(0) as number), String(0));
      expect(st.getParamByIndex(0) as number).assertEqual(0);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(0));
      expect(st.size()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4120 end');
    });

    /**
     * @tc.name   testNavVol4121
     * @tc.number SUB_MC_NAVG_4121
     * @tc.desc   NavPathStack push depth 2 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4121 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 2; i++) { st.pushPathByName('p4121_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=2', String(st.size()));
      expect(st.size()).assertEqual(2);
      const last: string = st.getAllPathName()[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4121_1'));
      expect(last).assertEqual('p4121_1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(1) as number), String(1));
      expect(st.getParamByIndex(1) as number).assertEqual(1);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(1));
      expect(st.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4121 end');
    });

    /**
     * @tc.name   testNavVol4122
     * @tc.number SUB_MC_NAVG_4122
     * @tc.desc   NavPathStack push depth 3 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4122 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 3; i++) { st.pushPathByName('p4122_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=3', String(st.size()));
      expect(st.size()).assertEqual(3);
      const last: string = st.getAllPathName()[2];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4122_2'));
      expect(last).assertEqual('p4122_2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(2) as number), String(2));
      expect(st.getParamByIndex(2) as number).assertEqual(2);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(2));
      expect(st.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4122 end');
    });

    /**
     * @tc.name   testNavVol4123
     * @tc.number SUB_MC_NAVG_4123
     * @tc.desc   NavPathStack push depth 4 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4123 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 4; i++) { st.pushPathByName('p4123_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=4', String(st.size()));
      expect(st.size()).assertEqual(4);
      const last: string = st.getAllPathName()[3];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4123_3'));
      expect(last).assertEqual('p4123_3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(3) as number), String(3));
      expect(st.getParamByIndex(3) as number).assertEqual(3);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(3));
      expect(st.size()).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4123 end');
    });

    /**
     * @tc.name   testNavVol4124
     * @tc.number SUB_MC_NAVG_4124
     * @tc.desc   NavPathStack push depth 5 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4124 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 5; i++) { st.pushPathByName('p4124_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=5', String(st.size()));
      expect(st.size()).assertEqual(5);
      const last: string = st.getAllPathName()[4];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4124_4'));
      expect(last).assertEqual('p4124_4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(4) as number), String(4));
      expect(st.getParamByIndex(4) as number).assertEqual(4);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(4));
      expect(st.size()).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4124 end');
    });

    /**
     * @tc.name   testNavVol4125
     * @tc.number SUB_MC_NAVG_4125
     * @tc.desc   NavPathStack push depth 6 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4125 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 6; i++) { st.pushPathByName('p4125_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=6', String(st.size()));
      expect(st.size()).assertEqual(6);
      const last: string = st.getAllPathName()[5];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4125_5'));
      expect(last).assertEqual('p4125_5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(5) as number), String(5));
      expect(st.getParamByIndex(5) as number).assertEqual(5);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(5));
      expect(st.size()).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4125 end');
    });

    /**
     * @tc.name   testNavVol4126
     * @tc.number SUB_MC_NAVG_4126
     * @tc.desc   NavPathStack push depth 7 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4126 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 7; i++) { st.pushPathByName('p4126_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=7', String(st.size()));
      expect(st.size()).assertEqual(7);
      const last: string = st.getAllPathName()[6];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4126_6'));
      expect(last).assertEqual('p4126_6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(6) as number), String(6));
      expect(st.getParamByIndex(6) as number).assertEqual(6);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(6));
      expect(st.size()).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4126 end');
    });

    /**
     * @tc.name   testNavVol4127
     * @tc.number SUB_MC_NAVG_4127
     * @tc.desc   NavPathStack push depth 8 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4127 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 8; i++) { st.pushPathByName('p4127_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=8', String(st.size()));
      expect(st.size()).assertEqual(8);
      const last: string = st.getAllPathName()[7];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4127_7'));
      expect(last).assertEqual('p4127_7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(7) as number), String(7));
      expect(st.getParamByIndex(7) as number).assertEqual(7);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(7));
      expect(st.size()).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4127 end');
    });

    /**
     * @tc.name   testNavVol4128
     * @tc.number SUB_MC_NAVG_4128
     * @tc.desc   NavPathStack push depth 9 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4128 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 9; i++) { st.pushPathByName('p4128_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=9', String(st.size()));
      expect(st.size()).assertEqual(9);
      const last: string = st.getAllPathName()[8];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4128_8'));
      expect(last).assertEqual('p4128_8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(8) as number), String(8));
      expect(st.getParamByIndex(8) as number).assertEqual(8);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(8));
      expect(st.size()).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4128 end');
    });

    /**
     * @tc.name   testNavVol4129
     * @tc.number SUB_MC_NAVG_4129
     * @tc.desc   NavPathStack push depth 10 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4129 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 10; i++) { st.pushPathByName('p4129_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(st.size()));
      expect(st.size()).assertEqual(10);
      const last: string = st.getAllPathName()[9];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4129_9'));
      expect(last).assertEqual('p4129_9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(9) as number), String(9));
      expect(st.getParamByIndex(9) as number).assertEqual(9);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(9));
      expect(st.size()).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4129 end');
    });

    /**
     * @tc.name   testNavVol4130
     * @tc.number SUB_MC_NAVG_4130
     * @tc.desc   NavPathStack push depth 1 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4130 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 1; i++) { st.pushPathByName('p4130_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=1', String(st.size()));
      expect(st.size()).assertEqual(1);
      const last: string = st.getAllPathName()[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4130_0'));
      expect(last).assertEqual('p4130_0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(0) as number), String(0));
      expect(st.getParamByIndex(0) as number).assertEqual(0);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(0));
      expect(st.size()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4130 end');
    });

    /**
     * @tc.name   testNavVol4131
     * @tc.number SUB_MC_NAVG_4131
     * @tc.desc   NavPathStack push depth 2 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4131 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 2; i++) { st.pushPathByName('p4131_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=2', String(st.size()));
      expect(st.size()).assertEqual(2);
      const last: string = st.getAllPathName()[1];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4131_1'));
      expect(last).assertEqual('p4131_1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(1) as number), String(1));
      expect(st.getParamByIndex(1) as number).assertEqual(1);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(1));
      expect(st.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4131 end');
    });

    /**
     * @tc.name   testNavVol4132
     * @tc.number SUB_MC_NAVG_4132
     * @tc.desc   NavPathStack push depth 3 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4132 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 3; i++) { st.pushPathByName('p4132_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=3', String(st.size()));
      expect(st.size()).assertEqual(3);
      const last: string = st.getAllPathName()[2];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4132_2'));
      expect(last).assertEqual('p4132_2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(2) as number), String(2));
      expect(st.getParamByIndex(2) as number).assertEqual(2);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(2));
      expect(st.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4132 end');
    });

    /**
     * @tc.name   testNavVol4133
     * @tc.number SUB_MC_NAVG_4133
     * @tc.desc   NavPathStack push depth 4 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4133 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 4; i++) { st.pushPathByName('p4133_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=4', String(st.size()));
      expect(st.size()).assertEqual(4);
      const last: string = st.getAllPathName()[3];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4133_3'));
      expect(last).assertEqual('p4133_3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(3) as number), String(3));
      expect(st.getParamByIndex(3) as number).assertEqual(3);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(3));
      expect(st.size()).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4133 end');
    });

    /**
     * @tc.name   testNavVol4134
     * @tc.number SUB_MC_NAVG_4134
     * @tc.desc   NavPathStack push depth 5 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4134 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 5; i++) { st.pushPathByName('p4134_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=5', String(st.size()));
      expect(st.size()).assertEqual(5);
      const last: string = st.getAllPathName()[4];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4134_4'));
      expect(last).assertEqual('p4134_4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(4) as number), String(4));
      expect(st.getParamByIndex(4) as number).assertEqual(4);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(4));
      expect(st.size()).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4134 end');
    });

    /**
     * @tc.name   testNavVol4135
     * @tc.number SUB_MC_NAVG_4135
     * @tc.desc   NavPathStack push depth 6 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4135 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 6; i++) { st.pushPathByName('p4135_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=6', String(st.size()));
      expect(st.size()).assertEqual(6);
      const last: string = st.getAllPathName()[5];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4135_5'));
      expect(last).assertEqual('p4135_5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(5) as number), String(5));
      expect(st.getParamByIndex(5) as number).assertEqual(5);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(5));
      expect(st.size()).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4135 end');
    });

    /**
     * @tc.name   testNavVol4136
     * @tc.number SUB_MC_NAVG_4136
     * @tc.desc   NavPathStack push depth 7 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4136 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 7; i++) { st.pushPathByName('p4136_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=7', String(st.size()));
      expect(st.size()).assertEqual(7);
      const last: string = st.getAllPathName()[6];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4136_6'));
      expect(last).assertEqual('p4136_6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(6) as number), String(6));
      expect(st.getParamByIndex(6) as number).assertEqual(6);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(6));
      expect(st.size()).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4136 end');
    });

    /**
     * @tc.name   testNavVol4137
     * @tc.number SUB_MC_NAVG_4137
     * @tc.desc   NavPathStack push depth 8 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4137 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 8; i++) { st.pushPathByName('p4137_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=8', String(st.size()));
      expect(st.size()).assertEqual(8);
      const last: string = st.getAllPathName()[7];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4137_7'));
      expect(last).assertEqual('p4137_7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(7) as number), String(7));
      expect(st.getParamByIndex(7) as number).assertEqual(7);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(7));
      expect(st.size()).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4137 end');
    });

    /**
     * @tc.name   testNavVol4138
     * @tc.number SUB_MC_NAVG_4138
     * @tc.desc   NavPathStack push depth 9 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4138 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 9; i++) { st.pushPathByName('p4138_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=9', String(st.size()));
      expect(st.size()).assertEqual(9);
      const last: string = st.getAllPathName()[8];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4138_8'));
      expect(last).assertEqual('p4138_8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(8) as number), String(8));
      expect(st.getParamByIndex(8) as number).assertEqual(8);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(8));
      expect(st.size()).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4138 end');
    });

    /**
     * @tc.name   testNavVol4139
     * @tc.number SUB_MC_NAVG_4139
     * @tc.desc   NavPathStack push depth 10 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4139 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 10; i++) { st.pushPathByName('p4139_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=10', String(st.size()));
      expect(st.size()).assertEqual(10);
      const last: string = st.getAllPathName()[9];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4139_9'));
      expect(last).assertEqual('p4139_9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(9) as number), String(9));
      expect(st.getParamByIndex(9) as number).assertEqual(9);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(9));
      expect(st.size()).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4139 end');
    });

    /**
     * @tc.name   testNavVol4140
     * @tc.number SUB_MC_NAVG_4140
     * @tc.desc   NavPathStack push depth 1 keeps ordered names, param round-trip and pop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNavVol4140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4140 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 1; i++) { st.pushPathByName('p4140_' + i, i, false); }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=1', String(st.size()));
      expect(st.size()).assertEqual(1);
      const last: string = st.getAllPathName()[0];
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(last), String('p4140_0'));
      expect(last).assertEqual('p4140_0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(0) as number), String(0));
      expect(st.getParamByIndex(0) as number).assertEqual(0);
      st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(0));
      expect(st.size()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavVol4140 end');
    });

  });
}
