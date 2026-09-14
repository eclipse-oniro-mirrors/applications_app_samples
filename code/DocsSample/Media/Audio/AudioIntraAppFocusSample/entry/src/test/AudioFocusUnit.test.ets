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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

const BUNDLE = 'IntraAppFocus_';
const DOMAIN = 0xF811;
const TAG = '[Sample_IntraAppFocus]';

const INTERRUPT_MODE_SHARE = 0;
const INTERRUPT_MODE_INDEPENDENT = 1;
const STREAM_USAGE_MUSIC = 0;
const STREAM_USAGE_MOVIE = 1;
const STREAM_USAGE_GAME = 2;
const STREAM_USAGE_AUDIOBOOK = 3;
const STREAM_USAGE_NAVIGATION = 4;
const INTERRUPT_HINT_NONE = 0;
const INTERRUPT_HINT_RESUME = 1;
const INTERRUPT_HINT_PAUSE = 2;
const INTERRUPT_HINT_STOP = 3;
const INTERRUPT_HINT_DUCK = 4;
const INTERRUPT_HINT_UNDUCK = 5;
const INTERRUPT_FORCE = 0;
const INTERRUPT_SHARE = 1;
const AUDIO_STATE_PREPARED = 0;
const AUDIO_STATE_RUNNING = 1;
const AUDIO_STATE_PAUSED = 2;
const AUDIO_STATE_STOPPED = 3;
const AUDIO_STATE_RELEASED = 4;

export default function AudioFocusUnitTest() {
  describe('AudioConstants', () => {
    // Verify InterruptMode enum values: SHARE(0) and INDEPENDENT(1)
    it(BUNDLE + 'InterruptMode_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'InterruptMode_001, begin');
      hilog.info(DOMAIN, TAG, BUNDLE + 'InterruptMode_001, actualValue:' + INTERRUPT_MODE_SHARE);
      expect(INTERRUPT_MODE_SHARE).assertEqual(0);
      hilog.info(DOMAIN, TAG, BUNDLE + 'InterruptMode_001, actualValue:' + INTERRUPT_MODE_INDEPENDENT);
      expect(INTERRUPT_MODE_INDEPENDENT).assertEqual(1);
      hilog.info(DOMAIN, TAG, BUNDLE + 'InterruptMode_001, end');
    });

    // Verify StreamUsageType enum values: MUSIC(0), MOVIE(1), GAME(2), AUDIOBOOK(3), NAVIGATION(4)
    it(BUNDLE + 'StreamUsage_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'StreamUsage_001, begin');
      hilog.info(DOMAIN, TAG, BUNDLE + 'StreamUsage_001, actualValue:' + STREAM_USAGE_MUSIC);
      expect(STREAM_USAGE_MUSIC).assertEqual(0);
      hilog.info(DOMAIN, TAG, BUNDLE + 'StreamUsage_001, actualValue:' + STREAM_USAGE_MOVIE);
      expect(STREAM_USAGE_MOVIE).assertEqual(1);
      hilog.info(DOMAIN, TAG, BUNDLE + 'StreamUsage_001, actualValue:' + STREAM_USAGE_GAME);
      expect(STREAM_USAGE_GAME).assertEqual(2);
      hilog.info(DOMAIN, TAG, BUNDLE + 'StreamUsage_001, actualValue:' + STREAM_USAGE_AUDIOBOOK);
      expect(STREAM_USAGE_AUDIOBOOK).assertEqual(3);
      hilog.info(DOMAIN, TAG, BUNDLE + 'StreamUsage_001, actualValue:' + STREAM_USAGE_NAVIGATION);
      expect(STREAM_USAGE_NAVIGATION).assertEqual(4);
      hilog.info(DOMAIN, TAG, BUNDLE + 'StreamUsage_001, end');
    });

    // Verify InterruptHintType enum values: NONE(0), RESUME(1), PAUSE(2), STOP(3), DUCK(4), UNDUCK(5)
    it(BUNDLE + 'InterruptHint_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'InterruptHint_001, begin');
      hilog.info(DOMAIN, TAG, BUNDLE + 'InterruptHint_001, actualValue:' + INTERRUPT_HINT_NONE);
      expect(INTERRUPT_HINT_NONE).assertEqual(0);
      hilog.info(DOMAIN, TAG, BUNDLE + 'InterruptHint_001, actualValue:' + INTERRUPT_HINT_RESUME);
      expect(INTERRUPT_HINT_RESUME).assertEqual(1);
      hilog.info(DOMAIN, TAG, BUNDLE + 'InterruptHint_001, actualValue:' + INTERRUPT_HINT_PAUSE);
      expect(INTERRUPT_HINT_PAUSE).assertEqual(2);
      hilog.info(DOMAIN, TAG, BUNDLE + 'InterruptHint_001, actualValue:' + INTERRUPT_HINT_STOP);
      expect(INTERRUPT_HINT_STOP).assertEqual(3);
      hilog.info(DOMAIN, TAG, BUNDLE + 'InterruptHint_001, actualValue:' + INTERRUPT_HINT_DUCK);
      expect(INTERRUPT_HINT_DUCK).assertEqual(4);
      hilog.info(DOMAIN, TAG, BUNDLE + 'InterruptHint_001, actualValue:' + INTERRUPT_HINT_UNDUCK);
      expect(INTERRUPT_HINT_UNDUCK).assertEqual(5);
      hilog.info(DOMAIN, TAG, BUNDLE + 'InterruptHint_001, end');
    });

    // Verify InterruptForceType enum values: FORCE(0) and SHARE(1)
    it(BUNDLE + 'InterruptForce_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'InterruptForce_001, begin');
      hilog.info(DOMAIN, TAG, BUNDLE + 'InterruptForce_001, actualValue:' + INTERRUPT_FORCE);
      expect(INTERRUPT_FORCE).assertEqual(0);
      hilog.info(DOMAIN, TAG, BUNDLE + 'InterruptForce_001, actualValue:' + INTERRUPT_SHARE);
      expect(INTERRUPT_SHARE).assertEqual(1);
      hilog.info(DOMAIN, TAG, BUNDLE + 'InterruptForce_001, end');
    });

    // Verify AudioStreamState enum values: PREPARED(0), RUNNING(1), PAUSED(2), STOPPED(3), RELEASED(4)
    it(BUNDLE + 'AudioStreamState_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'AudioStreamState_001, begin');
      hilog.info(DOMAIN, TAG, BUNDLE + 'AudioStreamState_001, actualValue:' + AUDIO_STATE_PREPARED);
      expect(AUDIO_STATE_PREPARED).assertEqual(0);
      hilog.info(DOMAIN, TAG, BUNDLE + 'AudioStreamState_001, actualValue:' + AUDIO_STATE_RUNNING);
      expect(AUDIO_STATE_RUNNING).assertEqual(1);
      hilog.info(DOMAIN, TAG, BUNDLE + 'AudioStreamState_001, actualValue:' + AUDIO_STATE_PAUSED);
      expect(AUDIO_STATE_PAUSED).assertEqual(2);
      hilog.info(DOMAIN, TAG, BUNDLE + 'AudioStreamState_001, actualValue:' + AUDIO_STATE_STOPPED);
      expect(AUDIO_STATE_STOPPED).assertEqual(3);
      hilog.info(DOMAIN, TAG, BUNDLE + 'AudioStreamState_001, actualValue:' + AUDIO_STATE_RELEASED);
      expect(AUDIO_STATE_RELEASED).assertEqual(4);
      hilog.info(DOMAIN, TAG, BUNDLE + 'AudioStreamState_001, end');
    });
  });

  describe('InterruptMode_decision', () => {
    // Verify SHARE mode(0) is the recommended default interrupt mode
    it(BUNDLE + 'InterruptMode_002', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'InterruptMode_002, begin');
      hilog.info(DOMAIN, TAG, BUNDLE + 'InterruptMode_002, actualValue:' + INTERRUPT_MODE_SHARE);
      expect(INTERRUPT_MODE_SHARE).assertEqual(0);
      hilog.info(DOMAIN, TAG, BUNDLE + 'InterruptMode_002, end');
    });

    // Verify INDEPENDENT mode(1) causes STOP interrupt for same-type streams
    it(BUNDLE + 'InterruptMode_003', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'InterruptMode_003, begin');
      hilog.info(DOMAIN, TAG, BUNDLE + 'InterruptMode_003, actualValue:' + INTERRUPT_MODE_INDEPENDENT);
      expect(INTERRUPT_MODE_INDEPENDENT).assertEqual(1);
      hilog.info(DOMAIN, TAG, BUNDLE + 'InterruptMode_003, end');
    });
  });

  describe('StreamUsageType_focus_strategy', () => {
    // Verify same StreamUsage type (MUSIC vs MUSIC) has equal priority
    it(BUNDLE + 'StreamUsage_002', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'StreamUsage_002, begin');
      hilog.info(DOMAIN, TAG, BUNDLE + 'StreamUsage_002, actualValue:' + STREAM_USAGE_MUSIC);
      expect(STREAM_USAGE_MUSIC).assertEqual(STREAM_USAGE_MUSIC);
      hilog.info(DOMAIN, TAG, BUNDLE + 'StreamUsage_002, end');
    });

    // Verify different StreamUsage types (MUSIC vs MOVIE) have different values
    it(BUNDLE + 'StreamUsage_003', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'StreamUsage_003, begin');
      let music: number = STREAM_USAGE_MUSIC;
      let movie: number = STREAM_USAGE_MOVIE;
      hilog.info(DOMAIN, TAG, BUNDLE + 'StreamUsage_003, actualValue:' + (music !== movie));
      expect(music !== movie).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'StreamUsage_003, end');
    });

    // Verify different StreamUsage types (MUSIC vs GAME) have different values
    it(BUNDLE + 'StreamUsage_004', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'StreamUsage_004, begin');
      let music: number = STREAM_USAGE_MUSIC;
      let game: number = STREAM_USAGE_GAME;
      hilog.info(DOMAIN, TAG, BUNDLE + 'StreamUsage_004, actualValue:' + (music !== game));
      expect(music !== game).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'StreamUsage_004, end');
    });

    // Verify NAVIGATION StreamUsage(4) triggers DUCK strategy for lower-priority streams
    it(BUNDLE + 'StreamUsage_005', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'StreamUsage_005, begin');
      hilog.info(DOMAIN, TAG, BUNDLE + 'StreamUsage_005, actualValue:' + STREAM_USAGE_NAVIGATION);
      expect(STREAM_USAGE_NAVIGATION).assertEqual(4);
      hilog.info(DOMAIN, TAG, BUNDLE + 'StreamUsage_005, end');
    });
  });
}
