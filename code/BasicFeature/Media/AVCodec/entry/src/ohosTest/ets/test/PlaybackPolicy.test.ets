/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

import { describe, expect, it } from '@ohos/hypium';
import { PlaybackMode, nextPlaybackIndex } from '../../../main/ets/model/PlaybackModeModel';
import { PlaybackRecoveryModel } from '../../../main/ets/model/PlaybackRecoveryModel';
import { SubtitleStyleModel } from '../../../main/ets/model/SubtitleStyleModel';
import { runTestCase } from './TestCaseLogger';

export default function playbackPolicyTest(): void {
  describe('PlaybackPolicyTest', () => {
    it('AVCodec_PlaybackMode_Boundaries_001', 0, () => {
      runTestCase('AVCodec_PlaybackMode_Boundaries_001', () => {
        expect(nextPlaybackIndex(PlaybackMode.SEQUENTIAL, 0, 3)).assertEqual(1);
        expect(nextPlaybackIndex(PlaybackMode.SEQUENTIAL, 2, 3)).assertEqual(-1);
        expect(nextPlaybackIndex(PlaybackMode.REPEAT_ONE, 1, 3)).assertEqual(1);
        expect(nextPlaybackIndex(PlaybackMode.REPEAT_ALL, 2, 3)).assertEqual(0);
        expect(nextPlaybackIndex(PlaybackMode.REPEAT_ALL, -1, 0)).assertEqual(-1);
        expect(nextPlaybackIndex(PlaybackMode.SHUFFLE, 0, 1)).assertEqual(0);
      });
    });
    it('AVCodec_PlaybackMode_Shuffle_002', 0, () => {
      runTestCase('AVCodec_PlaybackMode_Shuffle_002', () => {
        for (let current = 0; current < 4; current++) {
          for (let sample = 0; sample <= 10; sample++) {
            const next = nextPlaybackIndex(PlaybackMode.SHUFFLE, current, 4, sample / 10);
            expect(next >= 0 && next < 4 && next !== current).assertTrue();
          }
        }
      });
    });
    it('AVCodec_Recovery_OneRetry_001', 0, () => {
      runTestCase('AVCodec_Recovery_OneRetry_001', () => {
        const model = new PlaybackRecoveryModel();
        expect(model.takeRetry() === undefined).assertTrue();
        model.observe(5000000, 2, true, true);
      const snapshot = model.takeRetry();
      expect(snapshot?.positionUs).assertEqual(5000000);
        expect(snapshot?.speed).assertEqual(2);
      expect(snapshot?.paused).assertTrue();
      expect(model.getAttemptCount()).assertEqual(1);
        model.observe(6000000, 1, false, true);
        expect(model.takeRetry() === undefined).assertTrue();
      });
    });
    it('AVCodec_Recovery_CancelAndReset_002', 0, () => {
      runTestCase('AVCodec_Recovery_CancelAndReset_002', () => {
        const model = new PlaybackRecoveryModel();
        model.observe(5000000, 1, false, false);
        expect(model.takeRetry() === undefined).assertTrue();
        model.observe(5000000, 1, false, true);
        model.cancel();
        expect(model.takeRetry() === undefined).assertTrue();
        model.reset();
        expect(model.takeRetry() === undefined).assertTrue();
        model.observe(1000000, 3, false, true);
        expect(model.takeRetry()?.positionUs).assertEqual(1000000);
      });
    });
    it('AVCodec_SubtitleStyle_Reset_001', 0, () => {
      runTestCase('AVCodec_SubtitleStyle_Reset_001', () => {
        const style = new SubtitleStyleModel();
        style.visible = false;
        style.sizeIndex = 2;
        style.colorIndex = 1;
        style.backgroundIndex = 0;
        style.positionIndex = 1;
        expect(style.fontSize()).assertEqual('22fp');
        expect(style.fontColor()).assertEqual('#FFEB3B');
        expect(style.backgroundColor()).assertEqual('#00000000');
        style.reset();
        expect(style.visible).assertTrue();
        expect(style.fontSize()).assertEqual('18fp');
        expect(style.positionIndex).assertEqual(0);
      });
    });
  });
}
