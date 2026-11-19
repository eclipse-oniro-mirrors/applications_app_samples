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

import { afterAll, beforeAll, describe, expect, it } from '@ohos/hypium';
import { GobangConst } from '../../../../main/ets/util/GobangConst';

const EXPECTED_MODES: number[][] = [[1, 0], [0, 1], [1, 1], [1, -1]];

// ---- inlined MainThreadYield ----
/**
 * Long matrix suites run on the test main thread. Yielding between chunks keeps
 * the ability responsive so that component queries issued afterwards still see a
 * live window.
 */

export const DEFAULT_CHUNK: number = 200;

/** Resolves on the next macrotask, giving the UI thread a chance to breathe. */
export async function yieldToMainThread(): Promise<void> {
  await new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, 0);
  });
}

/** Runs a long loop in chunks, yielding after each chunk. */
export async function keepMainThreadResponsive<T>(items: T[], work: (item: T) => boolean,
  chunk: number = DEFAULT_CHUNK): Promise<number> {
  let completed: number = 0;
  for (let i = 0; i < items.length; i++) {
    if (work(items[i])) {
      completed++;
    }
    if (i > 0 && i % chunk === 0) {
      await yieldToMainThread();
    }
  }
  return completed;
}

export default function gobangConstContract() {
  describe('GobangConstContract', () => {
    beforeAll(async () => {
      await yieldToMainThread();
    });

    afterAll(() => {
    });

    /** @tc.number SUB_GOBANG_CONST_0100 @tc.name testConstStoreId0001 @tc.desc The KV store id is the short stable name game */
    it('testConstStoreId0001', 0, async () => {
      expect(GobangConst.STORE_ID).assertEqual('game');
      expect(GobangConst.STORE_ID.length).assertEqual(4);
      expect(GobangConst.STORE_ID.toLowerCase()).assertEqual(GobangConst.STORE_ID);
    });

    /** @tc.number SUB_GOBANG_CONST_0200 @tc.name testConstDeviceKeys0002 @tc.desc The two device keys and the exit key match the wire protocol */
    it('testConstDeviceKeys0002', 0, async () => {
      expect(GobangConst.DEVICE_A).assertEqual('deviceA');
      expect(GobangConst.DEVICE_B).assertEqual('deviceB');
      expect(GobangConst.EXIT).assertEqual('exit');
      expect(GobangConst.DEVICE_A === GobangConst.DEVICE_B).assertFalse();
    });

    /** @tc.number SUB_GOBANG_CONST_0300 @tc.name testConstColours0003 @tc.desc Black and white use the exact hex literals painted on the canvas */
    it('testConstColours0003', 0, async () => {
      expect(GobangConst.CHESS_COLOR.length).assertEqual(2);
      expect(GobangConst.CHESS_COLOR[0]).assertEqual('#000000');
      expect(GobangConst.CHESS_COLOR[1]).assertEqual('#ffffff');
      expect(GobangConst.CHESS_COLOR[0].length).assertEqual(7);
      expect(GobangConst.CHESS_COLOR[1].substring(1)).assertEqual('ffffff');
    });

    /** @tc.number SUB_GOBANG_CONST_0400 @tc.name testConstGeometry0004 @tc.desc The reference canvas is 720x1280 with 16 subdivisions per side */
    it('testConstGeometry0004', 0, async () => {
      expect(GobangConst.WIDTH).assertEqual(720);
      expect(GobangConst.HEIGHT).assertEqual(1280);
      expect(GobangConst.SIZE).assertEqual(16);
      expect(GobangConst.WIDTH / GobangConst.SIZE).assertEqual(45);
      expect(GobangConst.SIZE - 1).assertEqual(15);
      expect(GobangConst.HEIGHT > GobangConst.WIDTH).assertTrue();
    });

    /** @tc.number SUB_GOBANG_CONST_0500 @tc.name testConstCheckModes0005 @tc.desc The four scan directions are unchanged */
    it('testConstCheckModes0005', 0, async () => {
      expect(GobangConst.CHECK_MODE.length).assertEqual(4);
      for (let i = 0; i < EXPECTED_MODES.length; i++) {
        expect(GobangConst.CHECK_MODE[i][0]).assertEqual(EXPECTED_MODES[i][0]);
        expect(GobangConst.CHECK_MODE[i][1]).assertEqual(EXPECTED_MODES[i][1]);
      }
      expect(GobangConst.CHECK_MODE[0][1]).assertEqual(0);
      expect(GobangConst.CHECK_MODE[3][1]).assertEqual(-1);
    });

    /** @tc.number SUB_GOBANG_CONST_0600 @tc.name testConstAuthValues0006 @tc.desc The authentication and device type constants keep their numeric form */
    it('testConstAuthValues0006', 0, async () => {
      expect(GobangConst.AUTH_TYPE_NUMBER).assertEqual(1);
      expect(GobangConst.DEVICE_TYPE_STRING).assertEqual('0');
      expect(GobangConst.RANGE_NUMBER).assertEqual(1000);
      expect(GobangConst.NUMBER).assertEqual(65536);
      expect(typeof GobangConst.DEVICE_TYPE_STRING).assertEqual('string');
    });

    /** @tc.number SUB_GOBANG_CONST_0700 @tc.name testConstReadonlyImmutable0007 @tc.desc Static readonly constants return equal values on every read */
    it('testConstReadonlyImmutable0007', 0, async () => {
      expect(GobangConst.STORE_ID).assertEqual(GobangConst.STORE_ID);
      expect(GobangConst.CHESS_COLOR[0]).assertEqual(GobangConst.CHESS_COLOR[0]);
      let first: string = GobangConst.DEVICE_A;
      let second: string = GobangConst.DEVICE_A;
      expect(first).assertEqual(second);
      expect(first === second).assertTrue();
    });

    /** @tc.number SUB_GOBANG_CONST_0800 @tc.name testConstBoardCoverage0008 @tc.desc Sixteen subdivisions leave fifteen playable intersections per side */
    it('testConstBoardCoverage0008', 0, async () => {
      let intersections: number = GobangConst.SIZE - 1;
      expect(intersections).assertEqual(15);
      expect(intersections * intersections).assertEqual(225);
      let cell: number = GobangConst.WIDTH / GobangConst.SIZE;
      expect(cell * GobangConst.SIZE).assertEqual(GobangConst.WIDTH);
      expect(cell * intersections).assertEqual(675);
    });

    /** @tc.number SUB_GOBANG_CONST_0900 @tc.name testConstTimerBudget0009 @tc.desc The range constant matches the sync timeout used by the store */
    it('testConstTimerBudget0009', 0, async () => {
      expect(GobangConst.RANGE_NUMBER).assertEqual(1000);
      expect(GobangConst.NUMBER).assertEqual(2 * 32768);
      expect(GobangConst.NUMBER / 2).assertEqual(32768);
    });
  });
}
