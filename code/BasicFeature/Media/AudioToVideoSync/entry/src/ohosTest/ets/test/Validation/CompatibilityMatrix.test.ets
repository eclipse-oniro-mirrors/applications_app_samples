/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */
import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { paceTurn } from '../Shared/TestPace';
import { CommonConstants } from '../../../../main/ets/common/CommonConstants';

const WIDTHS: number[] = [320, 360, 480, 720, 1080, 1920];
const DENSITIES: number[] = [1, 1.5, 2, 3];

function heightOf(width: number): number {
  return width * CommonConstants.DEFAULT_HEIGHT / CommonConstants.DEFAULT_WIDTH;
}

export default function compatibilityMatrixTest() {
  describe('compatibilityMatrixTest', () => {
    beforeAll(() => {
      console.info('compatibilityMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('compatibilityMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_COMPAT_0100
     * @tc.name      testCompatibility0001
     * @tc.desc      Verify every width and density pair keeps the viewport ratio and vp round trip
     */
    it('testCompatibility0001', 0, () => {
      for (let i = 0; i < WIDTHS.length; i++) {
        for (let j = 0; j < DENSITIES.length; j++) {
          const widthVp: number = WIDTHS[i] / DENSITIES[j];
          expect(widthVp * DENSITIES[j]).assertClose(WIDTHS[i], 1e-9);
          expect(heightOf(WIDTHS[i]) / WIDTHS[i]).assertClose(9 / 16, 1e-9);
          expect(widthVp).assertLarger(0);
        }
      }
    })

    /**
     * @tc.number    SUB_AVS_COMPAT_0200
     * @tc.name      testCompatibility0002
     * @tc.desc      Verify the viewport height is strictly increasing across the width ladder
     */
    it('testCompatibility0002', 0, () => {
      let previous: number = -1;
      for (let i = 0; i < WIDTHS.length; i++) {
        const height: number = heightOf(WIDTHS[i]);
        expect(height).assertLarger(previous);
        previous = height;
      }
      expect(previous).assertLarger(0);
    })

    /**
     * @tc.number    SUB_AVS_COMPAT_0300
     * @tc.name      testCompatibility0003
     * @tc.desc      Verify doubling the width at each density doubles the derived height
     */
    it('testCompatibility0003', 0, () => {
      const bases: number[] = [320, 360, 480, 720];
      for (let i = 0; i < bases.length; i++) {
        expect(heightOf(bases[i] * 2)).assertClose(heightOf(bases[i]) * 2, 1e-9);
      }
      expect(CommonConstants.DEFAULT_HEIGHT * 16).assertEqual(CommonConstants.DEFAULT_WIDTH * 9);
    })
  });
}
