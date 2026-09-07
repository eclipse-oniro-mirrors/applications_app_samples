/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

import { describe, expect, it } from '@ohos/hypium';
import { getPlaybackTitle } from '../../../main/ets/model/PlaybackHistoryModel';
import { runTestCase } from './TestCaseLogger';

export default function playbackHistoryModelTest(): void {
  describe('PlaybackHistoryModelTest', () => {
    it('AVCodec_PlaybackHistory_Title_001', 0, () => {
      runTestCase('AVCodec_PlaybackHistory_Title_001', () => {
        expect(getPlaybackTitle('file://media/video.mp4?token=1')).assertEqual('video.mp4');
        expect(getPlaybackTitle('/data/storage/el2/base/files/audio.m4a')).assertEqual('audio.m4a');
      });
    });
  });
}
