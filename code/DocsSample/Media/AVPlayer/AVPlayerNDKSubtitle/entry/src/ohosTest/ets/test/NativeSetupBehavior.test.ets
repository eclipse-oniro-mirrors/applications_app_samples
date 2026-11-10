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
import avPlayerNDK from 'libentry.so';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { application, common } from '@kit.AbilityKit';

let context: common.Context;


export default function nativeSetupBehaviorTest() {
  describe('nativeSetupBehaviorTest', () => {
  beforeAll(async () => {
    context = await application.createModuleContext(
      abilityDelegatorRegistry.getAbilityDelegator().getAppContext(), 'entry');
  });

    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SETUP_0001
     * @tc.name      testFinalNativeSetup0001
     * @tc.desc      Native setup valid fd case 1 returns a numeric result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalNativeSetup0001', 0, () => {
      const raw = context.resourceManager.getRawFdSync('test1.mp4');
      const fd: number = raw.fd;
      const size: number = raw.length;
      const result: number = avPlayerNDK.setup('test1.mp4', fd, raw.offset, size);
      expect(typeof result).assertEqual('number');
      expect(result).assertEqual(0);
      const released: number = avPlayerNDK.release();
      expect(typeof released).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SETUP_0002
     * @tc.name      testFinalNativeSetup0002
     * @tc.desc      Native setup invalid fd case 2 returns a numeric result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalNativeSetup0002', 0, () => {
      const raw = context.resourceManager.getRawFdSync('test1.mp4');
      const fd: number = -1;
      const size: number = 0;
      const result: number = avPlayerNDK.setup('test1.mp4', fd, raw.offset, size);
      expect(typeof result).assertEqual('number');
      expect(result).assertEqual(0);
      const released: number = avPlayerNDK.release();
      expect(typeof released).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SETUP_0003
     * @tc.name      testFinalNativeSetup0003
     * @tc.desc      Native setup valid fd case 3 returns a numeric result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalNativeSetup0003', 0, () => {
      const raw = context.resourceManager.getRawFdSync('test1.mp4');
      const fd: number = raw.fd;
      const size: number = raw.length;
      const result: number = avPlayerNDK.setup('test1.mp4', fd, raw.offset, size);
      expect(typeof result).assertEqual('number');
      expect(result).assertEqual(0);
      const released: number = avPlayerNDK.release();
      expect(typeof released).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SETUP_0004
     * @tc.name      testFinalNativeSetup0004
     * @tc.desc      Native setup invalid fd case 4 returns a numeric result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalNativeSetup0004', 0, () => {
      const raw = context.resourceManager.getRawFdSync('test1.mp4');
      const fd: number = -1;
      const size: number = 0;
      const result: number = avPlayerNDK.setup('test1.mp4', fd, raw.offset, size);
      expect(typeof result).assertEqual('number');
      expect(result).assertEqual(0);
      const released: number = avPlayerNDK.release();
      expect(typeof released).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SETUP_0005
     * @tc.name      testFinalNativeSetup0005
     * @tc.desc      Native setup valid fd case 5 returns a numeric result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalNativeSetup0005', 0, () => {
      const raw = context.resourceManager.getRawFdSync('test1.mp4');
      const fd: number = raw.fd;
      const size: number = raw.length;
      const result: number = avPlayerNDK.setup('test1.mp4', fd, raw.offset, size);
      expect(typeof result).assertEqual('number');
      expect(result).assertEqual(0);
      const released: number = avPlayerNDK.release();
      expect(typeof released).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SETUP_0006
     * @tc.name      testFinalNativeSetup0006
     * @tc.desc      Native setup invalid fd case 6 returns a numeric result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalNativeSetup0006', 0, () => {
      const raw = context.resourceManager.getRawFdSync('test1.mp4');
      const fd: number = -1;
      const size: number = 0;
      const result: number = avPlayerNDK.setup('test1.mp4', fd, raw.offset, size);
      expect(typeof result).assertEqual('number');
      expect(result).assertEqual(0);
      const released: number = avPlayerNDK.release();
      expect(typeof released).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SETUP_0007
     * @tc.name      testFinalNativeSetup0007
     * @tc.desc      Native setup valid fd case 7 returns a numeric result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalNativeSetup0007', 0, () => {
      const raw = context.resourceManager.getRawFdSync('test1.mp4');
      const fd: number = raw.fd;
      const size: number = raw.length;
      const result: number = avPlayerNDK.setup('test1.mp4', fd, raw.offset, size);
      expect(typeof result).assertEqual('number');
      expect(result).assertEqual(0);
      const released: number = avPlayerNDK.release();
      expect(typeof released).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SETUP_0008
     * @tc.name      testFinalNativeSetup0008
     * @tc.desc      Native setup invalid fd case 8 returns a numeric result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalNativeSetup0008', 0, () => {
      const raw = context.resourceManager.getRawFdSync('test1.mp4');
      const fd: number = -1;
      const size: number = 0;
      const result: number = avPlayerNDK.setup('test1.mp4', fd, raw.offset, size);
      expect(typeof result).assertEqual('number');
      expect(result).assertEqual(0);
      const released: number = avPlayerNDK.release();
      expect(typeof released).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SETUP_0009
     * @tc.name      testFinalNativeSetup0009
     * @tc.desc      Native setup valid fd case 9 returns a numeric result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalNativeSetup0009', 0, () => {
      const raw = context.resourceManager.getRawFdSync('test1.mp4');
      const fd: number = raw.fd;
      const size: number = raw.length;
      const result: number = avPlayerNDK.setup('test1.mp4', fd, raw.offset, size);
      expect(typeof result).assertEqual('number');
      expect(result).assertEqual(0);
      const released: number = avPlayerNDK.release();
      expect(typeof released).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SETUP_0010
     * @tc.name      testFinalNativeSetup0010
     * @tc.desc      Native setup invalid fd case 10 returns a numeric result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalNativeSetup0010', 0, () => {
      const raw = context.resourceManager.getRawFdSync('test1.mp4');
      const fd: number = -1;
      const size: number = 0;
      const result: number = avPlayerNDK.setup('test1.mp4', fd, raw.offset, size);
      expect(typeof result).assertEqual('number');
      expect(result).assertEqual(0);
      const released: number = avPlayerNDK.release();
      expect(typeof released).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SETUP_0011
     * @tc.name      testFinalNativeSetup0011
     * @tc.desc      Native setup valid fd case 11 returns a numeric result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalNativeSetup0011', 0, () => {
      const raw = context.resourceManager.getRawFdSync('test1.mp4');
      const fd: number = raw.fd;
      const size: number = raw.length;
      const result: number = avPlayerNDK.setup('test1.mp4', fd, raw.offset, size);
      expect(typeof result).assertEqual('number');
      expect(result).assertEqual(0);
      const released: number = avPlayerNDK.release();
      expect(typeof released).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SETUP_0012
     * @tc.name      testFinalNativeSetup0012
     * @tc.desc      Native setup invalid fd case 12 returns a numeric result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalNativeSetup0012', 0, () => {
      const raw = context.resourceManager.getRawFdSync('test1.mp4');
      const fd: number = -1;
      const size: number = 0;
      const result: number = avPlayerNDK.setup('test1.mp4', fd, raw.offset, size);
      expect(typeof result).assertEqual('number');
      expect(result).assertEqual(0);
      const released: number = avPlayerNDK.release();
      expect(typeof released).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SETUP_0013
     * @tc.name      testFinalNativeSetup0013
     * @tc.desc      Native setup valid fd case 13 returns a numeric result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalNativeSetup0013', 0, () => {
      const raw = context.resourceManager.getRawFdSync('test1.mp4');
      const fd: number = raw.fd;
      const size: number = raw.length;
      const result: number = avPlayerNDK.setup('test1.mp4', fd, raw.offset, size);
      expect(typeof result).assertEqual('number');
      expect(result).assertEqual(0);
      const released: number = avPlayerNDK.release();
      expect(typeof released).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SETUP_0014
     * @tc.name      testFinalNativeSetup0014
     * @tc.desc      Native setup invalid fd case 14 returns a numeric result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalNativeSetup0014', 0, () => {
      const raw = context.resourceManager.getRawFdSync('test1.mp4');
      const fd: number = -1;
      const size: number = 0;
      const result: number = avPlayerNDK.setup('test1.mp4', fd, raw.offset, size);
      expect(typeof result).assertEqual('number');
      expect(result).assertEqual(0);
      const released: number = avPlayerNDK.release();
      expect(typeof released).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SETUP_0015
     * @tc.name      testFinalNativeSetup0015
     * @tc.desc      Native setup valid fd case 15 returns a numeric result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalNativeSetup0015', 0, () => {
      const raw = context.resourceManager.getRawFdSync('test1.mp4');
      const fd: number = raw.fd;
      const size: number = raw.length;
      const result: number = avPlayerNDK.setup('test1.mp4', fd, raw.offset, size);
      expect(typeof result).assertEqual('number');
      expect(result).assertEqual(0);
      const released: number = avPlayerNDK.release();
      expect(typeof released).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SETUP_0016
     * @tc.name      testFinalNativeSetup0016
     * @tc.desc      Native setup invalid fd case 16 returns a numeric result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalNativeSetup0016', 0, () => {
      const raw = context.resourceManager.getRawFdSync('test1.mp4');
      const fd: number = -1;
      const size: number = 0;
      const result: number = avPlayerNDK.setup('test1.mp4', fd, raw.offset, size);
      expect(typeof result).assertEqual('number');
      expect(result).assertEqual(0);
      const released: number = avPlayerNDK.release();
      expect(typeof released).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SETUP_0017
     * @tc.name      testFinalNativeSetup0017
     * @tc.desc      Native setup valid fd case 17 returns a numeric result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalNativeSetup0017', 0, () => {
      const raw = context.resourceManager.getRawFdSync('test1.mp4');
      const fd: number = raw.fd;
      const size: number = raw.length;
      const result: number = avPlayerNDK.setup('test1.mp4', fd, raw.offset, size);
      expect(typeof result).assertEqual('number');
      expect(result).assertEqual(0);
      const released: number = avPlayerNDK.release();
      expect(typeof released).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SETUP_0018
     * @tc.name      testFinalNativeSetup0018
     * @tc.desc      Native setup invalid fd case 18 returns a numeric result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalNativeSetup0018', 0, () => {
      const raw = context.resourceManager.getRawFdSync('test1.mp4');
      const fd: number = -1;
      const size: number = 0;
      const result: number = avPlayerNDK.setup('test1.mp4', fd, raw.offset, size);
      expect(typeof result).assertEqual('number');
      expect(result).assertEqual(0);
      const released: number = avPlayerNDK.release();
      expect(typeof released).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SETUP_0019
     * @tc.name      testFinalNativeSetup0019
     * @tc.desc      Native setup valid fd case 19 returns a numeric result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalNativeSetup0019', 0, () => {
      const raw = context.resourceManager.getRawFdSync('test1.mp4');
      const fd: number = raw.fd;
      const size: number = raw.length;
      const result: number = avPlayerNDK.setup('test1.mp4', fd, raw.offset, size);
      expect(typeof result).assertEqual('number');
      expect(result).assertEqual(0);
      const released: number = avPlayerNDK.release();
      expect(typeof released).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_SETUP_0020
     * @tc.name      testFinalNativeSetup0020
     * @tc.desc      Native setup invalid fd case 20 returns a numeric result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalNativeSetup0020', 0, () => {
      const raw = context.resourceManager.getRawFdSync('test1.mp4');
      const fd: number = -1;
      const size: number = 0;
      const result: number = avPlayerNDK.setup('test1.mp4', fd, raw.offset, size);
      expect(typeof result).assertEqual('number');
      expect(result).assertEqual(0);
      const released: number = avPlayerNDK.release();
      expect(typeof released).assertEqual('number');
    })
  })
}
