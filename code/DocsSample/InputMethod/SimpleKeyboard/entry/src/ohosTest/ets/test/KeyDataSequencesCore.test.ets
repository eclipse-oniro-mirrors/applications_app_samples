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
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  KeyState,
  keySourceListData,
  keySourceListType,
  numberSourceListData,
  symbolSourceListData,
  sourceListType
} from '../../../main/ets/InputMethodExtensionAbility/pages/KeyboardKeyData';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KeyDataSequences]';

export default function KeyDataSequencesCoreTest(): void {
  describe('KeyDataSequencesCoreTest', () => {
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0001
     * @tc.name      testKeyDataSequence0001
     * @tc.desc      Typing letter q appends exactly its lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0001 begin');
      const item: keySourceListType = keySourceListData[0];
      let text: string = '';
      text += item.content;
      expect(text).assertEqual('q');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0001 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0002
     * @tc.name      testKeyDataSequence0002
     * @tc.desc      Typing letter w appends exactly its lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0002 begin');
      const item: keySourceListType = keySourceListData[1];
      let text: string = '';
      text += item.content;
      expect(text).assertEqual('w');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0002 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0003
     * @tc.name      testKeyDataSequence0003
     * @tc.desc      Typing letter e appends exactly its lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0003 begin');
      const item: keySourceListType = keySourceListData[2];
      let text: string = '';
      text += item.content;
      expect(text).assertEqual('e');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0003 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0004
     * @tc.name      testKeyDataSequence0004
     * @tc.desc      Typing letter r appends exactly its lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0004 begin');
      const item: keySourceListType = keySourceListData[3];
      let text: string = '';
      text += item.content;
      expect(text).assertEqual('r');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0004 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0005
     * @tc.name      testKeyDataSequence0005
     * @tc.desc      Typing letter t appends exactly its lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0005 begin');
      const item: keySourceListType = keySourceListData[4];
      let text: string = '';
      text += item.content;
      expect(text).assertEqual('t');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0005 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0006
     * @tc.name      testKeyDataSequence0006
     * @tc.desc      Typing letter y appends exactly its lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0006 begin');
      const item: keySourceListType = keySourceListData[5];
      let text: string = '';
      text += item.content;
      expect(text).assertEqual('y');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0006 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0007
     * @tc.name      testKeyDataSequence0007
     * @tc.desc      Typing letter u appends exactly its lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0007 begin');
      const item: keySourceListType = keySourceListData[6];
      let text: string = '';
      text += item.content;
      expect(text).assertEqual('u');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0007 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0008
     * @tc.name      testKeyDataSequence0008
     * @tc.desc      Typing letter i appends exactly its lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0008 begin');
      const item: keySourceListType = keySourceListData[7];
      let text: string = '';
      text += item.content;
      expect(text).assertEqual('i');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0008 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0009
     * @tc.name      testKeyDataSequence0009
     * @tc.desc      Typing letter o appends exactly its lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0009 begin');
      const item: keySourceListType = keySourceListData[8];
      let text: string = '';
      text += item.content;
      expect(text).assertEqual('o');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0009 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0010
     * @tc.name      testKeyDataSequence0010
     * @tc.desc      Typing letter p appends exactly its lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0010 begin');
      const item: keySourceListType = keySourceListData[9];
      let text: string = '';
      text += item.content;
      expect(text).assertEqual('p');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0010 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0011
     * @tc.name      testKeyDataSequence0011
     * @tc.desc      Typing letter a appends exactly its lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0011 begin');
      const item: keySourceListType = keySourceListData[10];
      let text: string = '';
      text += item.content;
      expect(text).assertEqual('a');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0011 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0012
     * @tc.name      testKeyDataSequence0012
     * @tc.desc      Typing letter s appends exactly its lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0012 begin');
      const item: keySourceListType = keySourceListData[11];
      let text: string = '';
      text += item.content;
      expect(text).assertEqual('s');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0012 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0013
     * @tc.name      testKeyDataSequence0013
     * @tc.desc      Typing letter d appends exactly its lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0013 begin');
      const item: keySourceListType = keySourceListData[12];
      let text: string = '';
      text += item.content;
      expect(text).assertEqual('d');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0013 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0014
     * @tc.name      testKeyDataSequence0014
     * @tc.desc      Typing letter f appends exactly its lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0014 begin');
      const item: keySourceListType = keySourceListData[13];
      let text: string = '';
      text += item.content;
      expect(text).assertEqual('f');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0014 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0015
     * @tc.name      testKeyDataSequence0015
     * @tc.desc      Typing letter g appends exactly its lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0015 begin');
      const item: keySourceListType = keySourceListData[14];
      let text: string = '';
      text += item.content;
      expect(text).assertEqual('g');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0015 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0016
     * @tc.name      testKeyDataSequence0016
     * @tc.desc      Typing letter h appends exactly its lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0016 begin');
      const item: keySourceListType = keySourceListData[15];
      let text: string = '';
      text += item.content;
      expect(text).assertEqual('h');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0016 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0017
     * @tc.name      testKeyDataSequence0017
     * @tc.desc      Typing letter j appends exactly its lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0017 begin');
      const item: keySourceListType = keySourceListData[16];
      let text: string = '';
      text += item.content;
      expect(text).assertEqual('j');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0017 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0018
     * @tc.name      testKeyDataSequence0018
     * @tc.desc      Typing letter k appends exactly its lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0018 begin');
      const item: keySourceListType = keySourceListData[17];
      let text: string = '';
      text += item.content;
      expect(text).assertEqual('k');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0018 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0019
     * @tc.name      testKeyDataSequence0019
     * @tc.desc      Typing letter l appends exactly its lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0019 begin');
      const item: keySourceListType = keySourceListData[18];
      let text: string = '';
      text += item.content;
      expect(text).assertEqual('l');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0019 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0020
     * @tc.name      testKeyDataSequence0020
     * @tc.desc      Typing letter z appends exactly its lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0020 begin');
      const item: keySourceListType = keySourceListData[19];
      let text: string = '';
      text += item.content;
      expect(text).assertEqual('z');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0020 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0021
     * @tc.name      testKeyDataSequence0021
     * @tc.desc      Typing letter x appends exactly its lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0021 begin');
      const item: keySourceListType = keySourceListData[20];
      let text: string = '';
      text += item.content;
      expect(text).assertEqual('x');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0021 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0022
     * @tc.name      testKeyDataSequence0022
     * @tc.desc      Typing letter c appends exactly its lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0022 begin');
      const item: keySourceListType = keySourceListData[21];
      let text: string = '';
      text += item.content;
      expect(text).assertEqual('c');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0022 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0023
     * @tc.name      testKeyDataSequence0023
     * @tc.desc      Typing letter v appends exactly its lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0023 begin');
      const item: keySourceListType = keySourceListData[22];
      let text: string = '';
      text += item.content;
      expect(text).assertEqual('v');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0023 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0024
     * @tc.name      testKeyDataSequence0024
     * @tc.desc      Typing letter b appends exactly its lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0024 begin');
      const item: keySourceListType = keySourceListData[23];
      let text: string = '';
      text += item.content;
      expect(text).assertEqual('b');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0024 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0025
     * @tc.name      testKeyDataSequence0025
     * @tc.desc      Typing letter n appends exactly its lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0025 begin');
      const item: keySourceListType = keySourceListData[24];
      let text: string = '';
      text += item.content;
      expect(text).assertEqual('n');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0025 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0026
     * @tc.name      testKeyDataSequence0026
     * @tc.desc      Typing letter m appends exactly its lower content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0026 begin');
      const item: keySourceListType = keySourceListData[25];
      let text: string = '';
      text += item.content;
      expect(text).assertEqual('m');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0026 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0027
     * @tc.name      testKeyDataSequence0027
     * @tc.desc      Typing letter q with uppercase mode appends Q.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0027 begin');
      const item: keySourceListType = keySourceListData[0];
      let text: string = '';
      text += item.upperContent;
      expect(text).assertEqual('Q');
      expect(text).assertEqual('q'.toUpperCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0027 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0028
     * @tc.name      testKeyDataSequence0028
     * @tc.desc      Typing letter w with uppercase mode appends W.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0028 begin');
      const item: keySourceListType = keySourceListData[1];
      let text: string = '';
      text += item.upperContent;
      expect(text).assertEqual('W');
      expect(text).assertEqual('w'.toUpperCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0028 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0029
     * @tc.name      testKeyDataSequence0029
     * @tc.desc      Typing letter e with uppercase mode appends E.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0029 begin');
      const item: keySourceListType = keySourceListData[2];
      let text: string = '';
      text += item.upperContent;
      expect(text).assertEqual('E');
      expect(text).assertEqual('e'.toUpperCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0029 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0030
     * @tc.name      testKeyDataSequence0030
     * @tc.desc      Typing letter r with uppercase mode appends R.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0030 begin');
      const item: keySourceListType = keySourceListData[3];
      let text: string = '';
      text += item.upperContent;
      expect(text).assertEqual('R');
      expect(text).assertEqual('r'.toUpperCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0030 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0031
     * @tc.name      testKeyDataSequence0031
     * @tc.desc      Typing letter t with uppercase mode appends T.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0031 begin');
      const item: keySourceListType = keySourceListData[4];
      let text: string = '';
      text += item.upperContent;
      expect(text).assertEqual('T');
      expect(text).assertEqual('t'.toUpperCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0031 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0032
     * @tc.name      testKeyDataSequence0032
     * @tc.desc      Typing letter y with uppercase mode appends Y.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0032 begin');
      const item: keySourceListType = keySourceListData[5];
      let text: string = '';
      text += item.upperContent;
      expect(text).assertEqual('Y');
      expect(text).assertEqual('y'.toUpperCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0032 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0033
     * @tc.name      testKeyDataSequence0033
     * @tc.desc      Typing letter u with uppercase mode appends U.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0033 begin');
      const item: keySourceListType = keySourceListData[6];
      let text: string = '';
      text += item.upperContent;
      expect(text).assertEqual('U');
      expect(text).assertEqual('u'.toUpperCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0033 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0034
     * @tc.name      testKeyDataSequence0034
     * @tc.desc      Typing letter i with uppercase mode appends I.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0034 begin');
      const item: keySourceListType = keySourceListData[7];
      let text: string = '';
      text += item.upperContent;
      expect(text).assertEqual('I');
      expect(text).assertEqual('i'.toUpperCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0034 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0035
     * @tc.name      testKeyDataSequence0035
     * @tc.desc      Typing letter o with uppercase mode appends O.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0035 begin');
      const item: keySourceListType = keySourceListData[8];
      let text: string = '';
      text += item.upperContent;
      expect(text).assertEqual('O');
      expect(text).assertEqual('o'.toUpperCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0035 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0036
     * @tc.name      testKeyDataSequence0036
     * @tc.desc      Typing letter p with uppercase mode appends P.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0036 begin');
      const item: keySourceListType = keySourceListData[9];
      let text: string = '';
      text += item.upperContent;
      expect(text).assertEqual('P');
      expect(text).assertEqual('p'.toUpperCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0036 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0037
     * @tc.name      testKeyDataSequence0037
     * @tc.desc      Typing letter a with uppercase mode appends A.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0037 begin');
      const item: keySourceListType = keySourceListData[10];
      let text: string = '';
      text += item.upperContent;
      expect(text).assertEqual('A');
      expect(text).assertEqual('a'.toUpperCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0037 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0038
     * @tc.name      testKeyDataSequence0038
     * @tc.desc      Typing letter s with uppercase mode appends S.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0038 begin');
      const item: keySourceListType = keySourceListData[11];
      let text: string = '';
      text += item.upperContent;
      expect(text).assertEqual('S');
      expect(text).assertEqual('s'.toUpperCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0038 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0039
     * @tc.name      testKeyDataSequence0039
     * @tc.desc      Typing letter d with uppercase mode appends D.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0039 begin');
      const item: keySourceListType = keySourceListData[12];
      let text: string = '';
      text += item.upperContent;
      expect(text).assertEqual('D');
      expect(text).assertEqual('d'.toUpperCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0039 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0040
     * @tc.name      testKeyDataSequence0040
     * @tc.desc      Typing letter f with uppercase mode appends F.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0040 begin');
      const item: keySourceListType = keySourceListData[13];
      let text: string = '';
      text += item.upperContent;
      expect(text).assertEqual('F');
      expect(text).assertEqual('f'.toUpperCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0040 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0041
     * @tc.name      testKeyDataSequence0041
     * @tc.desc      Typing letter g with uppercase mode appends G.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0041 begin');
      const item: keySourceListType = keySourceListData[14];
      let text: string = '';
      text += item.upperContent;
      expect(text).assertEqual('G');
      expect(text).assertEqual('g'.toUpperCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0041 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0042
     * @tc.name      testKeyDataSequence0042
     * @tc.desc      Typing letter h with uppercase mode appends H.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0042 begin');
      const item: keySourceListType = keySourceListData[15];
      let text: string = '';
      text += item.upperContent;
      expect(text).assertEqual('H');
      expect(text).assertEqual('h'.toUpperCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0042 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0043
     * @tc.name      testKeyDataSequence0043
     * @tc.desc      Typing letter j with uppercase mode appends J.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0043 begin');
      const item: keySourceListType = keySourceListData[16];
      let text: string = '';
      text += item.upperContent;
      expect(text).assertEqual('J');
      expect(text).assertEqual('j'.toUpperCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0043 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0044
     * @tc.name      testKeyDataSequence0044
     * @tc.desc      Typing letter k with uppercase mode appends K.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0044 begin');
      const item: keySourceListType = keySourceListData[17];
      let text: string = '';
      text += item.upperContent;
      expect(text).assertEqual('K');
      expect(text).assertEqual('k'.toUpperCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0044 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0045
     * @tc.name      testKeyDataSequence0045
     * @tc.desc      Typing letter l with uppercase mode appends L.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0045 begin');
      const item: keySourceListType = keySourceListData[18];
      let text: string = '';
      text += item.upperContent;
      expect(text).assertEqual('L');
      expect(text).assertEqual('l'.toUpperCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0045 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0046
     * @tc.name      testKeyDataSequence0046
     * @tc.desc      Typing letter z with uppercase mode appends Z.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0046 begin');
      const item: keySourceListType = keySourceListData[19];
      let text: string = '';
      text += item.upperContent;
      expect(text).assertEqual('Z');
      expect(text).assertEqual('z'.toUpperCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0046 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0047
     * @tc.name      testKeyDataSequence0047
     * @tc.desc      Typing letter x with uppercase mode appends X.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0047 begin');
      const item: keySourceListType = keySourceListData[20];
      let text: string = '';
      text += item.upperContent;
      expect(text).assertEqual('X');
      expect(text).assertEqual('x'.toUpperCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0047 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0048
     * @tc.name      testKeyDataSequence0048
     * @tc.desc      Typing letter c with uppercase mode appends C.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0048 begin');
      const item: keySourceListType = keySourceListData[21];
      let text: string = '';
      text += item.upperContent;
      expect(text).assertEqual('C');
      expect(text).assertEqual('c'.toUpperCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0048 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0049
     * @tc.name      testKeyDataSequence0049
     * @tc.desc      Typing letter v with uppercase mode appends V.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0049 begin');
      const item: keySourceListType = keySourceListData[22];
      let text: string = '';
      text += item.upperContent;
      expect(text).assertEqual('V');
      expect(text).assertEqual('v'.toUpperCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0049 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0050
     * @tc.name      testKeyDataSequence0050
     * @tc.desc      Typing letter b with uppercase mode appends B.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0050 begin');
      const item: keySourceListType = keySourceListData[23];
      let text: string = '';
      text += item.upperContent;
      expect(text).assertEqual('B');
      expect(text).assertEqual('b'.toUpperCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0050 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0051
     * @tc.name      testKeyDataSequence0051
     * @tc.desc      Typing letter n with uppercase mode appends N.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0051 begin');
      const item: keySourceListType = keySourceListData[24];
      let text: string = '';
      text += item.upperContent;
      expect(text).assertEqual('N');
      expect(text).assertEqual('n'.toUpperCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0051 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0052
     * @tc.name      testKeyDataSequence0052
     * @tc.desc      Typing letter m with uppercase mode appends M.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0052 begin');
      const item: keySourceListType = keySourceListData[25];
      let text: string = '';
      text += item.upperContent;
      expect(text).assertEqual('M');
      expect(text).assertEqual('m'.toUpperCase());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0052 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0053
     * @tc.name      testKeyDataSequence0053
     * @tc.desc      Long-pressing letter q inserts its title '1'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0053 begin');
      const item: keySourceListType = keySourceListData[0];
      let text: string = '';
      text += item.title;
      expect(text).assertEqual('1');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0053 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0054
     * @tc.name      testKeyDataSequence0054
     * @tc.desc      Long-pressing letter w inserts its title '2'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0054 begin');
      const item: keySourceListType = keySourceListData[1];
      let text: string = '';
      text += item.title;
      expect(text).assertEqual('2');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0054 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0055
     * @tc.name      testKeyDataSequence0055
     * @tc.desc      Long-pressing letter e inserts its title '3'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0055 begin');
      const item: keySourceListType = keySourceListData[2];
      let text: string = '';
      text += item.title;
      expect(text).assertEqual('3');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0055 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0056
     * @tc.name      testKeyDataSequence0056
     * @tc.desc      Long-pressing letter r inserts its title '4'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0056 begin');
      const item: keySourceListType = keySourceListData[3];
      let text: string = '';
      text += item.title;
      expect(text).assertEqual('4');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0056 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0057
     * @tc.name      testKeyDataSequence0057
     * @tc.desc      Long-pressing letter t inserts its title '5'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0057 begin');
      const item: keySourceListType = keySourceListData[4];
      let text: string = '';
      text += item.title;
      expect(text).assertEqual('5');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0057 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0058
     * @tc.name      testKeyDataSequence0058
     * @tc.desc      Long-pressing letter y inserts its title '6'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0058 begin');
      const item: keySourceListType = keySourceListData[5];
      let text: string = '';
      text += item.title;
      expect(text).assertEqual('6');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0058 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0059
     * @tc.name      testKeyDataSequence0059
     * @tc.desc      Long-pressing letter u inserts its title '7'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0059 begin');
      const item: keySourceListType = keySourceListData[6];
      let text: string = '';
      text += item.title;
      expect(text).assertEqual('7');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0059 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0060
     * @tc.name      testKeyDataSequence0060
     * @tc.desc      Long-pressing letter i inserts its title '8'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0060 begin');
      const item: keySourceListType = keySourceListData[7];
      let text: string = '';
      text += item.title;
      expect(text).assertEqual('8');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0060 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0061
     * @tc.name      testKeyDataSequence0061
     * @tc.desc      Long-pressing letter o inserts its title '9'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0061 begin');
      const item: keySourceListType = keySourceListData[8];
      let text: string = '';
      text += item.title;
      expect(text).assertEqual('9');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0061 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0062
     * @tc.name      testKeyDataSequence0062
     * @tc.desc      Long-pressing letter p inserts its title '0'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0062 begin');
      const item: keySourceListType = keySourceListData[9];
      let text: string = '';
      text += item.title;
      expect(text).assertEqual('0');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0062 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0063
     * @tc.name      testKeyDataSequence0063
     * @tc.desc      Long-pressing letter a inserts its title '~'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0063 begin');
      const item: keySourceListType = keySourceListData[10];
      let text: string = '';
      text += item.title;
      expect(text).assertEqual('~');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0063 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0064
     * @tc.name      testKeyDataSequence0064
     * @tc.desc      Long-pressing letter s inserts its title '!'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0064 begin');
      const item: keySourceListType = keySourceListData[11];
      let text: string = '';
      text += item.title;
      expect(text).assertEqual('!');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0064 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0065
     * @tc.name      testKeyDataSequence0065
     * @tc.desc      Long-pressing letter d inserts its title '@'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0065 begin');
      const item: keySourceListType = keySourceListData[12];
      let text: string = '';
      text += item.title;
      expect(text).assertEqual('@');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0065 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0066
     * @tc.name      testKeyDataSequence0066
     * @tc.desc      Long-pressing letter f inserts its title '#'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0066 begin');
      const item: keySourceListType = keySourceListData[13];
      let text: string = '';
      text += item.title;
      expect(text).assertEqual('#');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0066 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0067
     * @tc.name      testKeyDataSequence0067
     * @tc.desc      Long-pressing letter g inserts its title '%'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0067 begin');
      const item: keySourceListType = keySourceListData[14];
      let text: string = '';
      text += item.title;
      expect(text).assertEqual('%');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0067 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0068
     * @tc.name      testKeyDataSequence0068
     * @tc.desc      Long-pressing letter h inserts its title "'".
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0068 begin');
      const item: keySourceListType = keySourceListData[15];
      let text: string = '';
      text += item.title;
      expect(text).assertEqual('\'');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0068 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0069
     * @tc.name      testKeyDataSequence0069
     * @tc.desc      Long-pressing letter j inserts its title '&'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0069 begin');
      const item: keySourceListType = keySourceListData[16];
      let text: string = '';
      text += item.title;
      expect(text).assertEqual('&');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0069 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0070
     * @tc.name      testKeyDataSequence0070
     * @tc.desc      Long-pressing letter k inserts its title '*'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0070 begin');
      const item: keySourceListType = keySourceListData[17];
      let text: string = '';
      text += item.title;
      expect(text).assertEqual('*');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0070 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0071
     * @tc.name      testKeyDataSequence0071
     * @tc.desc      Long-pressing letter l inserts its title '?'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0071 begin');
      const item: keySourceListType = keySourceListData[18];
      let text: string = '';
      text += item.title;
      expect(text).assertEqual('?');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0071 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0072
     * @tc.name      testKeyDataSequence0072
     * @tc.desc      Long-pressing letter z inserts its title 'H'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0072 begin');
      const item: keySourceListType = keySourceListData[19];
      let text: string = '';
      text += item.title;
      expect(text).assertEqual('H');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0072 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0073
     * @tc.name      testKeyDataSequence0073
     * @tc.desc      Long-pressing letter x inserts its title 'I'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0073 begin');
      const item: keySourceListType = keySourceListData[20];
      let text: string = '';
      text += item.title;
      expect(text).assertEqual('I');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0073 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0074
     * @tc.name      testKeyDataSequence0074
     * @tc.desc      Long-pressing letter c inserts its title '¯'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0074 begin');
      const item: keySourceListType = keySourceListData[21];
      let text: string = '';
      text += item.title;
      expect(text).assertEqual('\u00AF');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0074 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0075
     * @tc.name      testKeyDataSequence0075
     * @tc.desc      Long-pressing letter v inserts its title '_'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0075 begin');
      const item: keySourceListType = keySourceListData[22];
      let text: string = '';
      text += item.title;
      expect(text).assertEqual('_');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0075 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0076
     * @tc.name      testKeyDataSequence0076
     * @tc.desc      Long-pressing letter b inserts its title ':'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0076 begin');
      const item: keySourceListType = keySourceListData[23];
      let text: string = '';
      text += item.title;
      expect(text).assertEqual(':');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0076 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0077
     * @tc.name      testKeyDataSequence0077
     * @tc.desc      Long-pressing letter n inserts its title ';'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0077 begin');
      const item: keySourceListType = keySourceListData[24];
      let text: string = '';
      text += item.title;
      expect(text).assertEqual(';');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0077 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0078
     * @tc.name      testKeyDataSequence0078
     * @tc.desc      Long-pressing letter m inserts its title '/'.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0078 begin');
      const item: keySourceListType = keySourceListData[25];
      let text: string = '';
      text += item.title;
      expect(text).assertEqual('/');
      expect(text.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0078 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0079
     * @tc.name      testKeyDataSequence0079
     * @tc.desc      Number panel key '1' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0079 begin');
      const item: sourceListType = numberSourceListData[0];
      const rows: sourceListType[] = numberSourceListData.slice(0, 10).concat(numberSourceListData.slice(10, 20)).concat(numberSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[0].content).assertEqual('1');
      expect(item.content).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0079 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0080
     * @tc.name      testKeyDataSequence0080
     * @tc.desc      Number panel key '2' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0080 begin');
      const item: sourceListType = numberSourceListData[1];
      const rows: sourceListType[] = numberSourceListData.slice(0, 10).concat(numberSourceListData.slice(10, 20)).concat(numberSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[1].content).assertEqual('2');
      expect(item.content).assertEqual('2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0080 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0081
     * @tc.name      testKeyDataSequence0081
     * @tc.desc      Number panel key '3' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0081 begin');
      const item: sourceListType = numberSourceListData[2];
      const rows: sourceListType[] = numberSourceListData.slice(0, 10).concat(numberSourceListData.slice(10, 20)).concat(numberSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[2].content).assertEqual('3');
      expect(item.content).assertEqual('3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0081 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0082
     * @tc.name      testKeyDataSequence0082
     * @tc.desc      Number panel key '4' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0082 begin');
      const item: sourceListType = numberSourceListData[3];
      const rows: sourceListType[] = numberSourceListData.slice(0, 10).concat(numberSourceListData.slice(10, 20)).concat(numberSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[3].content).assertEqual('4');
      expect(item.content).assertEqual('4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0082 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0083
     * @tc.name      testKeyDataSequence0083
     * @tc.desc      Number panel key '5' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0083 begin');
      const item: sourceListType = numberSourceListData[4];
      const rows: sourceListType[] = numberSourceListData.slice(0, 10).concat(numberSourceListData.slice(10, 20)).concat(numberSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[4].content).assertEqual('5');
      expect(item.content).assertEqual('5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0083 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0084
     * @tc.name      testKeyDataSequence0084
     * @tc.desc      Number panel key '6' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0084 begin');
      const item: sourceListType = numberSourceListData[5];
      const rows: sourceListType[] = numberSourceListData.slice(0, 10).concat(numberSourceListData.slice(10, 20)).concat(numberSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[5].content).assertEqual('6');
      expect(item.content).assertEqual('6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0084 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0085
     * @tc.name      testKeyDataSequence0085
     * @tc.desc      Number panel key '7' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0085 begin');
      const item: sourceListType = numberSourceListData[6];
      const rows: sourceListType[] = numberSourceListData.slice(0, 10).concat(numberSourceListData.slice(10, 20)).concat(numberSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[6].content).assertEqual('7');
      expect(item.content).assertEqual('7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0085 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0086
     * @tc.name      testKeyDataSequence0086
     * @tc.desc      Number panel key '8' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0086 begin');
      const item: sourceListType = numberSourceListData[7];
      const rows: sourceListType[] = numberSourceListData.slice(0, 10).concat(numberSourceListData.slice(10, 20)).concat(numberSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[7].content).assertEqual('8');
      expect(item.content).assertEqual('8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0086 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0087
     * @tc.name      testKeyDataSequence0087
     * @tc.desc      Number panel key '9' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0087 begin');
      const item: sourceListType = numberSourceListData[8];
      const rows: sourceListType[] = numberSourceListData.slice(0, 10).concat(numberSourceListData.slice(10, 20)).concat(numberSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[8].content).assertEqual('9');
      expect(item.content).assertEqual('9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0087 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0088
     * @tc.name      testKeyDataSequence0088
     * @tc.desc      Number panel key '0' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0088 begin');
      const item: sourceListType = numberSourceListData[9];
      const rows: sourceListType[] = numberSourceListData.slice(0, 10).concat(numberSourceListData.slice(10, 20)).concat(numberSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[9].content).assertEqual('0');
      expect(item.content).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0088 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0089
     * @tc.name      testKeyDataSequence0089
     * @tc.desc      Number panel key '@' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0089 begin');
      const item: sourceListType = numberSourceListData[10];
      const rows: sourceListType[] = numberSourceListData.slice(0, 10).concat(numberSourceListData.slice(10, 20)).concat(numberSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[10].content).assertEqual('@');
      expect(item.content).assertEqual('@');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0089 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0090
     * @tc.name      testKeyDataSequence0090
     * @tc.desc      Number panel key '#' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0090 begin');
      const item: sourceListType = numberSourceListData[11];
      const rows: sourceListType[] = numberSourceListData.slice(0, 10).concat(numberSourceListData.slice(10, 20)).concat(numberSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[11].content).assertEqual('#');
      expect(item.content).assertEqual('#');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0090 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0091
     * @tc.name      testKeyDataSequence0091
     * @tc.desc      Number panel key '$' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0091 begin');
      const item: sourceListType = numberSourceListData[12];
      const rows: sourceListType[] = numberSourceListData.slice(0, 10).concat(numberSourceListData.slice(10, 20)).concat(numberSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[12].content).assertEqual('$');
      expect(item.content).assertEqual('$');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0091 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0092
     * @tc.name      testKeyDataSequence0092
     * @tc.desc      Number panel key '%' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0092 begin');
      const item: sourceListType = numberSourceListData[13];
      const rows: sourceListType[] = numberSourceListData.slice(0, 10).concat(numberSourceListData.slice(10, 20)).concat(numberSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[13].content).assertEqual('%');
      expect(item.content).assertEqual('%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0092 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0093
     * @tc.name      testKeyDataSequence0093
     * @tc.desc      Number panel key '&' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0093 begin');
      const item: sourceListType = numberSourceListData[14];
      const rows: sourceListType[] = numberSourceListData.slice(0, 10).concat(numberSourceListData.slice(10, 20)).concat(numberSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[14].content).assertEqual('&');
      expect(item.content).assertEqual('&');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0093 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0094
     * @tc.name      testKeyDataSequence0094
     * @tc.desc      Number panel key '-' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0094 begin');
      const item: sourceListType = numberSourceListData[15];
      const rows: sourceListType[] = numberSourceListData.slice(0, 10).concat(numberSourceListData.slice(10, 20)).concat(numberSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[15].content).assertEqual('-');
      expect(item.content).assertEqual('-');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0094 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0095
     * @tc.name      testKeyDataSequence0095
     * @tc.desc      Number panel key '+' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0095 begin');
      const item: sourceListType = numberSourceListData[16];
      const rows: sourceListType[] = numberSourceListData.slice(0, 10).concat(numberSourceListData.slice(10, 20)).concat(numberSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[16].content).assertEqual('+');
      expect(item.content).assertEqual('+');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0095 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0096
     * @tc.name      testKeyDataSequence0096
     * @tc.desc      Number panel key '(' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0096 begin');
      const item: sourceListType = numberSourceListData[17];
      const rows: sourceListType[] = numberSourceListData.slice(0, 10).concat(numberSourceListData.slice(10, 20)).concat(numberSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[17].content).assertEqual('(');
      expect(item.content).assertEqual('(');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0096 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0097
     * @tc.name      testKeyDataSequence0097
     * @tc.desc      Number panel key ')' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0097 begin');
      const item: sourceListType = numberSourceListData[18];
      const rows: sourceListType[] = numberSourceListData.slice(0, 10).concat(numberSourceListData.slice(10, 20)).concat(numberSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[18].content).assertEqual(')');
      expect(item.content).assertEqual(')');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0097 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0098
     * @tc.name      testKeyDataSequence0098
     * @tc.desc      Number panel key '/' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0098 begin');
      const item: sourceListType = numberSourceListData[19];
      const rows: sourceListType[] = numberSourceListData.slice(0, 10).concat(numberSourceListData.slice(10, 20)).concat(numberSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[19].content).assertEqual('/');
      expect(item.content).assertEqual('/');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0098 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0099
     * @tc.name      testKeyDataSequence0099
     * @tc.desc      Number panel key '*' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0099 begin');
      const item: sourceListType = numberSourceListData[20];
      const rows: sourceListType[] = numberSourceListData.slice(0, 10).concat(numberSourceListData.slice(10, 20)).concat(numberSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[20].content).assertEqual('*');
      expect(item.content).assertEqual('*');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0099 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0100
     * @tc.name      testKeyDataSequence0100
     * @tc.desc      Number panel key '"' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0100 begin');
      const item: sourceListType = numberSourceListData[21];
      const rows: sourceListType[] = numberSourceListData.slice(0, 10).concat(numberSourceListData.slice(10, 20)).concat(numberSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[21].content).assertEqual('"');
      expect(item.content).assertEqual('"');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0100 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0101
     * @tc.name      testKeyDataSequence0101
     * @tc.desc      Number panel key "'" is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0101 begin');
      const item: sourceListType = numberSourceListData[22];
      const rows: sourceListType[] = numberSourceListData.slice(0, 10).concat(numberSourceListData.slice(10, 20)).concat(numberSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[22].content).assertEqual('\'');
      expect(item.content).assertEqual('\'');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0101 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0102
     * @tc.name      testKeyDataSequence0102
     * @tc.desc      Number panel key ':' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0102 begin');
      const item: sourceListType = numberSourceListData[23];
      const rows: sourceListType[] = numberSourceListData.slice(0, 10).concat(numberSourceListData.slice(10, 20)).concat(numberSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[23].content).assertEqual(':');
      expect(item.content).assertEqual(':');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0102 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0103
     * @tc.name      testKeyDataSequence0103
     * @tc.desc      Number panel key ';' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0103 begin');
      const item: sourceListType = numberSourceListData[24];
      const rows: sourceListType[] = numberSourceListData.slice(0, 10).concat(numberSourceListData.slice(10, 20)).concat(numberSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[24].content).assertEqual(';');
      expect(item.content).assertEqual(';');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0103 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0104
     * @tc.name      testKeyDataSequence0104
     * @tc.desc      Number panel key '!' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0104 begin');
      const item: sourceListType = numberSourceListData[25];
      const rows: sourceListType[] = numberSourceListData.slice(0, 10).concat(numberSourceListData.slice(10, 20)).concat(numberSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[25].content).assertEqual('!');
      expect(item.content).assertEqual('!');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0104 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0105
     * @tc.name      testKeyDataSequence0105
     * @tc.desc      Number panel key '?' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0105 begin');
      const item: sourceListType = numberSourceListData[26];
      const rows: sourceListType[] = numberSourceListData.slice(0, 10).concat(numberSourceListData.slice(10, 20)).concat(numberSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[26].content).assertEqual('?');
      expect(item.content).assertEqual('?');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0105 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0106
     * @tc.name      testKeyDataSequence0106
     * @tc.desc      Symbol panel key '~' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0106 begin');
      const item: sourceListType = symbolSourceListData[0];
      const rows: sourceListType[] = symbolSourceListData.slice(0, 10).concat(symbolSourceListData.slice(10, 20)).concat(symbolSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[0].content).assertEqual('~');
      expect(item.content).assertEqual('~');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0106 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0107
     * @tc.name      testKeyDataSequence0107
     * @tc.desc      Symbol panel key '`' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0107 begin');
      const item: sourceListType = symbolSourceListData[1];
      const rows: sourceListType[] = symbolSourceListData.slice(0, 10).concat(symbolSourceListData.slice(10, 20)).concat(symbolSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[1].content).assertEqual('`');
      expect(item.content).assertEqual('`');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0107 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0108
     * @tc.name      testKeyDataSequence0108
     * @tc.desc      Symbol panel key '|' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0108 begin');
      const item: sourceListType = symbolSourceListData[2];
      const rows: sourceListType[] = symbolSourceListData.slice(0, 10).concat(symbolSourceListData.slice(10, 20)).concat(symbolSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[2].content).assertEqual('|');
      expect(item.content).assertEqual('|');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0108 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0109
     * @tc.name      testKeyDataSequence0109
     * @tc.desc      Symbol panel key '•' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0109 begin');
      const item: sourceListType = symbolSourceListData[3];
      const rows: sourceListType[] = symbolSourceListData.slice(0, 10).concat(symbolSourceListData.slice(10, 20)).concat(symbolSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[3].content).assertEqual('\u2022');
      expect(item.content).assertEqual('\u2022');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0109 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0110
     * @tc.name      testKeyDataSequence0110
     * @tc.desc      Symbol panel key '√' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0110 begin');
      const item: sourceListType = symbolSourceListData[4];
      const rows: sourceListType[] = symbolSourceListData.slice(0, 10).concat(symbolSourceListData.slice(10, 20)).concat(symbolSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[4].content).assertEqual('\u221A');
      expect(item.content).assertEqual('\u221A');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0110 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0111
     * @tc.name      testKeyDataSequence0111
     * @tc.desc      Symbol panel key 'Π' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0111 begin');
      const item: sourceListType = symbolSourceListData[5];
      const rows: sourceListType[] = symbolSourceListData.slice(0, 10).concat(symbolSourceListData.slice(10, 20)).concat(symbolSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[5].content).assertEqual('\u03A0');
      expect(item.content).assertEqual('\u03A0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0111 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_KEYSEQ_0112
     * @tc.name      testKeyDataSequence0112
     * @tc.desc      Symbol panel key '÷' is reachable once from its table.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKeyDataSequence0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0112 begin');
      const item: sourceListType = symbolSourceListData[6];
      const rows: sourceListType[] = symbolSourceListData.slice(0, 10).concat(symbolSourceListData.slice(10, 20)).concat(symbolSourceListData.slice(20));
      expect(rows.length).assertEqual(27);
      expect(rows[6].content).assertEqual('\u00F7');
      expect(item.content).assertEqual('\u00F7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyDataSequence0112 end');
    })
  })
}
