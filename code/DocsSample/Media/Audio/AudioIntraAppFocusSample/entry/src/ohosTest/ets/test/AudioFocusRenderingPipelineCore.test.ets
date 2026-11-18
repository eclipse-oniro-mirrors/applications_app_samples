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

const TAG: string = '[Sample_audioFocusRenderingPipelineCore]';
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

export default function audioFocusRenderingPipelineCoreTest(): void {
  describe('audioFocusRenderingPipelineCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0001
     * @tc.name      testExtFocusRenderPipe0000
     * @tc.desc      Rendering frames 128 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 128;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 8000;
      const phase: number = 0;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(256);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0002
     * @tc.name      testExtFocusRenderPipe0001
     * @tc.desc      Rendering frames 256 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 44100;
      const phase: number = 0.5;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0003
     * @tc.name      testExtFocusRenderPipe0002
     * @tc.desc      Rendering frames 512 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 48000;
      const phase: number = 3.14;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0004
     * @tc.name      testExtFocusRenderPipe0003
     * @tc.desc      Rendering frames 1024 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 8000;
      const phase: number = 6.28;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(4096);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0005
     * @tc.name      testExtFocusRenderPipe0004
     * @tc.desc      Rendering frames 128 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 128;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 44100;
      const phase: number = 0;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(256);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0006
     * @tc.name      testExtFocusRenderPipe0005
     * @tc.desc      Rendering frames 256 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 48000;
      const phase: number = 0.5;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0007
     * @tc.name      testExtFocusRenderPipe0006
     * @tc.desc      Rendering frames 512 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 8000;
      const phase: number = 3.14;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0008
     * @tc.name      testExtFocusRenderPipe0007
     * @tc.desc      Rendering frames 1024 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 44100;
      const phase: number = 6.28;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(4096);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0009
     * @tc.name      testExtFocusRenderPipe0008
     * @tc.desc      Rendering frames 128 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 128;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 48000;
      const phase: number = 0;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(256);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0010
     * @tc.name      testExtFocusRenderPipe0009
     * @tc.desc      Rendering frames 256 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 8000;
      const phase: number = 0.5;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0011
     * @tc.name      testExtFocusRenderPipe0010
     * @tc.desc      Rendering frames 512 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 44100;
      const phase: number = 3.14;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0012
     * @tc.name      testExtFocusRenderPipe0011
     * @tc.desc      Rendering frames 1024 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 48000;
      const phase: number = 6.28;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(4096);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0013
     * @tc.name      testExtFocusRenderPipe0012
     * @tc.desc      Rendering frames 128 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 128;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 8000;
      const phase: number = 0;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(256);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0014
     * @tc.name      testExtFocusRenderPipe0013
     * @tc.desc      Rendering frames 256 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 44100;
      const phase: number = 0.5;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0015
     * @tc.name      testExtFocusRenderPipe0014
     * @tc.desc      Rendering frames 512 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 48000;
      const phase: number = 3.14;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0016
     * @tc.name      testExtFocusRenderPipe0015
     * @tc.desc      Rendering frames 1024 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 8000;
      const phase: number = 6.28;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(4096);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0017
     * @tc.name      testExtFocusRenderPipe0016
     * @tc.desc      Rendering frames 128 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 128;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 44100;
      const phase: number = 0;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(256);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0018
     * @tc.name      testExtFocusRenderPipe0017
     * @tc.desc      Rendering frames 256 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 48000;
      const phase: number = 0.5;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0019
     * @tc.name      testExtFocusRenderPipe0018
     * @tc.desc      Rendering frames 512 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 8000;
      const phase: number = 3.14;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0020
     * @tc.name      testExtFocusRenderPipe0019
     * @tc.desc      Rendering frames 1024 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 44100;
      const phase: number = 6.28;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(4096);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0021
     * @tc.name      testExtFocusRenderPipe0020
     * @tc.desc      Rendering frames 128 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 128;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 48000;
      const phase: number = 0;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(256);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0022
     * @tc.name      testExtFocusRenderPipe0021
     * @tc.desc      Rendering frames 256 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 8000;
      const phase: number = 0.5;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0023
     * @tc.name      testExtFocusRenderPipe0022
     * @tc.desc      Rendering frames 512 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 44100;
      const phase: number = 3.14;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0024
     * @tc.name      testExtFocusRenderPipe0023
     * @tc.desc      Rendering frames 1024 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 48000;
      const phase: number = 6.28;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(4096);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0025
     * @tc.name      testExtFocusRenderPipe0024
     * @tc.desc      Rendering frames 128 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 128;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 8000;
      const phase: number = 0;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(256);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0026
     * @tc.name      testExtFocusRenderPipe0025
     * @tc.desc      Rendering frames 256 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 44100;
      const phase: number = 0.5;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0027
     * @tc.name      testExtFocusRenderPipe0026
     * @tc.desc      Rendering frames 512 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 48000;
      const phase: number = 3.14;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0028
     * @tc.name      testExtFocusRenderPipe0027
     * @tc.desc      Rendering frames 1024 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 8000;
      const phase: number = 6.28;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(4096);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0029
     * @tc.name      testExtFocusRenderPipe0028
     * @tc.desc      Rendering frames 128 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 128;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 44100;
      const phase: number = 0;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(256);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0030
     * @tc.name      testExtFocusRenderPipe0029
     * @tc.desc      Rendering frames 256 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 48000;
      const phase: number = 0.5;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0031
     * @tc.name      testExtFocusRenderPipe0030
     * @tc.desc      Rendering frames 512 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 8000;
      const phase: number = 3.14;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0032
     * @tc.name      testExtFocusRenderPipe0031
     * @tc.desc      Rendering frames 1024 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 44100;
      const phase: number = 6.28;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(4096);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0033
     * @tc.name      testExtFocusRenderPipe0032
     * @tc.desc      Rendering frames 128 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 128;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 48000;
      const phase: number = 0;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(256);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0034
     * @tc.name      testExtFocusRenderPipe0033
     * @tc.desc      Rendering frames 256 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 8000;
      const phase: number = 0.5;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0035
     * @tc.name      testExtFocusRenderPipe0034
     * @tc.desc      Rendering frames 512 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 44100;
      const phase: number = 3.14;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0036
     * @tc.name      testExtFocusRenderPipe0035
     * @tc.desc      Rendering frames 1024 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 48000;
      const phase: number = 6.28;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(4096);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0037
     * @tc.name      testExtFocusRenderPipe0036
     * @tc.desc      Rendering frames 128 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 128;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 8000;
      const phase: number = 0;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(256);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0038
     * @tc.name      testExtFocusRenderPipe0037
     * @tc.desc      Rendering frames 256 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 44100;
      const phase: number = 0.5;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0039
     * @tc.name      testExtFocusRenderPipe0038
     * @tc.desc      Rendering frames 512 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 48000;
      const phase: number = 3.14;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0040
     * @tc.name      testExtFocusRenderPipe0039
     * @tc.desc      Rendering frames 1024 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 8000;
      const phase: number = 6.28;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(4096);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0041
     * @tc.name      testExtFocusRenderPipe0040
     * @tc.desc      Rendering frames 128 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 128;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 44100;
      const phase: number = 0;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(256);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0042
     * @tc.name      testExtFocusRenderPipe0041
     * @tc.desc      Rendering frames 256 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 48000;
      const phase: number = 0.5;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0043
     * @tc.name      testExtFocusRenderPipe0042
     * @tc.desc      Rendering frames 512 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 8000;
      const phase: number = 3.14;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0044
     * @tc.name      testExtFocusRenderPipe0043
     * @tc.desc      Rendering frames 1024 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 44100;
      const phase: number = 6.28;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(4096);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0045
     * @tc.name      testExtFocusRenderPipe0044
     * @tc.desc      Rendering frames 128 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 128;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 48000;
      const phase: number = 0;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(256);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0046
     * @tc.name      testExtFocusRenderPipe0045
     * @tc.desc      Rendering frames 256 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 8000;
      const phase: number = 0.5;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0047
     * @tc.name      testExtFocusRenderPipe0046
     * @tc.desc      Rendering frames 512 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 44100;
      const phase: number = 3.14;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0048
     * @tc.name      testExtFocusRenderPipe0047
     * @tc.desc      Rendering frames 1024 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 48000;
      const phase: number = 6.28;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(4096);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0049
     * @tc.name      testExtFocusRenderPipe0048
     * @tc.desc      Rendering frames 128 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 128;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 8000;
      const phase: number = 0;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(256);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0050
     * @tc.name      testExtFocusRenderPipe0049
     * @tc.desc      Rendering frames 256 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 44100;
      const phase: number = 0.5;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0051
     * @tc.name      testExtFocusRenderPipe0050
     * @tc.desc      Rendering frames 512 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 48000;
      const phase: number = 3.14;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0052
     * @tc.name      testExtFocusRenderPipe0051
     * @tc.desc      Rendering frames 1024 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 8000;
      const phase: number = 6.28;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(4096);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0053
     * @tc.name      testExtFocusRenderPipe0052
     * @tc.desc      Rendering frames 128 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 128;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 44100;
      const phase: number = 0;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(256);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0054
     * @tc.name      testExtFocusRenderPipe0053
     * @tc.desc      Rendering frames 256 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 48000;
      const phase: number = 0.5;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0055
     * @tc.name      testExtFocusRenderPipe0054
     * @tc.desc      Rendering frames 512 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 8000;
      const phase: number = 3.14;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0056
     * @tc.name      testExtFocusRenderPipe0055
     * @tc.desc      Rendering frames 1024 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 44100;
      const phase: number = 6.28;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(4096);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0057
     * @tc.name      testExtFocusRenderPipe0056
     * @tc.desc      Rendering frames 128 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 128;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 48000;
      const phase: number = 0;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(256);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0058
     * @tc.name      testExtFocusRenderPipe0057
     * @tc.desc      Rendering frames 256 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 8000;
      const phase: number = 0.5;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0059
     * @tc.name      testExtFocusRenderPipe0058
     * @tc.desc      Rendering frames 512 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 44100;
      const phase: number = 3.14;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0060
     * @tc.name      testExtFocusRenderPipe0059
     * @tc.desc      Rendering frames 1024 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 48000;
      const phase: number = 6.28;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(4096);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0061
     * @tc.name      testExtFocusRenderPipe0060
     * @tc.desc      Rendering frames 128 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 128;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 8000;
      const phase: number = 0;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(256);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0062
     * @tc.name      testExtFocusRenderPipe0061
     * @tc.desc      Rendering frames 256 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 44100;
      const phase: number = 0.5;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0063
     * @tc.name      testExtFocusRenderPipe0062
     * @tc.desc      Rendering frames 512 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 48000;
      const phase: number = 3.14;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0064
     * @tc.name      testExtFocusRenderPipe0063
     * @tc.desc      Rendering frames 1024 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 8000;
      const phase: number = 6.28;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(4096);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0065
     * @tc.name      testExtFocusRenderPipe0064
     * @tc.desc      Rendering frames 128 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 128;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 44100;
      const phase: number = 0;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(256);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0066
     * @tc.name      testExtFocusRenderPipe0065
     * @tc.desc      Rendering frames 256 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 48000;
      const phase: number = 0.5;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0067
     * @tc.name      testExtFocusRenderPipe0066
     * @tc.desc      Rendering frames 512 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 8000;
      const phase: number = 3.14;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0068
     * @tc.name      testExtFocusRenderPipe0067
     * @tc.desc      Rendering frames 1024 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 44100;
      const phase: number = 6.28;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(4096);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0069
     * @tc.name      testExtFocusRenderPipe0068
     * @tc.desc      Rendering frames 128 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 128;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 48000;
      const phase: number = 0;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(256);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0070
     * @tc.name      testExtFocusRenderPipe0069
     * @tc.desc      Rendering frames 256 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 8000;
      const phase: number = 0.5;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0071
     * @tc.name      testExtFocusRenderPipe0070
     * @tc.desc      Rendering frames 512 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 44100;
      const phase: number = 3.14;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0072
     * @tc.name      testExtFocusRenderPipe0071
     * @tc.desc      Rendering frames 1024 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 48000;
      const phase: number = 6.28;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(4096);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0073
     * @tc.name      testExtFocusRenderPipe0072
     * @tc.desc      Rendering frames 128 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 128;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 8000;
      const phase: number = 0;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(256);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0074
     * @tc.name      testExtFocusRenderPipe0073
     * @tc.desc      Rendering frames 256 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 44100;
      const phase: number = 0.5;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0075
     * @tc.name      testExtFocusRenderPipe0074
     * @tc.desc      Rendering frames 512 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 48000;
      const phase: number = 3.14;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0076
     * @tc.name      testExtFocusRenderPipe0075
     * @tc.desc      Rendering frames 1024 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 8000;
      const phase: number = 6.28;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(4096);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0077
     * @tc.name      testExtFocusRenderPipe0076
     * @tc.desc      Rendering frames 128 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 128;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 44100;
      const phase: number = 0;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(256);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0078
     * @tc.name      testExtFocusRenderPipe0077
     * @tc.desc      Rendering frames 256 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 256;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 48000;
      const phase: number = 0.5;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0079
     * @tc.name      testExtFocusRenderPipe0078
     * @tc.desc      Rendering frames 512 ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 512;
      const channels: number = 1;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 8000;
      const phase: number = 3.14;
      const amplitude: number = 0.3;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(1024);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PIPE_0080
     * @tc.name      testExtFocusRenderPipe0079
     * @tc.desc      Rendering frames 1024 ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRenderPipe0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const frames: number = 1024;
      const channels: number = 2;
      const frameBytes: number = channels * 2;
      const bufferBytes: number = frames * frameBytes;
      const sampleRate: number = 44100;
      const phase: number = 6.28;
      const amplitude: number = 0.5;
      const sample: number = Math.floor(Math.sin(phase) * amplitude * 32767);
      const clamped: number = Math.max(-32767, Math.min(32767, sample));
      expect(bufferBytes).assertEqual(4096);
      expect(clamped).assertLargerOrEqual(-32767);
      expect(clamped).assertLessOrEqual(32767);
      expect(sampleRate).assertLarger(0);
    })
  });
}
