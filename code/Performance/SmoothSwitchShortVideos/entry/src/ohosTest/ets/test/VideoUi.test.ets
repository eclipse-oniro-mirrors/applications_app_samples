/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect } from '@ohos/hypium';
import { CommonConstants } from '../../../main/ets/common/CommonConstants';
import { AVDataSource } from '../../../main/ets/model/AVDataSource';
import { FeedDriver, runSerializedUiOperation } from './Shared/SharedDriver';

function videoCount(): number {
  return CommonConstants.VIDEO_SOURCE.length;
}

async function requireActive(feed: FeedDriver): Promise<number> {
  await feed.launch();
  const index = await feed.activeIndex(videoCount());
  if (index < 0) {
    throw new Error('Expected exactly one selected video');
  }
  return index;
}

async function switchTo(feed: FeedDriver, start: number, next: boolean, speed: number): Promise<number> {
  const expected = (start + (next ? 1 : -1) + videoCount()) % videoCount();
  await feed.swipe(next, speed);
  await feed.waitForIndex(expected);
  const actual = await feed.activeIndex(videoCount());
  expect(actual).assertEqual(expected);
  return expected;
}

export default function videoUiTest(): void {
  describe('ShortVideoCatalog', (): void => {
    it('configuredCatalogKeepsTheSixOrderedDemoRoutes', 0, (): void => {
      const source = new AVDataSource(CommonConstants.VIDEO_SOURCE);
      expect(source.totalCount()).assertEqual(6);
      for (let index = 0; index < 6; index++) {
        const item = source.getData(index);
        expect(item.endsWith(`/video${index + 1}`)).assertTrue();
      }
    });
  });

  describe('ShortVideoNavigation', (): void => {
    for (const next of [true, false]) {
      const direction = next ? 'Forward' : 'Backward';
      it(`completeLoop${direction}`, 0, async (): Promise<void> => {
        await runSerializedUiOperation(async (): Promise<void> => {
          const feed = new FeedDriver();
          const start = await requireActive(feed);
          let current = start;
          const seen: number[] = [];
          for (let step = 0; step < videoCount(); step++) {
            current = await switchTo(feed, current, next, 1600);
            expect(seen.indexOf(current)).assertEqual(-1);
            seen.push(current);
          }
          expect(current).assertEqual(start);
          expect(seen.length).assertEqual(videoCount());
        });
      });
    }

    it('reverseDirectionAtSeveralGestureSpeeds', 0, async (): Promise<void> => {
      await runSerializedUiOperation(async (): Promise<void> => {
        const feed = new FeedDriver();
        const start = await requireActive(feed);
        for (const speed of [800, 1600, 3200]) {
          const next = await switchTo(feed, start, true, speed);
          const returned = await switchTo(feed, next, false, speed);
          expect(returned).assertEqual(start);
        }
      });
    });
  });

  describe('ShortVideoStreaming', (): void => {
    it('eachVideoAdvancesItsOwnPlaybackClock', 0, async (): Promise<void> => {
      await runSerializedUiOperation(async (): Promise<void> => {
        const feed = new FeedDriver();
        let current = await requireActive(feed);
        for (let step = 0; step < videoCount(); step++) {
          current = await switchTo(feed, current, true, 1600);
          await feed.waitForPlayback(current);
          expect(await feed.readClock(current, true) > 0).assertTrue();
        }
      });
    });

    it('tapPausesAndSecondTapContinuesRealPlayback', 0, async (): Promise<void> => {
      await runSerializedUiOperation(async (): Promise<void> => {
        const feed = new FeedDriver();
        const current = await switchTo(feed, await requireActive(feed), true, 1500);
        await feed.waitForPlayback(current);
        await feed.tapVideo();
        await feed.waitForPauseIndicator(current, true);
        try {
          const paused = await feed.waitForPausedClock(current);
          expect(paused >= 0).assertTrue();
        } finally {
          await feed.tapVideo();
        }
        await feed.waitForPauseIndicator(current, false);
        await feed.waitForPlayback(current);
      });
    });

    it('seekWhilePausedMovesTheClockTowardTheRequestedFraction', 0, async (): Promise<void> => {
      await runSerializedUiOperation(async (): Promise<void> => {
        const feed = new FeedDriver();
        const index = await switchTo(feed, await requireActive(feed), true, 1500);
        await feed.waitForPlayback(index);
        await feed.tapVideo();
        await feed.waitForPauseIndicator(index, true);
        try {
          const start = await feed.waitForPausedClock(index);
          const duration = await feed.readClock(index, true);
          expect(duration >= 5).assertTrue();
          const fraction = start < duration / 2 ? 0.8 : 0.2;
          await feed.tapSeek(index, fraction);
          const actual = await feed.waitForSeek(index, start, Math.floor(duration * fraction), 2);
          expect(fraction > 0.5 ? actual > start : actual < start).assertTrue();
          await feed.waitForPauseIndicator(index, true);
        } finally {
          await feed.tapVideo();
        }
      });
    });

    it('hidePausesActiveVideoAndReturnAllowsResume', 0, async (): Promise<void> => {
      await runSerializedUiOperation(async (): Promise<void> => {
        const feed = new FeedDriver();
        const current = await switchTo(feed, await requireActive(feed), true, 1500);
        await feed.waitForPlayback(current);
        await feed.sendHome();
        await feed.waitForFeedHidden();
        await feed.launch();
        await feed.waitForIndex(current);
        await feed.waitForPauseIndicator(current, true);
        await feed.waitForPausedClock(current);
        await feed.tapVideo();
        await feed.waitForPauseIndicator(current, false);
        await feed.waitForPlayback(current);
      });
    });
  });
}
