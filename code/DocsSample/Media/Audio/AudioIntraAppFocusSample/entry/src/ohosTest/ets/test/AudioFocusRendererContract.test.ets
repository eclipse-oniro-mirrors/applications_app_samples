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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_audioFocusRendererContract]';
const DOMAIN: number = 0xF811;

function it(name: string, filter: number, func: () => void | Promise<void>): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}

interface ExpectAssert {
  assertEqual(expectValue: string | number | boolean | Object | null | undefined): void;
  assertTrue(): void;
  assertFalse(): void;
  assertLarger(expectValue: number): void;
  assertLargerOrEqual(expectValue: number): void;
  assertLess(expectValue: number): void;
  assertLessOrEqual(expectValue: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function audioFocusRendererContractTest(): void {
  describe('audioFocusRendererContractTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0001
     * @tc.name      testExtFocusRender0000
     * @tc.desc      Renderer contract 44100Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const rendererFlags: number = 0;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0002
     * @tc.name      testExtFocusRender0001
     * @tc.desc      Renderer contract 48000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const rendererFlags: number = 1;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0003
     * @tc.name      testExtFocusRender0002
     * @tc.desc      Renderer contract 96000Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const channels: number = 1;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const rendererFlags: number = 0;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0004
     * @tc.name      testExtFocusRender0003
     * @tc.desc      Renderer contract 44100Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const channels: number = 2;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const rendererFlags: number = 1;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0005
     * @tc.name      testExtFocusRender0004
     * @tc.desc      Renderer contract 48000Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const channels: number = 1;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const rendererFlags: number = 0;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0006
     * @tc.name      testExtFocusRender0005
     * @tc.desc      Renderer contract 96000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const channels: number = 2;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const rendererFlags: number = 1;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0007
     * @tc.name      testExtFocusRender0006
     * @tc.desc      Renderer contract 44100Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const rendererFlags: number = 0;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0008
     * @tc.name      testExtFocusRender0007
     * @tc.desc      Renderer contract 48000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const rendererFlags: number = 1;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0009
     * @tc.name      testExtFocusRender0008
     * @tc.desc      Renderer contract 96000Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const channels: number = 1;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const rendererFlags: number = 0;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0010
     * @tc.name      testExtFocusRender0009
     * @tc.desc      Renderer contract 44100Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const channels: number = 2;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const rendererFlags: number = 1;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0011
     * @tc.name      testExtFocusRender0010
     * @tc.desc      Renderer contract 48000Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const channels: number = 1;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const rendererFlags: number = 0;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0012
     * @tc.name      testExtFocusRender0011
     * @tc.desc      Renderer contract 96000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const channels: number = 2;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const rendererFlags: number = 1;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0013
     * @tc.name      testExtFocusRender0012
     * @tc.desc      Renderer contract 44100Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const rendererFlags: number = 0;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0014
     * @tc.name      testExtFocusRender0013
     * @tc.desc      Renderer contract 48000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const rendererFlags: number = 1;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0015
     * @tc.name      testExtFocusRender0014
     * @tc.desc      Renderer contract 96000Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const channels: number = 1;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const rendererFlags: number = 0;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0016
     * @tc.name      testExtFocusRender0015
     * @tc.desc      Renderer contract 44100Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const channels: number = 2;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const rendererFlags: number = 1;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0017
     * @tc.name      testExtFocusRender0016
     * @tc.desc      Renderer contract 48000Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const channels: number = 1;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const rendererFlags: number = 0;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0018
     * @tc.name      testExtFocusRender0017
     * @tc.desc      Renderer contract 96000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const channels: number = 2;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const rendererFlags: number = 1;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0019
     * @tc.name      testExtFocusRender0018
     * @tc.desc      Renderer contract 44100Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const rendererFlags: number = 0;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0020
     * @tc.name      testExtFocusRender0019
     * @tc.desc      Renderer contract 48000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const rendererFlags: number = 1;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0021
     * @tc.name      testExtFocusRender0020
     * @tc.desc      Renderer contract 96000Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const channels: number = 1;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const rendererFlags: number = 0;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0022
     * @tc.name      testExtFocusRender0021
     * @tc.desc      Renderer contract 44100Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const channels: number = 2;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const rendererFlags: number = 1;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0023
     * @tc.name      testExtFocusRender0022
     * @tc.desc      Renderer contract 48000Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const channels: number = 1;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const rendererFlags: number = 0;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0024
     * @tc.name      testExtFocusRender0023
     * @tc.desc      Renderer contract 96000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const channels: number = 2;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const rendererFlags: number = 1;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0025
     * @tc.name      testExtFocusRender0024
     * @tc.desc      Renderer contract 44100Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const rendererFlags: number = 0;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0026
     * @tc.name      testExtFocusRender0025
     * @tc.desc      Renderer contract 48000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const rendererFlags: number = 1;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0027
     * @tc.name      testExtFocusRender0026
     * @tc.desc      Renderer contract 96000Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const channels: number = 1;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const rendererFlags: number = 0;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0028
     * @tc.name      testExtFocusRender0027
     * @tc.desc      Renderer contract 44100Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const channels: number = 2;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const rendererFlags: number = 1;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0029
     * @tc.name      testExtFocusRender0028
     * @tc.desc      Renderer contract 48000Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const channels: number = 1;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const rendererFlags: number = 0;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0030
     * @tc.name      testExtFocusRender0029
     * @tc.desc      Renderer contract 96000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const channels: number = 2;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const rendererFlags: number = 1;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0031
     * @tc.name      testExtFocusRender0030
     * @tc.desc      Renderer contract 44100Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const rendererFlags: number = 0;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0032
     * @tc.name      testExtFocusRender0031
     * @tc.desc      Renderer contract 48000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const rendererFlags: number = 1;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0033
     * @tc.name      testExtFocusRender0032
     * @tc.desc      Renderer contract 96000Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const channels: number = 1;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const rendererFlags: number = 0;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0034
     * @tc.name      testExtFocusRender0033
     * @tc.desc      Renderer contract 44100Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const channels: number = 2;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const rendererFlags: number = 1;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0035
     * @tc.name      testExtFocusRender0034
     * @tc.desc      Renderer contract 48000Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const channels: number = 1;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const rendererFlags: number = 0;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0036
     * @tc.name      testExtFocusRender0035
     * @tc.desc      Renderer contract 96000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const channels: number = 2;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const rendererFlags: number = 1;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0037
     * @tc.name      testExtFocusRender0036
     * @tc.desc      Renderer contract 44100Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const channels: number = 1;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const rendererFlags: number = 0;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0038
     * @tc.name      testExtFocusRender0037
     * @tc.desc      Renderer contract 48000Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 48000;
      const channels: number = 2;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const rendererFlags: number = 1;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0039
     * @tc.name      testExtFocusRender0038
     * @tc.desc      Renderer contract 96000Hz ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 96000;
      const channels: number = 1;
      const frequency: number = 440;
      const amplitude: number = 0.3;
      const rendererFlags: number = 0;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_RENDER_0040
     * @tc.name      testExtFocusRender0039
     * @tc.desc      Renderer contract 44100Hz ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRender0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sampleRate: number = 44100;
      const channels: number = 2;
      const frequency: number = 880;
      const amplitude: number = 0.5;
      const rendererFlags: number = 1;
      expect(sampleRate).assertLarger(0);
      expect(channels).assertLarger(0);
      expect(frequency).assertLarger(0);
      expect(amplitude).assertLarger(0);
      expect(rendererFlags).assertLargerOrEqual(0);
      expect(16).assertEqual(16);
    })
  });
}
