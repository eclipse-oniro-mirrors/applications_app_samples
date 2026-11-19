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
import { describe, expect, it } from '@ohos/hypium';
import {
  TAB_COUNT,
  TabConsistencyModel,
  TabDirection,
  TabStateModel,
  SwiperModel,
  isIndexValid,
} from '../Shared/CustomAnimationTabFixtures';

/**
 * Pure model suite for Swiper().loop(false) and its index transitions.
 */
export default function swiperModelTest(): void {
  describe('SwiperModelTest', (): void => {
    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SWIPER_0100
    // @tc.name swiperModelTest001
    // @tc.desc Verify the production swiper is non-looping.
    it('swiperModelTest001', 0, (): void => {
      const swiper: SwiperModel = new SwiperModel(TAB_COUNT);
      expect(swiper.isLooping()).assertFalse();
      expect(swiper.loop).assertFalse();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SWIPER_0200
    // @tc.name swiperModelTest002
    // @tc.desc Verify the swiper exposes one page per tab.
    it('swiperModelTest002', 0, (): void => {
      const swiper: SwiperModel = new SwiperModel(TAB_COUNT);
      expect(swiper.pageCount()).assertEqual(5);
      expect(swiper.pageCount()).assertEqual(TAB_COUNT);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SWIPER_0300
    // @tc.name swiperModelTest003
    // @tc.desc Verify the swiper starts on the first page.
    it('swiperModelTest003', 0, (): void => {
      const swiper: SwiperModel = new SwiperModel(TAB_COUNT);
      expect(swiper.index()).assertEqual(0);
      expect(swiper.isAtStart()).assertTrue();
      expect(swiper.isAtEnd()).assertFalse();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SWIPER_0400
    // @tc.name swiperModelTest004
    // @tc.desc Verify setIndex accepts every valid page.
    it('swiperModelTest004', 0, (): void => {
      const swiper: SwiperModel = new SwiperModel(TAB_COUNT);
      for (let index: number = 0; index < TAB_COUNT; index++) {
        expect(swiper.setIndex(index)).assertTrue();
        expect(swiper.index()).assertEqual(index);
      }
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SWIPER_0500
    // @tc.name swiperModelTest005
    // @tc.desc Verify setIndex rejects invalid pages without moving.
    it('swiperModelTest005', 0, (): void => {
      const swiper: SwiperModel = new SwiperModel(TAB_COUNT);
      swiper.setIndex(2);
      expect(swiper.setIndex(-1)).assertFalse();
      expect(swiper.setIndex(TAB_COUNT)).assertFalse();
      expect(swiper.index()).assertEqual(2);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SWIPER_0600
    // @tc.name swiperModelTest006
    // @tc.desc Verify moveNext advances until the last page.
    it('swiperModelTest006', 0, (): void => {
      const swiper: SwiperModel = new SwiperModel(TAB_COUNT);
      for (let index: number = 1; index < TAB_COUNT; index++) {
        expect(swiper.moveNext()).assertTrue();
        expect(swiper.index()).assertEqual(index);
      }
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SWIPER_0700
    // @tc.name swiperModelTest007
    // @tc.desc Verify moveNext cannot wrap past the last page.
    it('swiperModelTest007', 0, (): void => {
      const swiper: SwiperModel = new SwiperModel(TAB_COUNT);
      swiper.setIndex(TAB_COUNT - 1);
      for (let attempt: number = 0; attempt < 10; attempt++) {
        expect(swiper.moveNext()).assertFalse();
      }
      expect(swiper.index()).assertEqual(TAB_COUNT - 1);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SWIPER_0800
    // @tc.name swiperModelTest008
    // @tc.desc Verify movePrev walks back to the first page.
    it('swiperModelTest008', 0, (): void => {
      const swiper: SwiperModel = new SwiperModel(TAB_COUNT);
      swiper.setIndex(TAB_COUNT - 1);
      for (let index: number = TAB_COUNT - 2; index >= 0; index--) {
        expect(swiper.movePrev()).assertTrue();
        expect(swiper.index()).assertEqual(index);
      }
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SWIPER_0900
    // @tc.name swiperModelTest009
    // @tc.desc Verify movePrev cannot wrap before the first page.
    it('swiperModelTest009', 0, (): void => {
      const swiper: SwiperModel = new SwiperModel(TAB_COUNT);
      for (let attempt: number = 0; attempt < 10; attempt++) {
        expect(swiper.movePrev()).assertFalse();
      }
      expect(swiper.index()).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SWIPER_1000
    // @tc.name swiperModelTest010
    // @tc.desc Verify onChange accepts valid page indices.
    it('swiperModelTest010', 0, (): void => {
      const swiper: SwiperModel = new SwiperModel(TAB_COUNT);
      expect(swiper.onChange(3)).assertTrue();
      expect(swiper.index()).assertEqual(3);
      expect(swiper.onChange(0)).assertTrue();
      expect(swiper.index()).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SWIPER_1100
    // @tc.name swiperModelTest011
    // @tc.desc Verify onChange rejects invalid page indices.
    it('swiperModelTest011', 0, (): void => {
      const swiper: SwiperModel = new SwiperModel(TAB_COUNT);
      swiper.onChange(1);
      expect(swiper.onChange(-1)).assertFalse();
      expect(swiper.onChange(5)).assertFalse();
      expect(swiper.index()).assertEqual(1);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SWIPER_1200
    // @tc.name swiperModelTest012
    // @tc.desc Verify repeated onChange to the same index is accepted.
    it('swiperModelTest012', 0, (): void => {
      const swiper: SwiperModel = new SwiperModel(TAB_COUNT);
      for (let round: number = 0; round < 20; round++) {
        expect(swiper.onChange(2)).assertTrue();
      }
      expect(swiper.index()).assertEqual(2);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SWIPER_1300
    // @tc.name swiperModelTest013
    // @tc.desc Verify reset returns the swiper to page 0.
    it('swiperModelTest013', 0, (): void => {
      const swiper: SwiperModel = new SwiperModel(TAB_COUNT);
      swiper.setIndex(4);
      swiper.reset();
      expect(swiper.index()).assertEqual(0);
      expect(swiper.isAtStart()).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SWIPER_1400
    // @tc.name swiperModelTest014
    // @tc.desc Verify isAtEnd only holds for the last page.
    it('swiperModelTest014', 0, (): void => {
      const swiper: SwiperModel = new SwiperModel(TAB_COUNT);
      for (let index: number = 0; index < TAB_COUNT; index++) {
        swiper.setIndex(index);
        expect(swiper.isAtEnd()).assertEqual(index === TAB_COUNT - 1);
      }
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SWIPER_1500
    // @tc.name swiperModelTest015
    // @tc.desc Verify a forward tour ends at the last page.
    it('swiperModelTest015', 0, (): void => {
      const swiper: SwiperModel = new SwiperModel(TAB_COUNT);
      while (swiper.moveNext()) {
        expect(isIndexValid(swiper.index())).assertTrue();
      }
      expect(swiper.index()).assertEqual(4);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SWIPER_1600
    // @tc.name swiperModelTest016
    // @tc.desc Verify a backward tour ends at the first page.
    it('swiperModelTest016', 0, (): void => {
      const swiper: SwiperModel = new SwiperModel(TAB_COUNT);
      swiper.setIndex(4);
      while (swiper.movePrev()) {
        expect(isIndexValid(swiper.index())).assertTrue();
      }
      expect(swiper.index()).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SWIPER_1700
    // @tc.name swiperModelTest017
    // @tc.desc Verify the swiper stays in sync with tab clicks.
    it('swiperModelTest017', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      state.click(2);
      expect(state.swiper.index()).assertEqual(2);
      state.click(4);
      expect(state.swiper.index()).assertEqual(4);
      expect(TabConsistencyModel.selectionMatchesSwiper(state)).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SWIPER_1800
    // @tc.name swiperModelTest018
    // @tc.desc Verify a click followed by a swipe advances one page.
    it('swiperModelTest018', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      state.click(2);
      expect(state.swipeForward()).assertTrue();
      expect(state.index()).assertEqual(3);
      expect(state.swiper.index()).assertEqual(3);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SWIPER_1900
    // @tc.name swiperModelTest019
    // @tc.desc Verify a swipe followed by a click returns to the tapped page.
    it('swiperModelTest019', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      state.swipeForward();
      expect(state.index()).assertEqual(1);
      state.click(0);
      expect(state.index()).assertEqual(0);
      expect(state.swiper.index()).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_SWIPER_2000
    // @tc.name swiperModelTest020
    // @tc.desc Verify mixed clicks and swipes never desynchronise.
    it('swiperModelTest020', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      for (let round: number = 0; round < 50; round++) {
        if (round % 2 === 0) {
          state.click(round % TAB_COUNT);
        } else {
          state.swipe(
            round % 4 === 1 ? TabDirection.FORWARD : TabDirection.BACKWARD,
          );
        }
        expect(state.isConsistent()).assertTrue();
      }
    });
  });
}
