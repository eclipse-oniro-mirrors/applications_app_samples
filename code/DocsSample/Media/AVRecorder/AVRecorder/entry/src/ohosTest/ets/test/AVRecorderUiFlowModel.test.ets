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

const TAG: string = '[Sample_avRecorderUiFlowModel]';
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

export default function avRecorderUiFlowModelTest(): void {
  describe('avRecorderUiFlowModelTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0001
     * @tc.name      testExtRecUiFlow20000
     * @tc.desc      UI flow start at 0s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = true;
      let seconds: number = 0;
      const action: string = 'start';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0002
     * @tc.name      testExtRecUiFlow20001
     * @tc.desc      UI flow pause at 1s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 1;
      const action: string = 'pause';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(true);
      expect(seconds).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0003
     * @tc.name      testExtRecUiFlow20002
     * @tc.desc      UI flow resume at 2s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 2;
      const action: string = 'resume';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0004
     * @tc.name      testExtRecUiFlow20003
     * @tc.desc      UI flow stop at 3s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = true;
      let seconds: number = 3;
      const action: string = 'stop';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0005
     * @tc.name      testExtRecUiFlow20004
     * @tc.desc      UI flow start at 4s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 4;
      const action: string = 'start';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0006
     * @tc.name      testExtRecUiFlow20005
     * @tc.desc      UI flow pause at 5s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 5;
      const action: string = 'pause';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(true);
      expect(seconds).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0007
     * @tc.name      testExtRecUiFlow20006
     * @tc.desc      UI flow resume at 6s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = true;
      let seconds: number = 6;
      const action: string = 'resume';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0008
     * @tc.name      testExtRecUiFlow20007
     * @tc.desc      UI flow stop at 7s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 7;
      const action: string = 'stop';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0009
     * @tc.name      testExtRecUiFlow20008
     * @tc.desc      UI flow start at 8s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 8;
      const action: string = 'start';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0010
     * @tc.name      testExtRecUiFlow20009
     * @tc.desc      UI flow pause at 9s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = true;
      let seconds: number = 9;
      const action: string = 'pause';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(true);
      expect(seconds).assertEqual(9);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0011
     * @tc.name      testExtRecUiFlow20010
     * @tc.desc      UI flow resume at 10s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 10;
      const action: string = 'resume';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0012
     * @tc.name      testExtRecUiFlow20011
     * @tc.desc      UI flow stop at 11s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 11;
      const action: string = 'stop';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0013
     * @tc.name      testExtRecUiFlow20012
     * @tc.desc      UI flow start at 12s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = true;
      let seconds: number = 12;
      const action: string = 'start';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0014
     * @tc.name      testExtRecUiFlow20013
     * @tc.desc      UI flow pause at 13s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 13;
      const action: string = 'pause';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(true);
      expect(seconds).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0015
     * @tc.name      testExtRecUiFlow20014
     * @tc.desc      UI flow resume at 14s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 14;
      const action: string = 'resume';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(14);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0016
     * @tc.name      testExtRecUiFlow20015
     * @tc.desc      UI flow stop at 15s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = true;
      let seconds: number = 15;
      const action: string = 'stop';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0017
     * @tc.name      testExtRecUiFlow20016
     * @tc.desc      UI flow start at 16s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 16;
      const action: string = 'start';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0018
     * @tc.name      testExtRecUiFlow20017
     * @tc.desc      UI flow pause at 17s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 17;
      const action: string = 'pause';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(true);
      expect(seconds).assertEqual(17);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0019
     * @tc.name      testExtRecUiFlow20018
     * @tc.desc      UI flow resume at 18s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = true;
      let seconds: number = 18;
      const action: string = 'resume';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(18);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0020
     * @tc.name      testExtRecUiFlow20019
     * @tc.desc      UI flow stop at 19s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 19;
      const action: string = 'stop';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0021
     * @tc.name      testExtRecUiFlow20020
     * @tc.desc      UI flow start at 20s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 20;
      const action: string = 'start';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0022
     * @tc.name      testExtRecUiFlow20021
     * @tc.desc      UI flow pause at 21s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = true;
      let seconds: number = 21;
      const action: string = 'pause';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(true);
      expect(seconds).assertEqual(21);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0023
     * @tc.name      testExtRecUiFlow20022
     * @tc.desc      UI flow resume at 22s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 22;
      const action: string = 'resume';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(22);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0024
     * @tc.name      testExtRecUiFlow20023
     * @tc.desc      UI flow stop at 23s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 23;
      const action: string = 'stop';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0025
     * @tc.name      testExtRecUiFlow20024
     * @tc.desc      UI flow start at 24s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = true;
      let seconds: number = 24;
      const action: string = 'start';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0026
     * @tc.name      testExtRecUiFlow20025
     * @tc.desc      UI flow pause at 25s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 25;
      const action: string = 'pause';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(true);
      expect(seconds).assertEqual(25);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0027
     * @tc.name      testExtRecUiFlow20026
     * @tc.desc      UI flow resume at 26s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 26;
      const action: string = 'resume';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(26);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0028
     * @tc.name      testExtRecUiFlow20027
     * @tc.desc      UI flow stop at 27s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = true;
      let seconds: number = 27;
      const action: string = 'stop';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0029
     * @tc.name      testExtRecUiFlow20028
     * @tc.desc      UI flow start at 28s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 28;
      const action: string = 'start';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0030
     * @tc.name      testExtRecUiFlow20029
     * @tc.desc      UI flow pause at 29s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 29;
      const action: string = 'pause';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(true);
      expect(seconds).assertEqual(29);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0031
     * @tc.name      testExtRecUiFlow20030
     * @tc.desc      UI flow resume at 30s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = true;
      let seconds: number = 30;
      const action: string = 'resume';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(30);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0032
     * @tc.name      testExtRecUiFlow20031
     * @tc.desc      UI flow stop at 31s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 31;
      const action: string = 'stop';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0033
     * @tc.name      testExtRecUiFlow20032
     * @tc.desc      UI flow start at 32s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 32;
      const action: string = 'start';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0034
     * @tc.name      testExtRecUiFlow20033
     * @tc.desc      UI flow pause at 33s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = true;
      let seconds: number = 33;
      const action: string = 'pause';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(true);
      expect(seconds).assertEqual(33);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0035
     * @tc.name      testExtRecUiFlow20034
     * @tc.desc      UI flow resume at 34s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 34;
      const action: string = 'resume';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(34);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0036
     * @tc.name      testExtRecUiFlow20035
     * @tc.desc      UI flow stop at 35s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 35;
      const action: string = 'stop';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0037
     * @tc.name      testExtRecUiFlow20036
     * @tc.desc      UI flow start at 36s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = true;
      let seconds: number = 36;
      const action: string = 'start';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0038
     * @tc.name      testExtRecUiFlow20037
     * @tc.desc      UI flow pause at 37s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 37;
      const action: string = 'pause';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(true);
      expect(seconds).assertEqual(37);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0039
     * @tc.name      testExtRecUiFlow20038
     * @tc.desc      UI flow resume at 38s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 38;
      const action: string = 'resume';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(38);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0040
     * @tc.name      testExtRecUiFlow20039
     * @tc.desc      UI flow stop at 39s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = true;
      let seconds: number = 39;
      const action: string = 'stop';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0041
     * @tc.name      testExtRecUiFlow20040
     * @tc.desc      UI flow start at 40s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 40;
      const action: string = 'start';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0042
     * @tc.name      testExtRecUiFlow20041
     * @tc.desc      UI flow pause at 41s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 41;
      const action: string = 'pause';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(true);
      expect(seconds).assertEqual(41);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0043
     * @tc.name      testExtRecUiFlow20042
     * @tc.desc      UI flow resume at 42s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = true;
      let seconds: number = 42;
      const action: string = 'resume';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(42);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0044
     * @tc.name      testExtRecUiFlow20043
     * @tc.desc      UI flow stop at 43s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 43;
      const action: string = 'stop';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0045
     * @tc.name      testExtRecUiFlow20044
     * @tc.desc      UI flow start at 44s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 44;
      const action: string = 'start';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0046
     * @tc.name      testExtRecUiFlow20045
     * @tc.desc      UI flow pause at 45s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = true;
      let seconds: number = 45;
      const action: string = 'pause';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(true);
      expect(seconds).assertEqual(45);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0047
     * @tc.name      testExtRecUiFlow20046
     * @tc.desc      UI flow resume at 46s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 46;
      const action: string = 'resume';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(46);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0048
     * @tc.name      testExtRecUiFlow20047
     * @tc.desc      UI flow stop at 47s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 47;
      const action: string = 'stop';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0049
     * @tc.name      testExtRecUiFlow20048
     * @tc.desc      UI flow start at 48s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = true;
      let seconds: number = 48;
      const action: string = 'start';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0050
     * @tc.name      testExtRecUiFlow20049
     * @tc.desc      UI flow pause at 49s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 49;
      const action: string = 'pause';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(true);
      expect(seconds).assertEqual(49);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0051
     * @tc.name      testExtRecUiFlow20050
     * @tc.desc      UI flow resume at 50s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 50;
      const action: string = 'resume';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(50);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0052
     * @tc.name      testExtRecUiFlow20051
     * @tc.desc      UI flow stop at 51s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = true;
      let seconds: number = 51;
      const action: string = 'stop';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0053
     * @tc.name      testExtRecUiFlow20052
     * @tc.desc      UI flow start at 52s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 52;
      const action: string = 'start';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0054
     * @tc.name      testExtRecUiFlow20053
     * @tc.desc      UI flow pause at 53s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 53;
      const action: string = 'pause';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(true);
      expect(seconds).assertEqual(53);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0055
     * @tc.name      testExtRecUiFlow20054
     * @tc.desc      UI flow resume at 54s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = true;
      let seconds: number = 54;
      const action: string = 'resume';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(54);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0056
     * @tc.name      testExtRecUiFlow20055
     * @tc.desc      UI flow stop at 55s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 55;
      const action: string = 'stop';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0057
     * @tc.name      testExtRecUiFlow20056
     * @tc.desc      UI flow start at 56s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 56;
      const action: string = 'start';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0058
     * @tc.name      testExtRecUiFlow20057
     * @tc.desc      UI flow pause at 57s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = true;
      let seconds: number = 57;
      const action: string = 'pause';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(true);
      expect(seconds).assertEqual(57);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0059
     * @tc.name      testExtRecUiFlow20058
     * @tc.desc      UI flow resume at 58s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 58;
      const action: string = 'resume';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(58);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW2_0060
     * @tc.name      testExtRecUiFlow20059
     * @tc.desc      UI flow stop at 59s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow20059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 59;
      const action: string = 'stop';
      if (action === 'start') { isStartRecording = true; isPauseRecording = false; seconds = 0; }
      else if (action === 'pause') { isPauseRecording = true; }
      else if (action === 'resume') { isPauseRecording = false; }
      else { isStartRecording = false; isPauseRecording = false; seconds = 0; }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
  });
}
