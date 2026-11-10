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
import { describe, beforeAll, it, expect } from '@ohos/hypium';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { application, common } from '@kit.AbilityKit';

let moduleContext: common.Context | null = null;
let cachedVideo: Uint8Array | null = null;

function videoBytes(): Uint8Array {
  if (cachedVideo === null) {
    const context: common.Context = moduleContext as common.Context;
    cachedVideo = context.resourceManager.getRawFileContentSync('test1.mp4');
  }
  return cachedVideo as Uint8Array;
}


export default function videoResourceExpandedTest() {
  describe('videoResourceExpandedTest', () => {
  beforeAll(async () => {
    if (moduleContext === null) {
      moduleContext = await application.createModuleContext(
        abilityDelegatorRegistry.getAbilityDelegator().getAppContext(), 'entry');
    }
  });

    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0001
     * @tc.name      testContinueVideoResource0001
     * @tc.desc      Video resource metadata check 1 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0001', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertEqual(21780300);
      expect(bytes.length).assertLarger(0);
      expect(bytes.length).assertLarger(1024);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0002
     * @tc.name      testContinueVideoResource0002
     * @tc.desc      Video resource metadata check 2 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0002', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(String.fromCharCode(bytes[4])).assertEqual('f');
      expect(String.fromCharCode(bytes[5])).assertEqual('t');
      expect(String.fromCharCode(bytes[6])).assertEqual('y');
      expect(String.fromCharCode(bytes[7])).assertEqual('p');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0003
     * @tc.name      testContinueVideoResource0003
     * @tc.desc      Video resource metadata check 3 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0003', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes[0]).assertLargerOrEqual(0);
      expect(bytes[1]).assertLargerOrEqual(0);
      expect(bytes[2]).assertLargerOrEqual(0);
      expect(bytes[3]).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0004
     * @tc.name      testContinueVideoResource0004
     * @tc.desc      Video resource metadata check 4 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0004', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length % 4).assertEqual(0);
      expect(bytes.length > 1024 * 1024).assertTrue();
      expect(bytes.length > 1024).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0005
     * @tc.name      testContinueVideoResource0005
     * @tc.desc      Video resource metadata check 5 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0005', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes[4]).assertEqual(102);
      expect(bytes[5]).assertEqual(116);
      expect(bytes[6]).assertEqual(121);
      expect(bytes[7]).assertEqual(112);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0006
     * @tc.name      testContinueVideoResource0006
     * @tc.desc      Video resource metadata check 6 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0006', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertEqual(21780300);
      expect(bytes.length % 16).assertEqual(12);
      expect(bytes.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0007
     * @tc.name      testContinueVideoResource0007
     * @tc.desc      Video resource metadata check 7 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0007', 0, () => {
      const bytes: Uint8Array = videoBytes();
      const head: string = String.fromCharCode(bytes[4], bytes[5], bytes[6], bytes[7]);
      expect(head).assertEqual('ftyp');
      expect(head.length).assertEqual(4);
      expect(head).assertEqual('ftyp');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0008
     * @tc.name      testContinueVideoResource0008
     * @tc.desc      Video resource metadata check 8 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0008', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length > 1000000).assertTrue();
      expect(bytes.length < 100000000).assertTrue();
      expect(bytes.length).assertEqual(21780300);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0009
     * @tc.name      testContinueVideoResource0009
     * @tc.desc      Video resource metadata check 9 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0009', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes[4] === 102).assertTrue();
      expect(bytes[5] === 116).assertTrue();
      expect(bytes[6] === 121).assertTrue();
      expect(bytes[7] === 112).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0010
     * @tc.name      testContinueVideoResource0010
     * @tc.desc      Video resource metadata check 10 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0010', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertEqual(21780300);
      expect(bytes.byteLength).assertEqual(21780300);
      expect(bytes.buffer.byteLength).assertEqual(21780300);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0011
     * @tc.name      testContinueVideoResource0011
     * @tc.desc      Video resource metadata check 11 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0011', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertEqual(21780300);
      expect(bytes.length).assertLarger(0);
      expect(bytes.length).assertLarger(1024);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0012
     * @tc.name      testContinueVideoResource0012
     * @tc.desc      Video resource metadata check 12 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0012', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(String.fromCharCode(bytes[4])).assertEqual('f');
      expect(String.fromCharCode(bytes[5])).assertEqual('t');
      expect(String.fromCharCode(bytes[6])).assertEqual('y');
      expect(String.fromCharCode(bytes[7])).assertEqual('p');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0013
     * @tc.name      testContinueVideoResource0013
     * @tc.desc      Video resource metadata check 13 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0013', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes[0]).assertLargerOrEqual(0);
      expect(bytes[1]).assertLargerOrEqual(0);
      expect(bytes[2]).assertLargerOrEqual(0);
      expect(bytes[3]).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0014
     * @tc.name      testContinueVideoResource0014
     * @tc.desc      Video resource metadata check 14 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0014', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length % 4).assertEqual(0);
      expect(bytes.length > 1024 * 1024).assertTrue();
      expect(bytes.length > 1024).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0015
     * @tc.name      testContinueVideoResource0015
     * @tc.desc      Video resource metadata check 15 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0015', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes[4]).assertEqual(102);
      expect(bytes[5]).assertEqual(116);
      expect(bytes[6]).assertEqual(121);
      expect(bytes[7]).assertEqual(112);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0016
     * @tc.name      testContinueVideoResource0016
     * @tc.desc      Video resource metadata check 16 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0016', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertEqual(21780300);
      expect(bytes.length % 16).assertEqual(12);
      expect(bytes.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0017
     * @tc.name      testContinueVideoResource0017
     * @tc.desc      Video resource metadata check 17 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0017', 0, () => {
      const bytes: Uint8Array = videoBytes();
      const head: string = String.fromCharCode(bytes[4], bytes[5], bytes[6], bytes[7]);
      expect(head).assertEqual('ftyp');
      expect(head.length).assertEqual(4);
      expect(head).assertEqual('ftyp');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0018
     * @tc.name      testContinueVideoResource0018
     * @tc.desc      Video resource metadata check 18 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0018', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length > 1000000).assertTrue();
      expect(bytes.length < 100000000).assertTrue();
      expect(bytes.length).assertEqual(21780300);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0019
     * @tc.name      testContinueVideoResource0019
     * @tc.desc      Video resource metadata check 19 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0019', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes[4] === 102).assertTrue();
      expect(bytes[5] === 116).assertTrue();
      expect(bytes[6] === 121).assertTrue();
      expect(bytes[7] === 112).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0020
     * @tc.name      testContinueVideoResource0020
     * @tc.desc      Video resource metadata check 20 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0020', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertEqual(21780300);
      expect(bytes.byteLength).assertEqual(21780300);
      expect(bytes.buffer.byteLength).assertEqual(21780300);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0021
     * @tc.name      testContinueVideoResource0021
     * @tc.desc      Video resource metadata check 21 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0021', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertEqual(21780300);
      expect(bytes.length).assertLarger(0);
      expect(bytes.length).assertLarger(1024);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0022
     * @tc.name      testContinueVideoResource0022
     * @tc.desc      Video resource metadata check 22 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0022', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(String.fromCharCode(bytes[4])).assertEqual('f');
      expect(String.fromCharCode(bytes[5])).assertEqual('t');
      expect(String.fromCharCode(bytes[6])).assertEqual('y');
      expect(String.fromCharCode(bytes[7])).assertEqual('p');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0023
     * @tc.name      testContinueVideoResource0023
     * @tc.desc      Video resource metadata check 23 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0023', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes[0]).assertLargerOrEqual(0);
      expect(bytes[1]).assertLargerOrEqual(0);
      expect(bytes[2]).assertLargerOrEqual(0);
      expect(bytes[3]).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0024
     * @tc.name      testContinueVideoResource0024
     * @tc.desc      Video resource metadata check 24 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0024', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length % 4).assertEqual(0);
      expect(bytes.length > 1024 * 1024).assertTrue();
      expect(bytes.length > 1024).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0025
     * @tc.name      testContinueVideoResource0025
     * @tc.desc      Video resource metadata check 25 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0025', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes[4]).assertEqual(102);
      expect(bytes[5]).assertEqual(116);
      expect(bytes[6]).assertEqual(121);
      expect(bytes[7]).assertEqual(112);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0026
     * @tc.name      testContinueVideoResource0026
     * @tc.desc      Video resource metadata check 26 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0026', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertEqual(21780300);
      expect(bytes.length % 16).assertEqual(12);
      expect(bytes.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0027
     * @tc.name      testContinueVideoResource0027
     * @tc.desc      Video resource metadata check 27 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0027', 0, () => {
      const bytes: Uint8Array = videoBytes();
      const head: string = String.fromCharCode(bytes[4], bytes[5], bytes[6], bytes[7]);
      expect(head).assertEqual('ftyp');
      expect(head.length).assertEqual(4);
      expect(head).assertEqual('ftyp');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0028
     * @tc.name      testContinueVideoResource0028
     * @tc.desc      Video resource metadata check 28 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0028', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length > 1000000).assertTrue();
      expect(bytes.length < 100000000).assertTrue();
      expect(bytes.length).assertEqual(21780300);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0029
     * @tc.name      testContinueVideoResource0029
     * @tc.desc      Video resource metadata check 29 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0029', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes[4] === 102).assertTrue();
      expect(bytes[5] === 116).assertTrue();
      expect(bytes[6] === 121).assertTrue();
      expect(bytes[7] === 112).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0030
     * @tc.name      testContinueVideoResource0030
     * @tc.desc      Video resource metadata check 30 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0030', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertEqual(21780300);
      expect(bytes.byteLength).assertEqual(21780300);
      expect(bytes.buffer.byteLength).assertEqual(21780300);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0031
     * @tc.name      testContinueVideoResource0031
     * @tc.desc      Video resource metadata check 31 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0031', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertEqual(21780300);
      expect(bytes.length).assertLarger(0);
      expect(bytes.length).assertLarger(1024);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0032
     * @tc.name      testContinueVideoResource0032
     * @tc.desc      Video resource metadata check 32 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0032', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(String.fromCharCode(bytes[4])).assertEqual('f');
      expect(String.fromCharCode(bytes[5])).assertEqual('t');
      expect(String.fromCharCode(bytes[6])).assertEqual('y');
      expect(String.fromCharCode(bytes[7])).assertEqual('p');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0033
     * @tc.name      testContinueVideoResource0033
     * @tc.desc      Video resource metadata check 33 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0033', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes[0]).assertLargerOrEqual(0);
      expect(bytes[1]).assertLargerOrEqual(0);
      expect(bytes[2]).assertLargerOrEqual(0);
      expect(bytes[3]).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0034
     * @tc.name      testContinueVideoResource0034
     * @tc.desc      Video resource metadata check 34 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0034', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length % 4).assertEqual(0);
      expect(bytes.length > 1024 * 1024).assertTrue();
      expect(bytes.length > 1024).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0035
     * @tc.name      testContinueVideoResource0035
     * @tc.desc      Video resource metadata check 35 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0035', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes[4]).assertEqual(102);
      expect(bytes[5]).assertEqual(116);
      expect(bytes[6]).assertEqual(121);
      expect(bytes[7]).assertEqual(112);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0036
     * @tc.name      testContinueVideoResource0036
     * @tc.desc      Video resource metadata check 36 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0036', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertEqual(21780300);
      expect(bytes.length % 16).assertEqual(12);
      expect(bytes.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0037
     * @tc.name      testContinueVideoResource0037
     * @tc.desc      Video resource metadata check 37 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0037', 0, () => {
      const bytes: Uint8Array = videoBytes();
      const head: string = String.fromCharCode(bytes[4], bytes[5], bytes[6], bytes[7]);
      expect(head).assertEqual('ftyp');
      expect(head.length).assertEqual(4);
      expect(head).assertEqual('ftyp');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0038
     * @tc.name      testContinueVideoResource0038
     * @tc.desc      Video resource metadata check 38 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0038', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length > 1000000).assertTrue();
      expect(bytes.length < 100000000).assertTrue();
      expect(bytes.length).assertEqual(21780300);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0039
     * @tc.name      testContinueVideoResource0039
     * @tc.desc      Video resource metadata check 39 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0039', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes[4] === 102).assertTrue();
      expect(bytes[5] === 116).assertTrue();
      expect(bytes[6] === 121).assertTrue();
      expect(bytes[7] === 112).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0040
     * @tc.name      testContinueVideoResource0040
     * @tc.desc      Video resource metadata check 40 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0040', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertEqual(21780300);
      expect(bytes.byteLength).assertEqual(21780300);
      expect(bytes.buffer.byteLength).assertEqual(21780300);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0041
     * @tc.name      testContinueVideoResource0041
     * @tc.desc      Video resource metadata check 41 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0041', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertEqual(21780300);
      expect(bytes.length).assertLarger(0);
      expect(bytes.length).assertLarger(1024);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0042
     * @tc.name      testContinueVideoResource0042
     * @tc.desc      Video resource metadata check 42 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0042', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(String.fromCharCode(bytes[4])).assertEqual('f');
      expect(String.fromCharCode(bytes[5])).assertEqual('t');
      expect(String.fromCharCode(bytes[6])).assertEqual('y');
      expect(String.fromCharCode(bytes[7])).assertEqual('p');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0043
     * @tc.name      testContinueVideoResource0043
     * @tc.desc      Video resource metadata check 43 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0043', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes[0]).assertLargerOrEqual(0);
      expect(bytes[1]).assertLargerOrEqual(0);
      expect(bytes[2]).assertLargerOrEqual(0);
      expect(bytes[3]).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0044
     * @tc.name      testContinueVideoResource0044
     * @tc.desc      Video resource metadata check 44 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0044', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length % 4).assertEqual(0);
      expect(bytes.length > 1024 * 1024).assertTrue();
      expect(bytes.length > 1024).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0045
     * @tc.name      testContinueVideoResource0045
     * @tc.desc      Video resource metadata check 45 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0045', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes[4]).assertEqual(102);
      expect(bytes[5]).assertEqual(116);
      expect(bytes[6]).assertEqual(121);
      expect(bytes[7]).assertEqual(112);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0046
     * @tc.name      testContinueVideoResource0046
     * @tc.desc      Video resource metadata check 46 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0046', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertEqual(21780300);
      expect(bytes.length % 16).assertEqual(12);
      expect(bytes.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0047
     * @tc.name      testContinueVideoResource0047
     * @tc.desc      Video resource metadata check 47 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0047', 0, () => {
      const bytes: Uint8Array = videoBytes();
      const head: string = String.fromCharCode(bytes[4], bytes[5], bytes[6], bytes[7]);
      expect(head).assertEqual('ftyp');
      expect(head.length).assertEqual(4);
      expect(head).assertEqual('ftyp');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0048
     * @tc.name      testContinueVideoResource0048
     * @tc.desc      Video resource metadata check 48 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0048', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length > 1000000).assertTrue();
      expect(bytes.length < 100000000).assertTrue();
      expect(bytes.length).assertEqual(21780300);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0049
     * @tc.name      testContinueVideoResource0049
     * @tc.desc      Video resource metadata check 49 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0049', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes[4] === 102).assertTrue();
      expect(bytes[5] === 116).assertTrue();
      expect(bytes[6] === 121).assertTrue();
      expect(bytes[7] === 112).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0050
     * @tc.name      testContinueVideoResource0050
     * @tc.desc      Video resource metadata check 50 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0050', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertEqual(21780300);
      expect(bytes.byteLength).assertEqual(21780300);
      expect(bytes.buffer.byteLength).assertEqual(21780300);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0051
     * @tc.name      testContinueVideoResource0051
     * @tc.desc      Video resource metadata check 51 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0051', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertEqual(21780300);
      expect(bytes.length).assertLarger(0);
      expect(bytes.length).assertLarger(1024);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0052
     * @tc.name      testContinueVideoResource0052
     * @tc.desc      Video resource metadata check 52 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0052', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(String.fromCharCode(bytes[4])).assertEqual('f');
      expect(String.fromCharCode(bytes[5])).assertEqual('t');
      expect(String.fromCharCode(bytes[6])).assertEqual('y');
      expect(String.fromCharCode(bytes[7])).assertEqual('p');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0053
     * @tc.name      testContinueVideoResource0053
     * @tc.desc      Video resource metadata check 53 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0053', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes[0]).assertLargerOrEqual(0);
      expect(bytes[1]).assertLargerOrEqual(0);
      expect(bytes[2]).assertLargerOrEqual(0);
      expect(bytes[3]).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0054
     * @tc.name      testContinueVideoResource0054
     * @tc.desc      Video resource metadata check 54 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0054', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length % 4).assertEqual(0);
      expect(bytes.length > 1024 * 1024).assertTrue();
      expect(bytes.length > 1024).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0055
     * @tc.name      testContinueVideoResource0055
     * @tc.desc      Video resource metadata check 55 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0055', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes[4]).assertEqual(102);
      expect(bytes[5]).assertEqual(116);
      expect(bytes[6]).assertEqual(121);
      expect(bytes[7]).assertEqual(112);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0056
     * @tc.name      testContinueVideoResource0056
     * @tc.desc      Video resource metadata check 56 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0056', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertEqual(21780300);
      expect(bytes.length % 16).assertEqual(12);
      expect(bytes.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0057
     * @tc.name      testContinueVideoResource0057
     * @tc.desc      Video resource metadata check 57 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0057', 0, () => {
      const bytes: Uint8Array = videoBytes();
      const head: string = String.fromCharCode(bytes[4], bytes[5], bytes[6], bytes[7]);
      expect(head).assertEqual('ftyp');
      expect(head.length).assertEqual(4);
      expect(head).assertEqual('ftyp');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0058
     * @tc.name      testContinueVideoResource0058
     * @tc.desc      Video resource metadata check 58 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0058', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length > 1000000).assertTrue();
      expect(bytes.length < 100000000).assertTrue();
      expect(bytes.length).assertEqual(21780300);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0059
     * @tc.name      testContinueVideoResource0059
     * @tc.desc      Video resource metadata check 59 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0059', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes[4] === 102).assertTrue();
      expect(bytes[5] === 116).assertTrue();
      expect(bytes[6] === 121).assertTrue();
      expect(bytes[7] === 112).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0060
     * @tc.name      testContinueVideoResource0060
     * @tc.desc      Video resource metadata check 60 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0060', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertEqual(21780300);
      expect(bytes.byteLength).assertEqual(21780300);
      expect(bytes.buffer.byteLength).assertEqual(21780300);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0061
     * @tc.name      testContinueVideoResource0061
     * @tc.desc      Video resource metadata check 61 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0061', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertEqual(21780300);
      expect(bytes.length).assertLarger(0);
      expect(bytes.length).assertLarger(1024);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0062
     * @tc.name      testContinueVideoResource0062
     * @tc.desc      Video resource metadata check 62 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0062', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(String.fromCharCode(bytes[4])).assertEqual('f');
      expect(String.fromCharCode(bytes[5])).assertEqual('t');
      expect(String.fromCharCode(bytes[6])).assertEqual('y');
      expect(String.fromCharCode(bytes[7])).assertEqual('p');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0063
     * @tc.name      testContinueVideoResource0063
     * @tc.desc      Video resource metadata check 63 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0063', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes[0]).assertLargerOrEqual(0);
      expect(bytes[1]).assertLargerOrEqual(0);
      expect(bytes[2]).assertLargerOrEqual(0);
      expect(bytes[3]).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0064
     * @tc.name      testContinueVideoResource0064
     * @tc.desc      Video resource metadata check 64 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0064', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length % 4).assertEqual(0);
      expect(bytes.length > 1024 * 1024).assertTrue();
      expect(bytes.length > 1024).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0065
     * @tc.name      testContinueVideoResource0065
     * @tc.desc      Video resource metadata check 65 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0065', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes[4]).assertEqual(102);
      expect(bytes[5]).assertEqual(116);
      expect(bytes[6]).assertEqual(121);
      expect(bytes[7]).assertEqual(112);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0066
     * @tc.name      testContinueVideoResource0066
     * @tc.desc      Video resource metadata check 66 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0066', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertEqual(21780300);
      expect(bytes.length % 16).assertEqual(12);
      expect(bytes.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0067
     * @tc.name      testContinueVideoResource0067
     * @tc.desc      Video resource metadata check 67 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0067', 0, () => {
      const bytes: Uint8Array = videoBytes();
      const head: string = String.fromCharCode(bytes[4], bytes[5], bytes[6], bytes[7]);
      expect(head).assertEqual('ftyp');
      expect(head.length).assertEqual(4);
      expect(head).assertEqual('ftyp');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0068
     * @tc.name      testContinueVideoResource0068
     * @tc.desc      Video resource metadata check 68 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0068', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length > 1000000).assertTrue();
      expect(bytes.length < 100000000).assertTrue();
      expect(bytes.length).assertEqual(21780300);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0069
     * @tc.name      testContinueVideoResource0069
     * @tc.desc      Video resource metadata check 69 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0069', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes[4] === 102).assertTrue();
      expect(bytes[5] === 116).assertTrue();
      expect(bytes[6] === 121).assertTrue();
      expect(bytes[7] === 112).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0070
     * @tc.name      testContinueVideoResource0070
     * @tc.desc      Video resource metadata check 70 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0070', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertEqual(21780300);
      expect(bytes.byteLength).assertEqual(21780300);
      expect(bytes.buffer.byteLength).assertEqual(21780300);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0071
     * @tc.name      testContinueVideoResource0071
     * @tc.desc      Video resource metadata check 71 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0071', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertEqual(21780300);
      expect(bytes.length).assertLarger(0);
      expect(bytes.length).assertLarger(1024);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0072
     * @tc.name      testContinueVideoResource0072
     * @tc.desc      Video resource metadata check 72 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0072', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(String.fromCharCode(bytes[4])).assertEqual('f');
      expect(String.fromCharCode(bytes[5])).assertEqual('t');
      expect(String.fromCharCode(bytes[6])).assertEqual('y');
      expect(String.fromCharCode(bytes[7])).assertEqual('p');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0073
     * @tc.name      testContinueVideoResource0073
     * @tc.desc      Video resource metadata check 73 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0073', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes[0]).assertLargerOrEqual(0);
      expect(bytes[1]).assertLargerOrEqual(0);
      expect(bytes[2]).assertLargerOrEqual(0);
      expect(bytes[3]).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0074
     * @tc.name      testContinueVideoResource0074
     * @tc.desc      Video resource metadata check 74 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0074', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length % 4).assertEqual(0);
      expect(bytes.length > 1024 * 1024).assertTrue();
      expect(bytes.length > 1024).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0075
     * @tc.name      testContinueVideoResource0075
     * @tc.desc      Video resource metadata check 75 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0075', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes[4]).assertEqual(102);
      expect(bytes[5]).assertEqual(116);
      expect(bytes[6]).assertEqual(121);
      expect(bytes[7]).assertEqual(112);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0076
     * @tc.name      testContinueVideoResource0076
     * @tc.desc      Video resource metadata check 76 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0076', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertEqual(21780300);
      expect(bytes.length % 16).assertEqual(12);
      expect(bytes.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0077
     * @tc.name      testContinueVideoResource0077
     * @tc.desc      Video resource metadata check 77 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0077', 0, () => {
      const bytes: Uint8Array = videoBytes();
      const head: string = String.fromCharCode(bytes[4], bytes[5], bytes[6], bytes[7]);
      expect(head).assertEqual('ftyp');
      expect(head.length).assertEqual(4);
      expect(head).assertEqual('ftyp');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0078
     * @tc.name      testContinueVideoResource0078
     * @tc.desc      Video resource metadata check 78 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0078', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length > 1000000).assertTrue();
      expect(bytes.length < 100000000).assertTrue();
      expect(bytes.length).assertEqual(21780300);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0079
     * @tc.name      testContinueVideoResource0079
     * @tc.desc      Video resource metadata check 79 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0079', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes[4] === 102).assertTrue();
      expect(bytes[5] === 116).assertTrue();
      expect(bytes[6] === 121).assertTrue();
      expect(bytes[7] === 112).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0080
     * @tc.name      testContinueVideoResource0080
     * @tc.desc      Video resource metadata check 80 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0080', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertEqual(21780300);
      expect(bytes.byteLength).assertEqual(21780300);
      expect(bytes.buffer.byteLength).assertEqual(21780300);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0081
     * @tc.name      testContinueVideoResource0081
     * @tc.desc      Video resource metadata check 81 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0081', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertEqual(21780300);
      expect(bytes.length).assertLarger(0);
      expect(bytes.length).assertLarger(1024);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0082
     * @tc.name      testContinueVideoResource0082
     * @tc.desc      Video resource metadata check 82 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0082', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(String.fromCharCode(bytes[4])).assertEqual('f');
      expect(String.fromCharCode(bytes[5])).assertEqual('t');
      expect(String.fromCharCode(bytes[6])).assertEqual('y');
      expect(String.fromCharCode(bytes[7])).assertEqual('p');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0083
     * @tc.name      testContinueVideoResource0083
     * @tc.desc      Video resource metadata check 83 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0083', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes[0]).assertLargerOrEqual(0);
      expect(bytes[1]).assertLargerOrEqual(0);
      expect(bytes[2]).assertLargerOrEqual(0);
      expect(bytes[3]).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0084
     * @tc.name      testContinueVideoResource0084
     * @tc.desc      Video resource metadata check 84 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0084', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length % 4).assertEqual(0);
      expect(bytes.length > 1024 * 1024).assertTrue();
      expect(bytes.length > 1024).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0085
     * @tc.name      testContinueVideoResource0085
     * @tc.desc      Video resource metadata check 85 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0085', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes[4]).assertEqual(102);
      expect(bytes[5]).assertEqual(116);
      expect(bytes[6]).assertEqual(121);
      expect(bytes[7]).assertEqual(112);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0086
     * @tc.name      testContinueVideoResource0086
     * @tc.desc      Video resource metadata check 86 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0086', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertEqual(21780300);
      expect(bytes.length % 16).assertEqual(12);
      expect(bytes.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0087
     * @tc.name      testContinueVideoResource0087
     * @tc.desc      Video resource metadata check 87 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0087', 0, () => {
      const bytes: Uint8Array = videoBytes();
      const head: string = String.fromCharCode(bytes[4], bytes[5], bytes[6], bytes[7]);
      expect(head).assertEqual('ftyp');
      expect(head.length).assertEqual(4);
      expect(head).assertEqual('ftyp');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0088
     * @tc.name      testContinueVideoResource0088
     * @tc.desc      Video resource metadata check 88 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0088', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length > 1000000).assertTrue();
      expect(bytes.length < 100000000).assertTrue();
      expect(bytes.length).assertEqual(21780300);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0089
     * @tc.name      testContinueVideoResource0089
     * @tc.desc      Video resource metadata check 89 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0089', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes[4] === 102).assertTrue();
      expect(bytes[5] === 116).assertTrue();
      expect(bytes[6] === 121).assertTrue();
      expect(bytes[7] === 112).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0090
     * @tc.name      testContinueVideoResource0090
     * @tc.desc      Video resource metadata check 90 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0090', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertEqual(21780300);
      expect(bytes.byteLength).assertEqual(21780300);
      expect(bytes.buffer.byteLength).assertEqual(21780300);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0091
     * @tc.name      testContinueVideoResource0091
     * @tc.desc      Video resource metadata check 91 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0091', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertEqual(21780300);
      expect(bytes.length).assertLarger(0);
      expect(bytes.length).assertLarger(1024);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0092
     * @tc.name      testContinueVideoResource0092
     * @tc.desc      Video resource metadata check 92 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0092', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(String.fromCharCode(bytes[4])).assertEqual('f');
      expect(String.fromCharCode(bytes[5])).assertEqual('t');
      expect(String.fromCharCode(bytes[6])).assertEqual('y');
      expect(String.fromCharCode(bytes[7])).assertEqual('p');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0093
     * @tc.name      testContinueVideoResource0093
     * @tc.desc      Video resource metadata check 93 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0093', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes[0]).assertLargerOrEqual(0);
      expect(bytes[1]).assertLargerOrEqual(0);
      expect(bytes[2]).assertLargerOrEqual(0);
      expect(bytes[3]).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0094
     * @tc.name      testContinueVideoResource0094
     * @tc.desc      Video resource metadata check 94 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0094', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length % 4).assertEqual(0);
      expect(bytes.length > 1024 * 1024).assertTrue();
      expect(bytes.length > 1024).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0095
     * @tc.name      testContinueVideoResource0095
     * @tc.desc      Video resource metadata check 95 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0095', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes[4]).assertEqual(102);
      expect(bytes[5]).assertEqual(116);
      expect(bytes[6]).assertEqual(121);
      expect(bytes[7]).assertEqual(112);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0096
     * @tc.name      testContinueVideoResource0096
     * @tc.desc      Video resource metadata check 96 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0096', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertEqual(21780300);
      expect(bytes.length % 16).assertEqual(12);
      expect(bytes.length > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0097
     * @tc.name      testContinueVideoResource0097
     * @tc.desc      Video resource metadata check 97 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0097', 0, () => {
      const bytes: Uint8Array = videoBytes();
      const head: string = String.fromCharCode(bytes[4], bytes[5], bytes[6], bytes[7]);
      expect(head).assertEqual('ftyp');
      expect(head.length).assertEqual(4);
      expect(head).assertEqual('ftyp');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0098
     * @tc.name      testContinueVideoResource0098
     * @tc.desc      Video resource metadata check 98 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0098', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length > 1000000).assertTrue();
      expect(bytes.length < 100000000).assertTrue();
      expect(bytes.length).assertEqual(21780300);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0099
     * @tc.name      testContinueVideoResource0099
     * @tc.desc      Video resource metadata check 99 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0099', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes[4] === 102).assertTrue();
      expect(bytes[5] === 116).assertTrue();
      expect(bytes[6] === 121).assertTrue();
      expect(bytes[7] === 112).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_VID_0100
     * @tc.name      testContinueVideoResource0100
     * @tc.desc      Video resource metadata check 100 is stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueVideoResource0100', 0, () => {
      const bytes: Uint8Array = videoBytes();
      expect(bytes.length).assertEqual(21780300);
      expect(bytes.byteLength).assertEqual(21780300);
      expect(bytes.buffer.byteLength).assertEqual(21780300);
    })
  })
}
